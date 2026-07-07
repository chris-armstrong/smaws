open Types

let vpc_id_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v
let error_description_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let unsupported_protocol_exception_to_query path (x : unsupported_protocol_exception) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> error_description_to_query (List.append path [ "Message" ]) v);
    ]

let unhealthy_threshold_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.int_field path v

let too_many_tags_exception_to_query path (x : too_many_tags_exception) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> error_description_to_query (List.append path [ "Message" ]) v);
    ]

let too_many_policies_exception_to_query path (x : too_many_policies_exception) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> error_description_to_query (List.append path [ "Message" ]) v);
    ]

let too_many_access_points_exception_to_query path (x : too_many_access_points_exception) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> error_description_to_query (List.append path [ "Message" ]) v);
    ]

let tag_value_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v
let tag_key_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let tag_to_query path (x : tag) =
  List.concat
    [
      (match x.value with
      | None -> []
      | Some v -> tag_value_to_query (List.append path [ "Value" ]) v);
      tag_key_to_query (List.append path [ "Key" ]) x.key;
    ]

let tag_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" tag_to_query path xs

let tag_key_only_to_query path (x : tag_key_only) =
  List.concat
    [ (match x.key with None -> [] | Some v -> tag_key_to_query (List.append path [ "Key" ]) v) ]

let tag_key_list_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" tag_key_only_to_query path xs

let access_point_name_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let tag_description_to_query path (x : tag_description) =
  List.concat
    [
      (match x.tags with None -> [] | Some v -> tag_list_to_query (List.append path [ "Tags" ]) v);
      (match x.load_balancer_name with
      | None -> []
      | Some v -> access_point_name_to_query (List.append path [ "LoadBalancerName" ]) v);
    ]

let tag_descriptions_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" tag_description_to_query path xs

let subnet_id_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let subnets_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" subnet_id_to_query path xs

let subnet_not_found_exception_to_query path (x : subnet_not_found_exception) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> error_description_to_query (List.append path [ "Message" ]) v);
    ]

let state_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let security_group_owner_alias_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let security_group_name_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let source_security_group_to_query path (x : source_security_group) =
  List.concat
    [
      (match x.group_name with
      | None -> []
      | Some v -> security_group_name_to_query (List.append path [ "GroupName" ]) v);
      (match x.owner_alias with
      | None -> []
      | Some v -> security_group_owner_alias_to_query (List.append path [ "OwnerAlias" ]) v);
    ]

let set_load_balancer_policies_of_listener_output_to_query path _x = []
let access_point_port_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.int_field path v
let policy_name_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let policy_names_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" policy_name_to_query path xs

let set_load_balancer_policies_of_listener_input_to_query path
    (x : set_load_balancer_policies_of_listener_input) =
  List.concat
    [
      policy_names_to_query (List.append path [ "PolicyNames" ]) x.policy_names;
      access_point_port_to_query (List.append path [ "LoadBalancerPort" ]) x.load_balancer_port;
      access_point_name_to_query (List.append path [ "LoadBalancerName" ]) x.load_balancer_name;
    ]

let policy_not_found_exception_to_query path (x : policy_not_found_exception) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> error_description_to_query (List.append path [ "Message" ]) v);
    ]

let listener_not_found_exception_to_query path (x : listener_not_found_exception) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> error_description_to_query (List.append path [ "Message" ]) v);
    ]

let invalid_configuration_request_exception_to_query path
    (x : invalid_configuration_request_exception) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> error_description_to_query (List.append path [ "Message" ]) v);
    ]

let access_point_not_found_exception_to_query path (x : access_point_not_found_exception) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> error_description_to_query (List.append path [ "Message" ]) v);
    ]

let set_load_balancer_policies_for_backend_server_output_to_query path _x = []
let end_point_port_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.int_field path v

let set_load_balancer_policies_for_backend_server_input_to_query path
    (x : set_load_balancer_policies_for_backend_server_input) =
  List.concat
    [
      policy_names_to_query (List.append path [ "PolicyNames" ]) x.policy_names;
      end_point_port_to_query (List.append path [ "InstancePort" ]) x.instance_port;
      access_point_name_to_query (List.append path [ "LoadBalancerName" ]) x.load_balancer_name;
    ]

let set_load_balancer_listener_ssl_certificate_output_to_query path _x = []
let ssl_certificate_id_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let set_load_balancer_listener_ssl_certificate_input_to_query path
    (x : set_load_balancer_listener_ssl_certificate_input) =
  List.concat
    [
      ssl_certificate_id_to_query (List.append path [ "SSLCertificateId" ]) x.ssl_certificate_id;
      access_point_port_to_query (List.append path [ "LoadBalancerPort" ]) x.load_balancer_port;
      access_point_name_to_query (List.append path [ "LoadBalancerName" ]) x.load_balancer_name;
    ]

