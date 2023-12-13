# DOCKERIZED TECHCO WEBSITE

## Author: Johnpaul Chukwu
## Email: j.chukwu493@mybvc.ca

## APPLICATION CI/CD Prerequisite
* Ensure that the required AWS resources are deployed and running via the [infrastructure repo](https://github.com/jchukwubvc/techco-aws-resources-terraform.git).

* Access to Docker Hub account credentials.

## APPLICATION CI/CD FLOW
1. The application was built using HTML, CSS, and JS.
2. A `DockerFile` was created and added to the root of the project.
3. This `DockerFile` defines the following steps:
   1. Pulls the Apache server Docker image from the official source.
   2. Retrieves all necessary files and places them in the Apache server directory.
   3. Exposes the application on port 80.
4. With the `DockerFile`, we can now build an image that can run as a container on any platform with Docker installed.
5. Next, there is a `deploy.yml` file located in the `.github/workflows/deploy.yml`.
6. This `deploy.yml` is our GitHub Actions workflow file that defines all the steps executed whenever any changes are made to the repository.
7. The following have been configured as repository secrets for the `deploy.yml` file:
   1. `DOCKERHUB_USERNAME`: username of the Docker Hub account.
   2. `DOCKERHUB_PASSWORD`: password of the Docker Hub account.
   3. `EC2_PRIVATE_KEY`: private key to SSH into the EC2 instance.
   4. `EC2_HOST`: the public host IP/DNS of the deployed EC2 instance.
   5. `EC2_USERNAME`: username of the deployed EC2 instance.
8. The breakdown of the `deploy.yml` is as follows:
   1. Fetches the code of the project.
   2. Signs in to Docker Hub where we store our built images.
   3. Creates a Docker image for our Techco site from the code.
   4. Sends this image to Docker Hub for easy access on other platforms.
   5. Next, connects to the deployed EC2 instance on the AWS Cloud.
   6. Pulls the Techco Docker image from Docker Hub to the EC2 instance.
   7. Stops and removes any running Techco Docker container on the EC2 instance.
   8. Runs the new container on the EC2 instance.
9. This ensures automatic deployment (CI/CD) for our project.

## How Do I run this project on my local machine?
### Prerequisites
* Have Docker installed on your system.
* Have Docker Compose installed on your system.

To run the project, navigate to the root of this project in your terminal and run the following command:

```bash
docker-compose up
```
Now, the application should be live and running at http://localhost:8080.

