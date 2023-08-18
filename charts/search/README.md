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

## Sync

Retake Sync Server

| Name                    | Description                                         | Value       |
| ----------------------- | --------------------------------------------------- | ----------- |
| `replicaCount`          | Replicas of Retake sync server                      | `1`         |
| `nameOverride`          | Partial name override                               | `""`        |
| `fullnameOverride`      | Full name override                                  | `""`        |
| `serviceAccount.create` | If a service account should be created              | `true`      |
| `service.type`          | Type of service to expose the API                   | `ClusterIP` |
| `service.port`          | Port where the API is exposed                       | `7433`      |
| `security.tls`          | Enables communication over TLS with the sync server | `false`     |
| `tolerations`           | Pod tolerations                                     | `""`        |
| `affinity`              | Node affinity                                       | `""`        |

## OpenSearch

The OpenSearch cluster is deployed using the OpenSearch Operator. See the
[documentation](https://github.com/Opster/opensearch-k8s-operator) for more
information on installing and using the operator.

| Name                                                | Description                                                           | Value            |
| --------------------------------------------------- | --------------------------------------------------------------------- | ---------------- |
| `opensearchCluster.enabled`                         | If the OpenSearch cluster is enabled                                  | `true`           |
| `opensearchCluster.installOperator`                 | If the OpenSearch Operator should be installed                        | `true`           |
| `opensearchCluster.general.httpPort`                | Port used to connect to the cluster                                   | `9200`           |
| `opensearchCluster.general.version`                 | OpenSearch version to use                                             | `2.9.0`          |
| `opensearchCluster.general.serviceName`             | Name of the service where the cluster will be exposed                 | `"core-cluster"` |
| `opensearchCluster.dashboards.enabled`              | If the OpenSearch dashboard is enabled                                | `false`          |
| `opensearchCluster.security.tls`                    | If TLS is enabled on the cluster. Used by the search and sync servers | `true`           |
| `opensearchCluster.security.tls.transport.generate` | Indicates if certificates are generated and managed by the operator   | `true`           |
| `opensearchCluster.security.tls.transport.perNode`  | If set, a certificate will be generated for each node in the cluster  | `true`           |

## Redis

Redis deployment. See the
[documentation](https://github.com/bitnami/charts/tree/main/bitnami/redis) for
more information on this chart.

| Name                                | Description                               | Value     |
| ----------------------------------- | ----------------------------------------- | --------- |
| `redis.master.containerPorts.redis` | Port where the master node can be reached | `6379`    |
| `auth.enabled`                      | If password authentication is enabled     | `true`    |
| `auth.password`                     | Password to access the master node        | `"redis"` |
