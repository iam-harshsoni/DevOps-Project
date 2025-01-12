
# Terraform AWS EKS Infrastructure

This project demonstrates how to create and manage a robust, scalable AWS infrastructure using **Terraform**, adhering to industry standards and best practices. The setup includes an **Amazon Elastic Kubernetes Service (EKS)** cluster, complete with supporting resources like VPCs, subnets, and NAT gateways.

---

## Project Architecture

### Key Components:
- **VPC**: Custom Virtual Private Cloud with public and private subnets.
- **EKS Cluster**: Managed Kubernetes cluster with two Node Groups for high availability.
- **NAT Gateways**: Secure routing for private subnets.
- **Elastic IPs**: Static IPs for NAT Gateways.
- **Route Tables**: Public and private route tables for subnet routing.
- **Internet Gateway**: For outbound internet access from public subnets.

### Architecture Diagram
![diagram-export-1-12-2025-7_05_47-PM](https://github.com/user-attachments/assets/82f10985-4558-4ea1-a0de-ef181ef7b709)

---

## Project Structure

This project is structured using Terraform modules to ensure reusability, scalability, and maintainability:


Project_Terraform_eks/  
├── .terraform/                  
├── modules/                     
│   ├── aws_eks/                
│   ├── aws_eks_node_group/      
│   ├── aws_elastic_ip/         
│   ├── aws_internetGW/         
│   ├── aws_natGW/               
│   ├── aws_route_table/        
│   ├── aws_route_table_association/ 
│   ├── aws_subnets/             
│   ├── aws_vpc/                 
├── main.tf                     
├── provider.tf                 
├── variables.tf                
├── outputs.tf                  
├── terraform.tfvars            
└── README.md                  

## Getting Started

### Prerequisites
Ensure you have the following installed:
- [Terraform](https://www.terraform.io/downloads.html)
- AWS CLI configured with appropriate credentials
- An AWS account

### Steps to Deploy:
1. Clone this repository:
   ```bash
   git clone https://github.com/iam-harshsoni/DevOps-Project
   cd Project-3-Terraform-EKS/
2. Initialize Terraform:
   ```bash
   terraform init

3. Review the execution plan:
   ```bash
   terraform plan --var-files="./config/terraform.tfvars"

4. Apply the Terraform configuration:
   ```bash
   terraform apply --var-files="./config/terraform.tfvars"

5. Confirm the infrastructure is successfully created.

---

## Features
Fully Modular Design: Each resource is modularized for reusability.
Scalable Infrastructure: EKS clusters with multiple Node Groups for scalability.
Secure Networking: Includes private subnets and NAT Gateways.
Cost Optimization: Public and private subnets strategically routed.

---

### Terraform Best Practices Used
Parameterized variables for flexibility.
Separation of configuration into modules.
Outputs for visibility into key resource values.

---

### Outputs
After applying the Terraform configuration, the following outputs will be displayed:

- EKS Cluster Name
- Public and Private Subnet IDs
- NAT Gateway IDs
- Node Group Details

---

### Resources
- Terraform Documentation
- AWS EKS Documentation

---

### License
This project is open-source and available under the MIT License.

---

### Contributing
Feel free to open issues or pull requests for improvements or new features!

---

# Author
Harsh Soni  
Let's connect and discuss more about Terraform, AWS, and DevOps!
