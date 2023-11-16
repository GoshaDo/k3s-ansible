This ansible project installing k3s HA cluster on VMs.

![alt text](https://raw.github.com/gosharo/k3s-ansible/master/docs/img/k3s-cluster.jpg?raw=true)

*Usage*

Edit the ansible configuration files:
```ansible.cfg and inventory.yml```

Then run the command:
```
python3 -m ansible playbook playbook/site.yml
```

After cluster creation, to expose kubeAPI locally run:

```
export KUBECONFIG=~/.kube/k3s-config
```

Then install Argocd using the command:

```
helm upgrade --install argocd ./charts/argo-cd -f ./bootstrap/argocd.yaml --create-namespace --namespace argocd --set configs.credentialTemplates.github-gitops.password=<YOUR GITHUB TOKEN>
```

Then apply the Apps of Apps:

```
kubectl apply -f bootstrap/apps.yaml
```

Then add the endpoints that you expose with nginx server adress in /etc/hosts