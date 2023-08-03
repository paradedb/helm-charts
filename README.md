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
- A Postgres database which can be accesed from the cluster

## Installation

To install the Retake Search on your cluster, follow these steps:

1. Clone this repository:

```bash
git clone https://github.com/getretake/retake.git && cd charts
```

2. Review and customize the `values.yaml` file to suit your specific deployment
   needs.

3. Install the chart using Helm:

```bash
helm install retake search --namespace retake
```

> Note: Retake Helm Chart will be published to a repository soon!

## Configuration

The Retake Search Product Helm chart can be configured using the values.yaml
file or by specifying values on the command line during installation.

Check the
[values.yaml](https://github.com/getretake/charts/blob/06da7e5bb48fd1cbb33b96809bfd1f4e005582ef/search/values.yaml)
for more information.

## Usage

By default, the chart exposes retake search as a `NodePort` on your cluster. You
can access the port using the ip address of any of your nodes. To list the ip
adresses run:

```bash
kubectl get nodes -o wide
```

And you can visualize the port where the Retake API by looking at retake's
`NodePort` service with:

```bash
kubectl get services
```

Once all pods and services are running, you are ready to start using Retake!

Refer to the [documentation](https://docs.getretake.com/introduction) for more
information.

### Expose using an Ingress

If you wish to use an `Ingress` for exposing the API, you can set the property
`ingress.enabled` to `true`. Note that the chart does not provide an Ingress
Controller yet, so an
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

2. Install the chart using Helm:

```bash
helm install retake search --namespace retake
```

You are set!
