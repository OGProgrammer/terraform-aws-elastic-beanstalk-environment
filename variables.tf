variable "namespace" {
  type        = "string"
  description = "Namespace, which could be your organization name, e.g. 'eg' or 'cp'"
}

variable "stage" {
  type        = "string"
  description = "Stage, e.g. 'prod', 'staging', 'dev', or 'test'"
}

variable "delimiter" {
  type        = "string"
  default     = "-"
  description = "Delimiter to be used between `name`, `namespace`, `stage`, etc."
}

variable "attributes" {
  type        = "list"
  default     = []
  description = "Additional attributes (e.g. `1`)"
}

variable "name" {
  default     = "app"
  description = "Solution name, e.g. 'app' or 'jenkins'"
}

variable "config_document" {
  default     = "{ \"CloudWatchMetrics\": {}, \"Version\": 1}"
  description = "A JSON document describing the environment and instance metrics to publish to CloudWatch."
}

variable "healthcheck_url" {
  default     = "/healthcheck"
  description = "Application Health Check URL. Elastic Beanstalk will call this URL to check the health of the application running on EC2 instances"
}

variable "notification_protocol" {
  default     = "email"
  description = "Notification protocol"
}

variable "notification_endpoint" {
  default     = ""
  description = "Notification endpoint"
}

variable "notification_topic_arn" {
  default     = ""
  description = "Notification topic arn"
}

variable "notification_topic_name" {
  default     = ""
  description = "Notification topic name"
}

variable "loadbalancer_type" {
  default     = "classic"
  description = "Load Balancer type, e.g. 'application' or 'classic'"
}

variable "loadbalancer_certificate_arn" {
  default     = ""
  description = "Load Balancer SSL certificate ARN. The certificate must be present in AWS Certificate Manager"
}

variable "loadbalancer_security_groups" {
  type        = "list"
  default     = []
  description = "Load balancer security groups"
}

variable "loadbalancer_managed_security_group" {
  type        = "string"
  default     = ""
  description = "Load balancer managed security group"
}

variable "http_listener_enabled" {
  default     = "false"
  description = "Enable port 80 (http)"
}

variable "ssh_listener_enabled" {
  default     = "false"
  description = "Enable ssh port"
}

variable "ssh_listener_port" {
  default     = "22"
  description = "SSH port"
}

variable "zone_id" {
  default     = ""
  description = "Route53 parent zone ID. The module will create sub-domain DNS records in the parent zone for the EB environment"
}

variable "config_source" {
  default     = ""
  description = "S3 source for config"
}

variable "preferred_start_time" {
  default     = "Sun:10:00"
  description = "Configure a maintenance window for managed actions in UTC"
}

variable "update_level" {
  default     = "minor"
  description = "The highest level of update to apply with managed platform updates"
}

variable "instance_refresh_enabled" {
  default     = "true"
  description = "Enable weekly instance replacement."
}

variable "security_groups" {
  type        = "list"
  description = "List of security groups to be allowed to connect to the EC2 instances"
}

variable "app" {
  description = "EBS application name"
}

variable "vpc_id" {
  description = "ID of the VPC in which to provision the AWS resources"
}

variable "public_subnets" {
  type        = "list"
  description = "List of public subnets to place Elastic Load Balancer"
}

variable "private_subnets" {
  type        = "list"
  description = "List of private subnets to place EC2 instances"
}

variable "keypair" {
  description = "Name of SSH key that will be deployed on Elastic Beanstalk and DataPipeline instance. The key should be present in AWS"
}

variable "root_volume_size" {
  default     = "8"
  description = "The size of the EBS root volume"
}

variable "root_volume_type" {
  default     = "gp2"
  description = "The type of the EBS root volume"
}

variable "availability_zones" {
  default     = "Any 2"
  description = "Choose the number of AZs for your instances"
}

variable "rolling_update_type" {
  default     = "Health"
  description = "Set it to Immutable to apply the configuration change to a fresh group of instances"
}

variable "updating_min_in_service" {
  default     = "1"
  description = "Minimum count of instances up during update"
}

variable "updating_max_batch" {
  default     = "1"
  description = "Maximum count of instances up during update"
}

variable "ssh_source_restriction" {
  default     = "0.0.0.0/0"
  description = "Used to lock down SSH access to the EC2 instances."
}

variable "instance_type" {
  default     = "t2.micro"
  description = "Instances type"
}

variable "associate_public_ip_address" {
  default     = "false"
  description = "Specifies whether to launch instances in your VPC with public IP addresses."
}

variable "autoscale_lower_bound" {
  default     = "20"
  description = "Minimum level of autoscale metric to add instance"
}

variable "autoscale_upper_bound" {
  default     = "80"
  description = "Maximum level of autoscale metric to remove instance"
}

variable "autoscale_min" {
  default     = "2"
  description = "Minumum instances in charge"
}

variable "autoscale_max" {
  default     = "3"
  description = "Maximum instances in charge"
}

variable "solution_stack_name" {
  default     = ""
  description = "Elastic Beanstalk stack, e.g. Docker, Go, Node, Java, IIS. [Read more](http://docs.aws.amazon.com/elasticbeanstalk/latest/dg/concepts.platforms.html)"
}

variable "wait_for_ready_timeout" {
  default = "20m"
}

# From: http://docs.aws.amazon.com/general/latest/gr/rande.html#elasticbeanstalk_region
# Via: https://github.com/hashicorp/terraform/issues/7071
variable "alb_zone_id" {
  default = {
    ap-northeast-1 = "Z1R25G3KIG2GBW"
    ap-northeast-2 = "Z3JE5OI70TWKCP"
    ap-south-1     = "Z18NTBI3Y7N9TZ"
    ap-southeast-1 = "Z16FZ9L249IFLT"
    ap-southeast-2 = "Z2PCDNR3VC2G1N"
    ca-central-1   = "ZJFCZL7SSZB5I"
    eu-central-1   = "Z1FRNW7UH4DEZJ"
    eu-west-1      = "Z2NYPWQ7DFZAZH"
    eu-west-2      = "Z1GKAAAUGATPF1"
    sa-east-1      = "Z10X7K2B4QSOFV"
    us-east-1      = "Z117KPS5GTRQ2G"
    us-east-2      = "Z14LCN19Q5QHIC"
    us-west-1      = "Z1LQECGX5PH1X"
    us-west-2      = "Z38NKT9BP95V3O"
  }

  description = "ALB zone id"
}

variable "tags" {
  type        = "map"
  default     = {}
  description = "Additional tags (e.g. `map('BusinessUnit`,`XYZ`)"
}

variable "env_default_key" {
  default     = "DEFAULT_ENV_%d"
  description = "Default ENV variable key for Elastic Beanstalk `aws:elasticbeanstalk:application:environment` setting"
}

variable "env_default_value" {
  default     = "UNSET"
  description = "Default ENV variable value for Elastic Beanstalk `aws:elasticbeanstalk:application:environment` setting"
}

variable "env_vars" {
  default     = {}
  type        = "map"
  description = "Map of custom ENV variables to be provided to the Jenkins application running on Elastic Beanstalk, e.g. `env_vars = { JENKINS_USER = 'admin' JENKINS_PASS = 'xxxxxx' }`"
}

variable "tier" {
  default     = "WebServer"
  description = "Elastic Beanstalk Environment tier, e.g. ('WebServer', 'Worker')"
}

variable "version_label" {
  default     = ""
  description = "Elastic Beanstalk Application version to deploy"
}

variable "nodejs_version" {
  default     = ""
  description = "Elastic Beanstalk NodeJS version to deploy"
}
