
region = "ap-south-1"
access_key = ""
secret_key=""

vpc_config = {
    vpc01 = {
        vpc_cidr_block = "192.168.0.0/16"
        tags={
            "Name" = "my_vpc"
        }
    }
}

subnet_config = {
    "public-ap-south-1a" = {

        vpc_name="vpc01"
        cidr_block = "192.168.0.0/18"
        availability_zone = "ap-south-1a"
        tags = {
            "Name" = "public-ap-south-1a"
        }
    }

    "public-ap-south-1b" = {

        vpc_name="vpc01"

        cidr_block = "192.168.64.0/18"
        availability_zone = "ap-south-1b"
        tags = {
            "Name" = "public-ap-south-1b"
        }
    }

    "private-ap-south-1a" = {

        vpc_name="vpc01"

        cidr_block = "192.168.128.0/18"
        availability_zone = "ap-south-1a"
        tags = {
            "Name" = "private-ap-south-1a"
        }
    }

    "private-ap-south-1b" = {

        vpc_name="vpc01"

        cidr_block = "192.168.192.0/18"
        availability_zone = "ap-south-1b"
        tags = {
            "Name" = "private-ap-south-1b"
        }
    }
}

internetGW_config = {
    igw01={
        vpc_name="vpc01"

        tags = {
            "Name" = "my_igw"
        }
    }
}

elastic_ip_config = {
    eip01={
        tags= {
            "Name" = "nat01"
        }
    }

    eip02={
        tags= {
            "Name" = "nat02"
        }
    }
}

natGW_config = {
    natGW01 = {
        eip_name = "eip01"
        subnet_name = "public-ap-south-1a"
        tags = {
            "Name" = "natGW01"
        }
    }

     natGW02 = {
        eip_name = "eip02"
        subnet_name = "public-ap-south-1b"
        tags = {
            "Name" = "natGW02"
        }
    }
}

route_table_config = {

    RT_01={
        private = 0 # this variable is used in logic, if the value of 'private' is 0 it means its a public subnet
        vpc_name="vpc01"
        gateway_name="igw01" #to get the igw id, we are using the name 'key'
        tags={
            "Name" = "Public-Route"
        }
    }   

    RT_02={
        private = 1  # this variable is used in logic, if the value of 'private' is 1 it means its a private subnet
        vpc_name="vpc01"
        gateway_name="natGW01" 
        tags={
            "Name" = "Private-Route"
        }
    }

    RT_03={
        private = 1   # this variable is used in logic, if the value of 'private' is 1 it means its a private subnet
        vpc_name="vpc01"
        gateway_name="natGW02" 
        tags={
            "Name" = "Private-Route"
        }
    }

}

route_table_association_config = {
    RT01_Association = {
        subnet_name = "public-ap-south-1a"
        route_table_name = "RT_01"
    }
    RT02_Association = {
        subnet_name = "public-ap-south-1b"
        route_table_name = "RT_01"
    }
    RT03_Association = {
        subnet_name = "private-ap-south-1a"
        route_table_name = "RT_02"
    }
    RT04_Association = {
        subnet_name = "private-ap-south-1b"
        route_table_name = "RT_03"
    }
}

aws_eks_cluster_config = {
    demo-cluster = {
        eks_cluster_name = "demo-cluster"

        subnet1 = "public-ap-south-1a"
        subnet2 = "public-ap-south-1b"
        subnet3 = "private-ap-south-1a"
        subnet4 = "private-ap-south-1b"

        tags = {
            "Name" = "demo-cluster"
        }
    }
}

aws_eks_nodegroups_config = {

    node1 ={
        node_group_name = "node1"
        eks_cluster_name =  "demo-cluster"

        node_iam_role = "eks-node-general1"

        subnet1="private-ap-south-1a"
        subnet2="private-ap-south-1b"

        tags = {
            "Name" = "node1"
        }
    }

     node2 ={
        node_group_name = "node2"
        eks_cluster_name =  "demo-cluster"

        node_iam_role = "eks-node-general2"

        subnet1="private-ap-south-1a"
        subnet2="private-ap-south-1b"

        tags = {
            "Name" = "node2"
        }
    }
}