let certificate_not_found_exception_to_query path (x : certificate_not_found_exception) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> error_description_to_query (List.append path [ "Message" ]) v);
    ]

let security_group_id_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let security_groups_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" security_group_id_to_query path xs

let s3_bucket_name_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v
let remove_tags_output_to_query path _x = []

let load_balancer_names_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" access_point_name_to_query path xs

let remove_tags_input_to_query path (x : remove_tags_input) =
  List.concat
    [
      tag_key_list_to_query (List.append path [ "Tags" ]) x.tags;
      load_balancer_names_to_query (List.append path [ "LoadBalancerNames" ]) x.load_balancer_names;
    ]

let availability_zone_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let availability_zones_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" availability_zone_to_query path xs

let remove_availability_zones_output_to_query path (x : remove_availability_zones_output) =
  List.concat
    [
      (match x.availability_zones with
      | None -> []
      | Some v -> availability_zones_to_query (List.append path [ "AvailabilityZones" ]) v);
    ]

let remove_availability_zones_input_to_query path (x : remove_availability_zones_input) =
  List.concat
    [
      availability_zones_to_query (List.append path [ "AvailabilityZones" ]) x.availability_zones;
      access_point_name_to_query (List.append path [ "LoadBalancerName" ]) x.load_balancer_name;
    ]

let invalid_end_point_exception_to_query path (x : invalid_end_point_exception) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> error_description_to_query (List.append path [ "Message" ]) v);
    ]

let instance_id_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let instance_to_query path (x : instance) =
  List.concat
    [
      (match x.instance_id with
      | None -> []
      | Some v -> instance_id_to_query (List.append path [ "InstanceId" ]) v);
    ]

let instances_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" instance_to_query path xs

let register_end_points_output_to_query path (x : register_end_points_output) =
  List.concat
    [
      (match x.instances with
      | None -> []
      | Some v -> instances_to_query (List.append path [ "Instances" ]) v);
    ]

let register_end_points_input_to_query path (x : register_end_points_input) =
  List.concat
    [
      instances_to_query (List.append path [ "Instances" ]) x.instances;
      access_point_name_to_query (List.append path [ "LoadBalancerName" ]) x.load_balancer_name;
    ]

let reason_code_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v
let protocol_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let ports_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" access_point_port_to_query path xs

let policy_type_not_found_exception_to_query path (x : policy_type_not_found_exception) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> error_description_to_query (List.append path [ "Message" ]) v);
    ]

let policy_type_name_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let policy_type_names_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" policy_type_name_to_query path xs

let description_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v
let attribute_name_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v
let attribute_type_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v
let default_value_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v
let cardinality_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let policy_attribute_type_description_to_query path (x : policy_attribute_type_description) =
  List.concat
    [
      (match x.cardinality with
      | None -> []
      | Some v -> cardinality_to_query (List.append path [ "Cardinality" ]) v);
      (match x.default_value with
      | None -> []
      | Some v -> default_value_to_query (List.append path [ "DefaultValue" ]) v);
      (match x.description with
      | None -> []
      | Some v -> description_to_query (List.append path [ "Description" ]) v);
      (match x.attribute_type with
      | None -> []
      | Some v -> attribute_type_to_query (List.append path [ "AttributeType" ]) v);
      (match x.attribute_name with
      | None -> []
      | Some v -> attribute_name_to_query (List.append path [ "AttributeName" ]) v);
    ]

let policy_attribute_type_descriptions_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member"
    policy_attribute_type_description_to_query path xs

let policy_type_description_to_query path (x : policy_type_description) =
  List.concat
    [
      (match x.policy_attribute_type_descriptions with
      | None -> []
      | Some v ->
          policy_attribute_type_descriptions_to_query
            (List.append path [ "PolicyAttributeTypeDescriptions" ])
            v);
      (match x.description with
      | None -> []
      | Some v -> description_to_query (List.append path [ "Description" ]) v);
      (match x.policy_type_name with
      | None -> []
      | Some v -> policy_type_name_to_query (List.append path [ "PolicyTypeName" ]) v);
    ]

let policy_type_descriptions_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" policy_type_description_to_query
    path xs

