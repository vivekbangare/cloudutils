# cloudutils
This repo contains Dockerfile which is designed to facilitate various cloud-related operations and includes tools such as Google Cloud SDK, AWS CLI, and Terraform

Here's an overview of the image's purpose and instructions on how to run it:

Image Purpose: The Docker image provides a consistent and portable environment for managing cloud resources and performing related operations. It includes the following tools:

**Google Cloud SDK**: Provides command-line access to Google Cloud Platform (GCP) services and resources.  
**AWS CLI**: Offers a unified command-line interface for interacting with Amazon Web Services (AWS).  
**Terraform**: Enables infrastructure provisioning and management using Infrastructure as Code (IaC) principles.  

Usage Instructions:

```
$ docker build -t vivekbangare01/cloudutils:<tag>
$ docker run -itd vivekbangare01/cloudutils:<tag>
$ docker exec -it {container_id} /bin/bash
```

Once inside the container, you can utilize various cloud-related tools and execute commands for cloud management tasks. For example, you can interact with Google Cloud Platform using gcloud commands:

```
$ gcloud --version
$ gcloud auth login
$ gcloud compute instances list
```

You can also utilize AWS CLI for AWS operations:
```
$ aws --version
$ aws configure
$ aws ec2 describe-instances
```

Additionally, you can leverage Terraform for infrastructure provisioning and management:

```
$ terraform --version
$ terraform init
$ terraform plan
$ terraform apply
```

**Customization**: *You can extend the existing image by creating a new Dockerfile that starts with FROM vivekbangare01/cloudutils:<tag>*

### Contributing
Contributions to this repository are welcome! If you have any improvements or additional example workflows, feel free to open a pull request.