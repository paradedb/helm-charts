<h1 align="center">
  <img src="https://raw.githubusercontent.com/paradedb/paradedb/dev/docs/logo/readme.svg" alt="ParadeDB" width="368px"></a>
<br>
</h1>

<p align="center">
    <b>PostgreSQL for Search</b> <br />
</p>

<h3 align="center">
  <a href="https://paradedb.com">Website</a> &bull;
  <a href="https://docs.paradedb.com">Documentation</a> &bull;
  <a href="https://paradedb.com/blog">Blog</a> &bull;
  <a href="https://join.slack.com/t/paradedbcommunity/shared_invite/zt-217mordsh-ielS6BiZf7VW3rqKBFgAlQ">Community</a>
</h3>

---

# Helm Chart

This repository contains the Helm chart for deploying and managing ParadeDB on
Kubernetes.

## Prerequisites

- A Kubernetes cluster with at least v1.21
- [Helm](https://helm.sh/)
- A Postgres database that can be accessed from the cluster

## Usage

[Helm](https://helm.sh) must be installed to use the charts. Please refer to
Helm's [documentation](https://helm.sh/docs) to get started.

Once Helm has been set up correctly, add the repo as follows:

    helm repo add paradedb https://paradedb.github.io/helm-charts

If you had already added this repo earlier, run `helm repo update` to retrieve
the latest versions of the packages. You can then run
`helm search repo paradedb` to see the charts.

To install the paradedb chart:

    helm install my-db paradedb/paradedb

To uninstall the chart:

    helm delete my-db

## Configuration

The ParadeDB Helm chart can be configured using the values.yaml file or by
specifying values on the command line during installation.

Check the
[values.yaml](https://github.com/paradedb/helm-charts/blob/main/charts/paradedb/values.yaml)
for more information.

### Expose using an Ingress

If you wish to use an `Ingress` for exposing the API, you can set the property
`ingress.enabled` to `true`. Note that an
[Ingress Controller](https://kubernetes.io/docs/concepts/services-networking/ingress-controllers/)
must be installed in your cluster for the `Ingress` resource to work.

## Development

For local development, its recommended to use a local Kubernetes cluster like
[Minikube](https://minikube.sigs.k8s.io/docs/) or
[kind](https://kind.sigs.k8s.io/). Then install by doing the following:

1. Clone this repository:

```bash
git clone https://github.com/paradedb/helm-charts && cd charts
```

2. Change into the charts directory:

```bash
cd helm-charts/charts
```

3. Build dependencies:

```bash
helm dep up
```

4. Install the chart using Helm:

```bash
helm install paradedb paradedb --namespace paradedb --create-namespace
```

You are set!

## Contributing

For more information on how to contribute, please see our
[Contributing Guide](CONTRIBUTING.md).

## License

ParadeDB is [Elastic License 2.0 licensed](LICENSE).
