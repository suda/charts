# documentserver

![Version: 7.0.1](https://img.shields.io/badge/Version-7.0.1-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 7.0.0](https://img.shields.io/badge/AppVersion-7.0.0-informational?style=flat-square)

Helm chart for installing ONLYOFFICE Docs in Kubernetes

**Homepage:** <https://github.com/suda/charts/tree/main/charts/documentserver>

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| suda | <admin@suda.pl> | <https://suda.pl> |

## Source Code

* <https://github.com/suda/charts/tree/main/charts/documentserver>

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| connections.amqpHost | string | `"rabbitmq"` | IP address or the name of the message broker |
| connections.amqpPasswordSecret | string | `""` | Secret name to use for the database password |
| connections.amqpProto | string | `"amqp"` | Messabe-broker protocol |
| connections.amqpUser | string | `"user"` | Messabe broker user |
| connections.dbHost | string | `"postgresql"` | IP address or the name of the database |
| connections.dbPasswordSecret | string | `""` | Secret name to use for the database password |
| connections.dbPort | string | `"5432"` | Database server port number |
| connections.dbUser | string | `"postgres"` | Database user |
| connections.redisHost | string | `"redis-master"` | IP address or the name of the redis host |
| converter.containerImage | string | `"onlyoffice/docs-converter-de:7.0.0.132"` | Converter container image name |
| converter.replicas | int | `1` | Converter replicas quantity |
| converter.resources | object | `{}` | CPU/Memory resource requests/limits |
| docservice.containerImage | string | `"onlyoffice/docs-docservice-de:7.0.0.132"` | docservice container image name |
| docservice.livenessProbe.failureThreshold | int | `5` |  |
| docservice.livenessProbe.httpGet.path | string | `"/index.html"` |  |
| docservice.livenessProbe.httpGet.port | int | `8000` |  |
| docservice.livenessProbe.periodSeconds | int | `10` |  |
| docservice.livenessProbe.successThreshold | int | `1` |  |
| docservice.livenessProbe.timeoutSeconds | int | `3` |  |
| docservice.livenessProbeEnabled | bool | `false` | Enable livenessProbe for docservice |
| docservice.readinessProbe.failureThreshold | int | `2` |  |
| docservice.readinessProbe.httpGet.path | string | `"/index.html"` |  |
| docservice.readinessProbe.httpGet.port | int | `8000` |  |
| docservice.readinessProbe.periodSeconds | int | `10` |  |
| docservice.readinessProbe.successThreshold | int | `1` |  |
| docservice.readinessProbe.timeoutSeconds | int | `3` |  |
| docservice.readinessProbeEnabled | bool | `false` | Enable readinessProbe for docservice |
| docservice.replicas | int | `1` | docservice replicas quantity |
| docservice.resources | object | `{}` | CPU/Memory resource requests/limits |
| docservice.startupProbe.failureThreshold | int | `30` |  |
| docservice.startupProbe.httpGet.path | string | `"/index.html"` |  |
| docservice.startupProbe.httpGet.port | int | `8000` |  |
| docservice.startupProbe.periodSeconds | int | `10` |  |
| docservice.startupProbeEnabled | bool | `false` | Enable startupProbe for docservice |
| example.containerImage | string | `"onlyoffice/docs-example:7.0.0.132"` | Example container image name |
| example.enabled | bool | `false` | Choice of example installation |
| grafana_ingress.enabled | bool | `false` | Installation grafana of ingress service |
| ingress.enabled | bool | `false` | Installation of ingress service |
| ingress.ssl.enabled | bool | `false` | Installation SSL for ingress service |
| ingress.ssl.host | string | `"example.com"` | Host for ingress |
| ingress.ssl.secret | string | `"tls"` | Secret name for SSL |
| jwt.enabled | bool | `true` | JWT enabling parameter |
| jwt.secret | string | `"MYSECRET"` | JWT secret |
| metrics.enabled | bool | `false` | Statsd installation |
| persistence.enabled | bool | `false` | Enabling persistence |
| persistence.size | string | `"8Gi"` | Storage volume size |
| persistence.storageClass | string | `""` | Storage class name |
| product.name | string | `"onlyoffice"` |  |
| proxy.livenessProbe.failureThreshold | int | `3` |  |
| proxy.livenessProbe.httpGet.path | string | `"/index.html"` |  |
| proxy.livenessProbe.httpGet.port | int | `8888` |  |
| proxy.livenessProbe.periodSeconds | int | `10` |  |
| proxy.livenessProbe.successThreshold | int | `1` |  |
| proxy.livenessProbe.timeoutSeconds | int | `3` |  |
| proxy.livenessProbeEnabled | bool | `false` | Enable livenessProbe for proxy |
| proxy.proxyContainerImage | string | `"onlyoffice/docs-proxy-de:7.0.0.132"` | docservice proxy container image name |
| proxy.resources | object | `{}` | CPU/Memory resource requests/limits |
| proxy.startupProbe.failureThreshold | int | `30` |  |
| proxy.startupProbe.httpGet.path | string | `"/index.html"` |  |
| proxy.startupProbe.httpGet.port | int | `8888` |  |
| proxy.startupProbe.periodSeconds | int | `10` |  |
| proxy.startupProbeEnabled | bool | `false` | Enable startupProbe for proxy |
| service.port | int | `8888` | documentserver service port |
| service.type | string | `"ClusterIP"` | documentserver service type |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.11.0](https://github.com/norwoodj/helm-docs/releases/v1.11.0)
