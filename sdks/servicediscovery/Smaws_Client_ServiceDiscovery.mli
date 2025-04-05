(** 
    ServiceDiscovery client library built on EIO.
    
*)

open Smaws_Lib

(** {1:types Types} *)

val service : Smaws_Lib.Service.descriptor
type nonrec update_service_response = {
  operation_id: string option }
type nonrec record_type =
  | CNAME 
  | AAAA 
  | A 
  | SRV 
type nonrec dns_record = {
  tt_l: int ;
  type_: record_type }
type nonrec dns_config_change = {
  dns_records: dns_record list }
type nonrec health_check_type =
  | TCP 
  | HTTPS 
  | HTTP 
type nonrec health_check_config =
  {
  failure_threshold: int option ;
  resource_path: string option ;
  type_: health_check_type }
type nonrec service_change =
  {
  health_check_config: health_check_config option ;
  dns_config: dns_config_change option ;
  description: string option }
type nonrec update_service_request = {
  service: service_change ;
  id: string }
type nonrec service_not_found = {
  message: string option }
type nonrec invalid_input = {
  message: string option }
type nonrec duplicate_request =
  {
  duplicate_operation_id: string option ;
  message: string option }
type nonrec update_public_dns_namespace_response =
  {
  operation_id: string option }
type nonrec soa_change = {
  tt_l: int }
type nonrec public_dns_properties_mutable_change = {
  so_a: soa_change }
type nonrec public_dns_namespace_properties_change =
  {
  dns_properties: public_dns_properties_mutable_change }
type nonrec public_dns_namespace_change =
  {
  properties: public_dns_namespace_properties_change option ;
  description: string option }
type nonrec update_public_dns_namespace_request =
  {
  namespace: public_dns_namespace_change ;
  updater_request_id: string option ;
  id: string }
type nonrec resource_in_use = {
  message: string option }
type nonrec namespace_not_found = {
  message: string option }
type nonrec update_private_dns_namespace_response =
  {
  operation_id: string option }
type nonrec private_dns_properties_mutable_change = {
  so_a: soa_change }
type nonrec private_dns_namespace_properties_change =
  {
  dns_properties: private_dns_properties_mutable_change }
type nonrec private_dns_namespace_change =
  {
  properties: private_dns_namespace_properties_change option ;
  description: string option }
type nonrec update_private_dns_namespace_request =
  {
  namespace: private_dns_namespace_change ;
  updater_request_id: string option ;
  id: string }
type nonrec custom_health_status =
  | UNHEALTHY 
  | HEALTHY 
type nonrec update_instance_custom_health_status_request =
  {
  status: custom_health_status ;
  instance_id: string ;
  service_id: string }
type nonrec instance_not_found = {
  message: string option }
type nonrec custom_health_not_found = {
  message: string option }
type nonrec update_http_namespace_response = {
  operation_id: string option }
type nonrec http_namespace_change = {
  description: string }
type nonrec update_http_namespace_request =
  {
  namespace: http_namespace_change ;
  updater_request_id: string option ;
  id: string }
type nonrec untag_resource_response = unit
type nonrec untag_resource_request =
  {
  tag_keys: string list ;
  resource_ar_n: string }
type nonrec resource_not_found_exception = {
  message: string option }
type nonrec too_many_tags_exception =
  {
  resource_name: string option ;
  message: string option }
type nonrec tag_resource_response = unit
type nonrec tag = {
  value: string ;
  key: string }
type nonrec tag_resource_request = {
  tags: tag list ;
  resource_ar_n: string }
type nonrec service_type_option =
  | HTTP 
type nonrec service_type =
  | DNS 
  | DNS_HTTP 
  | HTTP 
type nonrec routing_policy =
  | WEIGHTED 
  | MULTIVALUE 
type nonrec dns_config =
  {
  dns_records: dns_record list ;
  routing_policy: routing_policy option ;
  namespace_id: string option }
type nonrec health_check_custom_config = {
  failure_threshold: int option }
type nonrec service_summary =
  {
  create_date: CoreTypes.Timestamp.t option ;
  health_check_custom_config: health_check_custom_config option ;
  health_check_config: health_check_config option ;
  dns_config: dns_config option ;
  instance_count: int option ;
  description: string option ;
  type_: service_type option ;
  name: string option ;
  arn: string option ;
  id: string option }
type nonrec service_filter_name =
  | NAMESPACE_ID 
type nonrec filter_condition =
  | BEGINS_WITH 
  | BETWEEN 
  | IN 
  | EQ 
type nonrec service_filter =
  {
  condition: filter_condition option ;
  values: string list ;
  name: service_filter_name }
type nonrec service_already_exists =
  {
  service_id: string option ;
  creator_request_id: string option ;
  message: string option }
type nonrec service =
  {
  creator_request_id: string option ;
  create_date: CoreTypes.Timestamp.t option ;
  health_check_custom_config: health_check_custom_config option ;
  health_check_config: health_check_config option ;
  type_: service_type option ;
  dns_config: dns_config option ;
  instance_count: int option ;
  description: string option ;
  namespace_id: string option ;
  name: string option ;
  arn: string option ;
  id: string option }