let attribute_value_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let policy_attribute_description_to_query path (x : policy_attribute_description) =
  List.concat
    [
      (match x.attribute_value with
      | None -> []
      | Some v -> attribute_value_to_query (List.append path [ "AttributeValue" ]) v);
      (match x.attribute_name with
      | None -> []
      | Some v -> attribute_name_to_query (List.append path [ "AttributeName" ]) v);
    ]

let policy_attribute_descriptions_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member"
    policy_attribute_description_to_query path xs

let policy_description_to_query path (x : policy_description) =
  List.concat
    [
      (match x.policy_attribute_descriptions with
      | None -> []
      | Some v ->
          policy_attribute_descriptions_to_query
            (List.append path [ "PolicyAttributeDescriptions" ])
            v);
      (match x.policy_type_name with
      | None -> []
      | Some v -> policy_type_name_to_query (List.append path [ "PolicyTypeName" ]) v);
      (match x.policy_name with
      | None -> []
      | Some v -> policy_name_to_query (List.append path [ "PolicyName" ]) v);
    ]

let policy_descriptions_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" policy_description_to_query path xs

let policy_attribute_to_query path (x : policy_attribute) =
  List.concat
    [
      (match x.attribute_value with
      | None -> []
      | Some v -> attribute_value_to_query (List.append path [ "AttributeValue" ]) v);
      (match x.attribute_name with
      | None -> []
      | Some v -> attribute_name_to_query (List.append path [ "AttributeName" ]) v);
    ]

let policy_attributes_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" policy_attribute_to_query path xs

let cookie_name_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let app_cookie_stickiness_policy_to_query path (x : app_cookie_stickiness_policy) =
  List.concat
    [
      (match x.cookie_name with
      | None -> []
      | Some v -> cookie_name_to_query (List.append path [ "CookieName" ]) v);
      (match x.policy_name with
      | None -> []
      | Some v -> policy_name_to_query (List.append path [ "PolicyName" ]) v);
    ]

let app_cookie_stickiness_policies_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member"
    app_cookie_stickiness_policy_to_query path xs

let cookie_expiration_period_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.long_field path v

let lb_cookie_stickiness_policy_to_query path (x : lb_cookie_stickiness_policy) =
  List.concat
    [
      (match x.cookie_expiration_period with
      | None -> []
      | Some v ->
          cookie_expiration_period_to_query (List.append path [ "CookieExpirationPeriod" ]) v);
      (match x.policy_name with
      | None -> []
      | Some v -> policy_name_to_query (List.append path [ "PolicyName" ]) v);
    ]

let lb_cookie_stickiness_policies_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" lb_cookie_stickiness_policy_to_query
    path xs

let policies_to_query path (x : policies) =
  List.concat
    [
      (match x.other_policies with
      | None -> []
      | Some v -> policy_names_to_query (List.append path [ "OtherPolicies" ]) v);
      (match x.lb_cookie_stickiness_policies with
      | None -> []
      | Some v ->
          lb_cookie_stickiness_policies_to_query
            (List.append path [ "LBCookieStickinessPolicies" ])
            v);
      (match x.app_cookie_stickiness_policies with
      | None -> []
      | Some v ->
          app_cookie_stickiness_policies_to_query
            (List.append path [ "AppCookieStickinessPolicies" ])
            v);
    ]

let page_size_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.int_field path v

let operation_not_permitted_exception_to_query path (x : operation_not_permitted_exception) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> error_description_to_query (List.append path [ "Message" ]) v);
    ]

let name_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let cross_zone_load_balancing_enabled_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.bool_field path v

let cross_zone_load_balancing_to_query path (x : cross_zone_load_balancing) =
  List.concat
    [ cross_zone_load_balancing_enabled_to_query (List.append path [ "Enabled" ]) x.enabled ]

let access_log_enabled_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.bool_field path v
let access_log_interval_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.int_field path v
let access_log_prefix_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let access_log_to_query path (x : access_log) =
  List.concat
    [
      (match x.s3_bucket_prefix with
      | None -> []
      | Some v -> access_log_prefix_to_query (List.append path [ "S3BucketPrefix" ]) v);
      (match x.emit_interval with
      | None -> []
      | Some v -> access_log_interval_to_query (List.append path [ "EmitInterval" ]) v);
      (match x.s3_bucket_name with
      | None -> []
      | Some v -> s3_bucket_name_to_query (List.append path [ "S3BucketName" ]) v);
      access_log_enabled_to_query (List.append path [ "Enabled" ]) x.enabled;
    ]

let connection_draining_enabled_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.bool_field path v

let connection_draining_timeout_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.int_field path v

