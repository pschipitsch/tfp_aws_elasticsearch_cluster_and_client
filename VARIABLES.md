|Name|Description|Required|Default|Component|
|---|---|:---:|:---:|---|
|aws_region|The AWS region.|Yes||aws_instance.es_client, module.elasticsearch|
|domain|The name of the domain.|Yes||module.elasticsearch, template_file.elasticsearch|
|es_record_name|The DNS record name for the Elasticsearch ELB.|Yes||module.elasticsearch|
|key_pair_name|The EC2 Key Pair Name.|Yes||aws_instance.es_client, module.elasticsearch|
|route53_zone_id|The route53 Zone ID.|Yes||module.elasticsearch|
|subnet_ids|A comma separated list of subnet ids.|Yes||aws_instance.es_client, module.elasticsearch|
|vpc_id|The VPC id.|Yes||aws_security_group.default, module.elasticsearch|
|client_image_id|The AMI id for the Elasticsearch client.|No|{"us-west-2"=>"ami-9abea4fb"}|aws_instance.es_client|
|client_instance_type|The instance type for the Elasticsearch client.|No|t2.medium|aws_instance.es_client|
|es_image_id|The AMI id for Elasticsearch.|No|{"us-west-2"=>"ami-9abea4fb"}|module.elasticsearch|
|es_instance_type|The instance type for Elasticsearch.|No|m4.large|module.elasticsearch|