type nonrec so_a = {
  tt_l: int }
type nonrec resource_limit_exceeded = {
  message: string option }
type nonrec register_instance_response = {
  operation_id: string option }
type nonrec attributes = (string * string) list
type nonrec register_instance_request =
  {
  attributes: attributes ;
  creator_request_id: string option ;
  instance_id: string ;
  service_id: string }
type nonrec list_tags_for_resource_response = {
  tags: tag list option }
type nonrec list_tags_for_resource_request = {
  resource_ar_n: string }
type nonrec list_services_response =
  {
  next_token: string option ;
  services: service_summary list option }
type nonrec list_services_request =
  {
  filters: service_filter list option ;
  max_results: int option ;
  next_token: string option }
type nonrec operation_status =
  | FAIL 
  | SUCCESS 
  | PENDING 
  | SUBMITTED 
type nonrec operation_summary =
  {
  status: operation_status option ;
  id: string option }
type nonrec list_operations_response =
  {
  next_token: string option ;
  operations: operation_summary list option }
type nonrec operation_filter_name =
  | UPDATE_DATE 
  | TYPE 
  | STATUS 
  | SERVICE_ID 
  | NAMESPACE_ID 
type nonrec operation_filter =
  {
  condition: filter_condition option ;
  values: string list ;
  name: operation_filter_name }
type nonrec list_operations_request =
  {
  filters: operation_filter list option ;
  max_results: int option ;
  next_token: string option }
type nonrec namespace_type =
  | HTTP 
  | DNS_PRIVATE 
  | DNS_PUBLIC 
type nonrec dns_properties =
  {
  so_a: so_a option ;
  hosted_zone_id: string option }
type nonrec http_properties = {
  http_name: string option }
type nonrec namespace_properties =
  {
  http_properties: http_properties option ;
  dns_properties: dns_properties option }
type nonrec namespace_summary =
  {
  create_date: CoreTypes.Timestamp.t option ;
  properties: namespace_properties option ;
  service_count: int option ;
  description: string option ;
  type_: namespace_type option ;
  name: string option ;
  arn: string option ;
  id: string option }
type nonrec list_namespaces_response =
  {
  next_token: string option ;
  namespaces: namespace_summary list option }
type nonrec namespace_filter_name =
  | HTTP_NAME 
  | NAME 
  | TYPE 
type nonrec namespace_filter =
  {
  condition: filter_condition option ;
  values: string list ;
  name: namespace_filter_name }
type nonrec list_namespaces_request =
  {
  filters: namespace_filter list option ;
  max_results: int option ;
  next_token: string option }
type nonrec instance_summary =
  {
  attributes: attributes option ;
  id: string option }
type nonrec list_instances_response =
  {
  next_token: string option ;
  instances: instance_summary list option }
type nonrec list_instances_request =
  {
  max_results: int option ;
  next_token: string option ;
  service_id: string }
type nonrec get_service_response = {
  service: service option }
type nonrec get_service_request = {
  id: string }
type nonrec operation_not_found = {
  message: string option }
type nonrec operation_type =
  | DEREGISTER_INSTANCE 
  | REGISTER_INSTANCE 
  | UPDATE_SERVICE 
  | UPDATE_NAMESPACE 
  | DELETE_NAMESPACE 
  | CREATE_NAMESPACE 
type nonrec operation_target_type =
  | INSTANCE 
  | SERVICE 
  | NAMESPACE 
type nonrec operation_targets_map = (operation_target_type * string) list
type nonrec operation =
  {
  targets: operation_targets_map option ;
  update_date: CoreTypes.Timestamp.t option ;
  create_date: CoreTypes.Timestamp.t option ;
  error_code: string option ;
  error_message: string option ;
  status: operation_status option ;
  type_: operation_type option ;
  id: string option }
type nonrec get_operation_response = {
  operation: operation option }
type nonrec get_operation_request = {
  operation_id: string }
type nonrec namespace =
  {
  creator_request_id: string option ;
  create_date: CoreTypes.Timestamp.t option ;
  properties: namespace_properties option ;
  service_count: int option ;
  description: string option ;
  type_: namespace_type option ;
  name: string option ;
  arn: string option ;
  id: string option }
type nonrec get_namespace_response = {
  namespace: namespace option }
type nonrec get_namespace_request = {
  id: string }
type nonrec health_status =
  | UNKNOWN 
  | UNHEALTHY 
  | HEALTHY 
type nonrec instance_health_status_map = (string * health_status) list
type nonrec get_instances_health_status_response =
  {
  next_token: string option ;
  status: instance_health_status_map option }
type nonrec get_instances_health_status_request =
  {
  next_token: string option ;
  max_results: int option ;
  instances: string list option ;
  service_id: string }
type nonrec instance =
  {
  attributes: attributes option ;
  creator_request_id: string option ;
  id: string }
type nonrec get_instance_response = {
  instance: instance option }
type nonrec get_instance_request = {
  instance_id: string ;
  service_id: string }
type nonrec request_limit_exceeded = {
  message: string option }
type nonrec discover_instances_revision_response =
  {
  instances_revision: int option }