let connection_draining_to_query path (x : connection_draining) =
  List.concat
    [
      (match x.timeout with
      | None -> []
      | Some v -> connection_draining_timeout_to_query (List.append path [ "Timeout" ]) v);
      connection_draining_enabled_to_query (List.append path [ "Enabled" ]) x.enabled;
    ]

let idle_timeout_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.int_field path v

let connection_settings_to_query path (x : connection_settings) =
  List.concat [ idle_timeout_to_query (List.append path [ "IdleTimeout" ]) x.idle_timeout ]

let additional_attribute_key_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let additional_attribute_value_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let additional_attribute_to_query path (x : additional_attribute) =
  List.concat
    [
      (match x.value with
      | None -> []
      | Some v -> additional_attribute_value_to_query (List.append path [ "Value" ]) v);
      (match x.key with
      | None -> []
      | Some v -> additional_attribute_key_to_query (List.append path [ "Key" ]) v);
    ]

let additional_attributes_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" additional_attribute_to_query path
    xs

let load_balancer_attributes_to_query path (x : load_balancer_attributes) =
  List.concat
    [
      (match x.additional_attributes with
      | None -> []
      | Some v -> additional_attributes_to_query (List.append path [ "AdditionalAttributes" ]) v);
      (match x.connection_settings with
      | None -> []
      | Some v -> connection_settings_to_query (List.append path [ "ConnectionSettings" ]) v);
      (match x.connection_draining with
      | None -> []
      | Some v -> connection_draining_to_query (List.append path [ "ConnectionDraining" ]) v);
      (match x.access_log with
      | None -> []
      | Some v -> access_log_to_query (List.append path [ "AccessLog" ]) v);
      (match x.cross_zone_load_balancing with
      | None -> []
      | Some v ->
          cross_zone_load_balancing_to_query (List.append path [ "CrossZoneLoadBalancing" ]) v);
    ]

let modify_load_balancer_attributes_output_to_query path
    (x : modify_load_balancer_attributes_output) =
  List.concat
    [
      (match x.load_balancer_attributes with
      | None -> []
      | Some v ->
          load_balancer_attributes_to_query (List.append path [ "LoadBalancerAttributes" ]) v);
      (match x.load_balancer_name with
      | None -> []
      | Some v -> access_point_name_to_query (List.append path [ "LoadBalancerName" ]) v);
    ]

let modify_load_balancer_attributes_input_to_query path (x : modify_load_balancer_attributes_input)
    =
  List.concat
    [
      load_balancer_attributes_to_query
        (List.append path [ "LoadBalancerAttributes" ])
        x.load_balancer_attributes;
      access_point_name_to_query (List.append path [ "LoadBalancerName" ]) x.load_balancer_name;
    ]

let load_balancer_attribute_not_found_exception_to_query path
    (x : load_balancer_attribute_not_found_exception) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> error_description_to_query (List.append path [ "Message" ]) v);
    ]

let max_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v
let marker_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let load_balancer_scheme_to_query path v =
  Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v

let load_balancer_names_max20_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" access_point_name_to_query path xs

let dns_name_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v
let instance_port_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.int_field path v

let listener_to_query path (x : listener) =
  List.concat
    [
      (match x.ssl_certificate_id with
      | None -> []
      | Some v -> ssl_certificate_id_to_query (List.append path [ "SSLCertificateId" ]) v);
      instance_port_to_query (List.append path [ "InstancePort" ]) x.instance_port;
      (match x.instance_protocol with
      | None -> []
      | Some v -> protocol_to_query (List.append path [ "InstanceProtocol" ]) v);
      access_point_port_to_query (List.append path [ "LoadBalancerPort" ]) x.load_balancer_port;
      protocol_to_query (List.append path [ "Protocol" ]) x.protocol;
    ]

let listener_description_to_query path (x : listener_description) =
  List.concat
    [
      (match x.policy_names with
      | None -> []
      | Some v -> policy_names_to_query (List.append path [ "PolicyNames" ]) v);
      (match x.listener with
      | None -> []
      | Some v -> listener_to_query (List.append path [ "Listener" ]) v);
    ]

let listener_descriptions_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" listener_description_to_query path
    xs

let backend_server_description_to_query path (x : backend_server_description) =
  List.concat
    [
      (match x.policy_names with
      | None -> []
      | Some v -> policy_names_to_query (List.append path [ "PolicyNames" ]) v);
      (match x.instance_port with
      | None -> []
      | Some v -> instance_port_to_query (List.append path [ "InstancePort" ]) v);
    ]

let backend_server_descriptions_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" backend_server_description_to_query
    path xs

