
# DOCKERIZED TECHCO WEBSITE 
## 

### Author: Johnpaul Chukwu
### Email: j.chukwu493@mybvc.ca


## APPLICATION CI/CD Prerequisite
* AWS resources needed are deployed and running via the [infrastructure repo](https://github.com/jchukwubvc/techco-aws-resources-terraform.git) (https://github.com/jchukwubvc/techco-aws-resources-terraform.git)
* Access to Dockerhub account credentials. 


## APPLICATION CI/CD FLOW
1. The application was built using html,css,js.
2. A `DockerFile` was created and added in the root of the project. 
3. This `DockerFile` defines the following steps:
    1. Pulls Apache server docker image from official source
    2. Gets all the necessary files and puts them in the apache serve directory
    3. Exposes the application on port 80
4. Now with the `DockerFile` we can build an image which can run as a container on any platform that has docker installed.
5. Next we have a `deploy.yml` file located in the `.github/workflows/deploy.yml`
6. This `deploy.yml` is our Github actions workflow file that defines all the steps that we want to be executed everytime 
any change is made to the repository.
7. The following have been configured as repository secrets for the `deploy.yml` file:
   1. `DOCKERHUB_USERNAME` : username of the dockerhub account.
   2. `DOCKERHUB_PASSWORD`: password of the dockerhub account.
   3. `EC2_PRIVATE_KEY`: priavte key to ssh into EC2 instance.
   4. `EC2_HOST`: the public host IP/DNS of the deployed EC2 instance.
   5. `EC2_USERNAME`: username of the deployed EC2 instance. 
8. The breakdown of the `deploy.yml` is as follows:
   1. Fetches the code of the project.
   2. Signs in to a place called DockerHub where we store our built images.
   3. Creates a docker image for our Techco site from the code.
   4. Sends this image to our DockerHub, so it can be easily accessed on other platforms
   5. Next, we connect to the deployed EC2 instance on the AWS CLOUD
   6. Pull the Techco docker image on dockerhub to the EC2 instance.
   7. Stop and remove any running Techco docker container on the EC2 instance.
   8. Run the new container on the EC2 instance.
9. By so doing, we have ensured automatic deployment (CI/CD) on our project.

## How Do I run this project my local machine?
### Prerequisite
* Have Docker installed on your system 
* Have Docker Compose installed on your system

To run the project is straightforward, navigate to the root of this project 
on your terminal and run the command below:

```bash
docker-compose up
```
Now the application should be live and running on `http://localhost:8080`
