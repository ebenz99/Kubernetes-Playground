#  Minikube Stuff

## Docker/Nextflow Important Steps

1. `docker build -t mkdn .`
2. `docker run --name my_first_docker -i -t mkdn`
3. docker rm <container id> (container id can be found by trying to re-run the `docker run` command)
4. Log in to docker with `docker login`
5. Tag image on dockerhub with `docker tag mkdn ebensma/mkdn:latest`
6. Push image to dockerhub with `docker push ebensma/mkdn:latest`
7. Run with `nextflow kuberun ebenz99/Kube-Test -latest`
8. Save data to ./work directory with `./kube-runner/kube-save.sh deepgtex-prp .`
9. `nextflow kuberun login -v deepgtex-prp`


## Kubernetes Stuff
Also good to know:
- delete unused docker images `docker rmi -f $(docker images | grep "<none>" | awk "{print \$3}")`
- run a deployment or pod `kubectl apply -f workpod.yaml`
- Log in to the NRP with `nextflow kuberun login -v deepgtex-prp`
- save pod data with `kubectl cp saver-pod:a.txt .`
- ssh into pod with `kubectl exec -it <podname> -- /bin/bash`
- copy data to pvc `./kube-runner/kube-load.sh task-pv-claim .`
- delete helm stuff `helm ls --all --short | xargs -L1 helm delete --purge`
- update deployment `helm upgrade a1 ./mychart --recreate-pods`
- because `ls` isn't a bash command, it needs be before a `/bin/bash` entrypoint
- Minio Slate info: https://portal.slateci.io/applications/incubator/minio
- `RUN` vs `CMD` in Dockerfile https://stackoverflow.com/questions/37461868/difference-between-run-and-cmd-in-a-docker-file
- minio scripts: https://github.com/minio/minio/blob/master/docs/orchestration/kubernetes/
- PV(C) won't delete? Use this command to make it: `kubectl patch pvc db-pv-claim -p '{"metadata":{"finalizers":null}}'` (also check for volume attachments using `kubectl get volumeattachments`)

## Slate
- Peruse the incubator - >`slate app list --dev`
- set up minio configuration -> `slate app get-conf minio --dev -o minio.yaml`
- create a secret -> `slate secret create ekey --group <group> --cluster <cluster> --from-literal=accesskey=<username> --from-literal=secretkey=<secret>`
- installing minio -> `slate app install minio --cluster <YOUR CLUSTER> --group <YOUR GROUP> --conf minio.yaml --dev`

## Minio
- `docker run -p 9000:9000   --user $(id -u):$(id -g)   --name minio1   -e "MINIO_ACCESS_KEY=<key>"   -e "MINIO_SECRET_KEY=<key2>"   -v ${HOME}/data:/data   minio/minio server /data`

## Current State

AWS scope in Nextflow useless for writing nextflow logs to Minio PVC; will have to use `-with-weblog` option to POST to PVC (possible including keys in query string)
