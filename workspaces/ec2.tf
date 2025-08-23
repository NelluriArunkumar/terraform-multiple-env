resource "aws_instance" "Roboshop" {
    count = length(var.instances)
    ami = var.ami_id
    instance_type = lookup(var.instance_type, terraform.workspace)
    vpc_security_group_ids = [ aws_security_group.allow-all.id ]

    tags = merge(
        var.common_tags,
        {
            Name = "${var.project}-${var.instances[count.index]}-${terraform.workspace}"
            component = var.instances[count.index]
            environment = terraform.workspace
        }
    )
}

#Allow All SG
resource "aws_security_group" "allow-all" {
    name = "${var.project}-${var.sg_name}-${terraform.workspace}" # allow-all-dev
    description = var.sg_description

    ingress {
        from_port = var.from_port
        to_port = var.to_port
        protocol = "-1"
        cidr_blocks = var.cidr_blocks
        ipv6_cidr_blocks = ["::/0"]
    }
    egress {
        from_port = var.from_port
        to_port = var.to_port
        protocol = "-1"
        cidr_blocks = var.cidr_blocks
        ipv6_cidr_blocks = ["::/0"]
    }

    tags = merge(
        {
            Name = "${var.project}-${var.sg_name}-${terraform.workspace}"
        }
    )
}