type nonrec discover_instances_revision_request =
  {
  service_name: string ;
  namespace_name: string }
type nonrec http_instance_summary =
  {
  attributes: attributes option ;
  health_status: health_status option ;
  service_name: string option ;
  namespace_name: string option ;
  instance_id: string option }
type nonrec discover_instances_response =
  {
  instances_revision: int option ;
  instances: http_instance_summary list option }
type nonrec health_status_filter =
  | HEALTHY_OR_ELSE_ALL 
  | ALL 
  | UNHEALTHY 
  | HEALTHY 
type nonrec discover_instances_request =
  {
  health_status: health_status_filter option ;
  optional_parameters: attributes option ;
  query_parameters: attributes option ;
  max_results: int option ;
  service_name: string ;
  namespace_name: string }
type nonrec deregister_instance_response = {
  operation_id: string option }
type nonrec deregister_instance_request =
  {
  instance_id: string ;
  service_id: string }
type nonrec delete_service_response = unit
type nonrec delete_service_request = {
  id: string }
type nonrec delete_namespace_response = {
  operation_id: string option }
type nonrec delete_namespace_request = {
  id: string }
type nonrec create_service_response = {
  service: service option }
type nonrec create_service_request =
  {
  type_: service_type_option option ;
  tags: tag list option ;
  health_check_custom_config: health_check_custom_config option ;
  health_check_config: health_check_config option ;
  dns_config: dns_config option ;
  description: string option ;
  creator_request_id: string option ;
  namespace_id: string option ;
  name: string }
type nonrec namespace_already_exists =
  {
  namespace_id: string option ;
  creator_request_id: string option ;
  message: string option }
type nonrec create_public_dns_namespace_response =
  {
  operation_id: string option }
type nonrec public_dns_properties_mutable = {
  so_a: so_a }
type nonrec public_dns_namespace_properties =
  {
  dns_properties: public_dns_properties_mutable }
type nonrec create_public_dns_namespace_request =
  {
  properties: public_dns_namespace_properties option ;
  tags: tag list option ;
  description: string option ;
  creator_request_id: string option ;
  name: string }
type nonrec create_private_dns_namespace_response =
  {
  operation_id: string option }
type nonrec private_dns_properties_mutable = {
  so_a: so_a }
type nonrec private_dns_namespace_properties =
  {
  dns_properties: private_dns_properties_mutable }
type nonrec create_private_dns_namespace_request =
  {
  properties: private_dns_namespace_properties option ;
  tags: tag list option ;
  vpc: string ;
  description: string option ;
  creator_request_id: string option ;
  name: string }
type nonrec create_http_namespace_response = {
  operation_id: string option }
type nonrec create_http_namespace_request =
  {
  tags: tag list option ;
  description: string option ;
  creator_request_id: string option ;
  name: string }(** {1:builders Builders} *)

val make_update_service_response :
  ?operation_id:string -> unit -> update_service_response
val make_dns_record : tt_l:int -> type_:record_type -> unit -> dns_record
val make_dns_config_change :
  dns_records:dns_record list -> unit -> dns_config_change
val make_health_check_config :
  ?failure_threshold:int ->
    ?resource_path:string ->
      type_:health_check_type -> unit -> health_check_config
val make_service_change :
  ?health_check_config:health_check_config ->
    ?dns_config:dns_config_change ->
      ?description:string -> unit -> service_change
val make_update_service_request :
  service:service_change -> id:string -> unit -> update_service_request
val make_update_public_dns_namespace_response :
  ?operation_id:string -> unit -> update_public_dns_namespace_response
val make_soa_change : tt_l:int -> unit -> soa_change
val make_public_dns_properties_mutable_change :
  so_a:soa_change -> unit -> public_dns_properties_mutable_change
val make_public_dns_namespace_properties_change :
  dns_properties:public_dns_properties_mutable_change ->
    unit -> public_dns_namespace_properties_change
val make_public_dns_namespace_change :
  ?properties:public_dns_namespace_properties_change ->
    ?description:string -> unit -> public_dns_namespace_change
val make_update_public_dns_namespace_request :
  ?updater_request_id:string ->
    namespace:public_dns_namespace_change ->
      id:string -> unit -> update_public_dns_namespace_request
val make_update_private_dns_namespace_response :
  ?operation_id:string -> unit -> update_private_dns_namespace_response
val make_private_dns_properties_mutable_change :
  so_a:soa_change -> unit -> private_dns_properties_mutable_change
val make_private_dns_namespace_properties_change :
  dns_properties:private_dns_properties_mutable_change ->
    unit -> private_dns_namespace_properties_change
val make_private_dns_namespace_change :
  ?properties:private_dns_namespace_properties_change ->
    ?description:string -> unit -> private_dns_namespace_change
val make_update_private_dns_namespace_request :
  ?updater_request_id:string ->
    namespace:private_dns_namespace_change ->
      id:string -> unit -> update_private_dns_namespace_request
val make_update_instance_custom_health_status_request :
  status:custom_health_status ->
    instance_id:string ->
      service_id:string ->
        unit -> update_instance_custom_health_status_request
val make_update_http_namespace_response :
  ?operation_id:string -> unit -> update_http_namespace_response
