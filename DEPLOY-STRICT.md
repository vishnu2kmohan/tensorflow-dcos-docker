```bash
dcos security org service-accounts keypair tensorflow-private-key.pem tensorflow-public-key.pem
dcos security org service-accounts create -p tensorflow-public-key.pem -d "Dev Tensorflow Service Account" dev_tensorflow
dcos security secrets create-sa-secret --strict tensorflow-private-key.pem dev_tensorflow dev/tensorflow/serviceCredential

dcos security org users grant dev_tensorflow dcos:mesos:master:task:user:nobody create --description "Allow dev_tensorflow to launch tasks under the Linux user: nobody"
dcos security org users grant dev_tensorflow dcos:mesos:master:task:app_id:/dev/tensorflow create --description "Allow dev_tensorflow to create tasks under the /dev/tensorflow namespace"
dcos security org users grant dev_tensorflow dcos:mesos:master:framework:role:dev__tensorflow__mnist-role create --description "Allow dev_tensorflow to register with Mesos and consume resources from the dev-tensorflow role"
dcos security org users grant dev_tensorflow dcos:mesos:master:reservation:role:dev__tensorflow__mnist-role create --description "Allow dev__tensorflow__mnist-role to reserve resources"
dcos security org users grant dev_tensorflow dcos:mesos:master:reservation:principal:dev_tensorflow create --description "Allow dev_tensorflow principal to reserve resources"
dcos security org users grant dev_tensorflow dcos:mesos:master:reservation:principal:dev_tensorflow delete --description "Allow dev_tensorflow principal to reserve resources"
dcos security org users grant dev_tensorflow dcos:mesos:master:volume:role:dev__tensorflow__mnist-role create --description "Allow dev__tensorflow__mnist-role to access volumes"
dcos security org users grant dev_tensorflow dcos:mesos:master:volume:principal:dev_tensorflow create --description "Allow dev_tensorflow principal to access volumes"
dcos security org users grant dev_tensorflow dcos:mesos:master:volume:principal:dev_tensorflow delete --description "Allow dev_tensorflow principal to access volumes"

tee dev-tensorflow-mnist-options.json <<- 'EOF'
{
  "service": {
    "name": "/dev/tensorflow/mnist",
    "service_account": "dev_tensorflow",
    "service_account_secret": "dev/tensorflow/serviceCredential",
    "user": "nobody",
    "virtual_network_enabled": false,
    "virtual_network_name": "dcos",
    "log_level": "INFO",
    "job_url": "https://downloads.mesosphere.com/tensorflow-dcos/examples/v0/dcos-tensorflow-tools-master.zip",
    "job_path": "dcos-tensorflow-tools-master/examples/source/mnist",
    "job_name": "mnist",
    "job_context": "{\"learning_rate\":0.5,\"num_training_steps\":1000000}",
    "use_gcs_key_secret": false,
    "use_tensorboard": false,
    "tf_image": "vishnumohan/tensorflow-dcos:latest",
    "gpu_tf_image": "vishnumohna/tensorflow-dcos:latest-cudnn"
  },
  "parameter_server": {
    "count": 0,
    "port": 2223,
    "cpus": 1,
    "mem": 4096,
    "disk": 4096,
    "disk_type": "ROOT"
  },
  "worker": {
    "count": 1,
    "port": 2222,
    "cpus": 1,
    "mem": 4096,
    "disk": 4096,
    "disk_type": "ROOT"
  },
  "gpu_worker": {
    "count": 0,
    "gpus": 1,
    "cpus": 1,
    "mem": 4096,
    "disk": 4096,
    "disk_type": "ROOT"
  },
  "tensorboard": {
    "port": 6006,
    "cpus": 1,
    "mem": 4096
  }
}
EOF

dcos package install --options=dev-tensorflow-mnist-options.json --yes beta-tensorflow
```
