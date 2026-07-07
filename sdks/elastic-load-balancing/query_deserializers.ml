open Types

let unit_of_xml _ = ()
let vpc_id_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let error_description_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let unsupported_protocol_exception_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Message" ] (fun tag _ ->
      match tag with
      | "Message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Message"
                 (fun i _ -> error_description_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : unsupported_protocol_exception)

let unhealthy_threshold_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let too_many_tags_exception_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Message" ] (fun tag _ ->
      match tag with
      | "Message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Message"
                 (fun i _ -> error_description_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : too_many_tags_exception)

let too_many_policies_exception_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Message" ] (fun tag _ ->
      match tag with
      | "Message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Message"
                 (fun i _ -> error_description_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : too_many_policies_exception)

let too_many_access_points_exception_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Message" ] (fun tag _ ->
      match tag with
      | "Message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Message"
                 (fun i _ -> error_description_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : too_many_access_points_exception)

let tag_value_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let tag_key_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let tag_of_xml i =
  let r_value = ref None in
  let r_key = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Value"; "Key" ] (fun tag _ ->
      match tag with
      | "Value" ->
          r_value :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Value" (fun i _ -> tag_value_of_xml i) ())
      | "Key" ->
          r_key := Some (Smaws_Lib.Xml.Parse.Read.sequence i "Key" (fun i _ -> tag_key_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ value = ( ! ) r_value; key = Smaws_Lib.Xml.Parse.required "Key" (( ! ) r_key) i } : tag)

let tag_list_of_xml i = Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> tag_of_xml i) ()

let tag_key_only_of_xml i =
  let r_key = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Key" ] (fun tag _ ->
      match tag with
      | "Key" ->
          r_key := Some (Smaws_Lib.Xml.Parse.Read.sequence i "Key" (fun i _ -> tag_key_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ key = ( ! ) r_key } : tag_key_only)

let tag_key_list_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> tag_key_only_of_xml i) ()

let access_point_name_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let tag_description_of_xml i =
  let r_tags = ref None in
  let r_load_balancer_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Tags"; "LoadBalancerName" ] (fun tag _ ->
      match tag with
      | "Tags" ->
          r_tags :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Tags"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> tag_of_xml i) ())
                 ())
      | "LoadBalancerName" ->
          r_load_balancer_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LoadBalancerName"
                 (fun i _ -> access_point_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ tags = ( ! ) r_tags; load_balancer_name = ( ! ) r_load_balancer_name } : tag_description)

let tag_descriptions_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> tag_description_of_xml i) ()

let subnet_id_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let subnets_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> subnet_id_of_xml i) ()

let subnet_not_found_exception_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Message" ] (fun tag _ ->
      match tag with
      | "Message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Message"
                 (fun i _ -> error_description_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : subnet_not_found_exception)

let state_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let security_group_owner_alias_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let security_group_name_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let source_security_group_of_xml i =
  let r_group_name = ref None in
  let r_owner_alias = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "GroupName"; "OwnerAlias" ] (fun tag _ ->
      match tag with
      | "GroupName" ->
          r_group_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "GroupName"
                 (fun i _ -> security_group_name_of_xml i)
                 ())
      | "OwnerAlias" ->
          r_owner_alias :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "OwnerAlias"
                 (fun i _ -> security_group_owner_alias_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ group_name = ( ! ) r_group_name; owner_alias = ( ! ) r_owner_alias } : source_security_group)

let set_load_balancer_policies_of_listener_output_of_xml i = ()

let access_point_port_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let policy_name_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let policy_names_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> policy_name_of_xml i) ()

let set_load_balancer_policies_of_listener_input_of_xml i =
  let r_policy_names = ref None in
  let r_load_balancer_port = ref None in
  let r_load_balancer_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "PolicyNames"; "LoadBalancerPort"; "LoadBalancerName" ] (fun tag _ ->
      match tag with
      | "PolicyNames" ->
          r_policy_names :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PolicyNames"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> policy_name_of_xml i)
                     ())
                 ())
      | "LoadBalancerPort" ->
          r_load_balancer_port :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LoadBalancerPort"
                 (fun i _ -> access_point_port_of_xml i)
                 ())
      | "LoadBalancerName" ->
          r_load_balancer_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LoadBalancerName"
                 (fun i _ -> access_point_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     policy_names = Smaws_Lib.Xml.Parse.required "PolicyNames" (( ! ) r_policy_names) i;
     load_balancer_port =
       Smaws_Lib.Xml.Parse.required "LoadBalancerPort" (( ! ) r_load_balancer_port) i;
     load_balancer_name =
       Smaws_Lib.Xml.Parse.required "LoadBalancerName" (( ! ) r_load_balancer_name) i;
   }
    : set_load_balancer_policies_of_listener_input)

let policy_not_found_exception_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Message" ] (fun tag _ ->
      match tag with
      | "Message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Message"
                 (fun i _ -> error_description_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : policy_not_found_exception)

let listener_not_found_exception_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Message" ] (fun tag _ ->
      match tag with
      | "Message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Message"
                 (fun i _ -> error_description_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : listener_not_found_exception)

let invalid_configuration_request_exception_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Message" ] (fun tag _ ->
      match tag with
      | "Message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Message"
                 (fun i _ -> error_description_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : invalid_configuration_request_exception)

let access_point_not_found_exception_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Message" ] (fun tag _ ->
      match tag with
      | "Message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Message"
                 (fun i _ -> error_description_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : access_point_not_found_exception)

let set_load_balancer_policies_for_backend_server_output_of_xml i = ()

let end_point_port_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let set_load_balancer_policies_for_backend_server_input_of_xml i =
  let r_policy_names = ref None in
  let r_instance_port = ref None in
  let r_load_balancer_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "PolicyNames"; "InstancePort"; "LoadBalancerName" ]
    (fun tag _ ->
      match tag with
      | "PolicyNames" ->
          r_policy_names :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PolicyNames"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> policy_name_of_xml i)
                     ())
                 ())
      | "InstancePort" ->
          r_instance_port :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "InstancePort"
                 (fun i _ -> end_point_port_of_xml i)
                 ())
      | "LoadBalancerName" ->
          r_load_balancer_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LoadBalancerName"
                 (fun i _ -> access_point_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     policy_names = Smaws_Lib.Xml.Parse.required "PolicyNames" (( ! ) r_policy_names) i;
     instance_port = Smaws_Lib.Xml.Parse.required "InstancePort" (( ! ) r_instance_port) i;
     load_balancer_name =
       Smaws_Lib.Xml.Parse.required "LoadBalancerName" (( ! ) r_load_balancer_name) i;
   }
    : set_load_balancer_policies_for_backend_server_input)

let set_load_balancer_listener_ssl_certificate_output_of_xml i = ()
let ssl_certificate_id_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let set_load_balancer_listener_ssl_certificate_input_of_xml i =
  let r_ssl_certificate_id = ref None in
  let r_load_balancer_port = ref None in
  let r_load_balancer_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "SSLCertificateId"; "LoadBalancerPort"; "LoadBalancerName" ] (fun tag _ ->
      match tag with
      | "SSLCertificateId" ->
          r_ssl_certificate_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SSLCertificateId"
                 (fun i _ -> ssl_certificate_id_of_xml i)
                 ())
      | "LoadBalancerPort" ->
          r_load_balancer_port :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LoadBalancerPort"
                 (fun i _ -> access_point_port_of_xml i)
                 ())
      | "LoadBalancerName" ->
          r_load_balancer_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LoadBalancerName"
                 (fun i _ -> access_point_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     ssl_certificate_id =
       Smaws_Lib.Xml.Parse.required "SSLCertificateId" (( ! ) r_ssl_certificate_id) i;
     load_balancer_port =
       Smaws_Lib.Xml.Parse.required "LoadBalancerPort" (( ! ) r_load_balancer_port) i;
     load_balancer_name =
       Smaws_Lib.Xml.Parse.required "LoadBalancerName" (( ! ) r_load_balancer_name) i;
   }
    : set_load_balancer_listener_ssl_certificate_input)

