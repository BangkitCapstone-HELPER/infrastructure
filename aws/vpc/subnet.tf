
resource "aws_subnet" "demo-vpc-subnet1" {
    vpc_id     = "${aws_vpc.demo-vpc.id}"
    cidr_block = "10.0.0.0/24"
    availability_zone = "ap-southeast-1a"

    tags {
        Name = "demo-vpc-subnet"
    }
}



output "subnet1-id" {
  value = "${aws_subnet.demo-vpc-subnet1.id}"
}

output "subnet1-cidr" {
  value = "${aws_subnet.demo-vpc-subnet1.cidr_block}"
}
