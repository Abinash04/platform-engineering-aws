# platform-engineering-aws

Platform Engineering Practical Test - Volvo

# Frontend Applicaton - Volvo Platform Engineering

## TechStack and Tools

```
FrontEnd - Reactjs
CICD - GitHub Actions
Container Registry - AWS ECR
Container Orchestration - AWS EKS
```

## App UI

Application endpoint:

http://a4469ee25b4f8428e8025eaf134588de-1224538186.us-east-1.elb.amazonaws.com/

<img width="1736" alt="image" src="https://github.com/Abinash04/platform-engineering-aws/assets/15240069/82869488-b023-4198-a7d1-bb4054ba7b97">

# Architecture

![Architecture-volvo](https://github.com/Abinash04/platform-engineering-aws/assets/15240069/83e3f651-be1a-436b-8071-0cc0c40cd657)


# Set up:

```
1. Once the application is developed, create a dockerfile and list the base images from where the pre-requisites images will be pulled.

2. Docker image pre-requisites:
- Node
- Nginx (where the app will be deployed)

3. Run the container on port default port 80 (Nginx) to check if the application is working as expected. If the app doesn't load then set the inbound traffic rule for TCP on port 80.

4. Create AWS access key id and secret access key in AWS IAM and store this info in the GitHub settings under secrets and variables.

5. Create GitHub Actions workflow which will have options of deploying it to AWS EC2 instances.

6. Install eksctl and kubectl and get the ~/.kube/config content stored in the Github secrets.

7. Create a cluster using eksctl, we will use this cluster to deploy our applications.

8. Configure the necessary secrets and env variables and provide the steps and actions to:
 - checkout the code
 - configure the AWS credentials
 - configure the kubectl
 - build docker image
 - finally deploy to kubernetes cluster.

9. Once the github actions are successfully completed, the app will be deployed and we can use the external load balancer IP to access the application.

10. High availability is achieved using different availability zones in region us-east-1.

```