let certificate_not_found_exception_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Message" ] (fun tag _ ->
      match tag with
      | "Message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Message"
                 (fun i _ -> error_description_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : certificate_not_found_exception)

let security_group_id_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let security_groups_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> security_group_id_of_xml i) ()

let s3_bucket_name_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let remove_tags_output_of_xml i = ()

let load_balancer_names_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> access_point_name_of_xml i) ()

let remove_tags_input_of_xml i =
  let r_tags = ref None in
  let r_load_balancer_names = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Tags"; "LoadBalancerNames" ] (fun tag _ ->
      match tag with
      | "Tags" ->
          r_tags :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Tags"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> tag_key_only_of_xml i)
                     ())
                 ())
      | "LoadBalancerNames" ->
          r_load_balancer_names :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LoadBalancerNames"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> access_point_name_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     tags = Smaws_Lib.Xml.Parse.required "Tags" (( ! ) r_tags) i;
     load_balancer_names =
       Smaws_Lib.Xml.Parse.required "LoadBalancerNames" (( ! ) r_load_balancer_names) i;
   }
    : remove_tags_input)

let availability_zone_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let availability_zones_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> availability_zone_of_xml i) ()

let remove_availability_zones_output_of_xml i =
  let r_availability_zones = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "AvailabilityZones" ] (fun tag _ ->
      match tag with
      | "AvailabilityZones" ->
          r_availability_zones :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AvailabilityZones"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> availability_zone_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ availability_zones = ( ! ) r_availability_zones } : remove_availability_zones_output)

let remove_availability_zones_input_of_xml i =
  let r_availability_zones = ref None in
  let r_load_balancer_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "AvailabilityZones"; "LoadBalancerName" ]
    (fun tag _ ->
      match tag with
      | "AvailabilityZones" ->
          r_availability_zones :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AvailabilityZones"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> availability_zone_of_xml i)
                     ())
                 ())
      | "LoadBalancerName" ->
          r_load_balancer_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LoadBalancerName"
                 (fun i _ -> access_point_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     availability_zones =
       Smaws_Lib.Xml.Parse.required "AvailabilityZones" (( ! ) r_availability_zones) i;
     load_balancer_name =
       Smaws_Lib.Xml.Parse.required "LoadBalancerName" (( ! ) r_load_balancer_name) i;
   }
    : remove_availability_zones_input)

let invalid_end_point_exception_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Message" ] (fun tag _ ->
      match tag with
      | "Message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Message"
                 (fun i _ -> error_description_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : invalid_end_point_exception)

let instance_id_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let instance_of_xml i =
  let r_instance_id = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "InstanceId" ] (fun tag _ ->
      match tag with
      | "InstanceId" ->
          r_instance_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "InstanceId"
                 (fun i _ -> instance_id_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ instance_id = ( ! ) r_instance_id } : instance)

let instances_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> instance_of_xml i) ()

let register_end_points_output_of_xml i =
  let r_instances = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Instances" ] (fun tag _ ->
      match tag with
      | "Instances" ->
          r_instances :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Instances"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> instance_of_xml i) ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ instances = ( ! ) r_instances } : register_end_points_output)

let register_end_points_input_of_xml i =
  let r_instances = ref None in
  let r_load_balancer_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Instances"; "LoadBalancerName" ] (fun tag _ ->
      match tag with
      | "Instances" ->
          r_instances :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Instances"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> instance_of_xml i) ())
                 ())
      | "LoadBalancerName" ->
          r_load_balancer_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LoadBalancerName"
                 (fun i _ -> access_point_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     instances = Smaws_Lib.Xml.Parse.required "Instances" (( ! ) r_instances) i;
     load_balancer_name =
       Smaws_Lib.Xml.Parse.required "LoadBalancerName" (( ! ) r_load_balancer_name) i;
   }
    : register_end_points_input)

let reason_code_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let protocol_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let ports_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> access_point_port_of_xml i) ()

let policy_type_not_found_exception_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Message" ] (fun tag _ ->
      match tag with
      | "Message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Message"
                 (fun i _ -> error_description_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : policy_type_not_found_exception)

let policy_type_name_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let policy_type_names_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> policy_type_name_of_xml i) ()

let description_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let attribute_name_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let attribute_type_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let default_value_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let cardinality_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let policy_attribute_type_description_of_xml i =
  let r_cardinality = ref None in
  let r_default_value = ref None in
  let r_description = ref None in
  let r_attribute_type = ref None in
  let r_attribute_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "Cardinality"; "DefaultValue"; "Description"; "AttributeType"; "AttributeName" ] (fun tag _ ->
      match tag with
      | "Cardinality" ->
          r_cardinality :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Cardinality"
                 (fun i _ -> cardinality_of_xml i)
                 ())
      | "DefaultValue" ->
          r_default_value :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "DefaultValue"
                 (fun i _ -> default_value_of_xml i)
                 ())
      | "Description" ->
          r_description :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Description"
                 (fun i _ -> description_of_xml i)
                 ())
      | "AttributeType" ->
          r_attribute_type :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AttributeType"
                 (fun i _ -> attribute_type_of_xml i)
                 ())
      | "AttributeName" ->
          r_attribute_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AttributeName"
                 (fun i _ -> attribute_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     cardinality = ( ! ) r_cardinality;
     default_value = ( ! ) r_default_value;
     description = ( ! ) r_description;
     attribute_type = ( ! ) r_attribute_type;
     attribute_name = ( ! ) r_attribute_name;
   }
    : policy_attribute_type_description)

let policy_attribute_type_descriptions_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member"
    (fun i _ -> policy_attribute_type_description_of_xml i)
    ()

let policy_type_description_of_xml i =
  let r_policy_attribute_type_descriptions = ref None in
  let r_description = ref None in
  let r_policy_type_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "PolicyAttributeTypeDescriptions"; "Description"; "PolicyTypeName" ] (fun tag _ ->
      match tag with
      | "PolicyAttributeTypeDescriptions" ->
          r_policy_attribute_type_descriptions :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PolicyAttributeTypeDescriptions"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> policy_attribute_type_description_of_xml i)
                     ())
                 ())
      | "Description" ->
          r_description :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Description"
                 (fun i _ -> description_of_xml i)
                 ())
      | "PolicyTypeName" ->
          r_policy_type_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PolicyTypeName"
                 (fun i _ -> policy_type_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     policy_attribute_type_descriptions = ( ! ) r_policy_attribute_type_descriptions;
     description = ( ! ) r_description;
     policy_type_name = ( ! ) r_policy_type_name;
   }
    : policy_type_description)

let policy_type_descriptions_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> policy_type_description_of_xml i) ()

let attribute_value_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let policy_attribute_description_of_xml i =
  let r_attribute_value = ref None in
  let r_attribute_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "AttributeValue"; "AttributeName" ] (fun tag _ ->
      match tag with
      | "AttributeValue" ->
          r_attribute_value :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AttributeValue"
                 (fun i _ -> attribute_value_of_xml i)
                 ())
      | "AttributeName" ->
          r_attribute_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AttributeName"
                 (fun i _ -> attribute_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ attribute_value = ( ! ) r_attribute_value; attribute_name = ( ! ) r_attribute_name }
    : policy_attribute_description)

let policy_attribute_descriptions_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member"
    (fun i _ -> policy_attribute_description_of_xml i)
    ()

