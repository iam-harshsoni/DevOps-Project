output "cluster_id" {
  value = aws_eks_cluster.bluegreen.id
}

output "node_group_id" {
  value = aws_eks_node_group.bluegreen.id
}

output "vpc_id" {
  value = aws_vpc.bluegreen_vpc.id
}

output "subnet_ids" {
  value = aws_subnet.bluegreen_subnet[*].id
}

