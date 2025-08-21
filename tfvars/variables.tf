variable "project" {
    default = "Roboshop"  
}


variable "ami_id" {
    type = string
    default = "ami-09c813fb71547fc4f"
    description = "AMI ID of joindevops"
}

variable "instance_type" {
    
}

variable "ec2_tags" {
    type = map(string)
    default = {
      Name = "HelloTerraform"
      purpose = "variables-demo"
    }
}

variable "sg_name" {
    default = "allow-all"  
}

variable "sg_description" {
    default = "Allowing all ports from internet"  
}

variable "from_port" {
    default = 0  
}

variable "to_port" {
    type = number
    default = 0  
}

variable "cidr_blocks" {
    type = list(string)
    default = [ "0.0.0.0/0" ]
}

variable "sg_tags" {
    default = {
        Name = "allow-all"
    }
}

variable "environment" {
  
}


variable "common_tags" {
    default = {
        project = "Roboshop"
        Terraform = true
    }
  
}
variable "instances" {
    default = ["mongodb", "redis"]
  
}