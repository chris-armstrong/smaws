(** Elastic Load Balancing client library built on EIO. *)

open Types

(** {1:types Types} *)

module Types = Types

(** {1:builders Builders} *)

val make_access_log :
  ?s3_bucket_name:s3_bucket_name ->
  ?emit_interval:access_log_interval ->
  ?s3_bucket_prefix:access_log_prefix ->
  enabled:access_log_enabled ->
  unit ->
  access_log

val make_add_availability_zones_input :
  load_balancer_name:access_point_name ->
  availability_zones:availability_zones ->
  unit ->
  add_availability_zones_input

val make_add_availability_zones_output :
  ?availability_zones:availability_zones -> unit -> add_availability_zones_output

val make_add_tags_output : unit -> unit
val make_tag : ?value:tag_value -> key:tag_key -> unit -> tag

val make_add_tags_input :
  load_balancer_names:load_balancer_names -> tags:tag_list -> unit -> add_tags_input

val make_additional_attribute :
  ?key:additional_attribute_key -> ?value:additional_attribute_value -> unit -> additional_attribute

val make_app_cookie_stickiness_policy :
  ?policy_name:policy_name -> ?cookie_name:cookie_name -> unit -> app_cookie_stickiness_policy

val make_apply_security_groups_to_load_balancer_output :
  ?security_groups:security_groups -> unit -> apply_security_groups_to_load_balancer_output

val make_apply_security_groups_to_load_balancer_input :
  load_balancer_name:access_point_name ->
  security_groups:security_groups ->
  unit ->
  apply_security_groups_to_load_balancer_input

val make_attach_load_balancer_to_subnets_output :
  ?subnets:subnets -> unit -> attach_load_balancer_to_subnets_output

val make_attach_load_balancer_to_subnets_input :
  load_balancer_name:access_point_name ->
  subnets:subnets ->
  unit ->
  attach_load_balancer_to_subnets_input

val make_backend_server_description :
  ?instance_port:instance_port -> ?policy_names:policy_names -> unit -> backend_server_description

val make_health_check :
  target:health_check_target ->
  interval:health_check_interval ->
  timeout:health_check_timeout ->
  unhealthy_threshold:unhealthy_threshold ->
  healthy_threshold:healthy_threshold ->
  unit ->
  health_check

val make_configure_health_check_output :
  ?health_check:health_check -> unit -> configure_health_check_output

val make_configure_health_check_input :
  load_balancer_name:access_point_name ->
  health_check:health_check ->
  unit ->
  configure_health_check_input

val make_connection_draining :
  ?timeout:connection_draining_timeout ->
  enabled:connection_draining_enabled ->
  unit ->
  connection_draining

val make_connection_settings : idle_timeout:idle_timeout -> unit -> connection_settings

val make_listener :
  ?instance_protocol:protocol ->
  ?ssl_certificate_id:ssl_certificate_id ->
  protocol:protocol ->
  load_balancer_port:access_point_port ->
  instance_port:instance_port ->
  unit ->
  listener

val make_create_access_point_input :
  ?availability_zones:availability_zones ->
  ?subnets:subnets ->
  ?security_groups:security_groups ->
  ?scheme:load_balancer_scheme ->
  ?tags:tag_list ->
  load_balancer_name:access_point_name ->
  listeners:listeners ->
  unit ->
  create_access_point_input

val make_create_access_point_output : ?dns_name:dns_name -> unit -> create_access_point_output
val make_create_app_cookie_stickiness_policy_output : unit -> unit

val make_create_app_cookie_stickiness_policy_input :
  load_balancer_name:access_point_name ->
  policy_name:policy_name ->
  cookie_name:cookie_name ->
  unit ->
  create_app_cookie_stickiness_policy_input

val make_create_lb_cookie_stickiness_policy_output : unit -> unit

val make_create_lb_cookie_stickiness_policy_input :
  ?cookie_expiration_period:cookie_expiration_period ->
  load_balancer_name:access_point_name ->
  policy_name:policy_name ->
  unit ->
  create_lb_cookie_stickiness_policy_input

val make_create_load_balancer_listener_input :
  load_balancer_name:access_point_name ->
  listeners:listeners ->
  unit ->
  create_load_balancer_listener_input

val make_create_load_balancer_listener_output : unit -> unit
val make_create_load_balancer_policy_output : unit -> unit

val make_policy_attribute :
  ?attribute_name:attribute_name -> ?attribute_value:attribute_value -> unit -> policy_attribute

val make_create_load_balancer_policy_input :
  ?policy_attributes:policy_attributes ->
  load_balancer_name:access_point_name ->
  policy_name:policy_name ->
  policy_type_name:policy_type_name ->
  unit ->
  create_load_balancer_policy_input

val make_cross_zone_load_balancing :
  enabled:cross_zone_load_balancing_enabled -> unit -> cross_zone_load_balancing

val make_delete_access_point_input :
  load_balancer_name:access_point_name -> unit -> delete_access_point_input

val make_delete_access_point_output : unit -> unit

val make_delete_load_balancer_listener_input :
  load_balancer_name:access_point_name ->
  load_balancer_ports:ports ->
  unit ->
  delete_load_balancer_listener_input

val make_delete_load_balancer_listener_output : unit -> unit
val make_delete_load_balancer_policy_output : unit -> unit

val make_delete_load_balancer_policy_input :
  load_balancer_name:access_point_name ->
  policy_name:policy_name ->
  unit ->
  delete_load_balancer_policy_input

val make_instance : ?instance_id:instance_id -> unit -> instance

val make_deregister_end_points_input :
  load_balancer_name:access_point_name -> instances:instances -> unit -> deregister_end_points_input

val make_deregister_end_points_output : ?instances:instances -> unit -> deregister_end_points_output

val make_describe_access_points_input :
  ?load_balancer_names:load_balancer_names ->
  ?marker:marker ->
  ?page_size:page_size ->
  unit ->
  describe_access_points_input

val make_source_security_group :
  ?owner_alias:security_group_owner_alias ->
  ?group_name:security_group_name ->
  unit ->
  source_security_group

