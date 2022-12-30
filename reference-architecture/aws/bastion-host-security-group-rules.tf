
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule

#resource "aws_security_group_rule" "allow-egress-https-bastion-host-to-private-gateway" {
#	security_group_id = "${aws_security_group.bastion-host-security-group.id}"
#	type			= "egress"
#	from_port         	= 443
#	to_port           	= 443
#	protocol          	= "tcp"
#	description		= "allow-egress-https-bastion-host-to-private-services"
#	cidr_blocks		= ["0.0.0.0/0"]
#	prefix_list_ids   = [
#		"${aws_vpc_endpoint.s3-private-gateway.prefix_list_id}"
#	]
#}

resource "aws_security_group_rule" "allow-egress-https-bastion-host-to-internet-gateway-1" {
	security_group_id = "${aws_security_group.bastion-host-security-group.id}"
	type			= "egress"
	from_port         	= 443
	to_port           	= 443
	protocol          	= "tcp"
	description		= "allow-egress-https-bastion-host-to-intenet-services"
	cidr_blocks		= ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "allow-egress-https-bastion-host-to-internet-gateway-2" {
	security_group_id = "${aws_security_group.bastion-host-security-group.id}"
	type			= "egress"
	from_port         	= 80
	to_port           	= 80
	protocol          	= "tcp"
	description		= "allow-egress-https-bastion-host-to-intenet-services"
	cidr_blocks		= ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "allow-ingress-ssh-office-to-bastion-host" {
	security_group_id = "${aws_security_group.bastion-host-security-group.id}"
	type			= "ingress"
	cidr_blocks 		= "${var.admin-office-ip-address-range}"
	from_port         	= 22
	to_port           	= 22
	protocol          	= "tcp"
	description		= "allow-ingress-ssh-office-to-bastion-host"
}

resource "aws_security_group_rule" "allow-ingress-https-from-vpc-endpoints" {
	security_group_id	= "${aws_security_group.bastion-host-security-group.id}"
	type            	= "ingress"
	from_port       	= 443
	to_port        		= 443
	protocol		= "tcp"
	cidr_blocks		= ["${var.bastion-host-ip-address}/32"]
}

