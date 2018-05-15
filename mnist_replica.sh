#!/usr/bin/env bash

python mnist_replica.py \
    --existing_servers \
    --ps_hosts=parameter-server-0-node.devtensorflowinteractive.autoip.dcos.thisdcos.directory:2222,parameter-server-1-node.devtensorflowinteractive.autoip.dcos.thisdcos.directory:2222 \
    --worker_hosts=worker-0-node.devtensorflowinteractive.autoip.dcos.thisdcos.directory:2222,worker-1-node.devtensorflowinteractive.autoip.dcos.thisdcos.directory:2222,worker-2-node.devtensorflowinteractive.autoip.dcos.thisdcos.directory:2222 \
    --job_name=ps \
    --task_index=0 &
    
python mnist_replica.py \
    --existing_servers \
    --ps_hosts=parameter-server-0-node.devtensorflowinteractive.autoip.dcos.thisdcos.directory:2222,parameter-server-1-node.devtensorflowinteractive.autoip.dcos.thisdcos.directory:2222 \
    --worker_hosts=worker-0-node.devtensorflowinteractive.autoip.dcos.thisdcos.directory:2222,worker-1-node.devtensorflowinteractive.autoip.dcos.thisdcos.directory:2222,worker-2-node.devtensorflowinteractive.autoip.dcos.thisdcos.directory:2222 \
    --job_name=ps \
    --task_index=1 &
     
python mnist_replica.py \
    --existing_servers \
    --ps_hosts=parameter-server-0-node.devtensorflowinteractive.autoip.dcos.thisdcos.directory:2222,parameter-server-1-node.devtensorflowinteractive.autoip.dcos.thisdcos.directory:2222 \
    --worker_hosts=worker-0-node.devtensorflowinteractive.autoip.dcos.thisdcos.directory:2222,worker-1-node.devtensorflowinteractive.autoip.dcos.thisdcos.directory:2222,worker-2-node.devtensorflowinteractive.autoip.dcos.thisdcos.directory:2222 \
    --job_name=worker \
    --task_index=0 &
    
python mnist_replica.py \
    --existing_servers \
    --ps_hosts=parameter-server-0-node.devtensorflowinteractive.autoip.dcos.thisdcos.directory:2222,parameter-server-1-node.devtensorflowinteractive.autoip.dcos.thisdcos.directory:2222 \
    --worker_hosts=worker-0-node.devtensorflowinteractive.autoip.dcos.thisdcos.directory:2222,worker-1-node.devtensorflowinteractive.autoip.dcos.thisdcos.directory:2222,worker-2-node.devtensorflowinteractive.autoip.dcos.thisdcos.directory:2222 \
    --job_name=worker \
    --task_index=1 &

python mnist_replica.py \
    --existing_servers \
    --ps_hosts=parameter-server-0-node.devtensorflowinteractive.autoip.dcos.thisdcos.directory:2222,parameter-server-1-node.devtensorflowinteractive.autoip.dcos.thisdcos.directory:2222 \
    --worker_hosts=worker-0-node.devtensorflowinteractive.autoip.dcos.thisdcos.directory:2222,worker-1-node.devtensorflowinteractive.autoip.dcos.thisdcos.directory:2222,worker-2-node.devtensorflowinteractive.autoip.dcos.thisdcos.directory:2222 \
    --job_name=worker \
    --task_index=2 &