val make_lb_cookie_stickiness_policy :
  ?policy_name:policy_name ->
  ?cookie_expiration_period:cookie_expiration_period ->
  unit ->
  lb_cookie_stickiness_policy

val make_policies :
  ?app_cookie_stickiness_policies:app_cookie_stickiness_policies ->
  ?lb_cookie_stickiness_policies:lb_cookie_stickiness_policies ->
  ?other_policies:policy_names ->
  unit ->
  policies

val make_listener_description :
  ?listener:listener -> ?policy_names:policy_names -> unit -> listener_description

val make_load_balancer_description :
  ?load_balancer_name:access_point_name ->
  ?dns_name:dns_name ->
  ?canonical_hosted_zone_name:dns_name ->
  ?canonical_hosted_zone_name_i_d:dns_name ->
  ?listener_descriptions:listener_descriptions ->
  ?policies:policies ->
  ?backend_server_descriptions:backend_server_descriptions ->
  ?availability_zones:availability_zones ->
  ?subnets:subnets ->
  ?vpc_id:vpc_id ->
  ?instances:instances ->
  ?health_check:health_check ->
  ?source_security_group:source_security_group ->
  ?security_groups:security_groups ->
  ?created_time:created_time ->
  ?scheme:load_balancer_scheme ->
  unit ->
  load_balancer_description

val make_describe_access_points_output :
  ?load_balancer_descriptions:load_balancer_descriptions ->
  ?next_marker:marker ->
  unit ->
  describe_access_points_output

val make_limit : ?name:name -> ?max:max -> unit -> limit

val make_describe_account_limits_output :
  ?limits:limits -> ?next_marker:marker -> unit -> describe_account_limits_output

val make_describe_account_limits_input :
  ?marker:marker -> ?page_size:page_size -> unit -> describe_account_limits_input

val make_describe_end_point_state_input :
  ?instances:instances ->
  load_balancer_name:access_point_name ->
  unit ->
  describe_end_point_state_input

val make_instance_state :
  ?instance_id:instance_id ->
  ?state:state ->
  ?reason_code:reason_code ->
  ?description:description ->
  unit ->
  instance_state

val make_describe_end_point_state_output :
  ?instance_states:instance_states -> unit -> describe_end_point_state_output

val make_load_balancer_attributes :
  ?cross_zone_load_balancing:cross_zone_load_balancing ->
  ?access_log:access_log ->
  ?connection_draining:connection_draining ->
  ?connection_settings:connection_settings ->
  ?additional_attributes:additional_attributes ->
  unit ->
  load_balancer_attributes

val make_describe_load_balancer_attributes_output :
  ?load_balancer_attributes:load_balancer_attributes ->
  unit ->
  describe_load_balancer_attributes_output

val make_describe_load_balancer_attributes_input :
  load_balancer_name:access_point_name -> unit -> describe_load_balancer_attributes_input

val make_policy_attribute_description :
  ?attribute_name:attribute_name ->
  ?attribute_value:attribute_value ->
  unit ->
  policy_attribute_description

val make_policy_description :
  ?policy_name:policy_name ->
  ?policy_type_name:policy_type_name ->
  ?policy_attribute_descriptions:policy_attribute_descriptions ->
  unit ->
  policy_description

val make_describe_load_balancer_policies_output :
  ?policy_descriptions:policy_descriptions -> unit -> describe_load_balancer_policies_output

val make_describe_load_balancer_policies_input :
  ?load_balancer_name:access_point_name ->
  ?policy_names:policy_names ->
  unit ->
  describe_load_balancer_policies_input

val make_policy_attribute_type_description :
  ?attribute_name:attribute_name ->
  ?attribute_type:attribute_type ->
  ?description:description ->
  ?default_value:default_value ->
  ?cardinality:cardinality ->
  unit ->
  policy_attribute_type_description

val make_policy_type_description :
  ?policy_type_name:policy_type_name ->
  ?description:description ->
  ?policy_attribute_type_descriptions:policy_attribute_type_descriptions ->
  unit ->
  policy_type_description

val make_describe_load_balancer_policy_types_output :
  ?policy_type_descriptions:policy_type_descriptions ->
  unit ->
  describe_load_balancer_policy_types_output

val make_describe_load_balancer_policy_types_input :
  ?policy_type_names:policy_type_names -> unit -> describe_load_balancer_policy_types_input

val make_tag_description :
  ?load_balancer_name:access_point_name -> ?tags:tag_list -> unit -> tag_description

val make_describe_tags_output : ?tag_descriptions:tag_descriptions -> unit -> describe_tags_output

val make_describe_tags_input :
  load_balancer_names:load_balancer_names_max20 -> unit -> describe_tags_input

val make_detach_load_balancer_from_subnets_output :
  ?subnets:subnets -> unit -> detach_load_balancer_from_subnets_output

val make_detach_load_balancer_from_subnets_input :
  load_balancer_name:access_point_name ->
  subnets:subnets ->
  unit ->
  detach_load_balancer_from_subnets_input

val make_remove_availability_zones_output :
  ?availability_zones:availability_zones -> unit -> remove_availability_zones_output

val make_remove_availability_zones_input :
  load_balancer_name:access_point_name ->
  availability_zones:availability_zones ->
  unit ->
  remove_availability_zones_input

val make_set_load_balancer_policies_of_listener_output : unit -> unit

val make_set_load_balancer_policies_of_listener_input :
  load_balancer_name:access_point_name ->
  load_balancer_port:access_point_port ->
  policy_names:policy_names ->
  unit ->
  set_load_balancer_policies_of_listener_input

val make_set_load_balancer_policies_for_backend_server_output : unit -> unit

val make_set_load_balancer_policies_for_backend_server_input :
  load_balancer_name:access_point_name ->
  instance_port:end_point_port ->
  policy_names:policy_names ->
  unit ->
  set_load_balancer_policies_for_backend_server_input

val make_set_load_balancer_listener_ssl_certificate_output : unit -> unit

val make_set_load_balancer_listener_ssl_certificate_input :
  load_balancer_name:access_point_name ->
  load_balancer_port:access_point_port ->
  ssl_certificate_id:ssl_certificate_id ->
  unit ->
  set_load_balancer_listener_ssl_certificate_input

