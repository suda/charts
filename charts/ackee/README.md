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

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| ackee.corsHeaders | string | `""` | Setting CORS headers |
| ackee.mongodb | string | `"mongodb://mongo:27017/ackee"` | Address to MongoDB for ackee |
| ackee.passwordSecret | string | `"ackee-password"` | Name of the secret containing the password for the default Ackee user |
| ackee.trackerName | string | `"tracker"` | Custom name for the tracking script of Ackee to avoid getting blocked by browser extensions |
| ackee.ttl | int | `3600000` | Specifies how long a generated token is valid |
| ackee.username | string | `"ackee"` | Username for the default Ackee user |
| affinity | object | `{}` | Map of node/pod affinities |
| fullnameOverride | string | `""` | Overrides fullname template |
| image.pullPolicy | string | `"IfNotPresent"` | Image pull policy |
| image.repository | string | `"electerious/ackee"` | Ackee Image name |
| image.tag | string | `"3.2.0"` | Ackee Image tag |
| ingress.annotations | object | `{"nginx.ingress.kubernetes.io/enable-cors":"true"}` | Ingress annotations configuration |
| ingress.enabled | bool | `false` | Enable ingress controller resource |
| ingress.hosts | list | `["chart-example.local"]` | A list of ingress hosts |
| ingress.path | string | `"/"` |  |
| ingress.tls | list | `[]` | Ingress TLS configuration |
| livenessProbe.enabled | bool | `true` | Turn on and off liveness probe |
| livenessProbe.failureThreshold | int | `3` | Minimum consecutive failures for the probe |
| livenessProbe.initialDelaySeconds | int | `10` | Delay before liveness probe is initiated |
| livenessProbe.periodSeconds | int | `60` | How often to perform the probe |
| livenessProbe.successThreshold | int | `1` | Minimum consecutive successes for the probe |
| livenessProbe.timeoutSeconds | int | `2` | When the probe times out |
| nameOverride | string | `""` | Overrides name template |
| nodeSelector | object | `{}` | Node selector for pod assignment |
| readinessProbe.enabled | bool | `true` | Turn on and off readiness probe |
| readinessProbe.failureThreshold | int | `3` | Minimum consecutive failures for the probe |
| readinessProbe.initialDelaySeconds | int | `10` | Delay before readiness probe is initiated |
| readinessProbe.periodSeconds | int | `60` | How often to perform the probe |
| readinessProbe.successThreshold | int | `1` | Minimum consecutive successes for the probe |
| readinessProbe.timeoutSeconds | int | `2` | When the probe times out |
| replicaCount | int | `1` | Number of Ackee replicas to create |
| resources | object | `{}` | CPU/Memory resource requests/limits |
| service.port | int | `80` | Ackee service port |
| service.type | string | `"ClusterIP"` | Kubernetes Service type |
| tolerations | list | `[]` | Optional deployment tolerations |

Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`. For example:

```console
$ helm install ackee-release suda/ackee -n ackee --set replicaCount=1
```

Alternatively, a YAML file that specifies the values for the parameters can be provided while
installing the chart. For example:

```console
$ helm install ackee-release suda/ackee -n ackee --values values.yaml
```

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| suda | <admin@suda.pl> | <https://suda.pl> |