let policy_description_of_xml i =
  let r_policy_attribute_descriptions = ref None in
  let r_policy_type_name = ref None in
  let r_policy_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "PolicyAttributeDescriptions"; "PolicyTypeName"; "PolicyName" ] (fun tag _ ->
      match tag with
      | "PolicyAttributeDescriptions" ->
          r_policy_attribute_descriptions :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PolicyAttributeDescriptions"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> policy_attribute_description_of_xml i)
                     ())
                 ())
      | "PolicyTypeName" ->
          r_policy_type_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PolicyTypeName"
                 (fun i _ -> policy_type_name_of_xml i)
                 ())
      | "PolicyName" ->
          r_policy_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PolicyName"
                 (fun i _ -> policy_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     policy_attribute_descriptions = ( ! ) r_policy_attribute_descriptions;
     policy_type_name = ( ! ) r_policy_type_name;
     policy_name = ( ! ) r_policy_name;
   }
    : policy_description)

let policy_descriptions_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> policy_description_of_xml i) ()

let policy_attribute_of_xml i =
  let r_attribute_value = ref None in
  let r_attribute_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "AttributeValue"; "AttributeName" ] (fun tag _ ->
      match tag with
      | "AttributeValue" ->
          r_attribute_value :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AttributeValue"
                 (fun i _ -> attribute_value_of_xml i)
                 ())
      | "AttributeName" ->
          r_attribute_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AttributeName"
                 (fun i _ -> attribute_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ attribute_value = ( ! ) r_attribute_value; attribute_name = ( ! ) r_attribute_name }
    : policy_attribute)

let policy_attributes_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> policy_attribute_of_xml i) ()

let cookie_name_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let app_cookie_stickiness_policy_of_xml i =
  let r_cookie_name = ref None in
  let r_policy_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "CookieName"; "PolicyName" ] (fun tag _ ->
      match tag with
      | "CookieName" ->
          r_cookie_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CookieName"
                 (fun i _ -> cookie_name_of_xml i)
                 ())
      | "PolicyName" ->
          r_policy_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PolicyName"
                 (fun i _ -> policy_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ cookie_name = ( ! ) r_cookie_name; policy_name = ( ! ) r_policy_name }
    : app_cookie_stickiness_policy)

let app_cookie_stickiness_policies_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member"
    (fun i _ -> app_cookie_stickiness_policy_of_xml i)
    ()

let cookie_expiration_period_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.long_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let lb_cookie_stickiness_policy_of_xml i =
  let r_cookie_expiration_period = ref None in
  let r_policy_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "CookieExpirationPeriod"; "PolicyName" ]
    (fun tag _ ->
      match tag with
      | "CookieExpirationPeriod" ->
          r_cookie_expiration_period :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CookieExpirationPeriod"
                 (fun i _ -> cookie_expiration_period_of_xml i)
                 ())
      | "PolicyName" ->
          r_policy_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PolicyName"
                 (fun i _ -> policy_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     cookie_expiration_period = ( ! ) r_cookie_expiration_period;
     policy_name = ( ! ) r_policy_name;
   }
    : lb_cookie_stickiness_policy)

let lb_cookie_stickiness_policies_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> lb_cookie_stickiness_policy_of_xml i) ()

let policies_of_xml i =
  let r_other_policies = ref None in
  let r_lb_cookie_stickiness_policies = ref None in
  let r_app_cookie_stickiness_policies = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "OtherPolicies"; "LBCookieStickinessPolicies"; "AppCookieStickinessPolicies" ] (fun tag _ ->
      match tag with
      | "OtherPolicies" ->
          r_other_policies :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "OtherPolicies"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> policy_name_of_xml i)
                     ())
                 ())
      | "LBCookieStickinessPolicies" ->
          r_lb_cookie_stickiness_policies :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LBCookieStickinessPolicies"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> lb_cookie_stickiness_policy_of_xml i)
                     ())
                 ())
      | "AppCookieStickinessPolicies" ->
          r_app_cookie_stickiness_policies :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AppCookieStickinessPolicies"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> app_cookie_stickiness_policy_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     other_policies = ( ! ) r_other_policies;
     lb_cookie_stickiness_policies = ( ! ) r_lb_cookie_stickiness_policies;
     app_cookie_stickiness_policies = ( ! ) r_app_cookie_stickiness_policies;
   }
    : policies)

let page_size_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let operation_not_permitted_exception_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Message" ] (fun tag _ ->
      match tag with
      | "Message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Message"
                 (fun i _ -> error_description_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : operation_not_permitted_exception)

let name_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let cross_zone_load_balancing_enabled_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.bool_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let cross_zone_load_balancing_of_xml i =
  let r_enabled = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Enabled" ] (fun tag _ ->
      match tag with
      | "Enabled" ->
          r_enabled :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Enabled"
                 (fun i _ -> cross_zone_load_balancing_enabled_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ enabled = Smaws_Lib.Xml.Parse.required "Enabled" (( ! ) r_enabled) i }
    : cross_zone_load_balancing)

let access_log_enabled_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.bool_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let access_log_interval_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let access_log_prefix_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let access_log_of_xml i =
  let r_s3_bucket_prefix = ref None in
  let r_emit_interval = ref None in
  let r_s3_bucket_name = ref None in
  let r_enabled = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "S3BucketPrefix"; "EmitInterval"; "S3BucketName"; "Enabled" ] (fun tag _ ->
      match tag with
      | "S3BucketPrefix" ->
          r_s3_bucket_prefix :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "S3BucketPrefix"
                 (fun i _ -> access_log_prefix_of_xml i)
                 ())
      | "EmitInterval" ->
          r_emit_interval :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "EmitInterval"
                 (fun i _ -> access_log_interval_of_xml i)
                 ())
      | "S3BucketName" ->
          r_s3_bucket_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "S3BucketName"
                 (fun i _ -> s3_bucket_name_of_xml i)
                 ())
      | "Enabled" ->
          r_enabled :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Enabled"
                 (fun i _ -> access_log_enabled_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     s3_bucket_prefix = ( ! ) r_s3_bucket_prefix;
     emit_interval = ( ! ) r_emit_interval;
     s3_bucket_name = ( ! ) r_s3_bucket_name;
     enabled = Smaws_Lib.Xml.Parse.required "Enabled" (( ! ) r_enabled) i;
   }
    : access_log)

let connection_draining_enabled_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.bool_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let connection_draining_timeout_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let connection_draining_of_xml i =
  let r_timeout = ref None in
  let r_enabled = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Timeout"; "Enabled" ] (fun tag _ ->
      match tag with
      | "Timeout" ->
          r_timeout :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Timeout"
                 (fun i _ -> connection_draining_timeout_of_xml i)
                 ())
      | "Enabled" ->
          r_enabled :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Enabled"
                 (fun i _ -> connection_draining_enabled_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     timeout = ( ! ) r_timeout;
     enabled = Smaws_Lib.Xml.Parse.required "Enabled" (( ! ) r_enabled) i;
   }
    : connection_draining)

let idle_timeout_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let connection_settings_of_xml i =
  let r_idle_timeout = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "IdleTimeout" ] (fun tag _ ->
      match tag with
      | "IdleTimeout" ->
          r_idle_timeout :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "IdleTimeout"
                 (fun i _ -> idle_timeout_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ idle_timeout = Smaws_Lib.Xml.Parse.required "IdleTimeout" (( ! ) r_idle_timeout) i }
    : connection_settings)

let additional_attribute_key_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let additional_attribute_value_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let additional_attribute_of_xml i =
  let r_value = ref None in
  let r_key = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Value"; "Key" ] (fun tag _ ->
      match tag with
      | "Value" ->
          r_value :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Value"
                 (fun i _ -> additional_attribute_value_of_xml i)
                 ())
      | "Key" ->
          r_key :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Key"
                 (fun i _ -> additional_attribute_key_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ value = ( ! ) r_value; key = ( ! ) r_key } : additional_attribute)

let additional_attributes_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> additional_attribute_of_xml i) ()

