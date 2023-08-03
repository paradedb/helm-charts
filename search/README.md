# Parameters

The most common parameters are listed here. For a complete list, refer to the
[values.yaml](https://github.com/getretake/charts/blob/06da7e5bb48fd1cbb33b96809bfd1f4e005582ef/search/values.yaml)
file.

## Search

Retake Search API

| Name                    | Description                            | Value      |
| ----------------------- | -------------------------------------- | ---------- |
| `replicaCount`          | Replicas of Retake API                 | `1`        |
| `nameOverride`          | Partial name override                  | `""`       |
| `fullnameOverride`      | Full name override                     | `""`       |
| `serviceAccount.create` | If a service account should be created | `true`     |
| `service.type`          | Type of service to expose the API      | `NodePort` |
| `service.port`          | Port where the API is exposed          | `8000`     |
| `ingress.enabled`       | If an ingress should be created        | `false`    |
| `tolerations`           | Pod tolerations                        | `""`       |
| `affinity`              | Node affinity                          | `""`       |

## Pgsync

Retake Pgsync Server

| Name                    | Description                                           | Value       |
| ----------------------- | ----------------------------------------------------- | ----------- |
| `replicaCount`          | Replicas of Retake pgsync server                      | `1`         |
| `nameOverride`          | Partial name override                                 | `""`        |
| `fullnameOverride`      | Full name override                                    | `""`        |
| `serviceAccount.create` | If a service account should be created                | `true`      |
| `service.type`          | Type of service to expose the API                     | `ClusterIP` |
| `service.port`          | Port where the API is exposed                         | `7433`      |
| `security.tls`          | Enables communication over TLS with the pgsync server | `false`     |
| `tolerations`           | Pod tolerations                                       | `""`        |
| `affinity`              | Node affinity                                         | `""`        |

## OpenSearch

Opensearch cluster. See the
[documentation](https://github.com/opensearch-project/helm-charts) for more
information on this chart.

| Name                       | Description                                                                 | Value                         |
| -------------------------- | --------------------------------------------------------------------------- | ----------------------------- |
| `opensearch.clusterName`   | Opensearch cluster name                                                     | `"opensearch-cluster"`        |
| `opensearch.nodeGroup`     | Opensearch master group name                                                | `"master"`                    |
| `opensearch.masterService` | Opensearch master node name. Should be set to clusterName + "-" + nodeGroup | `"opensearch-cluster-master"` |
| `opensearch.user`          | Opensearch user                                                             | `"admin"`                     |
| `opensearch.password`      | Opensearch password                                                         | `"admin"`                     |
| `opensearch.singleNode`    | If true, replicas will be forced to 1                                       | `false`                       |
| `opensearch.replicas`      | Replicas of Opensearch Cluster                                              | `3`                           |

## Redis

Redis deployment. See the
[documentation](https://github.com/bitnami/charts/tree/main/bitnami/redis) for
more information on this chart.

| Name                                | Description                               | Value     |
| ----------------------------------- | ----------------------------------------- | --------- |
| `redis.master.containerPorts.redis` | Port where the master node can be reached | `6379`    |
| `auth.enabled`                      | If password authentication is enabled     | `true`    |
| `auth.password`                     | Password to access the master node        | `"redis"` |