let health_check_target_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.string_field path v
let health_check_interval_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.int_field path v
let health_check_timeout_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.int_field path v
let healthy_threshold_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.int_field path v

let health_check_to_query path (x : health_check) =
  List.concat
    [
      healthy_threshold_to_query (List.append path [ "HealthyThreshold" ]) x.healthy_threshold;
      unhealthy_threshold_to_query (List.append path [ "UnhealthyThreshold" ]) x.unhealthy_threshold;
      health_check_timeout_to_query (List.append path [ "Timeout" ]) x.timeout;
      health_check_interval_to_query (List.append path [ "Interval" ]) x.interval;
      health_check_target_to_query (List.append path [ "Target" ]) x.target;
    ]

let created_time_to_query path v = Smaws_Lib.Protocols.AwsQuery.Serialize.timestamp_iso_field path v

let load_balancer_description_to_query path (x : load_balancer_description) =
  List.concat
    [
      (match x.scheme with
      | None -> []
      | Some v -> load_balancer_scheme_to_query (List.append path [ "Scheme" ]) v);
      (match x.created_time with
      | None -> []
      | Some v -> created_time_to_query (List.append path [ "CreatedTime" ]) v);
      (match x.security_groups with
      | None -> []
      | Some v -> security_groups_to_query (List.append path [ "SecurityGroups" ]) v);
      (match x.source_security_group with
      | None -> []
      | Some v -> source_security_group_to_query (List.append path [ "SourceSecurityGroup" ]) v);
      (match x.health_check with
      | None -> []
      | Some v -> health_check_to_query (List.append path [ "HealthCheck" ]) v);
      (match x.instances with
      | None -> []
      | Some v -> instances_to_query (List.append path [ "Instances" ]) v);
      (match x.vpc_id with
      | None -> []
      | Some v -> vpc_id_to_query (List.append path [ "VPCId" ]) v);
      (match x.subnets with
      | None -> []
      | Some v -> subnets_to_query (List.append path [ "Subnets" ]) v);
      (match x.availability_zones with
      | None -> []
      | Some v -> availability_zones_to_query (List.append path [ "AvailabilityZones" ]) v);
      (match x.backend_server_descriptions with
      | None -> []
      | Some v ->
          backend_server_descriptions_to_query (List.append path [ "BackendServerDescriptions" ]) v);
      (match x.policies with
      | None -> []
      | Some v -> policies_to_query (List.append path [ "Policies" ]) v);
      (match x.listener_descriptions with
      | None -> []
      | Some v -> listener_descriptions_to_query (List.append path [ "ListenerDescriptions" ]) v);
      (match x.canonical_hosted_zone_name_i_d with
      | None -> []
      | Some v -> dns_name_to_query (List.append path [ "CanonicalHostedZoneNameID" ]) v);
      (match x.canonical_hosted_zone_name with
      | None -> []
      | Some v -> dns_name_to_query (List.append path [ "CanonicalHostedZoneName" ]) v);
      (match x.dns_name with
      | None -> []
      | Some v -> dns_name_to_query (List.append path [ "DNSName" ]) v);
      (match x.load_balancer_name with
      | None -> []
      | Some v -> access_point_name_to_query (List.append path [ "LoadBalancerName" ]) v);
    ]

let load_balancer_descriptions_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" load_balancer_description_to_query
    path xs

let listeners_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" listener_to_query path xs

let limit_to_query path (x : limit) =
  List.concat
    [
      (match x.max with None -> [] | Some v -> max_to_query (List.append path [ "Max" ]) v);
      (match x.name with None -> [] | Some v -> name_to_query (List.append path [ "Name" ]) v);
    ]

let limits_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" limit_to_query path xs

let invalid_subnet_exception_to_query path (x : invalid_subnet_exception) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> error_description_to_query (List.append path [ "Message" ]) v);
    ]

let invalid_security_group_exception_to_query path (x : invalid_security_group_exception) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> error_description_to_query (List.append path [ "Message" ]) v);
    ]

let invalid_scheme_exception_to_query path (x : invalid_scheme_exception) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> error_description_to_query (List.append path [ "Message" ]) v);
    ]

let instance_state_to_query path (x : instance_state) =
  List.concat
    [
      (match x.description with
      | None -> []
      | Some v -> description_to_query (List.append path [ "Description" ]) v);
      (match x.reason_code with
      | None -> []
      | Some v -> reason_code_to_query (List.append path [ "ReasonCode" ]) v);
      (match x.state with None -> [] | Some v -> state_to_query (List.append path [ "State" ]) v);
      (match x.instance_id with
      | None -> []
      | Some v -> instance_id_to_query (List.append path [ "InstanceId" ]) v);
    ]

