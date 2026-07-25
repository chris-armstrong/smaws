type nonrec access_log_prefix = string [@@ocaml.doc ""]

type nonrec access_log_interval = int [@@ocaml.doc ""]

type nonrec s3_bucket_name = string [@@ocaml.doc ""]

type nonrec access_log_enabled = bool [@@ocaml.doc ""]

type nonrec access_log = {
  enabled : access_log_enabled;
      [@ocaml.doc "Specifies whether access logs are enabled for the load balancer.\n"]
  s3_bucket_name : s3_bucket_name option;
      [@ocaml.doc "The name of the Amazon S3 bucket where the access logs are stored.\n"]
  emit_interval : access_log_interval option;
      [@ocaml.doc
        "The interval for publishing the access logs. You can specify an interval of either 5 \
         minutes or 60 minutes.\n\n\
        \ Default: 60 minutes\n\
        \ "]
  s3_bucket_prefix : access_log_prefix option;
      [@ocaml.doc
        "The logical hierarchy you created for your Amazon S3 bucket, for example \
         [my-bucket-prefix/prod]. If the prefix is not provided, the log is placed at the root \
         level of the bucket.\n"]
}
[@@ocaml.doc "Information about the [AccessLog] attribute.\n"]

type nonrec access_point_name = string [@@ocaml.doc ""]

type nonrec error_description = string [@@ocaml.doc ""]

type nonrec access_point_not_found_exception = {
  message : error_description option; [@ocaml.doc ""]
}
[@@ocaml.doc "The specified load balancer does not exist.\n"]

type nonrec access_point_port = int [@@ocaml.doc ""]

type nonrec availability_zone = string [@@ocaml.doc ""]

type nonrec availability_zones = availability_zone list [@@ocaml.doc ""]

type nonrec add_availability_zones_input = {
  load_balancer_name : access_point_name; [@ocaml.doc "The name of the load balancer.\n"]
  availability_zones : availability_zones;
      [@ocaml.doc
        "The Availability Zones. These must be in the same region as the load balancer.\n"]
}
[@@ocaml.doc "Contains the parameters for EnableAvailabilityZonesForLoadBalancer.\n"]

type nonrec add_availability_zones_output = {
  availability_zones : availability_zones option;
      [@ocaml.doc "The updated list of Availability Zones for the load balancer.\n"]
}
[@@ocaml.doc "Contains the output of EnableAvailabilityZonesForLoadBalancer.\n"]

type nonrec too_many_tags_exception = { message : error_description option [@ocaml.doc ""] }
[@@ocaml.doc
  "The quota for the number of tags that can be assigned to a load balancer has been reached.\n"]

type nonrec duplicate_tag_keys_exception = { message : error_description option [@ocaml.doc ""] }
[@@ocaml.doc "A tag key was specified more than once.\n"]

type nonrec add_tags_output = unit [@@ocaml.doc ""]

type nonrec tag_value = string [@@ocaml.doc ""]

type nonrec tag_key = string [@@ocaml.doc ""]

type nonrec tag = {
  key : tag_key; [@ocaml.doc "The key of the tag.\n"]
  value : tag_value option; [@ocaml.doc "The value of the tag.\n"]
}
[@@ocaml.doc "Information about a tag.\n"]

type nonrec tag_list = tag list [@@ocaml.doc ""]

type nonrec load_balancer_names = access_point_name list [@@ocaml.doc ""]

type nonrec add_tags_input = {
  load_balancer_names : load_balancer_names;
      [@ocaml.doc "The name of the load balancer. You can specify one load balancer only.\n"]
  tags : tag_list; [@ocaml.doc "The tags.\n"]
}
[@@ocaml.doc "Contains the parameters for AddTags.\n"]

type nonrec additional_attribute_value = string [@@ocaml.doc ""]

type nonrec additional_attribute_key = string [@@ocaml.doc ""]

