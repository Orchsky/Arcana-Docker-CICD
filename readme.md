# Docker Introduction
- What is docker: Docker is a container runtime tool. 

- What is docker used for: Docker is used to containerize modern applications.

- What does containerization mean: Containerization is when you have an application and all of its run time dependecies.

setup inside of an encapsulated lightweight environment that allows for easy deployment, scalability and modifications.

- What is the difference between VM and container? Check this [diagram](https://medium.com/@venkinarayanan/containers-101-8c7562d0d7cd)
Container is more lightweight due to the fact that it requires less components and time to run an entire application versus a VM
that requires multiple different host OS's + binaries and libraries to run an application.

- Why is a container lightweight? Containers are lightweight because they only contain everything that is necessary for the 
application to run. It does not require any other components besides what is needed for the app to build / run.

- Ease of deployment when it comes to applications that are containerized versus bare metal applications: 
Containers can be easily shared amongst everyone --> public registries, private registries, local images etc.)

- Concept of container images: Containers are ran by using a container image, a container image is like a traditional AMI with VM's. Difference between vm images and container images are size --> vm ami's are heavy (more than a couple GB versus container images which are under 1GB)

- What is the point of using containers? The point of containers is to enable faster 
application development through these lightweight containers that house applications. Containers also give consistent results for 
the application runtime.

- How do containers get deployed? and where do they get deployed? A container is ran by a container image which means,
in order to deploy a container you must make an image out of the container. After the image is created, it is then stored
in a registry - (public or private registry). After the image is pushed to a container image registry, then we can take the image
and deploy it onto services such as EKS or AKS (elastic kubernetes services AWS or Azure Kubernetes Service AKS) / or even some
PaaS services on the cloud such as - (azure app service) .

## Installation
- [Windows](https://docs.docker.com/desktop/install/windows-install/)
- [MAC](https://docs.docker.com/desktop/install/mac-install/)


## Docker Documentation
- [documentation](https://docs.docker.com/engine/reference/builder/)

### Service Connection Setup
- Ensure you have made your own dockerhub account
- Ensure you already have docker installed on your own build agent
- [Follow these steps to create service connection](https://www.programmingwithwolfgang.com/build-docker-azure-devops-ci-pipeline/)

#### Docker Compose
- Compose is used to run multiple containers locally [documentation here + installation](https://docs.docker.com/compose/)

##### Run Docker Compose Commands
- use ```docker-compose up``` 
- use ```docker-compose up -d``` to run in background

##### Intro to Kubernetes
- What is k8s: k8s is an open source container orchestration tool that runs docker containers with various different benefits and functionalities to use.
- Local k8s vs Cloud k8s: There are different cluster (collection of containers / infrastructure that makes up k8s) setups, the first one is local in which you can run identical k8s infrastructure on your own local machine versus cloud clusters which are clusters that exist on AWS or AKS.

##### Local Kubernetes Setup
- First ensure kubectl is installed on your machine: [MAC](https://kubernetes.io/docs/tasks/tools/install-kubectl-macos/) / [Windows](https://kubernetes.io/docs/tasks/tools/install-kubectl-windows/)
- What is kubectl? kubectl is the utility that we use to communicate to the cluster within k8s (both local and in cloud)
- Within docker desktop, select gear icon and check both boxes under the kubernetes tab then restart your docker desktop
- What is k8s namespace: namespaces are individual spaces where specific containers are ran and configurations / resources are stored. This is due to the way k8s is organized.
- (pod) --> (container) 1:1 ratio where one pod runs one container at a time. It is possible to run multiple containers in one pod but it is not reccomended because you run the risk of your applications crashing due to not enough memory in the pod to run everything at once. You can run multiple containers in the pod but is it reccomended? no.
- Whenever running kubectl commands, if you do not specify -n <namespace> at the end of your commands you will only be able to view the default namespace resources.
- [k8s documentation](https://kubernetes.io/docs/concepts/services-networking/service/)
- k8s service --> responsible for exposing your container to run on a specified port. 
- 1:1 ratio with application where for each app you should have its own service.
- k8s deployment --> resource used to deploy the container, comes with extra functionality which provides replicaset which we can use to maintain consistent number of pods running at all times. 
- [k8s service types](https://www.ibm.com/docs/en/cloud-private/3.2.0?topic=networking-kubernetes-service-types)

##### Commands
- ```kubectl config current-context``` this command verifies which cluster we are communicating with, if it shows as docker-desktop then this means our current context is set to communicate with the local cluster.
- ```kubectl get ns``` this command shows us the current namespaces within the cluster that we are configured to read from within our context.
- ```kubectl get pods -n <namespace here>``` this command shows us current running containers within a selected namespace. Pods is another word for container. 
- ```kubectl create ns <nameofyournamespace>``` if you wish to create a new one
- ```kubectl create -f deployment.yml``` to deploy the yaml code onto the local cluster
- ```kubectl describe pod <nameofpod> -n <namespace>``` to see further details of pod / be able to read error messages if any issues.
- ```kubectl port-forward svc/<nameofsvc> <localhostport>:<appport would be 80 in this case>``` use this whenever trying to locally test from cloud to local to ensure app is reachable
- When using load balancer service - reach the app via external ip, use kubectl get svc -n <name of your ns> and verify external IP from there.