let instance_states_to_query path xs =
  Smaws_Lib.Protocols.AwsQuery.Serialize.list_to_query "member" instance_state_to_query path xs

let add_availability_zones_output_to_query path (x : add_availability_zones_output) =
  List.concat
    [
      (match x.availability_zones with
      | None -> []
      | Some v -> availability_zones_to_query (List.append path [ "AvailabilityZones" ]) v);
    ]

let add_availability_zones_input_to_query path (x : add_availability_zones_input) =
  List.concat
    [
      availability_zones_to_query (List.append path [ "AvailabilityZones" ]) x.availability_zones;
      access_point_name_to_query (List.append path [ "LoadBalancerName" ]) x.load_balancer_name;
    ]

let detach_load_balancer_from_subnets_output_to_query path
    (x : detach_load_balancer_from_subnets_output) =
  List.concat
    [
      (match x.subnets with
      | None -> []
      | Some v -> subnets_to_query (List.append path [ "Subnets" ]) v);
    ]

let detach_load_balancer_from_subnets_input_to_query path
    (x : detach_load_balancer_from_subnets_input) =
  List.concat
    [
      subnets_to_query (List.append path [ "Subnets" ]) x.subnets;
      access_point_name_to_query (List.append path [ "LoadBalancerName" ]) x.load_balancer_name;
    ]

let describe_tags_output_to_query path (x : describe_tags_output) =
  List.concat
    [
      (match x.tag_descriptions with
      | None -> []
      | Some v -> tag_descriptions_to_query (List.append path [ "TagDescriptions" ]) v);
    ]

let describe_tags_input_to_query path (x : describe_tags_input) =
  List.concat
    [
      load_balancer_names_max20_to_query
        (List.append path [ "LoadBalancerNames" ])
        x.load_balancer_names;
    ]

let dependency_throttle_exception_to_query path (x : dependency_throttle_exception) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> error_description_to_query (List.append path [ "Message" ]) v);
    ]

let describe_access_points_output_to_query path (x : describe_access_points_output) =
  List.concat
    [
      (match x.next_marker with
      | None -> []
      | Some v -> marker_to_query (List.append path [ "NextMarker" ]) v);
      (match x.load_balancer_descriptions with
      | None -> []
      | Some v ->
          load_balancer_descriptions_to_query (List.append path [ "LoadBalancerDescriptions" ]) v);
    ]

let describe_access_points_input_to_query path (x : describe_access_points_input) =
  List.concat
    [
      (match x.page_size with
      | None -> []
      | Some v -> page_size_to_query (List.append path [ "PageSize" ]) v);
      (match x.marker with
      | None -> []
      | Some v -> marker_to_query (List.append path [ "Marker" ]) v);
      (match x.load_balancer_names with
      | None -> []
      | Some v -> load_balancer_names_to_query (List.append path [ "LoadBalancerNames" ]) v);
    ]

let describe_load_balancer_policy_types_output_to_query path
    (x : describe_load_balancer_policy_types_output) =
  List.concat
    [
      (match x.policy_type_descriptions with
      | None -> []
      | Some v ->
          policy_type_descriptions_to_query (List.append path [ "PolicyTypeDescriptions" ]) v);
    ]

let describe_load_balancer_policy_types_input_to_query path
    (x : describe_load_balancer_policy_types_input) =
  List.concat
    [
      (match x.policy_type_names with
      | None -> []
      | Some v -> policy_type_names_to_query (List.append path [ "PolicyTypeNames" ]) v);
    ]

let describe_load_balancer_policies_output_to_query path
    (x : describe_load_balancer_policies_output) =
  List.concat
    [
      (match x.policy_descriptions with
      | None -> []
      | Some v -> policy_descriptions_to_query (List.append path [ "PolicyDescriptions" ]) v);
    ]

let describe_load_balancer_policies_input_to_query path (x : describe_load_balancer_policies_input)
    =
  List.concat
    [
      (match x.policy_names with
      | None -> []
      | Some v -> policy_names_to_query (List.append path [ "PolicyNames" ]) v);
      (match x.load_balancer_name with
      | None -> []
      | Some v -> access_point_name_to_query (List.append path [ "LoadBalancerName" ]) v);
    ]

let describe_load_balancer_attributes_output_to_query path
    (x : describe_load_balancer_attributes_output) =
  List.concat
    [
      (match x.load_balancer_attributes with
      | None -> []
      | Some v ->
          load_balancer_attributes_to_query (List.append path [ "LoadBalancerAttributes" ]) v);
    ]

