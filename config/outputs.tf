output "client_private_ip" { value = "${aws_instance.es_client.private_ip}" }
output "cluster_endpoint"  { value = "${module.elasticsearch.endpoint}" }
