# Kafka Helm Chart (Strimzi)

This chart creates Strimzi `Kafka` and `KafkaNodePool` custom resources and optionally a `KafkaTopic`. It does not install the Strimzi operator itself.

## Prerequisite: install the Strimzi operator

```powershell
helm repo add strimzi https://strimzi.io/charts/
helm repo update
kubectl create namespace kafka
helm install strimzi-operator strimzi/strimzi-kafka-operator --namespace kafka
kubectl get pods -n kafka
```

Use an operator version compatible with your Kubernetes version and Kafka version. Official docs: https://strimzi.io/docs/operators/latest/full/deploying.html

## Validate and install this chart

Run from the directory containing `kafka-cluster`:

```powershell
helm lint ./kafka-cluster
helm template kafka ./kafka-cluster --namespace kafka
helm upgrade --install kafka ./kafka-cluster --namespace kafka --create-namespace
kubectl get kafka,kafkanodepool,pods,svc -n kafka
```

## Connect from inside Kubernetes

Default bootstrap service: `kafka-kafka-bootstrap.kafka.svc:9092`

## Persistent storage

The default `nodePool.storage.type: ephemeral` is only for development; data may be lost when pods are recreated. For PVC-backed storage set:

```yaml
nodePool:
  storage:
    type: persistent
    size: 10Gi
    deleteClaim: false
```

Make sure a suitable StorageClass exists. Single-broker mode is not highly available and is not recommended for production. For production, use multiple brokers/controllers, persistent storage, TLS/authentication, resource planning, and backups.

## Optional topic

Set `topic.enabled: true` in `values.yaml`, then set topic name, partitions, and replicas. For a single-broker dev cluster, `topic.replicas` must remain `1`.

## Upgrade / uninstall

```powershell
helm upgrade kafka ./kafka-cluster -n kafka
helm uninstall kafka -n kafka
```

Review PVCs and data-retention requirements before removing storage-related resources.