let load_balancer_attributes_of_xml i =
  let r_additional_attributes = ref None in
  let r_connection_settings = ref None in
  let r_connection_draining = ref None in
  let r_access_log = ref None in
  let r_cross_zone_load_balancing = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "AdditionalAttributes";
      "ConnectionSettings";
      "ConnectionDraining";
      "AccessLog";
      "CrossZoneLoadBalancing";
    ] (fun tag _ ->
      match tag with
      | "AdditionalAttributes" ->
          r_additional_attributes :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AdditionalAttributes"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> additional_attribute_of_xml i)
                     ())
                 ())
      | "ConnectionSettings" ->
          r_connection_settings :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ConnectionSettings"
                 (fun i _ -> connection_settings_of_xml i)
                 ())
      | "ConnectionDraining" ->
          r_connection_draining :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ConnectionDraining"
                 (fun i _ -> connection_draining_of_xml i)
                 ())
      | "AccessLog" ->
          r_access_log :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AccessLog" (fun i _ -> access_log_of_xml i) ())
      | "CrossZoneLoadBalancing" ->
          r_cross_zone_load_balancing :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CrossZoneLoadBalancing"
                 (fun i _ -> cross_zone_load_balancing_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     additional_attributes = ( ! ) r_additional_attributes;
     connection_settings = ( ! ) r_connection_settings;
     connection_draining = ( ! ) r_connection_draining;
     access_log = ( ! ) r_access_log;
     cross_zone_load_balancing = ( ! ) r_cross_zone_load_balancing;
   }
    : load_balancer_attributes)

let modify_load_balancer_attributes_output_of_xml i =
  let r_load_balancer_attributes = ref None in
  let r_load_balancer_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "LoadBalancerAttributes"; "LoadBalancerName" ]
    (fun tag _ ->
      match tag with
      | "LoadBalancerAttributes" ->
          r_load_balancer_attributes :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LoadBalancerAttributes"
                 (fun i _ -> load_balancer_attributes_of_xml i)
                 ())
      | "LoadBalancerName" ->
          r_load_balancer_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LoadBalancerName"
                 (fun i _ -> access_point_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     load_balancer_attributes = ( ! ) r_load_balancer_attributes;
     load_balancer_name = ( ! ) r_load_balancer_name;
   }
    : modify_load_balancer_attributes_output)

let modify_load_balancer_attributes_input_of_xml i =
  let r_load_balancer_attributes = ref None in
  let r_load_balancer_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "LoadBalancerAttributes"; "LoadBalancerName" ]
    (fun tag _ ->
      match tag with
      | "LoadBalancerAttributes" ->
          r_load_balancer_attributes :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LoadBalancerAttributes"
                 (fun i _ -> load_balancer_attributes_of_xml i)
                 ())
      | "LoadBalancerName" ->
          r_load_balancer_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LoadBalancerName"
                 (fun i _ -> access_point_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     load_balancer_attributes =
       Smaws_Lib.Xml.Parse.required "LoadBalancerAttributes" (( ! ) r_load_balancer_attributes) i;
     load_balancer_name =
       Smaws_Lib.Xml.Parse.required "LoadBalancerName" (( ! ) r_load_balancer_name) i;
   }
    : modify_load_balancer_attributes_input)

let load_balancer_attribute_not_found_exception_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Message" ] (fun tag _ ->
      match tag with
      | "Message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Message"
                 (fun i _ -> error_description_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : load_balancer_attribute_not_found_exception)

let max_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let marker_of_xml i = Smaws_Lib.Xml.Parse.Read.data i
let load_balancer_scheme_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let load_balancer_names_max20_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> access_point_name_of_xml i) ()

let dns_name_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let instance_port_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let listener_of_xml i =
  let r_ssl_certificate_id = ref None in
  let r_instance_port = ref None in
  let r_instance_protocol = ref None in
  let r_load_balancer_port = ref None in
  let r_protocol = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "SSLCertificateId"; "InstancePort"; "InstanceProtocol"; "LoadBalancerPort"; "Protocol" ]
    (fun tag _ ->
      match tag with
      | "SSLCertificateId" ->
          r_ssl_certificate_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SSLCertificateId"
                 (fun i _ -> ssl_certificate_id_of_xml i)
                 ())
      | "InstancePort" ->
          r_instance_port :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "InstancePort"
                 (fun i _ -> instance_port_of_xml i)
                 ())
      | "InstanceProtocol" ->
          r_instance_protocol :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "InstanceProtocol"
                 (fun i _ -> protocol_of_xml i)
                 ())
      | "LoadBalancerPort" ->
          r_load_balancer_port :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LoadBalancerPort"
                 (fun i _ -> access_point_port_of_xml i)
                 ())
      | "Protocol" ->
          r_protocol :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Protocol" (fun i _ -> protocol_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     ssl_certificate_id = ( ! ) r_ssl_certificate_id;
     instance_port = Smaws_Lib.Xml.Parse.required "InstancePort" (( ! ) r_instance_port) i;
     instance_protocol = ( ! ) r_instance_protocol;
     load_balancer_port =
       Smaws_Lib.Xml.Parse.required "LoadBalancerPort" (( ! ) r_load_balancer_port) i;
     protocol = Smaws_Lib.Xml.Parse.required "Protocol" (( ! ) r_protocol) i;
   }
    : listener)

let listener_description_of_xml i =
  let r_policy_names = ref None in
  let r_listener = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "PolicyNames"; "Listener" ] (fun tag _ ->
      match tag with
      | "PolicyNames" ->
          r_policy_names :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PolicyNames"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> policy_name_of_xml i)
                     ())
                 ())
      | "Listener" ->
          r_listener :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Listener" (fun i _ -> listener_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ policy_names = ( ! ) r_policy_names; listener = ( ! ) r_listener } : listener_description)

let listener_descriptions_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> listener_description_of_xml i) ()

let backend_server_description_of_xml i =
  let r_policy_names = ref None in
  let r_instance_port = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "PolicyNames"; "InstancePort" ] (fun tag _ ->
      match tag with
      | "PolicyNames" ->
          r_policy_names :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PolicyNames"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> policy_name_of_xml i)
                     ())
                 ())
      | "InstancePort" ->
          r_instance_port :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "InstancePort"
                 (fun i _ -> instance_port_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ policy_names = ( ! ) r_policy_names; instance_port = ( ! ) r_instance_port }
    : backend_server_description)

let backend_server_descriptions_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> backend_server_description_of_xml i) ()

let health_check_target_of_xml i = Smaws_Lib.Xml.Parse.Read.data i

let health_check_interval_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let health_check_timeout_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let healthy_threshold_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.int_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let health_check_of_xml i =
  let r_healthy_threshold = ref None in
  let r_unhealthy_threshold = ref None in
  let r_timeout = ref None in
  let r_interval = ref None in
  let r_target = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "HealthyThreshold"; "UnhealthyThreshold"; "Timeout"; "Interval"; "Target" ] (fun tag _ ->
      match tag with
      | "HealthyThreshold" ->
          r_healthy_threshold :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "HealthyThreshold"
                 (fun i _ -> healthy_threshold_of_xml i)
                 ())
      | "UnhealthyThreshold" ->
          r_unhealthy_threshold :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "UnhealthyThreshold"
                 (fun i _ -> unhealthy_threshold_of_xml i)
                 ())
      | "Timeout" ->
          r_timeout :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Timeout"
                 (fun i _ -> health_check_timeout_of_xml i)
                 ())
      | "Interval" ->
          r_interval :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Interval"
                 (fun i _ -> health_check_interval_of_xml i)
                 ())
      | "Target" ->
          r_target :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Target"
                 (fun i _ -> health_check_target_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     healthy_threshold =
       Smaws_Lib.Xml.Parse.required "HealthyThreshold" (( ! ) r_healthy_threshold) i;
     unhealthy_threshold =
       Smaws_Lib.Xml.Parse.required "UnhealthyThreshold" (( ! ) r_unhealthy_threshold) i;
     timeout = Smaws_Lib.Xml.Parse.required "Timeout" (( ! ) r_timeout) i;
     interval = Smaws_Lib.Xml.Parse.required "Interval" (( ! ) r_interval) i;
     target = Smaws_Lib.Xml.Parse.required "Target" (( ! ) r_target) i;
   }
    : health_check)

