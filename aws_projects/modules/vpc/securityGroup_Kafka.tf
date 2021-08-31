############################################
#          KAFKA SECURITY GROUP            #
############################################
resource "aws_security_group" "kafka_sg" {
    name = "kafka_sg"
    description = "Allow traffic to KAFKA from instances"
    vpc_id = "${aws_vpc.main.id}"
    
    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        description="SSH Port"
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
        from_port = 9092
        to_port = 9092
        protocol = "tcp"
        description="Kafka External Port"
        cidr_blocks = ["0.0.0.0/0"]
    }
    
    egress {
        from_port=0
        to_port=0
        protocol="-1"
        cidr_blocks=["0.0.0.0/0"]
    }    

    tags ={
        Name = "KafkaSecGroup"
    }
}

