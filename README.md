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
  <a href="https://join.slack.com/t/paradedbcommunity/shared_invite/zt-217mordsh-ielS6BiZf7VW3rqKBFgAlQ">Community</a> &bull;
  <a href="https://blog.paradedb.com">Blog</a> &bull;
  <a href="https://docs.paradedb.com/changelog/">Changelog</a>
</h3>

---

[![Publish Helm Chart](https://github.com/paradedb/helm-charts/actions/workflows/publish-helm-chart.yml/badge.svg)](https://github.com/paradedb/helm-charts/actions/workflows/publish-helm-chart.yml)
[![Artifact Hub](https://img.shields.io/endpoint?url=https://artifacthub.io/badge/repository/paradedb)](https://artifacthub.io/packages/search?repo=paradedb)

# ParadeDB Helm Chart

This repository contains the Helm chart for deploying and managing ParadeDB on Kubernetes. There are 3 ways in which you can deploy ParadeDB on Kubernetes:

- Using the ParadeDB Helm chart directly
- Using the Bitnami Helm chart with the ParadeDB-provided `values.yaml`
- Using the Bitnami Helm chart with the ParadeDB-provided `helmfile.yaml`

## Prerequisites

- A Kubernetes cluster with at least v1.21
- [Helm](https://helm.sh/)

The steps below assume you have an accessible Kubernetes cluster.

### Install Helm

First, install Helm. You can do so using their installation script:

```bash
curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
chmod 700 get_helm.sh
./get_helm.sh
```

See the [Helm docs](https://helm.sh/docs/intro/install/) for more information.

## Usage

### Using the ParadeDB Helm Chart

First, add the ParadeDB repo to Helm as follows:

```bash
helm repo add paradedb https://paradedb.github.io/helm-charts
```

If you had already added this repository earlier, run `helm repo update` to retrieve the latest versions of the packages. You can then run `helm search repo paradedb` to see the charts.

To install the `paradedb` chart:

```bash
helm install <mydb> paradedb/paradedb
```

To uninstall the chart:

```bash
helm delete <mydb>
```

You can also download the chart directly from [ArtifactHub](https://artifacthub.io/packages/helm/paradedb/paradedb).

### Using the Bitnami Helm Chart with ParadeDB `values.yaml`

You can install ParadeDB using Helm and the Bitnami Postgres chart directly. The ParadeDB Helm chart can be configured using the `values.yaml` file or by specifying values on the command line during installation. To do so, run:

```bash
helm install paradedb oci://registry-1.docker.io/bitnamicharts/postgresql --namespace paradedb --create-namespace --values values.yaml
```

You can configure the values inside the `values.yaml` file. Check the [values.yaml](https://github.com/paradedb/helm-charts/blob/main/charts/paradedb/values.yaml) file for more information. For a list of possible configurations, see the [Bitnami Postgres chart parameters](https://github.com/bitnami/charts/tree/main/bitnami/postgresql#parameters).

### Using the Bitnami Helm Chart with ParadeDB `helmfile.yaml`

You can install ParadeDB using [Helmfile](https://helmfile.readthedocs.io/en/latest/). Once Helmfile is installed, you can download the `helmfile.yaml` file from this repository and run:

```bash
helmfile apply
```

You can configure values inside the `helmfile.yaml`. For a list of possible configurations, see the [Bitnami Postgres hart parameters](https://github.com/bitnami/charts/tree/main/bitnami/postgresql#parameters)

## Development

For local development, it is recommended to use a local Kubernetes cluster like [Minikube](https://minikube.sigs.k8s.io/docs/)
or [kind](https://kind.sigs.k8s.io/). Then, install ParadeDB by doing the following:

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

ParadeDB is licensed under the [GNU Affero General Public License v3.0](LICENSE) and as commercial software.

For commercial licensing, please contact us at [sales@paradedb.com](mailto:sales@paradedb.com).

If you are an open-source project and would like to use ParadeDB under a different license, please contact us at [hello@paradedb.com](mailto:hello@paradedb.com).