let created_time_of_xml i =
  Smaws_Lib.Protocols.AwsQuery.Deserialize.timestamp_iso_of_string (Smaws_Lib.Xml.Parse.Read.data i)

let load_balancer_description_of_xml i =
  let r_scheme = ref None in
  let r_created_time = ref None in
  let r_security_groups = ref None in
  let r_source_security_group = ref None in
  let r_health_check = ref None in
  let r_instances = ref None in
  let r_vpc_id = ref None in
  let r_subnets = ref None in
  let r_availability_zones = ref None in
  let r_backend_server_descriptions = ref None in
  let r_policies = ref None in
  let r_listener_descriptions = ref None in
  let r_canonical_hosted_zone_name_i_d = ref None in
  let r_canonical_hosted_zone_name = ref None in
  let r_dns_name = ref None in
  let r_load_balancer_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "Scheme";
      "CreatedTime";
      "SecurityGroups";
      "SourceSecurityGroup";
      "HealthCheck";
      "Instances";
      "VPCId";
      "Subnets";
      "AvailabilityZones";
      "BackendServerDescriptions";
      "Policies";
      "ListenerDescriptions";
      "CanonicalHostedZoneNameID";
      "CanonicalHostedZoneName";
      "DNSName";
      "LoadBalancerName";
    ] (fun tag _ ->
      match tag with
      | "Scheme" ->
          r_scheme :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Scheme"
                 (fun i _ -> load_balancer_scheme_of_xml i)
                 ())
      | "CreatedTime" ->
          r_created_time :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CreatedTime"
                 (fun i _ -> created_time_of_xml i)
                 ())
      | "SecurityGroups" ->
          r_security_groups :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SecurityGroups"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> security_group_id_of_xml i)
                     ())
                 ())
      | "SourceSecurityGroup" ->
          r_source_security_group :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SourceSecurityGroup"
                 (fun i _ -> source_security_group_of_xml i)
                 ())
      | "HealthCheck" ->
          r_health_check :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "HealthCheck"
                 (fun i _ -> health_check_of_xml i)
                 ())
      | "Instances" ->
          r_instances :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Instances"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> instance_of_xml i) ())
                 ())
      | "VPCId" ->
          r_vpc_id :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "VPCId" (fun i _ -> vpc_id_of_xml i) ())
      | "Subnets" ->
          r_subnets :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Subnets"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> subnet_id_of_xml i) ())
                 ())
      | "AvailabilityZones" ->
          r_availability_zones :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AvailabilityZones"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> availability_zone_of_xml i)
                     ())
                 ())
      | "BackendServerDescriptions" ->
          r_backend_server_descriptions :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "BackendServerDescriptions"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> backend_server_description_of_xml i)
                     ())
                 ())
      | "Policies" ->
          r_policies :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Policies" (fun i _ -> policies_of_xml i) ())
      | "ListenerDescriptions" ->
          r_listener_descriptions :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ListenerDescriptions"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> listener_description_of_xml i)
                     ())
                 ())
      | "CanonicalHostedZoneNameID" ->
          r_canonical_hosted_zone_name_i_d :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CanonicalHostedZoneNameID"
                 (fun i _ -> dns_name_of_xml i)
                 ())
      | "CanonicalHostedZoneName" ->
          r_canonical_hosted_zone_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CanonicalHostedZoneName"
                 (fun i _ -> dns_name_of_xml i)
                 ())
      | "DNSName" ->
          r_dns_name :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "DNSName" (fun i _ -> dns_name_of_xml i) ())
      | "LoadBalancerName" ->
          r_load_balancer_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LoadBalancerName"
                 (fun i _ -> access_point_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     scheme = ( ! ) r_scheme;
     created_time = ( ! ) r_created_time;
     security_groups = ( ! ) r_security_groups;
     source_security_group = ( ! ) r_source_security_group;
     health_check = ( ! ) r_health_check;
     instances = ( ! ) r_instances;
     vpc_id = ( ! ) r_vpc_id;
     subnets = ( ! ) r_subnets;
     availability_zones = ( ! ) r_availability_zones;
     backend_server_descriptions = ( ! ) r_backend_server_descriptions;
     policies = ( ! ) r_policies;
     listener_descriptions = ( ! ) r_listener_descriptions;
     canonical_hosted_zone_name_i_d = ( ! ) r_canonical_hosted_zone_name_i_d;
     canonical_hosted_zone_name = ( ! ) r_canonical_hosted_zone_name;
     dns_name = ( ! ) r_dns_name;
     load_balancer_name = ( ! ) r_load_balancer_name;
   }
    : load_balancer_description)

let load_balancer_descriptions_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> load_balancer_description_of_xml i) ()

let listeners_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> listener_of_xml i) ()

let limit_of_xml i =
  let r_max = ref None in
  let r_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Max"; "Name" ] (fun tag _ ->
      match tag with
      | "Max" ->
          r_max := Some (Smaws_Lib.Xml.Parse.Read.sequence i "Max" (fun i _ -> max_of_xml i) ())
      | "Name" ->
          r_name := Some (Smaws_Lib.Xml.Parse.Read.sequence i "Name" (fun i _ -> name_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ max = ( ! ) r_max; name = ( ! ) r_name } : limit)

let limits_of_xml i = Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> limit_of_xml i) ()

let invalid_subnet_exception_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Message" ] (fun tag _ ->
      match tag with
      | "Message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Message"
                 (fun i _ -> error_description_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : invalid_subnet_exception)

let invalid_security_group_exception_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Message" ] (fun tag _ ->
      match tag with
      | "Message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Message"
                 (fun i _ -> error_description_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : invalid_security_group_exception)

let invalid_scheme_exception_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Message" ] (fun tag _ ->
      match tag with
      | "Message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Message"
                 (fun i _ -> error_description_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : invalid_scheme_exception)

let instance_state_of_xml i =
  let r_description = ref None in
  let r_reason_code = ref None in
  let r_state = ref None in
  let r_instance_id = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "Description"; "ReasonCode"; "State"; "InstanceId" ] (fun tag _ ->
      match tag with
      | "Description" ->
          r_description :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Description"
                 (fun i _ -> description_of_xml i)
                 ())
      | "ReasonCode" ->
          r_reason_code :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "ReasonCode"
                 (fun i _ -> reason_code_of_xml i)
                 ())
      | "State" ->
          r_state :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "State" (fun i _ -> state_of_xml i) ())
      | "InstanceId" ->
          r_instance_id :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "InstanceId"
                 (fun i _ -> instance_id_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     description = ( ! ) r_description;
     reason_code = ( ! ) r_reason_code;
     state = ( ! ) r_state;
     instance_id = ( ! ) r_instance_id;
   }
    : instance_state)

let instance_states_of_xml i =
  Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> instance_state_of_xml i) ()

let add_availability_zones_output_of_xml i =
  let r_availability_zones = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "AvailabilityZones" ] (fun tag _ ->
      match tag with
      | "AvailabilityZones" ->
          r_availability_zones :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AvailabilityZones"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> availability_zone_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ availability_zones = ( ! ) r_availability_zones } : add_availability_zones_output)

let add_availability_zones_input_of_xml i =
  let r_availability_zones = ref None in
  let r_load_balancer_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "AvailabilityZones"; "LoadBalancerName" ]
    (fun tag _ ->
      match tag with
      | "AvailabilityZones" ->
          r_availability_zones :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AvailabilityZones"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> availability_zone_of_xml i)
                     ())
                 ())
      | "LoadBalancerName" ->
          r_load_balancer_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LoadBalancerName"
                 (fun i _ -> access_point_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     availability_zones =
       Smaws_Lib.Xml.Parse.required "AvailabilityZones" (( ! ) r_availability_zones) i;
     load_balancer_name =
       Smaws_Lib.Xml.Parse.required "LoadBalancerName" (( ! ) r_load_balancer_name) i;
   }
    : add_availability_zones_input)