let describe_load_balancer_attributes_input_to_query path
    (x : describe_load_balancer_attributes_input) =
  List.concat
    [ access_point_name_to_query (List.append path [ "LoadBalancerName" ]) x.load_balancer_name ]

let describe_end_point_state_output_to_query path (x : describe_end_point_state_output) =
  List.concat
    [
      (match x.instance_states with
      | None -> []
      | Some v -> instance_states_to_query (List.append path [ "InstanceStates" ]) v);
    ]

let describe_end_point_state_input_to_query path (x : describe_end_point_state_input) =
  List.concat
    [
      (match x.instances with
      | None -> []
      | Some v -> instances_to_query (List.append path [ "Instances" ]) v);
      access_point_name_to_query (List.append path [ "LoadBalancerName" ]) x.load_balancer_name;
    ]

let describe_account_limits_output_to_query path (x : describe_account_limits_output) =
  List.concat
    [
      (match x.next_marker with
      | None -> []
      | Some v -> marker_to_query (List.append path [ "NextMarker" ]) v);
      (match x.limits with
      | None -> []
      | Some v -> limits_to_query (List.append path [ "Limits" ]) v);
    ]

let describe_account_limits_input_to_query path (x : describe_account_limits_input) =
  List.concat
    [
      (match x.page_size with
      | None -> []
      | Some v -> page_size_to_query (List.append path [ "PageSize" ]) v);
      (match x.marker with
      | None -> []
      | Some v -> marker_to_query (List.append path [ "Marker" ]) v);
    ]

let deregister_end_points_output_to_query path (x : deregister_end_points_output) =
  List.concat
    [
      (match x.instances with
      | None -> []
      | Some v -> instances_to_query (List.append path [ "Instances" ]) v);
    ]

let deregister_end_points_input_to_query path (x : deregister_end_points_input) =
  List.concat
    [
      instances_to_query (List.append path [ "Instances" ]) x.instances;
      access_point_name_to_query (List.append path [ "LoadBalancerName" ]) x.load_balancer_name;
    ]

let delete_load_balancer_policy_output_to_query path _x = []

let delete_load_balancer_policy_input_to_query path (x : delete_load_balancer_policy_input) =
  List.concat
    [
      policy_name_to_query (List.append path [ "PolicyName" ]) x.policy_name;
      access_point_name_to_query (List.append path [ "LoadBalancerName" ]) x.load_balancer_name;
    ]

let delete_load_balancer_listener_output_to_query path _x = []

let delete_load_balancer_listener_input_to_query path (x : delete_load_balancer_listener_input) =
  List.concat
    [
      ports_to_query (List.append path [ "LoadBalancerPorts" ]) x.load_balancer_ports;
      access_point_name_to_query (List.append path [ "LoadBalancerName" ]) x.load_balancer_name;
    ]

let delete_access_point_output_to_query path _x = []

let delete_access_point_input_to_query path (x : delete_access_point_input) =
  List.concat
    [ access_point_name_to_query (List.append path [ "LoadBalancerName" ]) x.load_balancer_name ]

let duplicate_policy_name_exception_to_query path (x : duplicate_policy_name_exception) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> error_description_to_query (List.append path [ "Message" ]) v);
    ]

let create_load_balancer_policy_output_to_query path _x = []

let create_load_balancer_policy_input_to_query path (x : create_load_balancer_policy_input) =
  List.concat
    [
      (match x.policy_attributes with
      | None -> []
      | Some v -> policy_attributes_to_query (List.append path [ "PolicyAttributes" ]) v);
      policy_type_name_to_query (List.append path [ "PolicyTypeName" ]) x.policy_type_name;
      policy_name_to_query (List.append path [ "PolicyName" ]) x.policy_name;
      access_point_name_to_query (List.append path [ "LoadBalancerName" ]) x.load_balancer_name;
    ]

let duplicate_listener_exception_to_query path (x : duplicate_listener_exception) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> error_description_to_query (List.append path [ "Message" ]) v);
    ]

let create_load_balancer_listener_output_to_query path _x = []

let create_load_balancer_listener_input_to_query path (x : create_load_balancer_listener_input) =
  List.concat
    [
      listeners_to_query (List.append path [ "Listeners" ]) x.listeners;
      access_point_name_to_query (List.append path [ "LoadBalancerName" ]) x.load_balancer_name;
    ]

let duplicate_tag_keys_exception_to_query path (x : duplicate_tag_keys_exception) =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> error_description_to_query (List.append path [ "Message" ]) v);
    ]

