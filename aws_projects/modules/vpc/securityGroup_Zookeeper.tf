############################################
#       ZOOKEEPER SECURITY GROUP           #
############################################
resource "aws_security_group" "zookeeper_sg" {
    name = "zookeeper_sg"
    description = "Allow traffic to zookeeper_sg from instances"
    vpc_id = "${aws_vpc.main.id}"
    
    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        description = "Zookeeper External Port"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        from_port = 8080
        to_port = 8080
        protocol = "tcp"
        description="JMX Exporter"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        from_port = 8778
        to_port = 8778
        protocol = "tcp"
        description="Jolokia Port"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        from_port = 9999
        to_port = 9999
        protocol = "tcp"
        description="JMX Port"
        cidr_blocks = ["0.0.0.0/0"]
    }
    
    ingress {
        from_port = 2888
        to_port = 2888
        protocol = "tcp"
        description="Zookeeper Internal Port"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        from_port = 3888
        to_port = 3888
        protocol = "tcp"
        description="Zookeeper Internal Port"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        from_port = 2181
        to_port = 2181
        protocol = "tcp"
        description="Zookeeper External Port"
        cidr_blocks = ["0.0.0.0/0"]
    }
    
    egress {
        from_port=0
        to_port=0
        protocol="-1"
        cidr_blocks=["0.0.0.0/0"]
    }    

    tags ={
        Name = "ZookeeperSecGroup"
    }
}

