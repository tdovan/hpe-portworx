#!§bin/sh

kubectl -n px-kafka-zookeeper delete -f zk-ss.yaml
kubectl -n px-kafka-zookeeper delete -f zk-config.yaml
kubectl -n px-kafka-zookeeper delete -f px-ha-sc.yaml
