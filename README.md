This ansible project installing k3s HA cluster on VMs.

![alt text](https://raw.github.com/gosharo/k3s-ansible/master/docs/img/k3s-cluster.jpg?raw=true)

*Usage*

Edit the ansible configuration files:
```ansible.cfg and inventory.yml```

Then run the command:
```
python3 -m ansible playbook playbook/site.yml
```



artifacts:

https://github.com/k3s-io/k3s-selinux/releases/download/v1.4.stable.1

curl https://get.k3s.io/ > k3s-install.sh

https://github.com/k3s-io/k3s/releases/download/v1.28.3%2Bk3s2/k3s-airgap-images-amd64.tar.gz

https://github.com/k3s-io/k3s/releases/download/v1.28.3%2Bk3s2/k3s



image list:

quay.io/jetstack/cert-manager-controller:v1.13.2

quay.io/jetstack/cert-manager-cainjector:v1.13.2

quay.io/jetstack/cert-manager-webhook:v1.13.2



quay.io/kiwigrid/k8s-sidecar:1.25.1

docker.io/grafana/grafana:10.1.2

registry.k8s.io/kube-state-metrics/kube-state-metrics:v2.10.0

quay.io/prometheus/node-exporter:v1.6.1

victoriametrics/operator:v0.39.1

quay.io/prometheus-operator/prometheus-config-reloader:v0.68.0

quay.io/prometheus-operator/prometheus-config-reloader:v0.68.0

victoriametrics/vmagent:v1.94.0