val make_http_namespace_change :
  description:string -> unit -> http_namespace_change
val make_update_http_namespace_request :
  ?updater_request_id:string ->
    namespace:http_namespace_change ->
      id:string -> unit -> update_http_namespace_request
val make_untag_resource_response : unit -> untag_resource_response
val make_untag_resource_request :
  tag_keys:string list ->
    resource_ar_n:string -> unit -> untag_resource_request
val make_tag_resource_response : unit -> tag_resource_response
val make_tag : value:string -> key:string -> unit -> tag
val make_tag_resource_request :
  tags:tag list -> resource_ar_n:string -> unit -> tag_resource_request
val make_dns_config :
  ?routing_policy:routing_policy ->
    ?namespace_id:string -> dns_records:dns_record list -> unit -> dns_config
val make_health_check_custom_config :
  ?failure_threshold:int -> unit -> health_check_custom_config
val make_service_summary :
  ?create_date:CoreTypes.Timestamp.t ->
    ?health_check_custom_config:health_check_custom_config ->
      ?health_check_config:health_check_config ->
        ?dns_config:dns_config ->
          ?instance_count:int ->
            ?description:string ->
              ?type_:service_type ->
                ?name:string ->
                  ?arn:string -> ?id:string -> unit -> service_summary
val make_service_filter :
  ?condition:filter_condition ->
    values:string list -> name:service_filter_name -> unit -> service_filter
val make_service :
  ?creator_request_id:string ->
    ?create_date:CoreTypes.Timestamp.t ->
      ?health_check_custom_config:health_check_custom_config ->
        ?health_check_config:health_check_config ->
          ?type_:service_type ->
            ?dns_config:dns_config ->
              ?instance_count:int ->
                ?description:string ->
                  ?namespace_id:string ->
                    ?name:string ->
                      ?arn:string -> ?id:string -> unit -> service
val make_so_a : tt_l:int -> unit -> so_a
val make_register_instance_response :
  ?operation_id:string -> unit -> register_instance_response
val make_register_instance_request :
  ?creator_request_id:string ->
    attributes:attributes ->
      instance_id:string ->
        service_id:string -> unit -> register_instance_request
val make_list_tags_for_resource_response :
  ?tags:tag list -> unit -> list_tags_for_resource_response
val make_list_tags_for_resource_request :
  resource_ar_n:string -> unit -> list_tags_for_resource_request
val make_list_services_response :
  ?next_token:string ->
    ?services:service_summary list -> unit -> list_services_response
val make_list_services_request :
  ?filters:service_filter list ->
    ?max_results:int -> ?next_token:string -> unit -> list_services_request
val make_operation_summary :
  ?status:operation_status -> ?id:string -> unit -> operation_summary
val make_list_operations_response :
  ?next_token:string ->
    ?operations:operation_summary list -> unit -> list_operations_response
val make_operation_filter :
  ?condition:filter_condition ->
    values:string list ->
      name:operation_filter_name -> unit -> operation_filter
val make_list_operations_request :
  ?filters:operation_filter list ->
    ?max_results:int -> ?next_token:string -> unit -> list_operations_request
val make_dns_properties :
  ?so_a:so_a -> ?hosted_zone_id:string -> unit -> dns_properties
val make_http_properties : ?http_name:string -> unit -> http_properties
val make_namespace_properties :
  ?http_properties:http_properties ->
    ?dns_properties:dns_properties -> unit -> namespace_properties
val make_namespace_summary :
  ?create_date:CoreTypes.Timestamp.t ->
    ?properties:namespace_properties ->
      ?service_count:int ->
        ?description:string ->
          ?type_:namespace_type ->
            ?name:string ->
              ?arn:string -> ?id:string -> unit -> namespace_summary
val make_list_namespaces_response :
  ?next_token:string ->
    ?namespaces:namespace_summary list -> unit -> list_namespaces_response
val make_namespace_filter :
  ?condition:filter_condition ->
    values:string list ->
      name:namespace_filter_name -> unit -> namespace_filter
val make_list_namespaces_request :
  ?filters:namespace_filter list ->
    ?max_results:int -> ?next_token:string -> unit -> list_namespaces_request
val make_instance_summary :
  ?attributes:attributes -> ?id:string -> unit -> instance_summary
val make_list_instances_response :
  ?next_token:string ->
    ?instances:instance_summary list -> unit -> list_instances_response
val make_list_instances_request :
  ?max_results:int ->
    ?next_token:string -> service_id:string -> unit -> list_instances_request
val make_get_service_response :
  ?service:service -> unit -> get_service_response
val make_get_service_request : id:string -> unit -> get_service_request
val make_operation :
  ?targets:operation_targets_map ->
    ?update_date:CoreTypes.Timestamp.t ->
      ?create_date:CoreTypes.Timestamp.t ->
        ?error_code:string ->
          ?error_message:string ->
            ?status:operation_status ->
              ?type_:operation_type -> ?id:string -> unit -> operation
val make_get_operation_response :
  ?operation:operation -> unit -> get_operation_response
val make_get_operation_request :
  operation_id:string -> unit -> get_operation_request
