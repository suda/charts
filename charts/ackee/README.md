# ackee [![](https://img.shields.io/static/v1.svg?label=Deploy%20on&message=DigitalOcean&color=blue)](https://www.digitalocean.com/products/kubernetes/?refcode=fef9487dad1e&utm_campaign=Referral_Invite&utm_medium=Referral_Program&utm_source=CopyPaste)

[Ackee](https://ackee.electerious.com/) - Self-hosted analytics tool for those who care about privacy

## TL;DR;

```console
$ helm repo add suda https://suda.github.io/charts/
$ helm repo update
$ helm install ackee-release suda/ackee -n ackee
```

## Introduction

This chart deploys  on a [Kubernetes](http://kubernetes.io) cluster using the [Helm](https://helm.sh) package manager.

## Prerequisites


## Installing the Chart

To install the chart with the release name `ackee-release`:

```console
$ helm install ackee-release suda/ackee -n ackee
```

The command deploys  on the Kubernetes cluster in the default configuration. The [configuration](#configuration) section lists the parameters that can be configured during installation.

> **Tip**: List all releases using `helm list`

## Uninstalling the Chart

To uninstall/delete the `ackee-release`:

```console
$ helm delete ackee-release -n ackee
```

The command removes all the Kubernetes components associated with the chart and deletes the release.

## Configuration

The following table lists the configurable parameters of the `ackee` chart and their default values.

|                          Parameter                          |                              Description                              |            Default            |
|-------------------------------------------------------------|-----------------------------------------------------------------------|-------------------------------|
| nameOverride                                                | Overrides name template                                               | `""`                          |
| fullnameOverride                                            | Overrides fullname template                                           | `""`                          |
| replicaCount                                                | Number of Ackee replicas to create                                    | `1`                           |
| ackee.mongodb                                               | Address to MongoDB for ackee                                          | `mongodb://mongo:27017/ackee` |
| ackee.username                                              | Username for the default Ackee user                                   | `ackee`                       |
| ackee.passwordSecret                                        | Name of the secret containing the password for the default Ackee user | `ackee-password`              |
| image.repository                                            | Ackee Image name                                                      | `electerious/ackee`           |
| image.tag                                                   | Ackee Image tag                                                       | `2.4.1`                       |
| image.pullPolicy                                            | Image pull policy                                                     | `IfNotPresent`                |
| service.type                                                | Kubernetes Service type                                               | `ClusterIP`                   |
| service.port                                                | Ackee service port                                                    | `80`                          |
| ingress.enabled                                             | Enable ingress controller resource                                    | `false`                       |
| ingress.annotations.nginx.ingress.kubernetes.io/enable-cors |                                                                       | `"true"`                      |
| ingress.path                                                |                                                                       | `/`                           |
| ingress.tls                                                 | Ingress TLS configuration                                             | `[]`                          |
| livenessProbe.enabled                                       | Turn on and off liveness probe                                        | `true`                        |
| livenessProbe.initialDelaySeconds                           | Delay before liveness probe is initiated                              | `10`                          |
| livenessProbe.periodSeconds                                 | How often to perform the probe                                        | `60`                          |
| livenessProbe.timeoutSeconds                                | When the probe times out                                              | `2`                           |
| livenessProbe.successThreshold                              | Minimum consecutive successes for the probe                           | `1`                           |
| livenessProbe.failureThreshold                              | Minimum consecutive failures for the probe                            | `3`                           |
| readinessProbe.enabled                                      | Turn on and off readiness probe                                       | `true`                        |
| readinessProbe.initialDelaySeconds                          | Delay before readiness probe is initiated                             | `10`                          |
| readinessProbe.periodSeconds                                | How often to perform the probe                                        | `60`                          |
| readinessProbe.timeoutSeconds                               | When the probe times out                                              | `2`                           |
| readinessProbe.successThreshold                             | Minimum consecutive successes for the probe                           | `1`                           |
| readinessProbe.failureThreshold                             | Minimum consecutive failures for the probe                            | `3`                           |
| resources                                                   | CPU/Memory resource requests/limits                                   | `{}`                          |
| nodeSelector                                                | Node selector for pod assignment                                      | `{}`                          |
| tolerations                                                 | Optional deployment tolerations                                       | `[]`                          |
| affinity                                                    | Map of node/pod affinities                                            | `{}`                          |


Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`. For example:

```console
$ helm install ackee-release suda/ackee -n ackee --set replicaCount=1
```

Alternatively, a YAML file that specifies the values for the parameters can be provided while
installing the chart. For example:

```console
$ helm install ackee-release suda/ackee -n ackee --values values.yaml
```
