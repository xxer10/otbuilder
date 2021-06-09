# otbuilder

This project was created and tested locally on Minikube.

Tools needed:
- Minikube or to be logged into any k8s service.
- Kubectl
- Helm

Instructions for testing in Minikube:

- Build and push the docker image to your docker hub repo with tag v1 (for example xxer10/jenkins:v1) and set the repository in the values.yaml file inside the k8s folder.
- Deploy the helm chart to the cluster with the image tag, in this case the example will be deployed to the default namespace:
  "helm upgrade --install jenkins k8s --set image.tag=v1 --set replicaCount=1 --namespace default"
- Check that the pod is running with: "kubectl get pods"
- If this procedure is done in Minikube then execute the command minikube tunnel which will expose the port in order to see Jenkins from localhost in port 80.

Notes:
- A single job names otbuilder is already created, the configuration is copied to the jobs folder inside the jenkins home folder. This job has a triggered with a token enabled in order to be able to execute it remotely through a POST request. (Still in progress, docker image has the job set but when deploying in the k8s cluster it erases the otbuilder job folder) 
- Nginx is installed as well to try to do a reverse proxy in order to serve Jenkins from a custom URL (THIS IS STILL A WORK IN PROGRESS, CURRENTLY NOT WORKING)
 
