# otbuilder

Applications needed:
- Minikube or to be logged into any k8s service.
- Kubectl
- Helm

Instructions for testing in Minikube:

- Build and push the docker image to your docker hub repo with tag v1 (for example xxer10/jenkins:v1) and set the repository in the values.yaml file inside the k8s folder.
- Deploy the helm chart to the cluster, in this case the example will be deployed to the default namespace:
  "helm upgrade --install jenkins k8s --set image.tag=v1 --set replicaCount=1 --namespace default"
- Check that the pod is running with: "kubectl get pods"
- If this procedure is done in Minikube then execute the command minikube tunnel which will expose the port in order to see Jenkins from localhost in port 80.

Notes:
- A single job is already created.
- Nginx is installed as well to try to do a reverse proxy in order to serve Jenkins from a custom URL (THIS IS STILL A WORK IN PROGRESS, CURRENTLY NOT WORKING)
 
