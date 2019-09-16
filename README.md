#  Minikube Stuff

Let's see if I remember Docker

1. `docker build -t mkdn .`
2. `docker run --name my_first_docker -i -t mkdn`
3. docker rm <container id> (container id can be found by trying to re-run the `docker run` command)
4. Log in to docker with `docker login`
5. Tag image on dockerhub with `docker tag mkdn ebensma/mkdn:latest`
6. Push image to dockerhub with `docker push ebensma/mkdn:latest`
7. Run with `nextflow kuberun ebenz99/Kube-Test -latest`
8. Save data to ./work directory with `./kube-runner/kube-save.sh deepgtex-prp .`
9. `nextflow kuberun login -v deepgtex-prp`


Also good to know:
- Log in to the NRP with `nextflow kuberun login -v deepgtex-prp`
- save pod data with `kubectl cp saver-pod:a.txt .`
- ssh into pod with `kubectl exec -it <podname> -- /bin/bash`