let duplicate_access_point_name_exception_to_query path (x : duplicate_access_point_name_exception)
    =
  List.concat
    [
      (match x.message with
      | None -> []
      | Some v -> error_description_to_query (List.append path [ "Message" ]) v);
    ]

let create_access_point_output_to_query path (x : create_access_point_output) =
  List.concat
    [
      (match x.dns_name with
      | None -> []
      | Some v -> dns_name_to_query (List.append path [ "DNSName" ]) v);
    ]

let create_access_point_input_to_query path (x : create_access_point_input) =
  List.concat
    [
      (match x.tags with None -> [] | Some v -> tag_list_to_query (List.append path [ "Tags" ]) v);
      (match x.scheme with
      | None -> []
      | Some v -> load_balancer_scheme_to_query (List.append path [ "Scheme" ]) v);
      (match x.security_groups with
      | None -> []
      | Some v -> security_groups_to_query (List.append path [ "SecurityGroups" ]) v);
      (match x.subnets with
      | None -> []
      | Some v -> subnets_to_query (List.append path [ "Subnets" ]) v);
      (match x.availability_zones with
      | None -> []
      | Some v -> availability_zones_to_query (List.append path [ "AvailabilityZones" ]) v);
      listeners_to_query (List.append path [ "Listeners" ]) x.listeners;
      access_point_name_to_query (List.append path [ "LoadBalancerName" ]) x.load_balancer_name;
    ]

let create_lb_cookie_stickiness_policy_output_to_query path _x = []

let create_lb_cookie_stickiness_policy_input_to_query path
    (x : create_lb_cookie_stickiness_policy_input) =
  List.concat
    [
      (match x.cookie_expiration_period with
      | None -> []
      | Some v ->
          cookie_expiration_period_to_query (List.append path [ "CookieExpirationPeriod" ]) v);
      policy_name_to_query (List.append path [ "PolicyName" ]) x.policy_name;
      access_point_name_to_query (List.append path [ "LoadBalancerName" ]) x.load_balancer_name;
    ]

let create_app_cookie_stickiness_policy_output_to_query path _x = []

let create_app_cookie_stickiness_policy_input_to_query path
    (x : create_app_cookie_stickiness_policy_input) =
  List.concat
    [
      cookie_name_to_query (List.append path [ "CookieName" ]) x.cookie_name;
      policy_name_to_query (List.append path [ "PolicyName" ]) x.policy_name;
      access_point_name_to_query (List.append path [ "LoadBalancerName" ]) x.load_balancer_name;
    ]

let configure_health_check_output_to_query path (x : configure_health_check_output) =
  List.concat
    [
      (match x.health_check with
      | None -> []
      | Some v -> health_check_to_query (List.append path [ "HealthCheck" ]) v);
    ]

let configure_health_check_input_to_query path (x : configure_health_check_input) =
  List.concat
    [
      health_check_to_query (List.append path [ "HealthCheck" ]) x.health_check;
      access_point_name_to_query (List.append path [ "LoadBalancerName" ]) x.load_balancer_name;
    ]

let attach_load_balancer_to_subnets_output_to_query path
    (x : attach_load_balancer_to_subnets_output) =
  List.concat
    [
      (match x.subnets with
      | None -> []
      | Some v -> subnets_to_query (List.append path [ "Subnets" ]) v);
    ]

let attach_load_balancer_to_subnets_input_to_query path (x : attach_load_balancer_to_subnets_input)
    =
  List.concat
    [
      subnets_to_query (List.append path [ "Subnets" ]) x.subnets;
      access_point_name_to_query (List.append path [ "LoadBalancerName" ]) x.load_balancer_name;
    ]

let apply_security_groups_to_load_balancer_output_to_query path
    (x : apply_security_groups_to_load_balancer_output) =
  List.concat
    [
      (match x.security_groups with
      | None -> []
      | Some v -> security_groups_to_query (List.append path [ "SecurityGroups" ]) v);
    ]

let apply_security_groups_to_load_balancer_input_to_query path
    (x : apply_security_groups_to_load_balancer_input) =
  List.concat
    [
      security_groups_to_query (List.append path [ "SecurityGroups" ]) x.security_groups;
      access_point_name_to_query (List.append path [ "LoadBalancerName" ]) x.load_balancer_name;
    ]

let add_tags_output_to_query path _x = []

let add_tags_input_to_query path (x : add_tags_input) =
  List.concat
    [
      tag_list_to_query (List.append path [ "Tags" ]) x.tags;
      load_balancer_names_to_query (List.append path [ "LoadBalancerNames" ]) x.load_balancer_names;
    ]