type nonrec additional_attribute = {
  key : additional_attribute_key option;
      [@ocaml.doc
        "The name of the attribute.\n\n\
        \ The following attribute is supported.\n\
        \ \n\
        \  {ul\n\
        \        {-   [elb.http.desyncmitigationmode] - Determines how the load balancer handles \
         requests that might pose a security risk to your application. The possible values are \
         [monitor], [defensive], and [strictest]. The default is [defensive].\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  value : additional_attribute_value option; [@ocaml.doc "This value of the attribute.\n"]
}
[@@ocaml.doc "Information about additional load balancer attributes.\n"]

type nonrec additional_attributes = additional_attribute list [@@ocaml.doc ""]

type nonrec cookie_name = string [@@ocaml.doc ""]

type nonrec policy_name = string [@@ocaml.doc ""]

type nonrec app_cookie_stickiness_policy = {
  policy_name : policy_name option;
      [@ocaml.doc
        "The mnemonic name for the policy being created. The name must be unique within a set of \
         policies for this load balancer.\n"]
  cookie_name : cookie_name option;
      [@ocaml.doc "The name of the application cookie used for stickiness.\n"]
}
[@@ocaml.doc "Information about a policy for application-controlled session stickiness.\n"]

type nonrec app_cookie_stickiness_policies = app_cookie_stickiness_policy list [@@ocaml.doc ""]

type nonrec invalid_security_group_exception = {
  message : error_description option; [@ocaml.doc ""]
}
[@@ocaml.doc "One or more of the specified security groups do not exist.\n"]

type nonrec invalid_configuration_request_exception = {
  message : error_description option; [@ocaml.doc ""]
}
[@@ocaml.doc "The requested configuration change is not valid.\n"]

type nonrec security_group_id = string [@@ocaml.doc ""]

type nonrec security_groups = security_group_id list [@@ocaml.doc ""]

type nonrec apply_security_groups_to_load_balancer_output = {
  security_groups : security_groups option;
      [@ocaml.doc "The IDs of the security groups associated with the load balancer.\n"]
}
[@@ocaml.doc "Contains the output of ApplySecurityGroupsToLoadBalancer.\n"]

type nonrec apply_security_groups_to_load_balancer_input = {
  load_balancer_name : access_point_name; [@ocaml.doc "The name of the load balancer.\n"]
  security_groups : security_groups;
      [@ocaml.doc
        "The IDs of the security groups to associate with the load balancer. Note that you cannot \
         specify the name of the security group.\n"]
}
[@@ocaml.doc "Contains the parameters for ApplySecurityGroupsToLoadBalancer.\n"]

type nonrec subnet_not_found_exception = { message : error_description option [@ocaml.doc ""] }
[@@ocaml.doc "One or more of the specified subnets do not exist.\n"]

type nonrec invalid_subnet_exception = { message : error_description option [@ocaml.doc ""] }
[@@ocaml.doc "The specified VPC has no associated Internet gateway.\n"]

type nonrec subnet_id = string [@@ocaml.doc ""]

type nonrec subnets = subnet_id list [@@ocaml.doc ""]

type nonrec attach_load_balancer_to_subnets_output = {
  subnets : subnets option; [@ocaml.doc "The IDs of the subnets attached to the load balancer.\n"]
}
[@@ocaml.doc "Contains the output of AttachLoadBalancerToSubnets.\n"]

type nonrec attach_load_balancer_to_subnets_input = {
  load_balancer_name : access_point_name; [@ocaml.doc "The name of the load balancer.\n"]
  subnets : subnets;
      [@ocaml.doc
        "The IDs of the subnets to add. You can add only one subnet per Availability Zone.\n"]
}
[@@ocaml.doc "Contains the parameters for AttachLoaBalancerToSubnets.\n"]

type nonrec attribute_name = string [@@ocaml.doc ""]

type nonrec attribute_type = string [@@ocaml.doc ""]

type nonrec attribute_value = string [@@ocaml.doc ""]

type nonrec policy_names = policy_name list [@@ocaml.doc ""]

type nonrec instance_port = int [@@ocaml.doc ""]

type nonrec backend_server_description = {
  instance_port : instance_port option;
      [@ocaml.doc "The port on which the EC2 instance is listening.\n"]
  policy_names : policy_names option;
      [@ocaml.doc "The names of the policies enabled for the EC2 instance.\n"]
}
[@@ocaml.doc "Information about the configuration of an EC2 instance.\n"]

type nonrec backend_server_descriptions = backend_server_description list [@@ocaml.doc ""]

type nonrec cardinality = string [@@ocaml.doc ""]

type nonrec certificate_not_found_exception = { message : error_description option [@ocaml.doc ""] }
[@@ocaml.doc
  "The specified ARN does not refer to a valid SSL certificate in AWS Identity and Access \
   Management (IAM) or AWS Certificate Manager (ACM). Note that if you recently uploaded the \
   certificate to IAM, this error might indicate that the certificate is not fully available yet.\n"]

type nonrec healthy_threshold = int [@@ocaml.doc ""]

type nonrec unhealthy_threshold = int [@@ocaml.doc ""]

type nonrec health_check_timeout = int [@@ocaml.doc ""]

type nonrec health_check_interval = int [@@ocaml.doc ""]

type nonrec health_check_target = string [@@ocaml.doc ""]

type nonrec health_check = {
  target : health_check_target;
      [@ocaml.doc
        "The instance being checked. The protocol is either TCP, HTTP, HTTPS, or SSL. The range of \
         valid ports is one (1) through 65535.\n\n\
        \ TCP is the default, specified as a TCP: port pair, for example \"TCP:5000\". In this \
         case, a health check simply attempts to open a TCP connection to the instance on the \
         specified port. Failure to connect within the configured timeout is considered unhealthy.\n\
        \ \n\
        \  SSL is also specified as SSL: port pair, for example, SSL:5000.\n\
        \  \n\
        \   For HTTP/HTTPS, you must include a ping path in the string. HTTP is specified as a \
         HTTP:port;/;PathToPing; grouping, for example \"HTTP:80/weather/us/wa/seattle\". In this \
         case, a HTTP GET request is issued to the instance on the given port and path. Any answer \
         other than \"200 OK\" within the timeout period is considered unhealthy.\n\
        \   \n\
        \    The total length of the HTTP ping target must be 1024 16-bit Unicode characters or \
         less.\n\
        \    "]
  interval : health_check_interval;
      [@ocaml.doc
        "The approximate interval, in seconds, between health checks of an individual instance.\n"]
  timeout : health_check_timeout;
      [@ocaml.doc
        "The amount of time, in seconds, during which no response means a failed health check.\n\n\
        \ This value must be less than the [Interval] value.\n\
        \ "]
  unhealthy_threshold : unhealthy_threshold;
      [@ocaml.doc
        "The number of consecutive health check failures required before moving the instance to \
         the [Unhealthy] state.\n"]
  healthy_threshold : healthy_threshold;
      [@ocaml.doc
        "The number of consecutive health checks successes required before moving the instance to \
         the [Healthy] state.\n"]
}
[@@ocaml.doc "Information about a health check.\n"]

type nonrec configure_health_check_output = {
  health_check : health_check option; [@ocaml.doc "The updated health check.\n"]
}
[@@ocaml.doc "Contains the output of ConfigureHealthCheck.\n"]

type nonrec configure_health_check_input = {
  load_balancer_name : access_point_name; [@ocaml.doc "The name of the load balancer.\n"]
  health_check : health_check; [@ocaml.doc "The configuration information.\n"]
}
[@@ocaml.doc "Contains the parameters for ConfigureHealthCheck.\n"]

type nonrec connection_draining_timeout = int [@@ocaml.doc ""]

type nonrec connection_draining_enabled = bool [@@ocaml.doc ""]

type nonrec connection_draining = {
  enabled : connection_draining_enabled;
      [@ocaml.doc "Specifies whether connection draining is enabled for the load balancer.\n"]
  timeout : connection_draining_timeout option;
      [@ocaml.doc
        "The maximum time, in seconds, to keep the existing connections open before deregistering \
         the instances.\n"]
}
[@@ocaml.doc "Information about the [ConnectionDraining] attribute.\n"]

type nonrec idle_timeout = int [@@ocaml.doc ""]

type nonrec connection_settings = {
  idle_timeout : idle_timeout;
      [@ocaml.doc
        "The time, in seconds, that the connection is allowed to be idle (no data has been sent \
         over the connection) before it is closed by the load balancer.\n"]
}
[@@ocaml.doc "Information about the [ConnectionSettings] attribute.\n"]

type nonrec cookie_expiration_period = Smaws_Lib.CoreTypes.Int64.t [@@ocaml.doc ""]

type nonrec load_balancer_scheme = string [@@ocaml.doc ""]

type nonrec ssl_certificate_id = string [@@ocaml.doc ""]

type nonrec protocol = string [@@ocaml.doc ""]

type nonrec listener = {
  protocol : protocol;
      [@ocaml.doc
        "The load balancer transport protocol to use for routing: HTTP, HTTPS, TCP, or SSL.\n"]
  load_balancer_port : access_point_port;
      [@ocaml.doc
        "The port on which the load balancer is listening. On EC2-VPC, you can specify any port \
         from the range 1-65535. On EC2-Classic, you can specify any port from the following list: \
         25, 80, 443, 465, 587, 1024-65535.\n"]
  instance_protocol : protocol option;
      [@ocaml.doc
        "The protocol to use for routing traffic to instances: HTTP, HTTPS, TCP, or SSL.\n\n\
        \ If the front-end protocol is TCP or SSL, the back-end protocol must be TCP or SSL. If \
         the front-end protocol is HTTP or HTTPS, the back-end protocol must be HTTP or HTTPS.\n\
        \ \n\
        \  If there is another listener with the same [InstancePort] whose [InstanceProtocol] is \
         secure, (HTTPS or SSL), the listener's [InstanceProtocol] must also be secure.\n\
        \  \n\
        \   If there is another listener with the same [InstancePort] whose [InstanceProtocol] is \
         HTTP or TCP, the listener's [InstanceProtocol] must be HTTP or TCP.\n\
        \   "]
  instance_port : instance_port; [@ocaml.doc "The port on which the instance is listening.\n"]
  ssl_certificate_id : ssl_certificate_id option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the server certificate.\n"]
}
[@@ocaml.doc
  "Information about a listener.\n\n\
  \ For information about the protocols and the ports supported by Elastic Load Balancing, see \
   {{:https://docs.aws.amazon.com/elasticloadbalancing/latest/classic/elb-listener-config.html}Listeners \
   for Your Classic Load Balancer} in the {i Classic Load Balancers Guide}.\n\
  \ "]

type nonrec listeners = listener list [@@ocaml.doc ""]

type nonrec create_access_point_input = {
  load_balancer_name : access_point_name;
      [@ocaml.doc
        "The name of the load balancer.\n\n\
        \ This name must be unique within your set of load balancers for the region, must have a \
         maximum of 32 characters, must contain only alphanumeric characters or hyphens, and \
         cannot begin or end with a hyphen.\n\
        \ "]
  listeners : listeners;
      [@ocaml.doc
        "The listeners.\n\n\
        \ For more information, see \
         {{:https://docs.aws.amazon.com/elasticloadbalancing/latest/classic/elb-listener-config.html}Listeners \
         for Your Classic Load Balancer} in the {i Classic Load Balancers Guide}.\n\
        \ "]
  availability_zones : availability_zones option;
      [@ocaml.doc
        "One or more Availability Zones from the same region as the load balancer.\n\n\
        \ You must specify at least one Availability Zone.\n\
        \ \n\
        \  You can add more Availability Zones after you create the load balancer using \
         [EnableAvailabilityZonesForLoadBalancer].\n\
        \  "]
  subnets : subnets option;
      [@ocaml.doc
        "The IDs of the subnets in your VPC to attach to the load balancer. Specify one subnet per \
         Availability Zone specified in [AvailabilityZones].\n"]
  security_groups : security_groups option;
      [@ocaml.doc "The IDs of the security groups to assign to the load balancer.\n"]
  scheme : load_balancer_scheme option;
      [@ocaml.doc
        "The type of a load balancer. Valid only for load balancers in a VPC.\n\n\
        \ By default, Elastic Load Balancing creates an Internet-facing load balancer with a DNS \
         name that resolves to public IP addresses. For more information about Internet-facing and \
         Internal load balancers, see \
         {{:https://docs.aws.amazon.com/elasticloadbalancing/latest/userguide/how-elastic-load-balancing-works.html#load-balancer-scheme}Load \
         Balancer Scheme} in the {i Elastic Load Balancing User Guide}.\n\
        \ \n\
        \  Specify [internal] to create a load balancer with a DNS name that resolves to private \
         IP addresses.\n\
        \  "]
  tags : tag_list option;
      [@ocaml.doc
        "A list of tags to assign to the load balancer.\n\n\
        \ For more information about tagging your load balancer, see \
         {{:https://docs.aws.amazon.com/elasticloadbalancing/latest/classic/add-remove-tags.html}Tag \
         Your Classic Load Balancer} in the {i Classic Load Balancers Guide}.\n\
        \ "]
}
[@@ocaml.doc "Contains the parameters for CreateLoadBalancer.\n"]

type nonrec dns_name = string [@@ocaml.doc ""]

type nonrec create_access_point_output = {
  dns_name : dns_name option; [@ocaml.doc "The DNS name of the load balancer.\n"]
}
[@@ocaml.doc "Contains the output for CreateLoadBalancer.\n"]

type nonrec too_many_policies_exception = { message : error_description option [@ocaml.doc ""] }
[@@ocaml.doc "The quota for the number of policies for this load balancer has been reached.\n"]

type nonrec duplicate_policy_name_exception = { message : error_description option [@ocaml.doc ""] }
[@@ocaml.doc "A policy with the specified name already exists for this load balancer.\n"]

type nonrec create_app_cookie_stickiness_policy_output = unit [@@ocaml.doc ""]

type nonrec create_app_cookie_stickiness_policy_input = {
  load_balancer_name : access_point_name; [@ocaml.doc "The name of the load balancer.\n"]
  policy_name : policy_name;
      [@ocaml.doc
        "The name of the policy being created. Policy names must consist of alphanumeric \
         characters and dashes (-). This name must be unique within the set of policies for this \
         load balancer.\n"]
  cookie_name : cookie_name; [@ocaml.doc "The name of the application cookie used for stickiness.\n"]
}
[@@ocaml.doc "Contains the parameters for CreateAppCookieStickinessPolicy.\n"]

type nonrec create_lb_cookie_stickiness_policy_output = unit [@@ocaml.doc ""]

type nonrec create_lb_cookie_stickiness_policy_input = {
  load_balancer_name : access_point_name; [@ocaml.doc "The name of the load balancer.\n"]
  policy_name : policy_name;
      [@ocaml.doc
        "The name of the policy being created. Policy names must consist of alphanumeric \
         characters and dashes (-). This name must be unique within the set of policies for this \
         load balancer.\n"]
  cookie_expiration_period : cookie_expiration_period option;
      [@ocaml.doc
        "The time period, in seconds, after which the cookie should be considered stale. If you do \
         not specify this parameter, the default value is 0, which indicates that the sticky \
         session should last for the duration of the browser session.\n"]
}
[@@ocaml.doc "Contains the parameters for CreateLBCookieStickinessPolicy.\n"]

type nonrec unsupported_protocol_exception = { message : error_description option [@ocaml.doc ""] }
[@@ocaml.doc "The specified protocol or signature version is not supported.\n"]

type nonrec too_many_access_points_exception = {
  message : error_description option; [@ocaml.doc ""]
}
[@@ocaml.doc "The quota for the number of load balancers has been reached.\n"]

type nonrec operation_not_permitted_exception = {
  message : error_description option; [@ocaml.doc ""]
}
[@@ocaml.doc "This operation is not allowed.\n"]

type nonrec invalid_scheme_exception = { message : error_description option [@ocaml.doc ""] }
[@@ocaml.doc
  "The specified value for the schema is not valid. You can only specify a scheme for load \
   balancers in a VPC.\n"]

type nonrec duplicate_access_point_name_exception = {
  message : error_description option; [@ocaml.doc ""]
}
[@@ocaml.doc "The specified load balancer name already exists for this account.\n"]

type nonrec create_load_balancer_listener_input = {
  load_balancer_name : access_point_name; [@ocaml.doc "The name of the load balancer.\n"]
  listeners : listeners; [@ocaml.doc "The listeners.\n"]
}
[@@ocaml.doc "Contains the parameters for CreateLoadBalancerListeners.\n"]

type nonrec create_load_balancer_listener_output = unit [@@ocaml.doc ""]

type nonrec duplicate_listener_exception = { message : error_description option [@ocaml.doc ""] }
[@@ocaml.doc
  "A listener already exists for the specified load balancer name and port, but with a different \
   instance port, protocol, or SSL certificate.\n"]

type nonrec policy_type_not_found_exception = { message : error_description option [@ocaml.doc ""] }
[@@ocaml.doc "One or more of the specified policy types do not exist.\n"]

type nonrec create_load_balancer_policy_output = unit [@@ocaml.doc ""]

type nonrec policy_attribute = {
  attribute_name : attribute_name option; [@ocaml.doc "The name of the attribute.\n"]
  attribute_value : attribute_value option; [@ocaml.doc "The value of the attribute.\n"]
}
[@@ocaml.doc "Information about a policy attribute.\n"]

type nonrec policy_attributes = policy_attribute list [@@ocaml.doc ""]

type nonrec policy_type_name = string [@@ocaml.doc ""]

type nonrec create_load_balancer_policy_input = {
  load_balancer_name : access_point_name; [@ocaml.doc "The name of the load balancer.\n"]
  policy_name : policy_name;
      [@ocaml.doc
        "The name of the load balancer policy to be created. This name must be unique within the \
         set of policies for this load balancer.\n"]
  policy_type_name : policy_type_name;
      [@ocaml.doc
        "The name of the base policy type. To get the list of policy types, use \
         [DescribeLoadBalancerPolicyTypes].\n"]
  policy_attributes : policy_attributes option; [@ocaml.doc "The policy attributes.\n"]
}
[@@ocaml.doc "Contains the parameters for CreateLoadBalancerPolicy.\n"]

type nonrec created_time = Smaws_Lib.CoreTypes.Timestamp.t [@@ocaml.doc ""]

type nonrec cross_zone_load_balancing_enabled = bool [@@ocaml.doc ""]

type nonrec cross_zone_load_balancing = {
  enabled : cross_zone_load_balancing_enabled;
      [@ocaml.doc "Specifies whether cross-zone load balancing is enabled for the load balancer.\n"]
}
[@@ocaml.doc "Information about the [CrossZoneLoadBalancing] attribute.\n"]

type nonrec default_value = string [@@ocaml.doc ""]

type nonrec delete_access_point_input = {
  load_balancer_name : access_point_name; [@ocaml.doc "The name of the load balancer.\n"]
}
[@@ocaml.doc "Contains the parameters for DeleteLoadBalancer.\n"]

type nonrec delete_access_point_output = unit [@@ocaml.doc ""]

type nonrec ports = access_point_port list [@@ocaml.doc ""]

type nonrec delete_load_balancer_listener_input = {
  load_balancer_name : access_point_name; [@ocaml.doc "The name of the load balancer.\n"]
  load_balancer_ports : ports; [@ocaml.doc "The client port numbers of the listeners.\n"]
}
[@@ocaml.doc "Contains the parameters for DeleteLoadBalancerListeners.\n"]

type nonrec delete_load_balancer_listener_output = unit [@@ocaml.doc ""]

type nonrec delete_load_balancer_policy_output = unit [@@ocaml.doc ""]

type nonrec delete_load_balancer_policy_input = {
  load_balancer_name : access_point_name; [@ocaml.doc "The name of the load balancer.\n"]
  policy_name : policy_name; [@ocaml.doc "The name of the policy.\n"]
}
[@@ocaml.doc "Contains the parameters for DeleteLoadBalancerPolicy.\n"]

type nonrec dependency_throttle_exception = { message : error_description option [@ocaml.doc ""] }
[@@ocaml.doc
  "A request made by Elastic Load Balancing to another service exceeds the maximum request rate \
   permitted for your account.\n"]

type nonrec instance_id = string [@@ocaml.doc ""]

type nonrec instance = { instance_id : instance_id option [@ocaml.doc "The instance ID.\n"] }
[@@ocaml.doc "The ID of an EC2 instance.\n"]

type nonrec instances = instance list [@@ocaml.doc ""]

type nonrec deregister_end_points_input = {
  load_balancer_name : access_point_name; [@ocaml.doc "The name of the load balancer.\n"]
  instances : instances; [@ocaml.doc "The IDs of the instances.\n"]
}
[@@ocaml.doc "Contains the parameters for DeregisterInstancesFromLoadBalancer.\n"]

type nonrec deregister_end_points_output = {
  instances : instances option;
      [@ocaml.doc "The remaining instances registered with the load balancer.\n"]
}
[@@ocaml.doc "Contains the output of DeregisterInstancesFromLoadBalancer.\n"]

type nonrec invalid_end_point_exception = { message : error_description option [@ocaml.doc ""] }
[@@ocaml.doc "The specified endpoint is not valid.\n"]

type nonrec page_size = int [@@ocaml.doc ""]

type nonrec marker = string [@@ocaml.doc ""]

type nonrec describe_access_points_input = {
  load_balancer_names : load_balancer_names option;
      [@ocaml.doc "The names of the load balancers.\n"]
  marker : marker option;
      [@ocaml.doc
        "The marker for the next set of results. (You received this marker from a previous call.)\n"]
  page_size : page_size option;
      [@ocaml.doc
        "The maximum number of results to return with this call (a number from 1 to 400). The \
         default is 400.\n"]
}
[@@ocaml.doc "Contains the parameters for DescribeLoadBalancers.\n"]

type nonrec security_group_name = string [@@ocaml.doc ""]

type nonrec security_group_owner_alias = string [@@ocaml.doc ""]

type nonrec source_security_group = {
  owner_alias : security_group_owner_alias option; [@ocaml.doc "The owner of the security group.\n"]
  group_name : security_group_name option; [@ocaml.doc "The name of the security group.\n"]
}
[@@ocaml.doc "Information about a source security group.\n"]

type nonrec vpc_id = string [@@ocaml.doc ""]

type nonrec lb_cookie_stickiness_policy = {
  policy_name : policy_name option;
      [@ocaml.doc
        "The name of the policy. This name must be unique within the set of policies for this load \
         balancer.\n"]
  cookie_expiration_period : cookie_expiration_period option;
      [@ocaml.doc
        "The time period, in seconds, after which the cookie should be considered stale. If this \
         parameter is not specified, the stickiness session lasts for the duration of the browser \
         session.\n"]
}
[@@ocaml.doc "Information about a policy for duration-based session stickiness.\n"]

type nonrec lb_cookie_stickiness_policies = lb_cookie_stickiness_policy list [@@ocaml.doc ""]

type nonrec policies = {
  app_cookie_stickiness_policies : app_cookie_stickiness_policies option;
      [@ocaml.doc "The stickiness policies created using [CreateAppCookieStickinessPolicy].\n"]
  lb_cookie_stickiness_policies : lb_cookie_stickiness_policies option;
      [@ocaml.doc "The stickiness policies created using [CreateLBCookieStickinessPolicy].\n"]
  other_policies : policy_names option;
      [@ocaml.doc "The policies other than the stickiness policies.\n"]
}
[@@ocaml.doc "The policies for a load balancer.\n"]

type nonrec listener_description = {
  listener : listener option; [@ocaml.doc "The listener.\n"]
  policy_names : policy_names option;
      [@ocaml.doc "The policies. If there are no policies enabled, the list is empty.\n"]
}
[@@ocaml.doc "The policies enabled for a listener.\n"]

type nonrec listener_descriptions = listener_description list [@@ocaml.doc ""]

type nonrec load_balancer_description = {
  load_balancer_name : access_point_name option; [@ocaml.doc "The name of the load balancer.\n"]
  dns_name : dns_name option; [@ocaml.doc "The DNS name of the load balancer.\n"]
  canonical_hosted_zone_name : dns_name option;
      [@ocaml.doc
        "The DNS name of the load balancer.\n\n\
        \ For more information, see \
         {{:https://docs.aws.amazon.com/elasticloadbalancing/latest/classic/using-domain-names-with-elb.html}Configure \
         a Custom Domain Name} in the {i Classic Load Balancers Guide}.\n\
        \ "]
  canonical_hosted_zone_name_i_d : dns_name option;
      [@ocaml.doc "The ID of the Amazon Route 53 hosted zone for the load balancer.\n"]
  listener_descriptions : listener_descriptions option;
      [@ocaml.doc "The listeners for the load balancer.\n"]
  policies : policies option; [@ocaml.doc "The policies defined for the load balancer.\n"]
  backend_server_descriptions : backend_server_descriptions option;
      [@ocaml.doc "Information about your EC2 instances.\n"]
  availability_zones : availability_zones option;
      [@ocaml.doc "The Availability Zones for the load balancer.\n"]
  subnets : subnets option; [@ocaml.doc "The IDs of the subnets for the load balancer.\n"]
  vpc_id : vpc_id option; [@ocaml.doc "The ID of the VPC for the load balancer.\n"]
  instances : instances option; [@ocaml.doc "The IDs of the instances for the load balancer.\n"]
  health_check : health_check option;
      [@ocaml.doc "Information about the health checks conducted on the load balancer.\n"]
  source_security_group : source_security_group option;
      [@ocaml.doc
        "The security group for the load balancer, which you can use as part of your inbound rules \
         for your registered instances. To only allow traffic from load balancers, add a security \
         group rule that specifies this source security group as the inbound source.\n"]
  security_groups : security_groups option;
      [@ocaml.doc
        "The security groups for the load balancer. Valid only for load balancers in a VPC.\n"]
  created_time : created_time option;
      [@ocaml.doc "The date and time the load balancer was created.\n"]
  scheme : load_balancer_scheme option;
      [@ocaml.doc
        "The type of load balancer. Valid only for load balancers in a VPC.\n\n\
        \ If [Scheme] is [internet-facing], the load balancer has a public DNS name that resolves \
         to a public IP address.\n\
        \ \n\
        \  If [Scheme] is [internal], the load balancer has a public DNS name that resolves to a \
         private IP address.\n\
        \  "]
}
[@@ocaml.doc "Information about a load balancer.\n"]

type nonrec load_balancer_descriptions = load_balancer_description list [@@ocaml.doc ""]

type nonrec describe_access_points_output = {
  load_balancer_descriptions : load_balancer_descriptions option;
      [@ocaml.doc "Information about the load balancers.\n"]
  next_marker : marker option;
      [@ocaml.doc
        "The marker to use when requesting the next set of results. If there are no additional \
         results, the string is empty.\n"]
}
[@@ocaml.doc "Contains the parameters for DescribeLoadBalancers.\n"]

type nonrec max = string [@@ocaml.doc ""]

type nonrec name = string [@@ocaml.doc ""]

type nonrec limit = {
  name : name option;
      [@ocaml.doc
        "The name of the limit. The possible values are:\n\n\
        \ {ul\n\
        \       {-  classic-listeners\n\
        \           \n\
        \            }\n\
        \       {-  classic-load-balancers\n\
        \           \n\
        \            }\n\
        \       {-  classic-registered-instances\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  max : max option; [@ocaml.doc "The maximum value of the limit.\n"]
}
[@@ocaml.doc "Information about an Elastic Load Balancing resource limit for your AWS account.\n"]

type nonrec limits = limit list [@@ocaml.doc ""]

type nonrec describe_account_limits_output = {
  limits : limits option; [@ocaml.doc "Information about the limits.\n"]
  next_marker : marker option;
      [@ocaml.doc
        "The marker to use when requesting the next set of results. If there are no additional \
         results, the string is empty.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_account_limits_input = {
  marker : marker option;
      [@ocaml.doc
        "The marker for the next set of results. (You received this marker from a previous call.)\n"]
  page_size : page_size option;
      [@ocaml.doc "The maximum number of results to return with this call.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_end_point_state_input = {
  load_balancer_name : access_point_name; [@ocaml.doc "The name of the load balancer.\n"]
  instances : instances option; [@ocaml.doc "The IDs of the instances.\n"]
}
[@@ocaml.doc "Contains the parameters for DescribeInstanceHealth.\n"]

type nonrec description = string [@@ocaml.doc ""]

type nonrec reason_code = string [@@ocaml.doc ""]

type nonrec state = string [@@ocaml.doc ""]

type nonrec instance_state = {
  instance_id : instance_id option; [@ocaml.doc "The ID of the instance.\n"]
  state : state option;
      [@ocaml.doc
        "The current state of the instance.\n\n\
        \ Valid values: [InService] | [OutOfService] | [Unknown] \n\
        \ "]
  reason_code : reason_code option;
      [@ocaml.doc
        "Information about the cause of [OutOfService] instances. Specifically, whether the cause \
         is Elastic Load Balancing or the instance.\n\n\
        \ Valid values: [ELB] | [Instance] | [N/A] \n\
        \ "]
  description : description option;
      [@ocaml.doc
        "A description of the instance state. This string can contain one or more of the following \
         messages.\n\n\
        \ {ul\n\
        \       {-   [N/A] \n\
        \           \n\
        \            }\n\
        \       {-   [A transient error occurred. Please try again later.] \n\
        \           \n\
        \            }\n\
        \       {-   [Instance has failed at least the UnhealthyThreshold number of health checks \
         consecutively.] \n\
        \           \n\
        \            }\n\
        \       {-   [Instance has not passed the configured HealthyThreshold number of health \
         checks consecutively.] \n\
        \           \n\
        \            }\n\
        \       {-   [Instance registration is still in progress.] \n\
        \           \n\
        \            }\n\
        \       {-   [Instance is in the EC2 Availability Zone for which LoadBalancer is not \
         configured to route traffic to.] \n\
        \           \n\
        \            }\n\
        \       {-   [Instance is not currently registered with the LoadBalancer.] \n\
        \           \n\
        \            }\n\
        \       {-   [Instance deregistration currently in progress.] \n\
        \           \n\
        \            }\n\
        \       {-   [Disable Availability Zone is currently in progress.] \n\
        \           \n\
        \            }\n\
        \       {-   [Instance is in pending state.] \n\
        \           \n\
        \            }\n\
        \       {-   [Instance is in stopped state.] \n\
        \           \n\
        \            }\n\
        \       {-   [Instance is in terminated state.] \n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc "Information about the state of an EC2 instance.\n"]

type nonrec instance_states = instance_state list [@@ocaml.doc ""]

type nonrec describe_end_point_state_output = {
  instance_states : instance_states option;
      [@ocaml.doc "Information about the health of the instances.\n"]
}
[@@ocaml.doc "Contains the output for DescribeInstanceHealth.\n"]

type nonrec load_balancer_attribute_not_found_exception = {
  message : error_description option; [@ocaml.doc ""]
}
[@@ocaml.doc "The specified load balancer attribute does not exist.\n"]

type nonrec load_balancer_attributes = {
  cross_zone_load_balancing : cross_zone_load_balancing option;
      [@ocaml.doc
        "If enabled, the load balancer routes the request traffic evenly across all instances \
         regardless of the Availability Zones.\n\n\
        \ For more information, see \
         {{:https://docs.aws.amazon.com/elasticloadbalancing/latest/classic/enable-disable-crosszone-lb.html}Configure \
         Cross-Zone Load Balancing} in the {i Classic Load Balancers Guide}.\n\
        \ "]
  access_log : access_log option;
      [@ocaml.doc
        "If enabled, the load balancer captures detailed information of all requests and delivers \
         the information to the Amazon S3 bucket that you specify.\n\n\
        \ For more information, see \
         {{:https://docs.aws.amazon.com/elasticloadbalancing/latest/classic/enable-access-logs.html}Enable \
         Access Logs} in the {i Classic Load Balancers Guide}.\n\
        \ "]
  connection_draining : connection_draining option;
      [@ocaml.doc
        "If enabled, the load balancer allows existing requests to complete before the load \
         balancer shifts traffic away from a deregistered or unhealthy instance.\n\n\
        \ For more information, see \
         {{:https://docs.aws.amazon.com/elasticloadbalancing/latest/classic/config-conn-drain.html}Configure \
         Connection Draining} in the {i Classic Load Balancers Guide}.\n\
        \ "]
  connection_settings : connection_settings option;
      [@ocaml.doc
        "If enabled, the load balancer allows the connections to remain idle (no data is sent over \
         the connection) for the specified duration.\n\n\
        \ By default, Elastic Load Balancing maintains a 60-second idle connection timeout for \
         both front-end and back-end connections of your load balancer. For more information, see \
         {{:https://docs.aws.amazon.com/elasticloadbalancing/latest/classic/config-idle-timeout.html}Configure \
         Idle Connection Timeout} in the {i Classic Load Balancers Guide}.\n\
        \ "]
  additional_attributes : additional_attributes option; [@ocaml.doc "Any additional attributes.\n"]
}
[@@ocaml.doc "The attributes for a load balancer.\n"]

type nonrec describe_load_balancer_attributes_output = {
  load_balancer_attributes : load_balancer_attributes option;
      [@ocaml.doc "Information about the load balancer attributes.\n"]
}
[@@ocaml.doc "Contains the output of DescribeLoadBalancerAttributes.\n"]

type nonrec describe_load_balancer_attributes_input = {
  load_balancer_name : access_point_name; [@ocaml.doc "The name of the load balancer.\n"]
}
[@@ocaml.doc "Contains the parameters for DescribeLoadBalancerAttributes.\n"]

type nonrec policy_not_found_exception = { message : error_description option [@ocaml.doc ""] }
[@@ocaml.doc "One or more of the specified policies do not exist.\n"]

type nonrec policy_attribute_description = {
  attribute_name : attribute_name option; [@ocaml.doc "The name of the attribute.\n"]
  attribute_value : attribute_value option; [@ocaml.doc "The value of the attribute.\n"]
}
[@@ocaml.doc "Information about a policy attribute.\n"]

type nonrec policy_attribute_descriptions = policy_attribute_description list [@@ocaml.doc ""]

type nonrec policy_description = {
  policy_name : policy_name option; [@ocaml.doc "The name of the policy.\n"]
  policy_type_name : policy_type_name option; [@ocaml.doc "The name of the policy type.\n"]
  policy_attribute_descriptions : policy_attribute_descriptions option;
      [@ocaml.doc "The policy attributes.\n"]
}
[@@ocaml.doc "Information about a policy.\n"]

type nonrec policy_descriptions = policy_description list [@@ocaml.doc ""]

type nonrec describe_load_balancer_policies_output = {
  policy_descriptions : policy_descriptions option; [@ocaml.doc "Information about the policies.\n"]
}
[@@ocaml.doc "Contains the output of DescribeLoadBalancerPolicies.\n"]

type nonrec describe_load_balancer_policies_input = {
  load_balancer_name : access_point_name option; [@ocaml.doc "The name of the load balancer.\n"]
  policy_names : policy_names option; [@ocaml.doc "The names of the policies.\n"]
}
[@@ocaml.doc "Contains the parameters for DescribeLoadBalancerPolicies.\n"]

type nonrec policy_attribute_type_description = {
  attribute_name : attribute_name option; [@ocaml.doc "The name of the attribute.\n"]
  attribute_type : attribute_type option;
      [@ocaml.doc "The type of the attribute. For example, [Boolean] or [Integer].\n"]
  description : description option; [@ocaml.doc "A description of the attribute.\n"]
  default_value : default_value option;
      [@ocaml.doc "The default value of the attribute, if applicable.\n"]
  cardinality : cardinality option;
      [@ocaml.doc
        "The cardinality of the attribute.\n\n\
        \ Valid values:\n\
        \ \n\
        \  {ul\n\
        \        {-  ONE(1) : Single value required\n\
        \            \n\
        \             }\n\
        \        {-  ZERO_OR_ONE(0..1) : Up to one value is allowed\n\
        \            \n\
        \             }\n\
        \        {-  ZERO_OR_MORE(0..*) : Optional. Multiple values are allowed\n\
        \            \n\
        \             }\n\
        \        {-  ONE_OR_MORE(1..*0) : Required. Multiple values are allowed\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
}
[@@ocaml.doc "Information about a policy attribute type.\n"]

type nonrec policy_attribute_type_descriptions = policy_attribute_type_description list
[@@ocaml.doc ""]

type nonrec policy_type_description = {
  policy_type_name : policy_type_name option; [@ocaml.doc "The name of the policy type.\n"]
  description : description option; [@ocaml.doc "A description of the policy type.\n"]
  policy_attribute_type_descriptions : policy_attribute_type_descriptions option;
      [@ocaml.doc
        "The description of the policy attributes associated with the policies defined by Elastic \
         Load Balancing.\n"]
}
[@@ocaml.doc "Information about a policy type.\n"]

type nonrec policy_type_descriptions = policy_type_description list [@@ocaml.doc ""]

type nonrec describe_load_balancer_policy_types_output = {
  policy_type_descriptions : policy_type_descriptions option;
      [@ocaml.doc "Information about the policy types.\n"]
}
[@@ocaml.doc "Contains the output of DescribeLoadBalancerPolicyTypes.\n"]

type nonrec policy_type_names = policy_type_name list [@@ocaml.doc ""]

type nonrec describe_load_balancer_policy_types_input = {
  policy_type_names : policy_type_names option;
      [@ocaml.doc
        "The names of the policy types. If no names are specified, describes all policy types \
         defined by Elastic Load Balancing.\n"]
}
[@@ocaml.doc "Contains the parameters for DescribeLoadBalancerPolicyTypes.\n"]

type nonrec tag_description = {
  load_balancer_name : access_point_name option; [@ocaml.doc "The name of the load balancer.\n"]
  tags : tag_list option; [@ocaml.doc "The tags.\n"]
}
[@@ocaml.doc "The tags associated with a load balancer.\n"]

type nonrec tag_descriptions = tag_description list [@@ocaml.doc ""]

type nonrec describe_tags_output = {
  tag_descriptions : tag_descriptions option; [@ocaml.doc "Information about the tags.\n"]
}
[@@ocaml.doc "Contains the output for DescribeTags.\n"]

type nonrec load_balancer_names_max20 = access_point_name list [@@ocaml.doc ""]

type nonrec describe_tags_input = {
  load_balancer_names : load_balancer_names_max20; [@ocaml.doc "The names of the load balancers.\n"]
}
[@@ocaml.doc "Contains the parameters for DescribeTags.\n"]

type nonrec detach_load_balancer_from_subnets_output = {
  subnets : subnets option; [@ocaml.doc "The IDs of the remaining subnets for the load balancer.\n"]
}
[@@ocaml.doc "Contains the output of DetachLoadBalancerFromSubnets.\n"]

type nonrec detach_load_balancer_from_subnets_input = {
  load_balancer_name : access_point_name; [@ocaml.doc "The name of the load balancer.\n"]
  subnets : subnets; [@ocaml.doc "The IDs of the subnets.\n"]
}
[@@ocaml.doc "Contains the parameters for DetachLoadBalancerFromSubnets.\n"]

type nonrec remove_availability_zones_output = {
  availability_zones : availability_zones option;
      [@ocaml.doc "The remaining Availability Zones for the load balancer.\n"]
}
[@@ocaml.doc "Contains the output for DisableAvailabilityZonesForLoadBalancer.\n"]

type nonrec remove_availability_zones_input = {
  load_balancer_name : access_point_name; [@ocaml.doc "The name of the load balancer.\n"]
  availability_zones : availability_zones; [@ocaml.doc "The Availability Zones.\n"]
}
[@@ocaml.doc "Contains the parameters for DisableAvailabilityZonesForLoadBalancer.\n"]

type nonrec listener_not_found_exception = { message : error_description option [@ocaml.doc ""] }
[@@ocaml.doc "The load balancer does not have a listener configured at the specified port.\n"]

type nonrec set_load_balancer_policies_of_listener_output = unit [@@ocaml.doc ""]

type nonrec set_load_balancer_policies_of_listener_input = {
  load_balancer_name : access_point_name; [@ocaml.doc "The name of the load balancer.\n"]
  load_balancer_port : access_point_port; [@ocaml.doc "The external port of the load balancer.\n"]
  policy_names : policy_names;
      [@ocaml.doc
        "The names of the policies. This list must include all policies to be enabled. If you omit \
         a policy that is currently enabled, it is disabled. If the list is empty, all current \
         policies are disabled.\n"]
}
[@@ocaml.doc "Contains the parameters for SetLoadBalancePoliciesOfListener.\n"]

type nonrec set_load_balancer_policies_for_backend_server_output = unit [@@ocaml.doc ""]

type nonrec end_point_port = int [@@ocaml.doc ""]

type nonrec set_load_balancer_policies_for_backend_server_input = {
  load_balancer_name : access_point_name; [@ocaml.doc "The name of the load balancer.\n"]
  instance_port : end_point_port; [@ocaml.doc "The port number associated with the EC2 instance.\n"]
  policy_names : policy_names;
      [@ocaml.doc
        "The names of the policies. If the list is empty, then all current polices are removed \
         from the EC2 instance.\n"]
}
[@@ocaml.doc "Contains the parameters for SetLoadBalancerPoliciesForBackendServer.\n"]

type nonrec set_load_balancer_listener_ssl_certificate_output = unit [@@ocaml.doc ""]

type nonrec set_load_balancer_listener_ssl_certificate_input = {
  load_balancer_name : access_point_name; [@ocaml.doc "The name of the load balancer.\n"]
  load_balancer_port : access_point_port;
      [@ocaml.doc "The port that uses the specified SSL certificate.\n"]
  ssl_certificate_id : ssl_certificate_id;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the SSL certificate.\n"]
}
[@@ocaml.doc "Contains the parameters for SetLoadBalancerListenerSSLCertificate.\n"]

type nonrec remove_tags_output = unit [@@ocaml.doc ""]

type nonrec tag_key_only = { key : tag_key option [@ocaml.doc "The name of the key.\n"] }
[@@ocaml.doc "The key of a tag.\n"]

type nonrec tag_key_list = tag_key_only list [@@ocaml.doc ""]

type nonrec remove_tags_input = {
  load_balancer_names : load_balancer_names;
      [@ocaml.doc
        "The name of the load balancer. You can specify a maximum of one load balancer name.\n"]
  tags : tag_key_list; [@ocaml.doc "The list of tag keys to remove.\n"]
}
[@@ocaml.doc "Contains the parameters for RemoveTags.\n"]

type nonrec register_end_points_output = {
  instances : instances option; [@ocaml.doc "The updated list of instances for the load balancer.\n"]
}
[@@ocaml.doc "Contains the output of RegisterInstancesWithLoadBalancer.\n"]

type nonrec register_end_points_input = {
  load_balancer_name : access_point_name; [@ocaml.doc "The name of the load balancer.\n"]
  instances : instances; [@ocaml.doc "The IDs of the instances.\n"]
}
[@@ocaml.doc "Contains the parameters for RegisterInstancesWithLoadBalancer.\n"]

type nonrec modify_load_balancer_attributes_output = {
  load_balancer_name : access_point_name option; [@ocaml.doc "The name of the load balancer.\n"]
  load_balancer_attributes : load_balancer_attributes option;
      [@ocaml.doc "Information about the load balancer attributes.\n"]
}
[@@ocaml.doc "Contains the output of ModifyLoadBalancerAttributes.\n"]

type nonrec modify_load_balancer_attributes_input = {
  load_balancer_name : access_point_name; [@ocaml.doc "The name of the load balancer.\n"]
  load_balancer_attributes : load_balancer_attributes;
      [@ocaml.doc "The attributes for the load balancer.\n"]
}
[@@ocaml.doc "Contains the parameters for ModifyLoadBalancerAttributes.\n"]
