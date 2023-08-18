<p align="center">
  <img src="https://raw.githubusercontent.com/getretake/retake/dev/assets/retake.svg" alt="Retake" width="125px"></a>
</p>

<h1 align="center">
    <b>Retake</b>
</h1>

# Helm Chart

This repository contains the Helm chart for deploying and managing Retake Search
on Kubernetes.

## Prerequisites

- A Kubernetes cluster with at least v1.21
- [Helm](https://helm.sh/)
- A Postgres database that can be accessed from the cluster

## Usage

[Helm](https://helm.sh) must be installed to use the charts. Please refer to
Helm's [documentation](https://helm.sh/docs) to get started.

Once Helm has been set up correctly, add the repo as follows:

    helm repo add retake https://getretake.github.io/helm-charts

If you had already added this repo earlier, run `helm repo update` to retrieve
the latest versions of the packages. You can then run `helm search repo retake`
to see the charts.

To install the search chart:

    helm install my-search retake/search

To uninstall the chart:

    helm delete my-search

## Configuration

The Retake Search Product Helm chart can be configured using the values.yaml
file or by specifying values on the command line during installation.

Check the
[values.yaml](https://github.com/getretake/charts/blob/06da7e5bb48fd1cbb33b96809bfd1f4e005582ef/search/values.yaml)
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
git clone https://github.com/getretake/retake.git && cd charts
```

2. Change into the charts directory:

```bash
cd helm-charts/charts
```

3. Build dependencies:

```bash
helm dep up
```

4. Create the `retake` namespace:

```bash
kubectl create ns retake
```

5. Install the chart using Helm:

```bash
helm install retake search --namespace retake
```

You are set!

## Contributing

For more information on how to contribute, please see our
[Contributing Guide](CONTRIBUTING.md).

## License

Retake is [Elastic License 2.0 licensed](LICENSE).