val make_namespace :
  ?creator_request_id:string ->
    ?create_date:CoreTypes.Timestamp.t ->
      ?properties:namespace_properties ->
        ?service_count:int ->
          ?description:string ->
            ?type_:namespace_type ->
              ?name:string -> ?arn:string -> ?id:string -> unit -> namespace
val make_get_namespace_response :
  ?namespace:namespace -> unit -> get_namespace_response
val make_get_namespace_request : id:string -> unit -> get_namespace_request
val make_get_instances_health_status_response :
  ?next_token:string ->
    ?status:instance_health_status_map ->
      unit -> get_instances_health_status_response
val make_get_instances_health_status_request :
  ?next_token:string ->
    ?max_results:int ->
      ?instances:string list ->
        service_id:string -> unit -> get_instances_health_status_request
val make_instance :
  ?attributes:attributes ->
    ?creator_request_id:string -> id:string -> unit -> instance
val make_get_instance_response :
  ?instance:instance -> unit -> get_instance_response
val make_get_instance_request :
  instance_id:string -> service_id:string -> unit -> get_instance_request
val make_discover_instances_revision_response :
  ?instances_revision:int -> unit -> discover_instances_revision_response
val make_discover_instances_revision_request :
  service_name:string ->
    namespace_name:string -> unit -> discover_instances_revision_request
val make_http_instance_summary :
  ?attributes:attributes ->
    ?health_status:health_status ->
      ?service_name:string ->
        ?namespace_name:string ->
          ?instance_id:string -> unit -> http_instance_summary
val make_discover_instances_response :
  ?instances_revision:int ->
    ?instances:http_instance_summary list ->
      unit -> discover_instances_response
val make_discover_instances_request :
  ?health_status:health_status_filter ->
    ?optional_parameters:attributes ->
      ?query_parameters:attributes ->
        ?max_results:int ->
          service_name:string ->
            namespace_name:string -> unit -> discover_instances_request
val make_deregister_instance_response :
  ?operation_id:string -> unit -> deregister_instance_response
val make_deregister_instance_request :
  instance_id:string ->
    service_id:string -> unit -> deregister_instance_request
val make_delete_service_response : unit -> delete_service_response
val make_delete_service_request : id:string -> unit -> delete_service_request
val make_delete_namespace_response :
  ?operation_id:string -> unit -> delete_namespace_response
val make_delete_namespace_request :
  id:string -> unit -> delete_namespace_request
val make_create_service_response :
  ?service:service -> unit -> create_service_response
val make_create_service_request :
  ?type_:service_type_option ->
    ?tags:tag list ->
      ?health_check_custom_config:health_check_custom_config ->
        ?health_check_config:health_check_config ->
          ?dns_config:dns_config ->
            ?description:string ->
              ?creator_request_id:string ->
                ?namespace_id:string ->
                  name:string -> unit -> create_service_request
val make_create_public_dns_namespace_response :
  ?operation_id:string -> unit -> create_public_dns_namespace_response
val make_public_dns_properties_mutable :
  so_a:so_a -> unit -> public_dns_properties_mutable
val make_public_dns_namespace_properties :
  dns_properties:public_dns_properties_mutable ->
    unit -> public_dns_namespace_properties
val make_create_public_dns_namespace_request :
  ?properties:public_dns_namespace_properties ->
    ?tags:tag list ->
      ?description:string ->
        ?creator_request_id:string ->
          name:string -> unit -> create_public_dns_namespace_request
val make_create_private_dns_namespace_response :
  ?operation_id:string -> unit -> create_private_dns_namespace_response
val make_private_dns_properties_mutable :
  so_a:so_a -> unit -> private_dns_properties_mutable
val make_private_dns_namespace_properties :
  dns_properties:private_dns_properties_mutable ->
    unit -> private_dns_namespace_properties
val make_create_private_dns_namespace_request :
  ?properties:private_dns_namespace_properties ->
    ?tags:tag list ->
      ?description:string ->
        ?creator_request_id:string ->
          vpc:string ->
            name:string -> unit -> create_private_dns_namespace_request
val make_create_http_namespace_response :
  ?operation_id:string -> unit -> create_http_namespace_response
val make_create_http_namespace_request :
  ?tags:tag list ->
    ?description:string ->
      ?creator_request_id:string ->
        name:string -> unit -> create_http_namespace_request(** {1:operations Operations} *)

