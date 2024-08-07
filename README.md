<h1 align="center">
  <img src="https://raw.githubusercontent.com/paradedb/paradedb/dev/docs/logo/readme.svg" alt="ParadeDB" width="368px"></a>
<br>
</h1>

<p align="center">
    <b>Postgres for Search and Analytics</b> <br />
</p>

<h3 align="center">
  <a href="https://paradedb.com">Website</a> &bull;
  <a href="https://docs.paradedb.com">Docs</a> &bull;
  <a href="https://join.slack.com/t/paradedbcommunity/shared_invite/zt-2lkzdsetw-OiIgbyFeiibd1DG~6wFgTQ">Community</a> &bull;
  <a href="https://blog.paradedb.com">Blog</a> &bull;
  <a href="https://docs.paradedb.com/changelog/">Changelog</a>
</h3>

---

[![Publish Helm Chart](https://github.com/paradedb/helm-charts/actions/workflows/publish-helm-chart.yml/badge.svg)](https://github.com/paradedb/helm-charts/actions/workflows/publish-helm-chart.yml)
[![Artifact Hub](https://img.shields.io/endpoint?url=https://artifacthub.io/badge/repository/paradedb)](https://artifacthub.io/packages/search?repo=paradedb)
[![Docker Pulls](https://img.shields.io/docker/pulls/paradedb/paradedb)](https://hub.docker.com/r/paradedb/paradedb)
[![License](https://img.shields.io/github/license/paradedb/paradedb?color=blue)](https://github.com/paradedb/paradedb?tab=AGPL-3.0-1-ov-file#readme)
[![Slack URL](https://img.shields.io/badge/Join%20Slack-purple?logo=slack&link=https%3A%2F%2Fjoin.slack.com%2Ft%2Fparadedbcommunity%2Fshared_invite%2Fzt-2lkzdsetw-OiIgbyFeiibd1DG~6wFgTQ)](https://join.slack.com/t/paradedbcommunity/shared_invite/zt-2lkzdsetw-OiIgbyFeiibd1DG~6wFgTQ)
[![X URL](https://img.shields.io/twitter/url?url=https%3A%2F%2Ftwitter.com%2Fparadedb&label=Follow%20%40paradedb)](https://x.com/paradedb)

# ParadeDB Helm Chart

This repository contains the Helm chart for deploying and managing ParadeDB on Kubernetes via [CloudNativePG](https://cloudnative-pg.io/).

## Prerequisites

- A Kubernetes cluster with at least v1.21
- [Helm](https://helm.sh/)
- [CloudNativePG Operator](https://cloudnative-pg.io/) installed on the Kubernetes cluster

## Usage

The steps below assume you have an accessible Kubernetes cluster.

### Installing Helm

First, install Helm. You can do so using their installation script:

```bash
curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
chmod 700 get_helm.sh
./get_helm.sh
```

See the [Helm docs](https://helm.sh/docs/intro/install/) for more information.

### Installing CloudNativePG Operator

This chart does not include the Custom Resource Definitions (CRDs) from the CloudNativePG Operator, and it doesn't explicitly depend on it due to Helm's constraints with CRD management. As such, the operator itself is not bundled within this chart.

To use this chart, you need to independently install the operator CRDs. You can install the operator using the [official Helm chart](https://github.com/cloudnative-pg/charts).

```bash
helm repo add cnpg https://cloudnative-pg.github.io/charts
helm upgrade --install cnpg \
  --namespace cnpg-system \
  --create-namespace \
  cnpg/cloudnative-pg
```

It is also possible to install using the manifest directly. See the operator [installation documentation](https://cloudnative-pg.io/documentation/1.21/installation_upgrade/#installation-on-kubernetes) for more information.

### Installing ParadeDB Helm Chart

Once the operator is installed, add the ParadeDB repository to Helm as follows:

```bash
helm repo add paradedb https://paradedb.github.io/helm-charts
```

If you had already added this repository earlier, run `helm repo update` to retrieve the latest versions of the packages. You can then run `helm search repo paradedb` to see the charts.

To install the `paradedb` chart:

```bash
helm install <my-db> paradedb/paradedb
```

To uninstall the chart:

```bash
helm delete <my-db>
```

You can also download the chart directly from [Artifact Hub](https://artifacthub.io/packages/helm/paradedb/paradedb).

## Configuration

The ParadeDB Helm chart can be configured using the `values.yaml` file or by specifying values on the command line during installation.

Check the [values.yaml](https://github.com/paradedb/helm-charts/blob/main/charts/paradedb/values.yaml) file for more information.

## Development

For local development, it is recommended to use a local Kubernetes cluster like [Minikube](https://minikube.sigs.k8s.io/docs/) or [kind](https://kind.sigs.k8s.io/). Then, install ParadeDB by doing the following:

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

You are now all set to start developing and testing locally!

## License

ParadeDB is licensed under the [GNU Affero General Public License v3.0](LICENSE) and as commercial software. For commercial licensing, please contact us at [sales@paradedb.com](mailto:sales@paradedb.com).
