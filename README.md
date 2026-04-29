## 📖 Overview

This repository provides a hands-on collection of Terraform configurations, each demonstrating a specific scenario for provisioning and managing various AWS cloud services. It's designed as a learning resource and a quick-start guide for common infrastructure patterns, enabling developers, DevOps engineers, and cloud practitioners to understand and implement Infrastructure as Code (IaC) efficiently and consistently on AWS.

## ✨ Scenarios & Features

Explore diverse AWS infrastructure patterns, from basic resource provisioning to complex architectural deployments:

-   **🎯 01-EC2-Instance**: Provisions a single Amazon EC2 instance.
-   **📦 02-S3-Bucket**: Creates an Amazon S3 bucket with common configurations.
-   **🔒 03-EC2-SG**: Manages EC2 Security Groups to control network traffic.
-   **👤 04-IAM-User**: Defines an AWS IAM user with specified permissions.
-   **🔑 05-IAM-EC2**: Attaches an IAM role to an EC2 instance for secure access to AWS services.
-   **🌐 06-VPC**: Sets up a custom Virtual Private Cloud (VPC) with basic networking components.
-   **🌍 07-PS-AZ**: Demonstrates provisioning resources across multiple Availability Zones for high availability.
-   **🔢 08-EC2-Count**: Provisions multiple EC2 instances using Terraform's `count` meta-argument.
-   ** iterating-over-ec2 09-EC2-For-Each**: Provisions multiple EC2 instances using Terraform's `for_each` meta-argument based on a map.
-   **💾 10-EC2-EBS**: Attaches Elastic Block Store (EBS) volumes to EC2 instances.
-   **🗄️ 11-AWS-RDS**: Provisions an Amazon RDS relational database instance.
-   **📡 12-NAT-GAT**: Deploys a NAT Gateway within a VPC for outbound internet access from private subnets.
-   **⚖️ 13-ASG**: Configures an Auto Scaling Group (ASG) to manage a fleet of EC2 instances for scalability and resilience.
-   **🏗️ 14-Architecture**: Demonstrates a more comprehensive, multi-resource AWS architecture.

## 🛠️ Tech Stack

**Infrastructure as Code:**

[![Terraform](https://img.shields.io/badge/Terraform-7B42BC?style=for-the-badge&logo=terraform&logoColor=white)](https://www.terraform.io/)

[![HCL](https://img.shields.io/badge/HCL-white?style=for-the-badge)](https://github.com/hashicorp/hcl)

**Cloud Provider:**

[![AWS](https://img.shields.io/badge/AWS-%23FF9900.svg?style=for-the-badge&logo=amazon-aws&logoColor=white)](https://aws.amazon.com/)

## 🚀 Quick Start

To use any of the Terraform scenarios in this repository, follow these general steps.

### Prerequisites
-   **AWS Account**: An active AWS account with programmatic access configured.
-   **AWS CLI**: (Recommended) Installed and configured for managing AWS credentials.
    ```bash
    aws configure
    ```
-   **Terraform CLI**: Installed on your local machine. Refer to the [official Terraform documentation](https://developer.hashicorp.com/terraform/downloads) for installation instructions.

### Usage

1.  **Clone the repository**
    ```bash
    git clone https://github.com/hs2002-18/Terraform-Scenarios.git
    cd Terraform-Scenarios
    ```

2.  **Navigate to a specific scenario**
    Choose any of the numbered directories, for example, for the EC2 instance scenario:
    ```bash
    cd 01-EC2-Instance
    ```

3.  **Initialize Terraform**
    This command downloads the necessary providers and initializes the backend.
    ```bash
    terraform init
    ```

4.  **Review the plan**
    This command creates an execution plan, showing what actions Terraform will take without making any changes to your infrastructure.
    ```bash
    terraform plan
    ```

5.  **Apply the configuration**
    This command executes the actions proposed in the plan, provisioning the resources in your AWS account.
    ```bash
    terraform apply
    # Type 'yes' when prompted to confirm the apply operation.
    ```

6.  **Verify the deployed resources**
    Log in to your AWS Management Console or use the AWS CLI to confirm that the resources have been created as expected.

7.  **Destroy the resources**
    Once you are done with a scenario, it's good practice to destroy the resources to avoid incurring unnecessary costs.
    ```bash
    terraform destroy
    # Type 'yes' when prompted to confirm the destroy operation.
    ```

## 📁 Project Structure

```
Terraform-Scenarios/
├── 01-EC2-Instance/       # Terraform configuration for a single EC2 instance
│   
├── 02-S3-Bucket/          # Terraform configuration for an S3 bucket
│   
├── 03-EC2-SG/             # Terraform configuration for EC2 Security Groups
│  
├── 04-IAM-User/           # Terraform configuration for an IAM User
│   
├── 05-IAM-EC2/            # Terraform configuration for IAM Role attached to EC2
│   
├── 06-VPC/                # Terraform configuration for a Virtual Private Cloud (VPC)
│   
├── 07-PS-AZ/              # Terraform configuration demonstrating Multi-AZ deployments
│ 
├── 08-EC2-Count/          # Terraform configuration for provisioning multiple EC2s using 'count'
│ 
├── 09-EC2-For-Each/       # Terraform configuration for provisioning multiple EC2s using 'for_each'
│ 
├── 10-EC2-EBS/            # Terraform configuration for EC2 with EBS volumes
│  
├── 11-AWS-RDS/            # Terraform configuration for an AWS RDS database instance
│   
├── 12-NAT-GAT/            # Terraform configuration for a NAT Gateway
│   
├── 13-ASG/                # Terraform configuration for an Auto Scaling Group (ASG)
│   
└── 14-Architecture/       # Terraform configuration for a more complex AWS architecture
   
```

Each directory typically contains:
-   `main.tf`: The primary Terraform configuration file defining resources.
-   `variables.tf` (optional): Defines input variables for the scenario.
-   `outputs.tf` (optional): Defines output values from the deployed infrastructure.
-   `providers.tf` (optional): Configures the AWS provider.

## ⚙️ Configuration

### AWS Credentials
Terraform interacts with AWS using credentials configured in one of several ways:
-   **Environment Variables**: `AWS_ACCESS_KEY_ID`, `AWS_SECRET_ACCESS_KEY`, `AWS_SESSION_TOKEN`.
-   **Shared Credentials File**: Typically `~/.aws/credentials`.
-   **Shared Configuration File**: Typically `~/.aws/config` for profiles and regions.
-   **IAM Roles**: For EC2 instances or AWS Lambda functions.

It is highly recommended to use the AWS CLI to configure your credentials and region, which Terraform will automatically pick up.

### Terraform Variables
Many scenarios may use input variables (defined in `variables.tf`) to make configurations flexible. You can provide values for these variables in several ways:
-   **Command-line flags**: `terraform apply -var="variable_name=value"`
-   **Variable definition files**: `.tfvars` files (e.g., `terraform.tfvars`).
-   **Environment variables**: `TF_VAR_variable_name`.

## 📄 Author
### Harsh Shrimali

This project is licensed under the [MIT License](LICENSE) - see the LICENSE file for details.
<!-- TODO: Add a LICENSE file if not present -->