module CreateHttpNamespace : sig
  val request :
    Smaws_Lib.Context.t ->
      create_http_namespace_request ->
        (create_http_namespace_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `DuplicateRequest of duplicate_request
            | `InvalidInput of invalid_input
            | `NamespaceAlreadyExists of namespace_already_exists
            | `ResourceLimitExceeded of resource_limit_exceeded
            | `TooManyTagsException of too_many_tags_exception
            
        ]
      ) result
  (** 
    Creates an HTTP namespace. Service instances registered using an HTTP namespace can be discovered using a [DiscoverInstances] request but can't be discovered using DNS.
    
     For the current quota on the number of namespaces that you can create using the same Amazon Web Services account, see {{:https://docs.aws.amazon.com/cloud-map/latest/dg/cloud-map-limits.html}Cloud Map quotas} in the {i Cloud Map Developer Guide}.
      *)

  
end

module CreatePrivateDnsNamespace : sig
  val request :
    Smaws_Lib.Context.t ->
      create_private_dns_namespace_request ->
        (create_private_dns_namespace_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `DuplicateRequest of duplicate_request
            | `InvalidInput of invalid_input
            | `NamespaceAlreadyExists of namespace_already_exists
            | `ResourceLimitExceeded of resource_limit_exceeded
            | `TooManyTagsException of too_many_tags_exception
            
        ]
      ) result
  (** 
    Creates a private namespace based on DNS, which is visible only inside a specified Amazon VPC. The namespace defines your service naming scheme. For example, if you name your namespace [example.com] and name your service [backend], the resulting DNS name for the service is [backend.example.com]. Service instances that are registered using a private DNS namespace can be discovered using either a [DiscoverInstances] request or using DNS. For the current quota on the number of namespaces that you can create using the same Amazon Web Services account, see {{:https://docs.aws.amazon.com/cloud-map/latest/dg/cloud-map-limits.html}Cloud Map quotas} in the {i Cloud Map Developer Guide}.
     *)

  
end

module CreatePublicDnsNamespace : sig
  val request :
    Smaws_Lib.Context.t ->
      create_public_dns_namespace_request ->
        (create_public_dns_namespace_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `DuplicateRequest of duplicate_request
            | `InvalidInput of invalid_input
            | `NamespaceAlreadyExists of namespace_already_exists
            | `ResourceLimitExceeded of resource_limit_exceeded
            | `TooManyTagsException of too_many_tags_exception
            
        ]
      ) result
  (** 
    Creates a public namespace based on DNS, which is visible on the internet. The namespace defines your service naming scheme. For example, if you name your namespace [example.com] and name your service [backend], the resulting DNS name for the service is [backend.example.com]. You can discover instances that were registered with a public DNS namespace by using either a [DiscoverInstances] request or using DNS. For the current quota on the number of namespaces that you can create using the same Amazon Web Services account, see {{:https://docs.aws.amazon.com/cloud-map/latest/dg/cloud-map-limits.html}Cloud Map quotas} in the {i Cloud Map Developer Guide}.
    
     The [CreatePublicDnsNamespace] API operation is not supported in the Amazon Web Services GovCloud (US) Regions.
     
      *)

  
end

module CreateService : sig
  val request :
    Smaws_Lib.Context.t ->
      create_service_request ->
        (create_service_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidInput of invalid_input
            | `NamespaceNotFound of namespace_not_found
            | `ResourceLimitExceeded of resource_limit_exceeded
            | `ServiceAlreadyExists of service_already_exists
            | `TooManyTagsException of too_many_tags_exception
            
        ]
      ) result
  (** 
    Creates a service. This action defines the configuration for the following entities:
    
     {ul
          {- For public and private DNS namespaces, one of the following combinations of DNS records in Amazon Route 53:
             
              {ul
                   {- [A]
                      
                      }
                    {- [AAAA]
                       
                       }
                    {- [A] and [AAAA]
                       
                       }
                    {- [SRV]
                       
                       }
                    {- [CNAME]
                       
                       }
                   
            }
            }
           {- Optionally, a health check
              
              }
          
      }
       After you create the service, you can submit a {{:https://docs.aws.amazon.com/cloud-map/latest/api/API_RegisterInstance.html}RegisterInstance} request, and Cloud Map uses the values in the configuration to create the specified entities.
       
        For the current quota on the number of instances that you can register using the same namespace and using the same service, see {{:https://docs.aws.amazon.com/cloud-map/latest/dg/cloud-map-limits.html}Cloud Map quotas} in the {i Cloud Map Developer Guide}.
         *)

  
end

module DeleteNamespace : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_namespace_request ->
        (delete_namespace_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `DuplicateRequest of duplicate_request
            | `InvalidInput of invalid_input
            | `NamespaceNotFound of namespace_not_found
            | `ResourceInUse of resource_in_use
            
        ]
      ) result
  (** 
    Deletes a namespace from the current account. If the namespace still contains one or more services, the request fails.
     *)

  
end

module DeleteService : sig
  val request :
    Smaws_Lib.Context.t ->
      delete_service_request ->
        (delete_service_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidInput of invalid_input
            | `ResourceInUse of resource_in_use
            | `ServiceNotFound of service_not_found
            
        ]
      ) result
  (** 
    Deletes a specified service. If the service still contains one or more registered instances, the request fails.
     *)

  
end

module DeregisterInstance : sig
  val request :
    Smaws_Lib.Context.t ->
      deregister_instance_request ->
        (deregister_instance_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `DuplicateRequest of duplicate_request
            | `InstanceNotFound of instance_not_found
            | `InvalidInput of invalid_input
            | `ResourceInUse of resource_in_use
            | `ServiceNotFound of service_not_found
            
        ]
      ) result
  (** 
    Deletes the Amazon Route 53 DNS records and health check, if any, that Cloud Map created for the specified instance.
     *)

  
end

module DiscoverInstances : sig
  val request :
    Smaws_Lib.Context.t ->
      discover_instances_request ->
        (discover_instances_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidInput of invalid_input
            | `NamespaceNotFound of namespace_not_found
            | `RequestLimitExceeded of request_limit_exceeded
            | `ServiceNotFound of service_not_found
            
        ]
      ) result
  (** 
    Discovers registered instances for a specified namespace and service. You can use [DiscoverInstances] to discover instances for any type of namespace. [DiscoverInstances] returns a randomized list of instances allowing customers to distribute traffic evenly across instances. For public and private DNS namespaces, you can also use DNS queries to discover instances.
     *)

  
end

module DiscoverInstancesRevision : sig
  val request :
    Smaws_Lib.Context.t ->
      discover_instances_revision_request ->
        (discover_instances_revision_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidInput of invalid_input
            | `NamespaceNotFound of namespace_not_found
            | `RequestLimitExceeded of request_limit_exceeded
            | `ServiceNotFound of service_not_found
            
        ]
      ) result
  (** 
    Discovers the increasing revision associated with an instance.
     *)

  
