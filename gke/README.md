# GKE Stuff

## Helm Edition (New)

1. Set up a cluster:

```bash
$ gcloud container clusters create \
> --machine-type <machine-type>
> --num-nodes <num-nodes> \
> [--preemptible \]
> [--zone <zone> \]
> [--accelerator type=<gpu-type>,count=<gpu-count> \]
> --cluster-version latest \
> [--enable-autoscaling --min-nodes <min-nodes> --max-nodes <max-nodes> \]
<cluster-name>
```

2. Create a persistent disk

`gcloud compute disks create <diskname> --size=<number-of-gigs> --zone=<zoneNOTREGION>`

3.  Create a nfs provisioner that will allocate and bind your PVC
`helm3 install kf stable/nfs-server-provisioner --set=persistence.enabled=true,persistence.storageClass=standard,persistence.size=10Gi`. For more info, go to https://github.com/helm/charts/tree/master/stable/nfs-server-provisioner.

4. Make sure your nfs storageclass now exists with `kubectl get sc`

5. Create a configmap using the `create-config-map.sh`. Your `zone` can be found from the zone you specified when creating your cluster, the `PROJECTID` can be found from `gcloud projects list`, the `clusterid` is found with `gcloud container clusters list`, and the keypath is the path to your kubeconfig file, which in most cases is `~/.kube/config`. Run this to create the mapping.

6. Edit your helm `values.yaml` such that `NewLocalPVC` is enabled and `ExistingLocalPVC` is disabled. Give it some memory, and make sure the `StorageClass` is `nfs`. This allows for the creation of a PVC with `RWX` access, which is necessary for multiple pods to write to memory. Run with `helm3 install nf nextflow-api`

7. Use `kubectl get services` to find the external IP and port of your service, and you're good to go!


## Old GKE version

### Create a disk:

gcloud compute disks create <diskname> --size=<number-of-gigs> --zone=<zoneNOTREGION>

## Deploying NF-API

1. Set up a cluster:

```bash
$ gcloud container clusters create \
> --machine-type <machine-type>
> --num-nodes <num-nodes> \
> [--preemptible \]
> [--zone <zone> \]
> [--accelerator type=<gpu-type>,count=<gpu-count> \]
> --cluster-version latest \
> [--enable-autoscaling --min-nodes <min-nodes> --max-nodes <max-nodes> \]
<cluster-name>
```

2. Create a persistent disk:

```bash
$ gcloud compute disks create --size=<storage-size> [--zone <zone>] <pd-name>
```

3. Edit `001-nfs-server.yaml` such that the pdName is the name of the pd you've created and that all volume names are what you want to use going forward. Then run with `kubectl pply -f 001-nfs-server.yaml`

4.  Edit`002-pv-pvc.yaml` such that your volume names are consistent across yaml files and you're requesting a feasible amount of storage. Also make sure that the IP address specified matches the cluster IP of the nfs-server. Run with `kubectl apply -f`

5. Create a configmap using the `create-config-map.sh`. Your `zone` can be found from the zone you specified when creating your cluster, the `PROJECTID` can be found from `gcloud projects list`, the `clusterid` is found with `gcloud container clusters list`, and the keypath is the path to your kubeconfig file, which in most cases is `~/.kube/config`. Run this to create the mapping.

6. Before running the final step, `003-nextflow-api-gke.yaml`, change the volumes in that file listed to match the ones created.k


IT WORKS!!!


