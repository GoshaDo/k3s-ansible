# Release notes for version 0.18.6

**Release date:** 2023-11-01

![AppVersion: v1.94.0](https://img.shields.io/static/v1?label=AppVersion&message=v1.94.0&color=success&logo=)
![Helm: v3](https://img.shields.io/static/v1?label=Helm&message=v3&color=informational&logo=helm)

- Fix kube scheduler default scraping port from 10251 to 10259, Kubernetes changed it since 1.23.0. See [this pr](https://github.com/VictoriaMetrics/helm-charts/pull/736) for details.
- Bump version of operator chart to [0.27.4](https://github.com/VictoriaMetrics/helm-charts/releases/tag/victoria-metrics-operator-0.27.4)