let detach_load_balancer_from_subnets_output_of_xml i =
  let r_subnets = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Subnets" ] (fun tag _ ->
      match tag with
      | "Subnets" ->
          r_subnets :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Subnets"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> subnet_id_of_xml i) ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ subnets = ( ! ) r_subnets } : detach_load_balancer_from_subnets_output)

let detach_load_balancer_from_subnets_input_of_xml i =
  let r_subnets = ref None in
  let r_load_balancer_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Subnets"; "LoadBalancerName" ] (fun tag _ ->
      match tag with
      | "Subnets" ->
          r_subnets :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Subnets"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> subnet_id_of_xml i) ())
                 ())
      | "LoadBalancerName" ->
          r_load_balancer_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LoadBalancerName"
                 (fun i _ -> access_point_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     subnets = Smaws_Lib.Xml.Parse.required "Subnets" (( ! ) r_subnets) i;
     load_balancer_name =
       Smaws_Lib.Xml.Parse.required "LoadBalancerName" (( ! ) r_load_balancer_name) i;
   }
    : detach_load_balancer_from_subnets_input)

let describe_tags_output_of_xml i =
  let r_tag_descriptions = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "TagDescriptions" ] (fun tag _ ->
      match tag with
      | "TagDescriptions" ->
          r_tag_descriptions :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "TagDescriptions"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> tag_description_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ tag_descriptions = ( ! ) r_tag_descriptions } : describe_tags_output)

let describe_tags_input_of_xml i =
  let r_load_balancer_names = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "LoadBalancerNames" ] (fun tag _ ->
      match tag with
      | "LoadBalancerNames" ->
          r_load_balancer_names :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LoadBalancerNames"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> access_point_name_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     load_balancer_names =
       Smaws_Lib.Xml.Parse.required "LoadBalancerNames" (( ! ) r_load_balancer_names) i;
   }
    : describe_tags_input)

let dependency_throttle_exception_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Message" ] (fun tag _ ->
      match tag with
      | "Message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Message"
                 (fun i _ -> error_description_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : dependency_throttle_exception)

let describe_access_points_output_of_xml i =
  let r_next_marker = ref None in
  let r_load_balancer_descriptions = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "NextMarker"; "LoadBalancerDescriptions" ]
    (fun tag _ ->
      match tag with
      | "NextMarker" ->
          r_next_marker :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "NextMarker" (fun i _ -> marker_of_xml i) ())
      | "LoadBalancerDescriptions" ->
          r_load_balancer_descriptions :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LoadBalancerDescriptions"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> load_balancer_description_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     next_marker = ( ! ) r_next_marker;
     load_balancer_descriptions = ( ! ) r_load_balancer_descriptions;
   }
    : describe_access_points_output)

let describe_access_points_input_of_xml i =
  let r_page_size = ref None in
  let r_marker = ref None in
  let r_load_balancer_names = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "PageSize"; "Marker"; "LoadBalancerNames" ]
    (fun tag _ ->
      match tag with
      | "PageSize" ->
          r_page_size :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "PageSize" (fun i _ -> page_size_of_xml i) ())
      | "Marker" ->
          r_marker :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Marker" (fun i _ -> marker_of_xml i) ())
      | "LoadBalancerNames" ->
          r_load_balancer_names :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LoadBalancerNames"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> access_point_name_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     page_size = ( ! ) r_page_size;
     marker = ( ! ) r_marker;
     load_balancer_names = ( ! ) r_load_balancer_names;
   }
    : describe_access_points_input)

let describe_load_balancer_policy_types_output_of_xml i =
  let r_policy_type_descriptions = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "PolicyTypeDescriptions" ] (fun tag _ ->
      match tag with
      | "PolicyTypeDescriptions" ->
          r_policy_type_descriptions :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PolicyTypeDescriptions"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> policy_type_description_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ policy_type_descriptions = ( ! ) r_policy_type_descriptions }
    : describe_load_balancer_policy_types_output)

let describe_load_balancer_policy_types_input_of_xml i =
  let r_policy_type_names = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "PolicyTypeNames" ] (fun tag _ ->
      match tag with
      | "PolicyTypeNames" ->
          r_policy_type_names :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PolicyTypeNames"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> policy_type_name_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ policy_type_names = ( ! ) r_policy_type_names } : describe_load_balancer_policy_types_input)

let describe_load_balancer_policies_output_of_xml i =
  let r_policy_descriptions = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "PolicyDescriptions" ] (fun tag _ ->
      match tag with
      | "PolicyDescriptions" ->
          r_policy_descriptions :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PolicyDescriptions"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> policy_description_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ policy_descriptions = ( ! ) r_policy_descriptions } : describe_load_balancer_policies_output)

let describe_load_balancer_policies_input_of_xml i =
  let r_policy_names = ref None in
  let r_load_balancer_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "PolicyNames"; "LoadBalancerName" ] (fun tag _ ->
      match tag with
      | "PolicyNames" ->
          r_policy_names :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PolicyNames"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> policy_name_of_xml i)
                     ())
                 ())
      | "LoadBalancerName" ->
          r_load_balancer_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LoadBalancerName"
                 (fun i _ -> access_point_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ policy_names = ( ! ) r_policy_names; load_balancer_name = ( ! ) r_load_balancer_name }
    : describe_load_balancer_policies_input)

let describe_load_balancer_attributes_output_of_xml i =
  let r_load_balancer_attributes = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "LoadBalancerAttributes" ] (fun tag _ ->
      match tag with
      | "LoadBalancerAttributes" ->
          r_load_balancer_attributes :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LoadBalancerAttributes"
                 (fun i _ -> load_balancer_attributes_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ load_balancer_attributes = ( ! ) r_load_balancer_attributes }
    : describe_load_balancer_attributes_output)

let describe_load_balancer_attributes_input_of_xml i =
  let r_load_balancer_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "LoadBalancerName" ] (fun tag _ ->
      match tag with
      | "LoadBalancerName" ->
          r_load_balancer_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LoadBalancerName"
                 (fun i _ -> access_point_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     load_balancer_name =
       Smaws_Lib.Xml.Parse.required "LoadBalancerName" (( ! ) r_load_balancer_name) i;
   }
    : describe_load_balancer_attributes_input)

let describe_end_point_state_output_of_xml i =
  let r_instance_states = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "InstanceStates" ] (fun tag _ ->
      match tag with
      | "InstanceStates" ->
          r_instance_states :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "InstanceStates"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> instance_state_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ instance_states = ( ! ) r_instance_states } : describe_end_point_state_output)

let describe_end_point_state_input_of_xml i =
  let r_instances = ref None in
  let r_load_balancer_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Instances"; "LoadBalancerName" ] (fun tag _ ->
      match tag with
      | "Instances" ->
          r_instances :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Instances"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> instance_of_xml i) ())
                 ())
      | "LoadBalancerName" ->
          r_load_balancer_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LoadBalancerName"
                 (fun i _ -> access_point_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     instances = ( ! ) r_instances;
     load_balancer_name =
       Smaws_Lib.Xml.Parse.required "LoadBalancerName" (( ! ) r_load_balancer_name) i;
   }
    : describe_end_point_state_input)

let describe_account_limits_output_of_xml i =
  let r_next_marker = ref None in
  let r_limits = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "NextMarker"; "Limits" ] (fun tag _ ->
      match tag with
      | "NextMarker" ->
          r_next_marker :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "NextMarker" (fun i _ -> marker_of_xml i) ())
      | "Limits" ->
          r_limits :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Limits"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> limit_of_xml i) ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ next_marker = ( ! ) r_next_marker; limits = ( ! ) r_limits } : describe_account_limits_output)