val make_remove_tags_output : unit -> unit
val make_tag_key_only : ?key:tag_key -> unit -> tag_key_only

val make_remove_tags_input :
  load_balancer_names:load_balancer_names -> tags:tag_key_list -> unit -> remove_tags_input

val make_register_end_points_output : ?instances:instances -> unit -> register_end_points_output

val make_register_end_points_input :
  load_balancer_name:access_point_name -> instances:instances -> unit -> register_end_points_input

val make_modify_load_balancer_attributes_output :
  ?load_balancer_name:access_point_name ->
  ?load_balancer_attributes:load_balancer_attributes ->
  unit ->
  modify_load_balancer_attributes_output

val make_modify_load_balancer_attributes_input :
  load_balancer_name:access_point_name ->
  load_balancer_attributes:load_balancer_attributes ->
  unit ->
  modify_load_balancer_attributes_input
(** {1:operations Operations} *)

module EnableAvailabilityZonesForLoadBalancer : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `AccessPointNotFoundException of access_point_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    add_availability_zones_input ->
    ( add_availability_zones_output,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `AccessPointNotFoundException of access_point_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    add_availability_zones_input ->
    ( add_availability_zones_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `AccessPointNotFoundException of access_point_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Adds the specified Availability Zones to the set of Availability Zones for the specified load \
   balancer in EC2-Classic or a default VPC.\n\n\
  \ For load balancers in a non-default VPC, use [AttachLoadBalancerToSubnets].\n\
  \ \n\
  \  The load balancer evenly distributes requests across all its registered Availability Zones \
   that contain instances. For more information, see \
   {{:https://docs.aws.amazon.com/elasticloadbalancing/latest/classic/enable-disable-az.html}Add \
   or Remove Availability Zones} in the {i Classic Load Balancers Guide}.\n\
  \  "]

module ModifyLoadBalancerAttributes : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `AccessPointNotFoundException of access_point_not_found_exception
    | `InvalidConfigurationRequestException of invalid_configuration_request_exception
    | `LoadBalancerAttributeNotFoundException of load_balancer_attribute_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    modify_load_balancer_attributes_input ->
    ( modify_load_balancer_attributes_output,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `AccessPointNotFoundException of access_point_not_found_exception
      | `InvalidConfigurationRequestException of invalid_configuration_request_exception
      | `LoadBalancerAttributeNotFoundException of load_balancer_attribute_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    modify_load_balancer_attributes_input ->
    ( modify_load_balancer_attributes_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `AccessPointNotFoundException of access_point_not_found_exception
      | `InvalidConfigurationRequestException of invalid_configuration_request_exception
      | `LoadBalancerAttributeNotFoundException of load_balancer_attribute_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Modifies the attributes of the specified load balancer.\n\n\
  \ You can modify the load balancer attributes, such as [AccessLogs], [ConnectionDraining], and \
   [CrossZoneLoadBalancing] by either enabling or disabling them. Or, you can modify the load \
   balancer attribute [ConnectionSettings] by specifying an idle connection timeout value for your \
   load balancer.\n\
  \ \n\
  \  For more information, see the following in the {i Classic Load Balancers Guide}:\n\
  \  \n\
  \   {ul\n\
  \         {-   \
   {{:https://docs.aws.amazon.com/elasticloadbalancing/latest/classic/enable-disable-crosszone-lb.html}Cross-Zone \
   Load Balancing} \n\
  \             \n\
  \              }\n\
  \         {-   \
   {{:https://docs.aws.amazon.com/elasticloadbalancing/latest/classic/config-conn-drain.html}Connection \
   Draining} \n\
  \             \n\
  \              }\n\
  \         {-   \
   {{:https://docs.aws.amazon.com/elasticloadbalancing/latest/classic/access-log-collection.html}Access \
   Logs} \n\
  \             \n\
  \              }\n\
  \         {-   \
   {{:https://docs.aws.amazon.com/elasticloadbalancing/latest/classic/config-idle-timeout.html}Idle \
   Connection Timeout} \n\
  \             \n\
  \              }\n\
  \         }\n\
  \  "]

module RegisterInstancesWithLoadBalancer : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `AccessPointNotFoundException of access_point_not_found_exception
    | `InvalidEndPointException of invalid_end_point_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    register_end_points_input ->
    ( register_end_points_output,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `AccessPointNotFoundException of access_point_not_found_exception
      | `InvalidEndPointException of invalid_end_point_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    register_end_points_input ->
    ( register_end_points_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `AccessPointNotFoundException of access_point_not_found_exception
      | `InvalidEndPointException of invalid_end_point_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Adds the specified instances to the specified load balancer.\n\n\
  \ The instance must be a running instance in the same network as the load balancer (EC2-Classic \
   or the same VPC). If you have EC2-Classic instances and a load balancer in a VPC with \
   ClassicLink enabled, you can link the EC2-Classic instances to that VPC and then register the \
   linked EC2-Classic instances with the load balancer in the VPC.\n\
  \ \n\
  \  Note that [RegisterInstanceWithLoadBalancer] completes when the request has been registered. \
   Instance registration takes a little time to complete. To check the state of the registered \
   instances, use [DescribeLoadBalancers] or [DescribeInstanceHealth].\n\
  \  \n\
  \   After the instance is registered, it starts receiving traffic and requests from the load \
   balancer. Any instance that is not in one of the Availability Zones registered for the load \
   balancer is moved to the [OutOfService] state. If an Availability Zone is added to the load \
   balancer later, any instances registered with the load balancer move to the [InService] state.\n\
  \   \n\
  \    To deregister instances from a load balancer, use [DeregisterInstancesFromLoadBalancer].\n\
  \    \n\
  \     For more information, see \
   {{:https://docs.aws.amazon.com/elasticloadbalancing/latest/classic/elb-deregister-register-instances.html}Register \
   or De-Register EC2 Instances} in the {i Classic Load Balancers Guide}.\n\
  \     "]

module RemoveTags : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `AccessPointNotFoundException of access_point_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    remove_tags_input ->
    ( remove_tags_output,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `AccessPointNotFoundException of access_point_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    remove_tags_input ->
    ( remove_tags_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `AccessPointNotFoundException of access_point_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Removes one or more tags from the specified load balancer.\n"]

module SetLoadBalancerListenerSSLCertificate : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `AccessPointNotFoundException of access_point_not_found_exception
    | `CertificateNotFoundException of certificate_not_found_exception
    | `InvalidConfigurationRequestException of invalid_configuration_request_exception
    | `ListenerNotFoundException of listener_not_found_exception
    | `UnsupportedProtocolException of unsupported_protocol_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    set_load_balancer_listener_ssl_certificate_input ->
    ( set_load_balancer_listener_ssl_certificate_output,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `AccessPointNotFoundException of access_point_not_found_exception
      | `CertificateNotFoundException of certificate_not_found_exception
      | `InvalidConfigurationRequestException of invalid_configuration_request_exception
      | `ListenerNotFoundException of listener_not_found_exception
      | `UnsupportedProtocolException of unsupported_protocol_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    set_load_balancer_listener_ssl_certificate_input ->
    ( set_load_balancer_listener_ssl_certificate_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `AccessPointNotFoundException of access_point_not_found_exception
      | `CertificateNotFoundException of certificate_not_found_exception
      | `InvalidConfigurationRequestException of invalid_configuration_request_exception
      | `ListenerNotFoundException of listener_not_found_exception
      | `UnsupportedProtocolException of unsupported_protocol_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Sets the certificate that terminates the specified listener's SSL connections. The specified \
   certificate replaces any prior certificate that was used on the same load balancer and port.\n\n\
  \ For more information about updating your SSL certificate, see \
   {{:https://docs.aws.amazon.com/elasticloadbalancing/latest/classic/elb-update-ssl-cert.html}Replace \
   the SSL Certificate for Your Load Balancer} in the {i Classic Load Balancers Guide}.\n\
  \ "]

module SetLoadBalancerPoliciesForBackendServer : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `AccessPointNotFoundException of access_point_not_found_exception
    | `InvalidConfigurationRequestException of invalid_configuration_request_exception
    | `PolicyNotFoundException of policy_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    set_load_balancer_policies_for_backend_server_input ->
    ( set_load_balancer_policies_for_backend_server_output,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `AccessPointNotFoundException of access_point_not_found_exception
      | `InvalidConfigurationRequestException of invalid_configuration_request_exception
      | `PolicyNotFoundException of policy_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    set_load_balancer_policies_for_backend_server_input ->
    ( set_load_balancer_policies_for_backend_server_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `AccessPointNotFoundException of access_point_not_found_exception
      | `InvalidConfigurationRequestException of invalid_configuration_request_exception
      | `PolicyNotFoundException of policy_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Replaces the set of policies associated with the specified port on which the EC2 instance is \
   listening with a new set of policies. At this time, only the back-end server authentication \
   policy type can be applied to the instance ports; this policy type is composed of multiple \
   public key policies.\n\n\
  \ Each time you use [SetLoadBalancerPoliciesForBackendServer] to enable the policies, use the \
   [PolicyNames] parameter to list the policies that you want to enable.\n\
  \ \n\
  \  You can use [DescribeLoadBalancers] or [DescribeLoadBalancerPolicies] to verify that the \
   policy is associated with the EC2 instance.\n\
  \  \n\
  \   For more information about enabling back-end instance authentication, see \
   {{:https://docs.aws.amazon.com/elasticloadbalancing/latest/classic/elb-create-https-ssl-load-balancer.html#configure_backendauth_clt}Configure \
   Back-end Instance Authentication} in the {i Classic Load Balancers Guide}. For more information \
   about Proxy Protocol, see \
   {{:https://docs.aws.amazon.com/elasticloadbalancing/latest/classic/enable-proxy-protocol.html}Configure \
   Proxy Protocol Support} in the {i Classic Load Balancers Guide}.\n\
  \   "]

module SetLoadBalancerPoliciesOfListener : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `AccessPointNotFoundException of access_point_not_found_exception
    | `InvalidConfigurationRequestException of invalid_configuration_request_exception
    | `ListenerNotFoundException of listener_not_found_exception
    | `PolicyNotFoundException of policy_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    set_load_balancer_policies_of_listener_input ->
    ( set_load_balancer_policies_of_listener_output,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `AccessPointNotFoundException of access_point_not_found_exception
      | `InvalidConfigurationRequestException of invalid_configuration_request_exception
      | `ListenerNotFoundException of listener_not_found_exception
      | `PolicyNotFoundException of policy_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    set_load_balancer_policies_of_listener_input ->
    ( set_load_balancer_policies_of_listener_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `AccessPointNotFoundException of access_point_not_found_exception
      | `InvalidConfigurationRequestException of invalid_configuration_request_exception
      | `ListenerNotFoundException of listener_not_found_exception
      | `PolicyNotFoundException of policy_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Replaces the current set of policies for the specified load balancer port with the specified \
   set of policies.\n\n\
  \ To enable back-end server authentication, use [SetLoadBalancerPoliciesForBackendServer].\n\
  \ \n\
  \  For more information about setting policies, see \
   {{:https://docs.aws.amazon.com/elasticloadbalancing/latest/classic/ssl-config-update.html}Update \
   the SSL Negotiation Configuration}, \
   {{:https://docs.aws.amazon.com/elasticloadbalancing/latest/classic/elb-sticky-sessions.html#enable-sticky-sessions-duration}Duration-Based \
   Session Stickiness}, and \
   {{:https://docs.aws.amazon.com/elasticloadbalancing/latest/classic/elb-sticky-sessions.html#enable-sticky-sessions-application}Application-Controlled \
   Session Stickiness} in the {i Classic Load Balancers Guide}.\n\
  \  "]

module DisableAvailabilityZonesForLoadBalancer : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `AccessPointNotFoundException of access_point_not_found_exception
    | `InvalidConfigurationRequestException of invalid_configuration_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    remove_availability_zones_input ->
    ( remove_availability_zones_output,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `AccessPointNotFoundException of access_point_not_found_exception
      | `InvalidConfigurationRequestException of invalid_configuration_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    remove_availability_zones_input ->
    ( remove_availability_zones_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `AccessPointNotFoundException of access_point_not_found_exception
      | `InvalidConfigurationRequestException of invalid_configuration_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Removes the specified Availability Zones from the set of Availability Zones for the specified \
   load balancer in EC2-Classic or a default VPC.\n\n\
  \ For load balancers in a non-default VPC, use [DetachLoadBalancerFromSubnets].\n\
  \ \n\
  \  There must be at least one Availability Zone registered with a load balancer at all times. \
   After an Availability Zone is removed, all instances registered with the load balancer that are \
   in the removed Availability Zone go into the [OutOfService] state. Then, the load balancer \
   attempts to equally balance the traffic among its remaining Availability Zones.\n\
  \  \n\
  \   For more information, see \
   {{:https://docs.aws.amazon.com/elasticloadbalancing/latest/classic/enable-disable-az.html}Add \
   or Remove Availability Zones} in the {i Classic Load Balancers Guide}.\n\
  \   "]

module DetachLoadBalancerFromSubnets : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `AccessPointNotFoundException of access_point_not_found_exception
    | `InvalidConfigurationRequestException of invalid_configuration_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    detach_load_balancer_from_subnets_input ->
    ( detach_load_balancer_from_subnets_output,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `AccessPointNotFoundException of access_point_not_found_exception
      | `InvalidConfigurationRequestException of invalid_configuration_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    detach_load_balancer_from_subnets_input ->
    ( detach_load_balancer_from_subnets_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `AccessPointNotFoundException of access_point_not_found_exception
      | `InvalidConfigurationRequestException of invalid_configuration_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Removes the specified subnets from the set of configured subnets for the load balancer.\n\n\
  \ After a subnet is removed, all EC2 instances registered with the load balancer in the removed \
   subnet go into the [OutOfService] state. Then, the load balancer balances the traffic among the \
   remaining routable subnets.\n\
  \ "]

module DescribeTags : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `AccessPointNotFoundException of access_point_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_tags_input ->
    ( describe_tags_output,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `AccessPointNotFoundException of access_point_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_tags_input ->
    ( describe_tags_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `AccessPointNotFoundException of access_point_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Describes the tags associated with the specified load balancers.\n"]

module DescribeLoadBalancers : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `AccessPointNotFoundException of access_point_not_found_exception
    | `DependencyThrottleException of dependency_throttle_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_access_points_input ->
    ( describe_access_points_output,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `AccessPointNotFoundException of access_point_not_found_exception
      | `DependencyThrottleException of dependency_throttle_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_access_points_input ->
    ( describe_access_points_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `AccessPointNotFoundException of access_point_not_found_exception
      | `DependencyThrottleException of dependency_throttle_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Describes the specified the load balancers. If no load balancers are specified, the call \
   describes all of your load balancers.\n"]

module DescribeLoadBalancerPolicyTypes : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `PolicyTypeNotFoundException of policy_type_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_load_balancer_policy_types_input ->
    ( describe_load_balancer_policy_types_output,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `PolicyTypeNotFoundException of policy_type_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_load_balancer_policy_types_input ->
    ( describe_load_balancer_policy_types_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `PolicyTypeNotFoundException of policy_type_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Describes the specified load balancer policy types or all load balancer policy types.\n\n\
  \ The description of each type indicates how it can be used. For example, some policies can be \
   used only with layer 7 listeners, some policies can be used only with layer 4 listeners, and \
   some policies can be used only with your EC2 instances.\n\
  \ \n\
  \  You can use [CreateLoadBalancerPolicy] to create a policy configuration for any of these \
   policy types. Then, depending on the policy type, use either \
   [SetLoadBalancerPoliciesOfListener] or [SetLoadBalancerPoliciesForBackendServer] to set the \
   policy.\n\
  \  "]

module DescribeLoadBalancerPolicies : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `AccessPointNotFoundException of access_point_not_found_exception
    | `PolicyNotFoundException of policy_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_load_balancer_policies_input ->
    ( describe_load_balancer_policies_output,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `AccessPointNotFoundException of access_point_not_found_exception
      | `PolicyNotFoundException of policy_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_load_balancer_policies_input ->
    ( describe_load_balancer_policies_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `AccessPointNotFoundException of access_point_not_found_exception
      | `PolicyNotFoundException of policy_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Describes the specified policies.\n\n\
  \ If you specify a load balancer name, the action returns the descriptions of all policies \
   created for the load balancer. If you specify a policy name associated with your load balancer, \
   the action returns the description of that policy. If you don't specify a load balancer name, \
   the action returns descriptions of the specified sample policies, or descriptions of all sample \
   policies. The names of the sample policies have the [ELBSample-] prefix.\n\
  \ "]

module DescribeLoadBalancerAttributes : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `AccessPointNotFoundException of access_point_not_found_exception
    | `LoadBalancerAttributeNotFoundException of load_balancer_attribute_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_load_balancer_attributes_input ->
    ( describe_load_balancer_attributes_output,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `AccessPointNotFoundException of access_point_not_found_exception
      | `LoadBalancerAttributeNotFoundException of load_balancer_attribute_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_load_balancer_attributes_input ->
    ( describe_load_balancer_attributes_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `AccessPointNotFoundException of access_point_not_found_exception
      | `LoadBalancerAttributeNotFoundException of load_balancer_attribute_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Describes the attributes for the specified load balancer.\n"]

module DescribeInstanceHealth : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `AccessPointNotFoundException of access_point_not_found_exception
    | `InvalidEndPointException of invalid_end_point_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_end_point_state_input ->
    ( describe_end_point_state_output,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `AccessPointNotFoundException of access_point_not_found_exception
      | `InvalidEndPointException of invalid_end_point_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_end_point_state_input ->
    ( describe_end_point_state_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `AccessPointNotFoundException of access_point_not_found_exception
      | `InvalidEndPointException of invalid_end_point_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Describes the state of the specified instances with respect to the specified load balancer. If \
   no instances are specified, the call describes the state of all instances that are currently \
   registered with the load balancer. If instances are specified, their state is returned even if \
   they are no longer registered with the load balancer. The state of terminated instances is not \
   returned.\n"]

module DescribeAccountLimits : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsQuery.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    describe_account_limits_input ->
    (describe_account_limits_output, [> Smaws_Lib.Protocols.AwsQuery.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    describe_account_limits_input ->
    ( describe_account_limits_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Describes the current Elastic Load Balancing resource limits for your AWS account.\n\n\
  \ For more information, see \
   {{:https://docs.aws.amazon.com/elasticloadbalancing/latest/classic/elb-limits.html}Limits for \
   Your Classic Load Balancer} in the {i Classic Load Balancers Guide}.\n\
  \ "]

module DeregisterInstancesFromLoadBalancer : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `AccessPointNotFoundException of access_point_not_found_exception
    | `InvalidEndPointException of invalid_end_point_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    deregister_end_points_input ->
    ( deregister_end_points_output,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `AccessPointNotFoundException of access_point_not_found_exception
      | `InvalidEndPointException of invalid_end_point_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    deregister_end_points_input ->
    ( deregister_end_points_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `AccessPointNotFoundException of access_point_not_found_exception
      | `InvalidEndPointException of invalid_end_point_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deregisters the specified instances from the specified load balancer. After the instance is \
   deregistered, it no longer receives traffic from the load balancer.\n\n\
  \ You can use [DescribeLoadBalancers] to verify that the instance is deregistered from the load \
   balancer.\n\
  \ \n\
  \  For more information, see \
   {{:https://docs.aws.amazon.com/elasticloadbalancing/latest/classic/elb-deregister-register-instances.html}Register \
   or De-Register EC2 Instances} in the {i Classic Load Balancers Guide}.\n\
  \  "]

module DeleteLoadBalancerPolicy : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `AccessPointNotFoundException of access_point_not_found_exception
    | `InvalidConfigurationRequestException of invalid_configuration_request_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_load_balancer_policy_input ->
    ( delete_load_balancer_policy_output,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `AccessPointNotFoundException of access_point_not_found_exception
      | `InvalidConfigurationRequestException of invalid_configuration_request_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_load_balancer_policy_input ->
    ( delete_load_balancer_policy_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `AccessPointNotFoundException of access_point_not_found_exception
      | `InvalidConfigurationRequestException of invalid_configuration_request_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes the specified policy from the specified load balancer. This policy must not be enabled \
   for any listeners.\n"]

module DeleteLoadBalancerListeners : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `AccessPointNotFoundException of access_point_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_load_balancer_listener_input ->
    ( delete_load_balancer_listener_output,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `AccessPointNotFoundException of access_point_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_load_balancer_listener_input ->
    ( delete_load_balancer_listener_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `AccessPointNotFoundException of access_point_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc "Deletes the specified listeners from the specified load balancer.\n"]

module DeleteLoadBalancer : sig
  val error_to_string : [ | Smaws_Lib.Protocols.AwsQuery.error ] -> string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_access_point_input ->
    (delete_access_point_output, [> Smaws_Lib.Protocols.AwsQuery.error ]) result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_access_point_input ->
    ( delete_access_point_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error ] * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes the specified load balancer.\n\n\
  \ If you are attempting to recreate a load balancer, you must reconfigure all settings. The DNS \
   name associated with a deleted load balancer are no longer usable. The name and associated DNS \
   record of the deleted load balancer no longer exist and traffic sent to any of its IP addresses \
   is no longer delivered to your instances.\n\
  \ \n\
  \  If the load balancer does not exist or has already been deleted, the call to \
   [DeleteLoadBalancer] still succeeds.\n\
  \  "]

module CreateLoadBalancerPolicy : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `AccessPointNotFoundException of access_point_not_found_exception
    | `DuplicatePolicyNameException of duplicate_policy_name_exception
    | `InvalidConfigurationRequestException of invalid_configuration_request_exception
    | `PolicyTypeNotFoundException of policy_type_not_found_exception
    | `TooManyPoliciesException of too_many_policies_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_load_balancer_policy_input ->
    ( create_load_balancer_policy_output,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `AccessPointNotFoundException of access_point_not_found_exception
      | `DuplicatePolicyNameException of duplicate_policy_name_exception
      | `InvalidConfigurationRequestException of invalid_configuration_request_exception
      | `PolicyTypeNotFoundException of policy_type_not_found_exception
      | `TooManyPoliciesException of too_many_policies_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_load_balancer_policy_input ->
    ( create_load_balancer_policy_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `AccessPointNotFoundException of access_point_not_found_exception
      | `DuplicatePolicyNameException of duplicate_policy_name_exception
      | `InvalidConfigurationRequestException of invalid_configuration_request_exception
      | `PolicyTypeNotFoundException of policy_type_not_found_exception
      | `TooManyPoliciesException of too_many_policies_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a policy with the specified attributes for the specified load balancer.\n\n\
  \ Policies are settings that are saved for your load balancer and that can be applied to the \
   listener or the application server, depending on the policy type.\n\
  \ "]

module CreateLoadBalancerListeners : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `AccessPointNotFoundException of access_point_not_found_exception
    | `CertificateNotFoundException of certificate_not_found_exception
    | `DuplicateListenerException of duplicate_listener_exception
    | `InvalidConfigurationRequestException of invalid_configuration_request_exception
    | `UnsupportedProtocolException of unsupported_protocol_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_load_balancer_listener_input ->
    ( create_load_balancer_listener_output,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `AccessPointNotFoundException of access_point_not_found_exception
      | `CertificateNotFoundException of certificate_not_found_exception
      | `DuplicateListenerException of duplicate_listener_exception
      | `InvalidConfigurationRequestException of invalid_configuration_request_exception
      | `UnsupportedProtocolException of unsupported_protocol_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_load_balancer_listener_input ->
    ( create_load_balancer_listener_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `AccessPointNotFoundException of access_point_not_found_exception
      | `CertificateNotFoundException of certificate_not_found_exception
      | `DuplicateListenerException of duplicate_listener_exception
      | `InvalidConfigurationRequestException of invalid_configuration_request_exception
      | `UnsupportedProtocolException of unsupported_protocol_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates one or more listeners for the specified load balancer. If a listener with the specified \
   port does not already exist, it is created; otherwise, the properties of the new listener must \
   match the properties of the existing listener.\n\n\
  \ For more information, see \
   {{:https://docs.aws.amazon.com/elasticloadbalancing/latest/classic/elb-listener-config.html}Listeners \
   for Your Classic Load Balancer} in the {i Classic Load Balancers Guide}.\n\
  \ "]

module CreateLoadBalancer : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `CertificateNotFoundException of certificate_not_found_exception
    | `DuplicateAccessPointNameException of duplicate_access_point_name_exception
    | `DuplicateTagKeysException of duplicate_tag_keys_exception
    | `InvalidConfigurationRequestException of invalid_configuration_request_exception
    | `InvalidSchemeException of invalid_scheme_exception
    | `InvalidSecurityGroupException of invalid_security_group_exception
    | `InvalidSubnetException of invalid_subnet_exception
    | `OperationNotPermittedException of operation_not_permitted_exception
    | `SubnetNotFoundException of subnet_not_found_exception
    | `TooManyAccessPointsException of too_many_access_points_exception
    | `TooManyTagsException of too_many_tags_exception
    | `UnsupportedProtocolException of unsupported_protocol_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_access_point_input ->
    ( create_access_point_output,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `CertificateNotFoundException of certificate_not_found_exception
      | `DuplicateAccessPointNameException of duplicate_access_point_name_exception
      | `DuplicateTagKeysException of duplicate_tag_keys_exception
      | `InvalidConfigurationRequestException of invalid_configuration_request_exception
      | `InvalidSchemeException of invalid_scheme_exception
      | `InvalidSecurityGroupException of invalid_security_group_exception
      | `InvalidSubnetException of invalid_subnet_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `SubnetNotFoundException of subnet_not_found_exception
      | `TooManyAccessPointsException of too_many_access_points_exception
      | `TooManyTagsException of too_many_tags_exception
      | `UnsupportedProtocolException of unsupported_protocol_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_access_point_input ->
    ( create_access_point_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `CertificateNotFoundException of certificate_not_found_exception
      | `DuplicateAccessPointNameException of duplicate_access_point_name_exception
      | `DuplicateTagKeysException of duplicate_tag_keys_exception
      | `InvalidConfigurationRequestException of invalid_configuration_request_exception
      | `InvalidSchemeException of invalid_scheme_exception
      | `InvalidSecurityGroupException of invalid_security_group_exception
      | `InvalidSubnetException of invalid_subnet_exception
      | `OperationNotPermittedException of operation_not_permitted_exception
      | `SubnetNotFoundException of subnet_not_found_exception
      | `TooManyAccessPointsException of too_many_access_points_exception
      | `TooManyTagsException of too_many_tags_exception
      | `UnsupportedProtocolException of unsupported_protocol_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a Classic Load Balancer.\n\n\
  \ You can add listeners, security groups, subnets, and tags when you create your load balancer, \
   or you can add them later using [CreateLoadBalancerListeners], \
   [ApplySecurityGroupsToLoadBalancer], [AttachLoadBalancerToSubnets], and [AddTags].\n\
  \ \n\
  \  To describe your current load balancers, see [DescribeLoadBalancers]. When you are finished \
   with a load balancer, you can delete it using [DeleteLoadBalancer].\n\
  \  \n\
  \   You can create up to 20 load balancers per region per account. You can request an increase \
   for the number of load balancers for your account. For more information, see \
   {{:https://docs.aws.amazon.com/elasticloadbalancing/latest/classic/elb-limits.html}Limits for \
   Your Classic Load Balancer} in the {i Classic Load Balancers Guide}.\n\
  \   "]

module CreateLBCookieStickinessPolicy : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `AccessPointNotFoundException of access_point_not_found_exception
    | `DuplicatePolicyNameException of duplicate_policy_name_exception
    | `InvalidConfigurationRequestException of invalid_configuration_request_exception
    | `TooManyPoliciesException of too_many_policies_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_lb_cookie_stickiness_policy_input ->
    ( create_lb_cookie_stickiness_policy_output,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `AccessPointNotFoundException of access_point_not_found_exception
      | `DuplicatePolicyNameException of duplicate_policy_name_exception
      | `InvalidConfigurationRequestException of invalid_configuration_request_exception
      | `TooManyPoliciesException of too_many_policies_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_lb_cookie_stickiness_policy_input ->
    ( create_lb_cookie_stickiness_policy_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `AccessPointNotFoundException of access_point_not_found_exception
      | `DuplicatePolicyNameException of duplicate_policy_name_exception
      | `InvalidConfigurationRequestException of invalid_configuration_request_exception
      | `TooManyPoliciesException of too_many_policies_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Generates a stickiness policy with sticky session lifetimes controlled by the lifetime of the \
   browser (user-agent) or a specified expiration period. This policy can be associated only with \
   HTTP/HTTPS listeners.\n\n\
  \ When a load balancer implements this policy, the load balancer uses a special cookie to track \
   the instance for each request. When the load balancer receives a request, it first checks to \
   see if this cookie is present in the request. If so, the load balancer sends the request to the \
   application server specified in the cookie. If not, the load balancer sends the request to a \
   server that is chosen based on the existing load-balancing algorithm.\n\
  \ \n\
  \  A cookie is inserted into the response for binding subsequent requests from the same user to \
   that server. The validity of the cookie is based on the cookie expiration time, which is \
   specified in the policy configuration.\n\
  \  \n\
  \   For more information, see \
   {{:https://docs.aws.amazon.com/elasticloadbalancing/latest/classic/elb-sticky-sessions.html#enable-sticky-sessions-duration}Duration-Based \
   Session Stickiness} in the {i Classic Load Balancers Guide}.\n\
  \   "]

module CreateAppCookieStickinessPolicy : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `AccessPointNotFoundException of access_point_not_found_exception
    | `DuplicatePolicyNameException of duplicate_policy_name_exception
    | `InvalidConfigurationRequestException of invalid_configuration_request_exception
    | `TooManyPoliciesException of too_many_policies_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_app_cookie_stickiness_policy_input ->
    ( create_app_cookie_stickiness_policy_output,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `AccessPointNotFoundException of access_point_not_found_exception
      | `DuplicatePolicyNameException of duplicate_policy_name_exception
      | `InvalidConfigurationRequestException of invalid_configuration_request_exception
      | `TooManyPoliciesException of too_many_policies_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_app_cookie_stickiness_policy_input ->
    ( create_app_cookie_stickiness_policy_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `AccessPointNotFoundException of access_point_not_found_exception
      | `DuplicatePolicyNameException of duplicate_policy_name_exception
      | `InvalidConfigurationRequestException of invalid_configuration_request_exception
      | `TooManyPoliciesException of too_many_policies_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Generates a stickiness policy with sticky session lifetimes that follow that of an \
   application-generated cookie. This policy can be associated only with HTTP/HTTPS listeners.\n\n\
  \ This policy is similar to the policy created by [CreateLBCookieStickinessPolicy], except that \
   the lifetime of the special Elastic Load Balancing cookie, [AWSELB], follows the lifetime of \
   the application-generated cookie specified in the policy configuration. The load balancer only \
   inserts a new stickiness cookie when the application response includes a new application cookie.\n\
  \ \n\
  \  If the application cookie is explicitly removed or expires, the session stops being sticky \
   until a new application cookie is issued.\n\
  \  \n\
  \   For more information, see \
   {{:https://docs.aws.amazon.com/elasticloadbalancing/latest/classic/elb-sticky-sessions.html#enable-sticky-sessions-application}Application-Controlled \
   Session Stickiness} in the {i Classic Load Balancers Guide}.\n\
  \   "]

module ConfigureHealthCheck : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `AccessPointNotFoundException of access_point_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    configure_health_check_input ->
    ( configure_health_check_output,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `AccessPointNotFoundException of access_point_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    configure_health_check_input ->
    ( configure_health_check_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `AccessPointNotFoundException of access_point_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Specifies the health check settings to use when evaluating the health state of your EC2 \
   instances.\n\n\
  \ For more information, see \
   {{:https://docs.aws.amazon.com/elasticloadbalancing/latest/classic/elb-healthchecks.html}Configure \
   Health Checks for Your Load Balancer} in the {i Classic Load Balancers Guide}.\n\
  \ "]

module AttachLoadBalancerToSubnets : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `AccessPointNotFoundException of access_point_not_found_exception
    | `InvalidConfigurationRequestException of invalid_configuration_request_exception
    | `InvalidSubnetException of invalid_subnet_exception
    | `SubnetNotFoundException of subnet_not_found_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    attach_load_balancer_to_subnets_input ->
    ( attach_load_balancer_to_subnets_output,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `AccessPointNotFoundException of access_point_not_found_exception
      | `InvalidConfigurationRequestException of invalid_configuration_request_exception
      | `InvalidSubnetException of invalid_subnet_exception
      | `SubnetNotFoundException of subnet_not_found_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    attach_load_balancer_to_subnets_input ->
    ( attach_load_balancer_to_subnets_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `AccessPointNotFoundException of access_point_not_found_exception
      | `InvalidConfigurationRequestException of invalid_configuration_request_exception
      | `InvalidSubnetException of invalid_subnet_exception
      | `SubnetNotFoundException of subnet_not_found_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Adds one or more subnets to the set of configured subnets for the specified load balancer.\n\n\
  \ The load balancer evenly distributes requests across all registered subnets. For more \
   information, see \
   {{:https://docs.aws.amazon.com/elasticloadbalancing/latest/classic/elb-manage-subnets.html}Add \
   or Remove Subnets for Your Load Balancer in a VPC} in the {i Classic Load Balancers Guide}.\n\
  \ "]

module ApplySecurityGroupsToLoadBalancer : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `AccessPointNotFoundException of access_point_not_found_exception
    | `InvalidConfigurationRequestException of invalid_configuration_request_exception
    | `InvalidSecurityGroupException of invalid_security_group_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    apply_security_groups_to_load_balancer_input ->
    ( apply_security_groups_to_load_balancer_output,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `AccessPointNotFoundException of access_point_not_found_exception
      | `InvalidConfigurationRequestException of invalid_configuration_request_exception
      | `InvalidSecurityGroupException of invalid_security_group_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    apply_security_groups_to_load_balancer_input ->
    ( apply_security_groups_to_load_balancer_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `AccessPointNotFoundException of access_point_not_found_exception
      | `InvalidConfigurationRequestException of invalid_configuration_request_exception
      | `InvalidSecurityGroupException of invalid_security_group_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Associates one or more security groups with your load balancer in a virtual private cloud \
   (VPC). The specified security groups override the previously associated security groups.\n\n\
  \ For more information, see \
   {{:https://docs.aws.amazon.com/elasticloadbalancing/latest/classic/elb-security-groups.html#elb-vpc-security-groups}Security \
   Groups for Load Balancers in a VPC} in the {i Classic Load Balancers Guide}.\n\
  \ "]

(** {1:Serialization and Deserialization} *)
module AddTags : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsQuery.error
    | `AccessPointNotFoundException of access_point_not_found_exception
    | `DuplicateTagKeysException of duplicate_tag_keys_exception
    | `TooManyTagsException of too_many_tags_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    add_tags_input ->
    ( add_tags_output,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `AccessPointNotFoundException of access_point_not_found_exception
      | `DuplicateTagKeysException of duplicate_tag_keys_exception
      | `TooManyTagsException of too_many_tags_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    add_tags_input ->
    ( add_tags_output Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsQuery.error
      | `AccessPointNotFoundException of access_point_not_found_exception
      | `DuplicateTagKeysException of duplicate_tag_keys_exception
      | `TooManyTagsException of too_many_tags_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Adds the specified tags to the specified load balancer. Each load balancer can have a maximum \
   of 10 tags.\n\n\
  \ Each tag consists of a key and an optional value. If a tag with the same key is already \
   associated with the load balancer, [AddTags] updates its value.\n\
  \ \n\
  \  For more information, see \
   {{:https://docs.aws.amazon.com/elasticloadbalancing/latest/classic/add-remove-tags.html}Tag \
   Your Classic Load Balancer} in the {i Classic Load Balancers Guide}.\n\
  \  "]

module Query_serializers = Query_serializers
module Query_deserializers = Query_deserializers
