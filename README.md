# Just a collection of Helm charts

[![](https://github.com/suda/charts/workflows/Release%20Charts/badge.svg?branch=master)](https://github.com/suda/charts/actions)
[![Artifact Hub](https://img.shields.io/endpoint?url=https://artifacthub.io/badge/repository/suda)](https://artifacthub.io/packages/search?repo=suda)
[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)

## Usage

```console
helm repo add suda https://suda.github.io/charts/
```

You can then run `helm search repo suda` to see the charts.

## Charts

See [Artifact Hub](https://artifacthub.io/packages/search?repo=suda) or [charts](./charts/) for a complete list.

## Contributing

[All contributions (no matter if small) are always welcome](http://contributionswelcome.org/).

## Acknowledgements

* [`documentserver` chart](charts/documentserver) is based on [ONLYOFFICE chart/documentation](https://github.com/ONLYOFFICE/Kubernetes-Docs)
* [`scaleway-webhook` chart](charts/scaleway-webhook) is based on [`cert-manager-webhook-scaleway` deployment chart](https://github.com/scaleway/cert-manager-webhook-scaleway/tree/main/deploy)

## License

[Apache 2.0 License](./LICENSE)