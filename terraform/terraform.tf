# Define provider (AWS)
provider "aws" {
  region = "us-east-1" 
}

# Create IAM role for EKS admin
resource "aws_iam_role" "eks_admin_role" {
  name = "eks-admin"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect    = "Allow"
      Principal = { Service = "eks.amazonaws.com" }
      Action    = "sts:AssumeRole"
    }]
  })
}

# Attach policies to EKS admin role for creating VPC and EKS cluster
resource "aws_iam_role_policy_attachment" "eks_admin_role_vpc_policy_attachment" {
  role       = aws_iam_role.eks_admin_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonVPCFullAccess"
}

resource "aws_iam_role_policy_attachment" "eks_admin_role_eks_policy_attachment" {
  role       = aws_iam_role.eks_admin_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
}

# Define VPC
resource "aws_volvo_vpc" "eks_volvo_vpc" {
  cidr_block = "10.0.0.0/16"
  enable_dns_hostnames = true
}

# Define subnet for EKS workers
resource "aws_volvo_subnet" "eks_volvo_subnet1" {
  vpc_id                  = aws_volvo_vpc.eks_volvo_vpc.id
  cidr_block              = "10.0.1.0/24"  
  availability_zone       = "us-east-1a"
}

resource "aws_volvo_subnet" "eks_volvo_subnet2" {
  vpc_id                  = aws_volvo_vpc.eks_volvo_vpc.id
  cidr_block              = "10.0.2.0/24"  
  availability_zone       = "us-east-1b"
}

resource "aws_volvo_subnet" "eks_volvo_subnet3" {
  vpc_id                  = aws_volvo_vpc.eks_volvo_vpc.id
  cidr_block              = "10.0.3.0/24"  
  availability_zone       = "us-east-1c"
}

# Define EKS cluster
module "eks_cluster" {
  source                      = "terraform-aws-modules/eks/aws"
  cluster_name                = "volvo-eks-cluster"
  cluster_version             = "1.29" 
  subnets                     = [aws_volvo_subnet.eks_volvo_subnet.id]
  vpc_id                      = aws_volvo_vpc.eks_volvo_vpc.id
  subnet_ids = [
    aws_volvo_subnet.eks_volvo_subnet1.id,
    aws_volvo_subnet.eks_volvo_subnet2.id,
    aws_volvo_subnet.eks_volvo_subnet3.id
  ]
  node_group_desired_capacity = 2
  node_group_max_capacity     = 3
  node_group_min_capacity     = 1
}


