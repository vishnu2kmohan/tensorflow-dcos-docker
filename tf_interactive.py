"""
tf_interactive.py
Start a Distributed Tensorflow Cluster with which you can interact with a Jupyter Notebook
"""
import tensorflow as tf


def main(server, log_dir, context):
    """
    server: a tf.train.Server object (which knows about every other member of the cluster)
    log_dir: a string providing the recommended location for training logs, summaries, and checkpoints
    context: an optional dictionary of parameters (batch_size, learning_rate, etc.) specified at run-time
    """

    print("server.target:" + str(server.target))
    print("log_dir:" + str(log_dir))
    print("context:" + str(context))
    server.start()
    server.join()
