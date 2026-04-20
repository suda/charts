# Private Kubernetes OpenVPN Helm chart

[![](https://img.shields.io/static/v1.svg?label=Deploy%20on&message=DigitalOcean&color=blue)](https://www.digitalocean.com/products/kubernetes/?refcode=fef9487dad1e&utm_campaign=Referral_Invite&utm_medium=Referral_Program&utm_source=CopyPaste) ![Version: 0.2.1](https://img.shields.io/badge/Version-0.2.1-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 2.4](https://img.shields.io/badge/AppVersion-2.4-informational?style=flat-square)

**TL;DR:** This Chart is intended for deploying a private VPN server **without access to other Pods in the cluster**.
Think of it as roll-your-own Nord/Express VPN in your Kubernetes cluster.

## Usage

```bash
$ helm repo add suda https://suda.github.io/charts/
$ helm repo update
$ helm install suda/personal-ovpn
```
### Skip manual steps: Automatic and Insecure way (not for production)

```bash
$ helm repo add suda https://suda.github.io/charts/
$ helm repo update
$ helm install suda/personal-ovpn --set automatic.enabled=true
```

### Generate necessary secrets (manual way & secure CA)

```bash
$ git clone https://github.com/suda/charts.git
$ cd charts
$ export VPN_HOSTNAME=vpn.example.com
# Generate basic OpenVPN config
$ ./bin/generate-config
# Repeat this step for all the clients you need
$ CLIENT_NAME=my-client ./bin/add-client
# Set the Kubernetes secrets. Prepend with REPLACE=true to update existing ones
$ ./bin/set-secrets
```

After generating the secrets above, you'll have all the config, certificates **and the keys** on your machine, in the `ovpn0` directory. You need it to add more clients later but also isn't very secure to keep those keys just laying around on your machine.

### Allowing traffic inside of the cluster

If you want to make debugging the cluster easier and use VPN to access the pods, you might prefer using [`stable/openvpn` chart](https://github.com/helm/charts/tree/master/stable/openvpn).
But if you really want to, you can enable it by setting `limitTraficToNamespace` value to `false`.

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| suda | <admin@suda.pl> |  |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` | node/pod affinities (requires Kubernetes >=1.6) |
| automatic.cipher | string | `"AES-256-CBC"` | Cipher used |
| automatic.digestAlgorythm | string | `"SHA384"` | Authenticate  packets with HMAC using the given message digest algorithm (auth). |
| automatic.dnsServer | string | `"8.8.8.8"` | DNS Server IP |
| automatic.enabled | bool | `false` | Skip manual steps and generate configuration & pki according to values config, Warning, PKI will be passwordless ! |
| automatic.externalHostname | string | `""` | Hostname OR Ip of cluster openvpn entrypoint, default to 'domain.tld' so you must define it |
| automatic.externalPort | string | `""` | Port cluster openvpn entrypoint, defaults to service.port (nodePort) |
| automatic.extraOptions | list | `[]` | Additional options for openvpn configuration |
| automatic.persistence.accessModes | list | `["ReadWriteOnce"]` | PersistentVolumeClaim access modes |
| automatic.persistence.annotations | object | `{}` | PersistentVolumeClaim annotations |
| automatic.persistence.mountPath | string | `"/etc/openvpn"` | PersistentVolumeClaim mounting path |
| automatic.persistence.size | string | `"8Gi"` | PersistentVolumeClaim size request |
| fullnameOverride | string | `""` | release full release name override option |
| image.pullPolicy | string | `"IfNotPresent"` | container image pull policy |
| image.repository | string | `"kylemanna/openvpn"` | container image repository |
| image.tag | string | `""` | container image tag or Chart appVersion if undefined |
| limitTraficToNamespace | bool | `true` | limit network traffic just to OpenVPN namespace |
| limitedCidr | string | `"10.0.0.0/8"` | CIDR to be blocked out |
| nameOverride | string | `""` | release name override option |
| namespace | object | `{"name":"ovpn"}` | release namespace |
| nodeSelector | object | `{}` | node labels for pod assignment |
| resources | object | `{}` | pod resource requests & limits |
| secretName | string | `"ovpn0"` |  |
| security.ipForward | int | `0` |  |
| security.privileged | bool | `false` |  |
| service.port | int | `31304` | OpenVPN port |
| service.port | int | `31304` | OpenVPN port |
| service.protocol | string | `"TCP"` | OpenVPN protocol |
| service.type | string | `"NodePort"` | Service type |
| tolerations | list | `[]` | node taints to tolerate (requires Kubernetes >=1.6) |

## Acknowledgements

This chart is based on [`chepurko/k8s-ovpn`](https://github.com/chepurko/k8s-ovpn) which is using the great [`kylemanna/docker-openvpn`](https://github.com/kylemanna/docker-openvpn) Docker image.
