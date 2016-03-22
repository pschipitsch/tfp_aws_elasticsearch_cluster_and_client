provider "aws" {
  region = "${var.aws_region}"
}

resource "template_file" "elasticsearch" {
  template = "${file("./templates/elasticsearch.sh.template")}"

  vars {
    cluster_name           = "${var.domain}-logs"
    cluster_security_group = "${module.elasticsearch.cluster_group_name}"
  }

  lifecycle {
    create_before_destroy = true
  }
}

module "elasticsearch" {
  source          = "git::https://github.com/TrueCar/tf_aws_elasticsearch.git"
  name            = "${var.domain}-elasticsearch"
  vpc_id          = "${var.vpc_id}"
  subnet_ids      = "${var.subnet_ids}"
  instance_type   = "${var.es_instance_type}"
  image_id        = "${lookup(var.es_image_id,var.aws_region)}"
  key_pair_name   = "${var.key_pair_name}"
  user_data       = "${template_file.elasticsearch.rendered}"
  route53_zone_id = "${var.route53_zone_id}"
  record_name     = "${var.es_record_name}"
}

resource "aws_security_group" "default" {
  vpc_id = "${var.vpc_id}"
  name   = "client_default"
    
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  egress {
    from_port   = 53
    to_port     = 53
    protocol    = "udp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "es_client" {
  ami                    = "${lookup(var.client_image_id,var.aws_region)}"
  instance_type          = "${var.client_instance_type}"
  key_name               = "${var.key_pair_name}"
  vpc_security_group_ids = ["${aws_security_group.default.id}","${module.elasticsearch.client_group_id}"]
  subnet_id              = "${element(split(",",var.subnet_ids),0)}"

  tags {
    Name = "meetup:client"
  }
}