let describe_account_limits_input_of_xml i =
  let r_page_size = ref None in
  let r_marker = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "PageSize"; "Marker" ] (fun tag _ ->
      match tag with
      | "PageSize" ->
          r_page_size :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "PageSize" (fun i _ -> page_size_of_xml i) ())
      | "Marker" ->
          r_marker :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "Marker" (fun i _ -> marker_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ page_size = ( ! ) r_page_size; marker = ( ! ) r_marker } : describe_account_limits_input)

let deregister_end_points_output_of_xml i =
  let r_instances = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Instances" ] (fun tag _ ->
      match tag with
      | "Instances" ->
          r_instances :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Instances"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> instance_of_xml i) ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ instances = ( ! ) r_instances } : deregister_end_points_output)

let deregister_end_points_input_of_xml i =
  let r_instances = ref None in
  let r_load_balancer_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Instances"; "LoadBalancerName" ] (fun tag _ ->
      match tag with
      | "Instances" ->
          r_instances :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Instances"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> instance_of_xml i) ())
                 ())
      | "LoadBalancerName" ->
          r_load_balancer_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LoadBalancerName"
                 (fun i _ -> access_point_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     instances = Smaws_Lib.Xml.Parse.required "Instances" (( ! ) r_instances) i;
     load_balancer_name =
       Smaws_Lib.Xml.Parse.required "LoadBalancerName" (( ! ) r_load_balancer_name) i;
   }
    : deregister_end_points_input)

let delete_load_balancer_policy_output_of_xml i = ()

let delete_load_balancer_policy_input_of_xml i =
  let r_policy_name = ref None in
  let r_load_balancer_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "PolicyName"; "LoadBalancerName" ] (fun tag _ ->
      match tag with
      | "PolicyName" ->
          r_policy_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PolicyName"
                 (fun i _ -> policy_name_of_xml i)
                 ())
      | "LoadBalancerName" ->
          r_load_balancer_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LoadBalancerName"
                 (fun i _ -> access_point_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     policy_name = Smaws_Lib.Xml.Parse.required "PolicyName" (( ! ) r_policy_name) i;
     load_balancer_name =
       Smaws_Lib.Xml.Parse.required "LoadBalancerName" (( ! ) r_load_balancer_name) i;
   }
    : delete_load_balancer_policy_input)

let delete_load_balancer_listener_output_of_xml i = ()

let delete_load_balancer_listener_input_of_xml i =
  let r_load_balancer_ports = ref None in
  let r_load_balancer_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "LoadBalancerPorts"; "LoadBalancerName" ]
    (fun tag _ ->
      match tag with
      | "LoadBalancerPorts" ->
          r_load_balancer_ports :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LoadBalancerPorts"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> access_point_port_of_xml i)
                     ())
                 ())
      | "LoadBalancerName" ->
          r_load_balancer_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LoadBalancerName"
                 (fun i _ -> access_point_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     load_balancer_ports =
       Smaws_Lib.Xml.Parse.required "LoadBalancerPorts" (( ! ) r_load_balancer_ports) i;
     load_balancer_name =
       Smaws_Lib.Xml.Parse.required "LoadBalancerName" (( ! ) r_load_balancer_name) i;
   }
    : delete_load_balancer_listener_input)

let delete_access_point_output_of_xml i = ()

let delete_access_point_input_of_xml i =
  let r_load_balancer_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "LoadBalancerName" ] (fun tag _ ->
      match tag with
      | "LoadBalancerName" ->
          r_load_balancer_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LoadBalancerName"
                 (fun i _ -> access_point_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     load_balancer_name =
       Smaws_Lib.Xml.Parse.required "LoadBalancerName" (( ! ) r_load_balancer_name) i;
   }
    : delete_access_point_input)

let duplicate_policy_name_exception_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Message" ] (fun tag _ ->
      match tag with
      | "Message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Message"
                 (fun i _ -> error_description_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : duplicate_policy_name_exception)

let create_load_balancer_policy_output_of_xml i = ()

let create_load_balancer_policy_input_of_xml i =
  let r_policy_attributes = ref None in
  let r_policy_type_name = ref None in
  let r_policy_name = ref None in
  let r_load_balancer_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "PolicyAttributes"; "PolicyTypeName"; "PolicyName"; "LoadBalancerName" ] (fun tag _ ->
      match tag with
      | "PolicyAttributes" ->
          r_policy_attributes :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PolicyAttributes"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> policy_attribute_of_xml i)
                     ())
                 ())
      | "PolicyTypeName" ->
          r_policy_type_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PolicyTypeName"
                 (fun i _ -> policy_type_name_of_xml i)
                 ())
      | "PolicyName" ->
          r_policy_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PolicyName"
                 (fun i _ -> policy_name_of_xml i)
                 ())
      | "LoadBalancerName" ->
          r_load_balancer_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LoadBalancerName"
                 (fun i _ -> access_point_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     policy_attributes = ( ! ) r_policy_attributes;
     policy_type_name = Smaws_Lib.Xml.Parse.required "PolicyTypeName" (( ! ) r_policy_type_name) i;
     policy_name = Smaws_Lib.Xml.Parse.required "PolicyName" (( ! ) r_policy_name) i;
     load_balancer_name =
       Smaws_Lib.Xml.Parse.required "LoadBalancerName" (( ! ) r_load_balancer_name) i;
   }
    : create_load_balancer_policy_input)

let duplicate_listener_exception_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Message" ] (fun tag _ ->
      match tag with
      | "Message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Message"
                 (fun i _ -> error_description_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : duplicate_listener_exception)

let create_load_balancer_listener_output_of_xml i = ()

let create_load_balancer_listener_input_of_xml i =
  let r_listeners = ref None in
  let r_load_balancer_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Listeners"; "LoadBalancerName" ] (fun tag _ ->
      match tag with
      | "Listeners" ->
          r_listeners :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Listeners"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> listener_of_xml i) ())
                 ())
      | "LoadBalancerName" ->
          r_load_balancer_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LoadBalancerName"
                 (fun i _ -> access_point_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     listeners = Smaws_Lib.Xml.Parse.required "Listeners" (( ! ) r_listeners) i;
     load_balancer_name =
       Smaws_Lib.Xml.Parse.required "LoadBalancerName" (( ! ) r_load_balancer_name) i;
   }
    : create_load_balancer_listener_input)

let duplicate_tag_keys_exception_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Message" ] (fun tag _ ->
      match tag with
      | "Message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Message"
                 (fun i _ -> error_description_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : duplicate_tag_keys_exception)

let duplicate_access_point_name_exception_of_xml i =
  let r_message = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Message" ] (fun tag _ ->
      match tag with
      | "Message" ->
          r_message :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Message"
                 (fun i _ -> error_description_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ message = ( ! ) r_message } : duplicate_access_point_name_exception)

let create_access_point_output_of_xml i =
  let r_dns_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "DNSName" ] (fun tag _ ->
      match tag with
      | "DNSName" ->
          r_dns_name :=
            Some (Smaws_Lib.Xml.Parse.Read.sequence i "DNSName" (fun i _ -> dns_name_of_xml i) ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ dns_name = ( ! ) r_dns_name } : create_access_point_output)