end

module GetInstance : sig
  val request :
    Smaws_Lib.Context.t ->
      get_instance_request ->
        (get_instance_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InstanceNotFound of instance_not_found
            | `InvalidInput of invalid_input
            | `ServiceNotFound of service_not_found
            
        ]
      ) result
  (** 
    Gets information about a specified instance.
     *)

  
end

module GetInstancesHealthStatus : sig
  val request :
    Smaws_Lib.Context.t ->
      get_instances_health_status_request ->
        (get_instances_health_status_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InstanceNotFound of instance_not_found
            | `InvalidInput of invalid_input
            | `ServiceNotFound of service_not_found
            
        ]
      ) result
  (** 
    Gets the current health status ([Healthy], [Unhealthy], or [Unknown]) of one or more instances that are associated with a specified service.
    
     There's a brief delay between when you register an instance and when the health status for the instance is available.
     
      *)

  
end

module GetNamespace : sig
  val request :
    Smaws_Lib.Context.t ->
      get_namespace_request ->
        (get_namespace_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidInput of invalid_input
            | `NamespaceNotFound of namespace_not_found
            
        ]
      ) result
  (** 
    Gets information about a namespace.
     *)

  
end

module GetOperation : sig
  val request :
    Smaws_Lib.Context.t ->
      get_operation_request ->
        (get_operation_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidInput of invalid_input
            | `OperationNotFound of operation_not_found
            
        ]
      ) result
  (** 
    Gets information about any operation that returns an operation ID in the response, such as a [CreateHttpNamespace] request.
    
     To get a list of operations that match specified criteria, see {{:https://docs.aws.amazon.com/cloud-map/latest/api/API_ListOperations.html}ListOperations}.
     
      *)

  
end

module GetService : sig
  val request :
    Smaws_Lib.Context.t ->
      get_service_request ->
        (get_service_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidInput of invalid_input
            | `ServiceNotFound of service_not_found
            
        ]
      ) result
  (** 
    Gets the settings for a specified service.
     *)

  
end

module ListInstances : sig
  val request :
    Smaws_Lib.Context.t ->
      list_instances_request ->
        (list_instances_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidInput of invalid_input
            | `ServiceNotFound of service_not_found
            
        ]
      ) result
  (** 
    Lists summary information about the instances that you registered by using a specified service.
     *)

  
end

module ListNamespaces : sig
  val request :
    Smaws_Lib.Context.t ->
      list_namespaces_request ->
        (list_namespaces_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidInput of invalid_input
            
        ]
      ) result
  (** 
    Lists summary information about the namespaces that were created by the current Amazon Web Services account.
     *)

  
end

module ListOperations : sig
  val request :
    Smaws_Lib.Context.t ->
      list_operations_request ->
        (list_operations_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidInput of invalid_input
            
        ]
      ) result
  (** 
    Lists operations that match the criteria that you specify.
     *)

  
end

module ListServices : sig
  val request :
    Smaws_Lib.Context.t ->
      list_services_request ->
        (list_services_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidInput of invalid_input
            
        ]
      ) result
  (** 
    Lists summary information for all the services that are associated with one or more namespaces.
     *)

  
end

module ListTagsForResource : sig
  val request :
    Smaws_Lib.Context.t ->
      list_tags_for_resource_request ->
        (list_tags_for_resource_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidInput of invalid_input
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** 
    Lists tags for the specified resource.
     *)

  
end