let create_access_point_input_of_xml i =
  let r_tags = ref None in
  let r_scheme = ref None in
  let r_security_groups = ref None in
  let r_subnets = ref None in
  let r_availability_zones = ref None in
  let r_listeners = ref None in
  let r_load_balancer_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [
      "Tags";
      "Scheme";
      "SecurityGroups";
      "Subnets";
      "AvailabilityZones";
      "Listeners";
      "LoadBalancerName";
    ] (fun tag _ ->
      match tag with
      | "Tags" ->
          r_tags :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Tags"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> tag_of_xml i) ())
                 ())
      | "Scheme" ->
          r_scheme :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Scheme"
                 (fun i _ -> load_balancer_scheme_of_xml i)
                 ())
      | "SecurityGroups" ->
          r_security_groups :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SecurityGroups"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> security_group_id_of_xml i)
                     ())
                 ())
      | "Subnets" ->
          r_subnets :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Subnets"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> subnet_id_of_xml i) ())
                 ())
      | "AvailabilityZones" ->
          r_availability_zones :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "AvailabilityZones"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> availability_zone_of_xml i)
                     ())
                 ())
      | "Listeners" ->
          r_listeners :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Listeners"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> listener_of_xml i) ())
                 ())
      | "LoadBalancerName" ->
          r_load_balancer_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LoadBalancerName"
                 (fun i _ -> access_point_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     tags = ( ! ) r_tags;
     scheme = ( ! ) r_scheme;
     security_groups = ( ! ) r_security_groups;
     subnets = ( ! ) r_subnets;
     availability_zones = ( ! ) r_availability_zones;
     listeners = Smaws_Lib.Xml.Parse.required "Listeners" (( ! ) r_listeners) i;
     load_balancer_name =
       Smaws_Lib.Xml.Parse.required "LoadBalancerName" (( ! ) r_load_balancer_name) i;
   }
    : create_access_point_input)

let create_lb_cookie_stickiness_policy_output_of_xml i = ()

let create_lb_cookie_stickiness_policy_input_of_xml i =
  let r_cookie_expiration_period = ref None in
  let r_policy_name = ref None in
  let r_load_balancer_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i
    [ "CookieExpirationPeriod"; "PolicyName"; "LoadBalancerName" ] (fun tag _ ->
      match tag with
      | "CookieExpirationPeriod" ->
          r_cookie_expiration_period :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CookieExpirationPeriod"
                 (fun i _ -> cookie_expiration_period_of_xml i)
                 ())
      | "PolicyName" ->
          r_policy_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PolicyName"
                 (fun i _ -> policy_name_of_xml i)
                 ())
      | "LoadBalancerName" ->
          r_load_balancer_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LoadBalancerName"
                 (fun i _ -> access_point_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     cookie_expiration_period = ( ! ) r_cookie_expiration_period;
     policy_name = Smaws_Lib.Xml.Parse.required "PolicyName" (( ! ) r_policy_name) i;
     load_balancer_name =
       Smaws_Lib.Xml.Parse.required "LoadBalancerName" (( ! ) r_load_balancer_name) i;
   }
    : create_lb_cookie_stickiness_policy_input)

let create_app_cookie_stickiness_policy_output_of_xml i = ()

let create_app_cookie_stickiness_policy_input_of_xml i =
  let r_cookie_name = ref None in
  let r_policy_name = ref None in
  let r_load_balancer_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "CookieName"; "PolicyName"; "LoadBalancerName" ]
    (fun tag _ ->
      match tag with
      | "CookieName" ->
          r_cookie_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "CookieName"
                 (fun i _ -> cookie_name_of_xml i)
                 ())
      | "PolicyName" ->
          r_policy_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "PolicyName"
                 (fun i _ -> policy_name_of_xml i)
                 ())
      | "LoadBalancerName" ->
          r_load_balancer_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LoadBalancerName"
                 (fun i _ -> access_point_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     cookie_name = Smaws_Lib.Xml.Parse.required "CookieName" (( ! ) r_cookie_name) i;
     policy_name = Smaws_Lib.Xml.Parse.required "PolicyName" (( ! ) r_policy_name) i;
     load_balancer_name =
       Smaws_Lib.Xml.Parse.required "LoadBalancerName" (( ! ) r_load_balancer_name) i;
   }
    : create_app_cookie_stickiness_policy_input)

let configure_health_check_output_of_xml i =
  let r_health_check = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "HealthCheck" ] (fun tag _ ->
      match tag with
      | "HealthCheck" ->
          r_health_check :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "HealthCheck"
                 (fun i _ -> health_check_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ health_check = ( ! ) r_health_check } : configure_health_check_output)

let configure_health_check_input_of_xml i =
  let r_health_check = ref None in
  let r_load_balancer_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "HealthCheck"; "LoadBalancerName" ] (fun tag _ ->
      match tag with
      | "HealthCheck" ->
          r_health_check :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "HealthCheck"
                 (fun i _ -> health_check_of_xml i)
                 ())
      | "LoadBalancerName" ->
          r_load_balancer_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LoadBalancerName"
                 (fun i _ -> access_point_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     health_check = Smaws_Lib.Xml.Parse.required "HealthCheck" (( ! ) r_health_check) i;
     load_balancer_name =
       Smaws_Lib.Xml.Parse.required "LoadBalancerName" (( ! ) r_load_balancer_name) i;
   }
    : configure_health_check_input)

let attach_load_balancer_to_subnets_output_of_xml i =
  let r_subnets = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Subnets" ] (fun tag _ ->
      match tag with
      | "Subnets" ->
          r_subnets :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Subnets"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> subnet_id_of_xml i) ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ subnets = ( ! ) r_subnets } : attach_load_balancer_to_subnets_output)

let attach_load_balancer_to_subnets_input_of_xml i =
  let r_subnets = ref None in
  let r_load_balancer_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Subnets"; "LoadBalancerName" ] (fun tag _ ->
      match tag with
      | "Subnets" ->
          r_subnets :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Subnets"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> subnet_id_of_xml i) ())
                 ())
      | "LoadBalancerName" ->
          r_load_balancer_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LoadBalancerName"
                 (fun i _ -> access_point_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     subnets = Smaws_Lib.Xml.Parse.required "Subnets" (( ! ) r_subnets) i;
     load_balancer_name =
       Smaws_Lib.Xml.Parse.required "LoadBalancerName" (( ! ) r_load_balancer_name) i;
   }
    : attach_load_balancer_to_subnets_input)

let apply_security_groups_to_load_balancer_output_of_xml i =
  let r_security_groups = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "SecurityGroups" ] (fun tag _ ->
      match tag with
      | "SecurityGroups" ->
          r_security_groups :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SecurityGroups"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> security_group_id_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({ security_groups = ( ! ) r_security_groups } : apply_security_groups_to_load_balancer_output)

let apply_security_groups_to_load_balancer_input_of_xml i =
  let r_security_groups = ref None in
  let r_load_balancer_name = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "SecurityGroups"; "LoadBalancerName" ]
    (fun tag _ ->
      match tag with
      | "SecurityGroups" ->
          r_security_groups :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "SecurityGroups"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> security_group_id_of_xml i)
                     ())
                 ())
      | "LoadBalancerName" ->
          r_load_balancer_name :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LoadBalancerName"
                 (fun i _ -> access_point_name_of_xml i)
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     security_groups = Smaws_Lib.Xml.Parse.required "SecurityGroups" (( ! ) r_security_groups) i;
     load_balancer_name =
       Smaws_Lib.Xml.Parse.required "LoadBalancerName" (( ! ) r_load_balancer_name) i;
   }
    : apply_security_groups_to_load_balancer_input)

let add_tags_output_of_xml i = ()

let add_tags_input_of_xml i =
  let r_tags = ref None in
  let r_load_balancer_names = ref None in
  Smaws_Lib.Xml.Parse.Structure.scanSequence i [ "Tags"; "LoadBalancerNames" ] (fun tag _ ->
      match tag with
      | "Tags" ->
          r_tags :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "Tags"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member" (fun i _ -> tag_of_xml i) ())
                 ())
      | "LoadBalancerNames" ->
          r_load_balancer_names :=
            Some
              (Smaws_Lib.Xml.Parse.Read.sequence i "LoadBalancerNames"
                 (fun i _ ->
                   Smaws_Lib.Xml.Parse.Read.sequences i "member"
                     (fun i _ -> access_point_name_of_xml i)
                     ())
                 ())
      | _ -> Smaws_Lib.Xml.Parse.Read.skip_element i);
  ({
     tags = Smaws_Lib.Xml.Parse.required "Tags" (( ! ) r_tags) i;
     load_balancer_names =
       Smaws_Lib.Xml.Parse.required "LoadBalancerNames" (( ! ) r_load_balancer_names) i;
   }
    : add_tags_input)