module RegisterInstance : sig
  val request :
    Smaws_Lib.Context.t ->
      register_instance_request ->
        (register_instance_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `DuplicateRequest of duplicate_request
            | `InvalidInput of invalid_input
            | `ResourceInUse of resource_in_use
            | `ResourceLimitExceeded of resource_limit_exceeded
            | `ServiceNotFound of service_not_found
            
        ]
      ) result
  (** 
    Creates or updates one or more records and, optionally, creates a health check based on the settings in a specified service. When you submit a [RegisterInstance] request, the following occurs:
    
     {ul
          {- For each DNS record that you define in the service that's specified by [ServiceId], a record is created or updated in the hosted zone that's associated with the corresponding namespace.
             
             }
           {- If the service includes [HealthCheckConfig], a health check is created based on the settings in the health check configuration.
              
              }
           {- The health check, if any, is associated with each of the new or updated records.
              
              }
          
      }
       One [RegisterInstance] request must complete before you can submit another request and specify the same service ID and instance ID.
       
        For more information, see {{:https://docs.aws.amazon.com/cloud-map/latest/api/API_CreateService.html}CreateService}.
        
         When Cloud Map receives a DNS query for the specified DNS name, it returns the applicable value:
         
          {ul
               {- {b If the health check is healthy}: returns all the records
                  
                  }
                {- {b If the health check is unhealthy}: returns the applicable value for the last healthy instance
                   
                   }
                {- {b If you didn't specify a health check configuration}: returns all the records
                   
                   }
               
      }
       For the current quota on the number of instances that you can register using the same namespace and using the same service, see {{:https://docs.aws.amazon.com/cloud-map/latest/dg/cloud-map-limits.html}Cloud Map quotas} in the {i Cloud Map Developer Guide}.
        *)

  
end

module TagResource : sig
  val request :
    Smaws_Lib.Context.t ->
      tag_resource_request ->
        (tag_resource_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidInput of invalid_input
            | `ResourceNotFoundException of resource_not_found_exception
            | `TooManyTagsException of too_many_tags_exception
            
        ]
      ) result
  (** 
    Adds one or more tags to the specified resource.
     *)

  
end

module UntagResource : sig
  val request :
    Smaws_Lib.Context.t ->
      untag_resource_request ->
        (untag_resource_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `InvalidInput of invalid_input
            | `ResourceNotFoundException of resource_not_found_exception
            
        ]
      ) result
  (** 
    Removes one or more tags from the specified resource.
     *)

  
end

module UpdateHttpNamespace : sig
  val request :
    Smaws_Lib.Context.t ->
      update_http_namespace_request ->
        (update_http_namespace_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `DuplicateRequest of duplicate_request
            | `InvalidInput of invalid_input
            | `NamespaceNotFound of namespace_not_found
            | `ResourceInUse of resource_in_use
            
        ]
      ) result
  (** 
    Updates an HTTP namespace.
     *)

  
end

module UpdateInstanceCustomHealthStatus : sig
  val request :
    Smaws_Lib.Context.t ->
      update_instance_custom_health_status_request ->
        (unit,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `CustomHealthNotFound of custom_health_not_found
            | `InstanceNotFound of instance_not_found
            | `InvalidInput of invalid_input
            | `ServiceNotFound of service_not_found
            
        ]
      ) result
  (** 
    Submits a request to change the health status of a custom health check to healthy or unhealthy.
    
     You can use [UpdateInstanceCustomHealthStatus] to change the status only for custom health checks, which you define using [HealthCheckCustomConfig] when you create a service. You can't use it to change the status for Route 53 health checks, which you define using [HealthCheckConfig].
     
      For more information, see {{:https://docs.aws.amazon.com/cloud-map/latest/api/API_HealthCheckCustomConfig.html}HealthCheckCustomConfig}.
       *)

  
end

module UpdatePrivateDnsNamespace : sig
  val request :
    Smaws_Lib.Context.t ->
      update_private_dns_namespace_request ->
        (update_private_dns_namespace_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `DuplicateRequest of duplicate_request
            | `InvalidInput of invalid_input
            | `NamespaceNotFound of namespace_not_found
            | `ResourceInUse of resource_in_use
            
        ]
      ) result
  (** 
    Updates a private DNS namespace.
     *)

  
end

module UpdatePublicDnsNamespace : sig
  val request :
    Smaws_Lib.Context.t ->
      update_public_dns_namespace_request ->
        (update_public_dns_namespace_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `DuplicateRequest of duplicate_request
            | `InvalidInput of invalid_input
            | `NamespaceNotFound of namespace_not_found
            | `ResourceInUse of resource_in_use
            
        ]
      ) result
  (** 
    Updates a public DNS namespace.
     *)

  
end

module UpdateService : sig
  val request :
    Smaws_Lib.Context.t ->
      update_service_request ->
        (update_service_response,
        [>
            | Smaws_Lib.Protocols.AwsJson.error | `DuplicateRequest of duplicate_request
            | `InvalidInput of invalid_input
            | `ServiceNotFound of service_not_found
            
        ]
      ) result
  (** 
    Submits a request to perform the following operations:
    
     {ul
          {- Update the TTL setting for existing [DnsRecords] configurations
             
             }
           {- Add, update, or delete [HealthCheckConfig] for a specified service
              
               You can't add, update, or delete a [HealthCheckCustomConfig] configuration.
               
               }
          
      }
       For public and private DNS namespaces, note the following:
       
        {ul
             {- If you omit any existing [DnsRecords] or [HealthCheckConfig] configurations from an [UpdateService] request, the configurations are deleted from the service.
                
                }
              {- If you omit an existing [HealthCheckCustomConfig] configuration from an [UpdateService] request, the configuration isn't deleted from the service.
                 
                 }
             
      }
       When you update settings for a service, Cloud Map also updates the corresponding settings in all the records and health checks that were created by using the specified service.
        *)

  
end

