(** b2bi client library built on EIO. *)

open Types

(** {1:types Types} *)

module Types = Types

(** {1:builders Builders} *)

val make_x12_element_requirement_validation_rule :
  element_position:element_position ->
  requirement:element_requirement ->
  unit ->
  x12_element_requirement_validation_rule

val make_x12_element_length_validation_rule :
  element_id:element_id ->
  max_length:Smaws_Lib.Smithy_api.Types.integer ->
  min_length:Smaws_Lib.Smithy_api.Types.integer ->
  unit ->
  x12_element_length_validation_rule

val make_x12_code_list_validation_rule :
  ?codes_to_add:code_list ->
  ?codes_to_remove:code_list ->
  element_id:element_id ->
  unit ->
  x12_code_list_validation_rule

val make_x12_validation_options :
  ?validation_rules:x12_validation_rules -> unit -> x12_validation_options

val make_x12_split_options : split_by:x12_split_by -> unit -> x12_split_options

val make_x12_advanced_options :
  ?split_options:x12_split_options ->
  ?validation_options:x12_validation_options ->
  unit ->
  x12_advanced_options

val make_advanced_options : ?x12:x12_advanced_options -> unit -> advanced_options

val make_untag_resource_request :
  resource_ar_n:amazon_resource_name -> tag_keys:tag_key_list -> unit -> untag_resource_request

val make_test_parsing_response :
  ?parsed_split_file_contents:parsed_split_file_contents_list ->
  ?validation_messages:validation_messages ->
  parsed_file_content:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  test_parsing_response

val make_x12_details :
  ?transaction_set:x12_transaction_set -> ?version:x12_version -> unit -> x12_details

val make_s3_location : ?bucket_name:bucket_name -> ?key:s3_key -> unit -> s3_location

val make_test_parsing_request :
  ?advanced_options:advanced_options ->
  input_file:s3_location ->
  file_format:file_format ->
  edi_type:edi_type ->
  unit ->
  test_parsing_request

val make_test_mapping_response :
  mapped_file_content:Smaws_Lib.Smithy_api.Types.string_ -> unit -> test_mapping_response

val make_test_mapping_request :
  input_file_content:test_mapping_input_file_content ->
  mapping_template:mapping_template ->
  file_format:file_format ->
  unit ->
  test_mapping_request

val make_test_conversion_response :
  ?validation_messages:validation_messages ->
  converted_file_content:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  test_conversion_response

val make_conversion_target :
  ?format_details:conversion_target_format_details ->
  ?output_sample_file:output_sample_file_source ->
  ?advanced_options:advanced_options ->
  file_format:conversion_target_format ->
  unit ->
  conversion_target

val make_conversion_source :
  file_format:conversion_source_format -> input_file:input_file_source -> unit -> conversion_source

val make_test_conversion_request :
  source:conversion_source -> target:conversion_target -> unit -> test_conversion_request

val make_tag : key:tag_key -> value:tag_value -> unit -> tag

val make_tag_resource_request :
  resource_ar_n:amazon_resource_name -> tags:tag_list -> unit -> tag_resource_request

val make_start_transformer_job_response :
  transformer_job_id:transformer_job_id -> unit -> start_transformer_job_response

val make_start_transformer_job_request :
  ?client_token:Smaws_Lib.Smithy_api.Types.string_ ->
  input_file:s3_location ->
  output_location:s3_location ->
  transformer_id:transformer_id ->
  unit ->
  start_transformer_job_request

val make_list_tags_for_resource_response : ?tags:tag_list -> unit -> list_tags_for_resource_response

val make_list_tags_for_resource_request :
  resource_ar_n:amazon_resource_name -> unit -> list_tags_for_resource_request

val make_get_transformer_job_response :
  ?output_files:s3_location_list ->
  ?message:Smaws_Lib.Smithy_api.Types.string_ ->
  status:transformer_job_status ->
  unit ->
  get_transformer_job_response

val make_get_transformer_job_request :
  transformer_job_id:transformer_job_id ->
  transformer_id:transformer_id ->
  unit ->
  get_transformer_job_request

val make_generate_mapping_response :
  ?mapping_accuracy:Smaws_Lib.Smithy_api.Types.float_ ->
  mapping_template:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  generate_mapping_response

val make_generate_mapping_request :
  input_file_content:generate_mapping_input_file_content ->
  output_file_content:generate_mapping_output_file_content ->
  mapping_type:mapping_type ->
  unit ->
  generate_mapping_request

val make_create_starter_mapping_template_response :
  mapping_template:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  create_starter_mapping_template_response

val make_create_starter_mapping_template_request :
  ?output_sample_location:s3_location ->
  mapping_type:mapping_type ->
  template_details:template_details ->
  unit ->
  create_starter_mapping_template_request

val make_edi_configuration :
  ?capability_direction:capability_direction ->
  type_:edi_type ->
  input_location:s3_location ->
  output_location:s3_location ->
  transformer_id:transformer_id ->
  unit ->
  edi_configuration

val make_capability_summary :
  ?modified_at:modified_date ->
  capability_id:capability_id ->
  name:capability_name ->
  type_:capability_type ->
  created_at:created_date ->
  unit ->
  capability_summary

val make_x12_acknowledgment_options :
  functional_acknowledgment:x12_functional_acknowledgment ->
  technical_acknowledgment:x12_technical_acknowledgment ->
  unit ->
  x12_acknowledgment_options

val make_x12_inbound_edi_options :
  ?acknowledgment_options:x12_acknowledgment_options -> unit -> x12_inbound_edi_options

val make_inbound_edi_options : ?x12:x12_inbound_edi_options -> unit -> inbound_edi_options

val make_wrap_options :
  ?line_terminator:line_terminator ->
  ?line_length:line_length ->
  wrap_by:wrap_format ->
  unit ->
  wrap_options

val make_x12_control_numbers :
  ?starting_interchange_control_number:starting_interchange_control_number ->
  ?starting_functional_group_control_number:starting_functional_group_control_number ->
  ?starting_transaction_set_control_number:starting_transaction_set_control_number ->
  unit ->
  x12_control_numbers

val make_x12_delimiters :
  ?component_separator:x12_component_separator ->
  ?data_element_separator:x12_data_element_separator ->
  ?segment_terminator:x12_segment_terminator ->
  unit ->
  x12_delimiters

val make_x12_functional_group_headers :
  ?application_sender_code:x12_application_sender_code ->
  ?application_receiver_code:x12_application_receiver_code ->
  ?responsible_agency_code:x12_responsible_agency_code ->
  unit ->
  x12_functional_group_headers

val make_x12_interchange_control_headers :
  ?sender_id_qualifier:x12_id_qualifier ->
  ?sender_id:x12_sender_id ->
  ?receiver_id_qualifier:x12_id_qualifier ->
  ?receiver_id:x12_receiver_id ->
  ?repetition_separator:x12_repetition_separator ->
  ?acknowledgment_requested_code:x12_acknowledgment_requested_code ->
  ?usage_indicator_code:x12_usage_indicator_code ->
  unit ->
  x12_interchange_control_headers

val make_x12_outbound_edi_headers :
  ?interchange_control_headers:x12_interchange_control_headers ->
  ?functional_group_headers:x12_functional_group_headers ->
  ?delimiters:x12_delimiters ->
  ?validate_edi:x12_validate_edi ->
  ?control_numbers:x12_control_numbers ->
  ?gs05_time_format:x12gs05_time_format ->
  unit ->
  x12_outbound_edi_headers

val make_x12_envelope :
  ?common:x12_outbound_edi_headers -> ?wrap_options:wrap_options -> unit -> x12_envelope

val make_capability_options :
  ?outbound_edi:outbound_edi_options ->
  ?inbound_edi:inbound_edi_options ->
  unit ->
  capability_options

val make_create_capability_response :
  ?instructions_documents:instructions_documents ->
  capability_id:capability_id ->
  capability_arn:resource_arn ->
  name:capability_name ->
  type_:capability_type ->
  configuration:capability_configuration ->
  created_at:created_date ->
  unit ->
  create_capability_response

val make_create_capability_request :
  ?instructions_documents:instructions_documents ->
  ?client_token:Smaws_Lib.Smithy_api.Types.string_ ->
  ?tags:tag_list ->
  name:capability_name ->
  type_:capability_type ->
  configuration:capability_configuration ->
  unit ->
  create_capability_request

val make_create_partnership_response :
  ?name:partner_name ->
  ?email:email ->
  ?phone:phone ->
  ?capabilities:partnership_capabilities ->
  ?capability_options:capability_options ->
  ?trading_partner_id:trading_partner_id ->
  profile_id:profile_id ->
  partnership_id:partnership_id ->
  partnership_arn:resource_arn ->
  created_at:created_date ->
  unit ->
  create_partnership_response

val make_create_partnership_request :
  ?phone:phone ->
  ?capability_options:capability_options ->
  ?client_token:Smaws_Lib.Smithy_api.Types.string_ ->
  ?tags:tag_list ->
  profile_id:profile_id ->
  name:partner_name ->
  email:email ->
  capabilities:partnership_capabilities ->
  unit ->
  create_partnership_request

val make_create_profile_response :
  ?email:email ->
  ?logging:logging ->
  ?log_group_name:log_group_name ->
  profile_id:profile_id ->
  profile_arn:resource_arn ->
  name:profile_name ->
  business_name:business_name ->
  phone:phone ->
  created_at:created_date ->
  unit ->
  create_profile_response

val make_create_profile_request :
  ?email:email ->
  ?client_token:Smaws_Lib.Smithy_api.Types.string_ ->
  ?tags:tag_list ->
  name:profile_name ->
  phone:phone ->
  business_name:business_name ->
  logging:logging ->
  unit ->
  create_profile_request

val make_sample_document_keys : ?input:s3_key -> ?output:s3_key -> unit -> sample_document_keys
val make_sample_documents : bucket_name:bucket_name -> keys:key_list -> unit -> sample_documents

val make_output_conversion :
  ?format_options:format_options ->
  ?advanced_options:advanced_options ->
  to_format:to_format ->
  unit ->
  output_conversion

val make_mapping :
  ?template:mapping_template -> template_language:mapping_template_language -> unit -> mapping

val make_input_conversion :
  ?format_options:format_options ->
  ?advanced_options:advanced_options ->
  from_format:from_format ->
  unit ->
  input_conversion

val make_create_transformer_response :
  ?file_format:file_format ->
  ?mapping_template:mapping_template ->
  ?edi_type:edi_type ->
  ?sample_document:file_location ->
  ?input_conversion:input_conversion ->
  ?mapping:mapping ->
  ?output_conversion:output_conversion ->
  ?sample_documents:sample_documents ->
  transformer_id:transformer_id ->
  transformer_arn:resource_arn ->
  name:transformer_name ->
  status:transformer_status ->
  created_at:created_date ->
  unit ->
  create_transformer_response

val make_create_transformer_request :
  ?client_token:Smaws_Lib.Smithy_api.Types.string_ ->
  ?tags:tag_list ->
  ?file_format:file_format ->
  ?mapping_template:mapping_template ->
  ?edi_type:edi_type ->
  ?sample_document:file_location ->
  ?input_conversion:input_conversion ->
  ?mapping:mapping ->
  ?output_conversion:output_conversion ->
  ?sample_documents:sample_documents ->
  name:transformer_name ->
  unit ->
  create_transformer_request

val make_delete_capability_request :
  capability_id:capability_id -> unit -> delete_capability_request

val make_delete_partnership_request :
  partnership_id:partnership_id -> unit -> delete_partnership_request

val make_delete_profile_request : profile_id:profile_id -> unit -> delete_profile_request

val make_delete_transformer_request :
  transformer_id:transformer_id -> unit -> delete_transformer_request

val make_get_capability_response :
  ?instructions_documents:instructions_documents ->
  ?modified_at:modified_date ->
  capability_id:capability_id ->
  capability_arn:resource_arn ->
  name:capability_name ->
  type_:capability_type ->
  configuration:capability_configuration ->
  created_at:created_date ->
  unit ->
  get_capability_response

val make_get_capability_request : capability_id:capability_id -> unit -> get_capability_request

val make_get_partnership_response :
  ?name:partner_name ->
  ?email:email ->
  ?phone:phone ->
  ?capabilities:partnership_capabilities ->
  ?capability_options:capability_options ->
  ?trading_partner_id:trading_partner_id ->
  ?modified_at:modified_date ->
  profile_id:profile_id ->
  partnership_id:partnership_id ->
  partnership_arn:resource_arn ->
  created_at:created_date ->
  unit ->
  get_partnership_response

val make_get_partnership_request : partnership_id:partnership_id -> unit -> get_partnership_request

val make_get_profile_response :
  ?email:email ->
  ?logging:logging ->
  ?log_group_name:log_group_name ->
  ?modified_at:modified_date ->
  profile_id:profile_id ->
  profile_arn:resource_arn ->
  name:profile_name ->
  phone:phone ->
  business_name:business_name ->
  created_at:created_date ->
  unit ->
  get_profile_response

val make_get_profile_request : profile_id:profile_id -> unit -> get_profile_request

val make_get_transformer_response :
  ?modified_at:modified_date ->
  ?file_format:file_format ->
  ?mapping_template:mapping_template ->
  ?edi_type:edi_type ->
  ?sample_document:file_location ->
  ?input_conversion:input_conversion ->
  ?mapping:mapping ->
  ?output_conversion:output_conversion ->
  ?sample_documents:sample_documents ->
  transformer_id:transformer_id ->
  transformer_arn:resource_arn ->
  name:transformer_name ->
  status:transformer_status ->
  created_at:created_date ->
  unit ->
  get_transformer_response

val make_get_transformer_request : transformer_id:transformer_id -> unit -> get_transformer_request

val make_list_capabilities_response :
  ?next_token:page_token -> capabilities:capability_list -> unit -> list_capabilities_response

val make_list_capabilities_request :
  ?next_token:page_token -> ?max_results:max_results -> unit -> list_capabilities_request

val make_partnership_summary :
  ?name:partner_name ->
  ?capabilities:partnership_capabilities ->
  ?capability_options:capability_options ->
  ?trading_partner_id:trading_partner_id ->
  ?modified_at:modified_date ->
  profile_id:profile_id ->
  partnership_id:partnership_id ->
  created_at:created_date ->
  unit ->
  partnership_summary

val make_list_partnerships_response :
  ?next_token:page_token -> partnerships:partnership_list -> unit -> list_partnerships_response

val make_list_partnerships_request :
  ?profile_id:profile_id ->
  ?next_token:page_token ->
  ?max_results:max_results ->
  unit ->
  list_partnerships_request

val make_profile_summary :
  ?logging:logging ->
  ?log_group_name:log_group_name ->
  ?modified_at:modified_date ->
  profile_id:profile_id ->
  name:profile_name ->
  business_name:business_name ->
  created_at:created_date ->
  unit ->
  profile_summary

val make_list_profiles_response :
  ?next_token:page_token -> profiles:profile_list -> unit -> list_profiles_response

val make_list_profiles_request :
  ?next_token:page_token -> ?max_results:max_results -> unit -> list_profiles_request

val make_transformer_summary :
  ?modified_at:modified_date ->
  ?file_format:file_format ->
  ?mapping_template:mapping_template ->
  ?edi_type:edi_type ->
  ?sample_document:file_location ->
  ?input_conversion:input_conversion ->
  ?mapping:mapping ->
  ?output_conversion:output_conversion ->
  ?sample_documents:sample_documents ->
  transformer_id:transformer_id ->
  name:transformer_name ->
  status:transformer_status ->
  created_at:created_date ->
  unit ->
  transformer_summary

val make_list_transformers_response :
  ?next_token:page_token -> transformers:transformer_list -> unit -> list_transformers_response

val make_list_transformers_request :
  ?next_token:page_token -> ?max_results:max_results -> unit -> list_transformers_request

val make_update_capability_response :
  ?instructions_documents:instructions_documents ->
  ?modified_at:modified_date ->
  capability_id:capability_id ->
  capability_arn:resource_arn ->
  name:capability_name ->
  type_:capability_type ->
  configuration:capability_configuration ->
  created_at:created_date ->
  unit ->
  update_capability_response

val make_update_capability_request :
  ?name:capability_name ->
  ?configuration:capability_configuration ->
  ?instructions_documents:instructions_documents ->
  capability_id:capability_id ->
  unit ->
  update_capability_request

val make_update_partnership_response :
  ?name:partner_name ->
  ?email:email ->
  ?phone:phone ->
  ?capabilities:partnership_capabilities ->
  ?capability_options:capability_options ->
  ?trading_partner_id:trading_partner_id ->
  ?modified_at:modified_date ->
  profile_id:profile_id ->
  partnership_id:partnership_id ->
  partnership_arn:resource_arn ->
  created_at:created_date ->
  unit ->
  update_partnership_response

val make_update_partnership_request :
  ?name:partner_name ->
  ?capabilities:partnership_capabilities ->
  ?capability_options:capability_options ->
  partnership_id:partnership_id ->
  unit ->
  update_partnership_request

val make_update_profile_response :
  ?email:email ->
  ?logging:logging ->
  ?log_group_name:log_group_name ->
  ?modified_at:modified_date ->
  profile_id:profile_id ->
  profile_arn:resource_arn ->
  name:profile_name ->
  phone:phone ->
  business_name:business_name ->
  created_at:created_date ->
  unit ->
  update_profile_response

val make_update_profile_request :
  ?name:profile_name ->
  ?email:email ->
  ?phone:phone ->
  ?business_name:business_name ->
  profile_id:profile_id ->
  unit ->
  update_profile_request

val make_update_transformer_response :
  ?file_format:file_format ->
  ?mapping_template:mapping_template ->
  ?edi_type:edi_type ->
  ?sample_document:file_location ->
  ?input_conversion:input_conversion ->
  ?mapping:mapping ->
  ?output_conversion:output_conversion ->
  ?sample_documents:sample_documents ->
  transformer_id:transformer_id ->
  transformer_arn:resource_arn ->
  name:transformer_name ->
  status:transformer_status ->
  created_at:created_date ->
  modified_at:modified_date ->
  unit ->
  update_transformer_response

val make_update_transformer_request :
  ?name:transformer_name ->
  ?status:transformer_status ->
  ?file_format:file_format ->
  ?mapping_template:mapping_template ->
  ?edi_type:edi_type ->
  ?sample_document:file_location ->
  ?input_conversion:input_conversion ->
  ?mapping:mapping ->
  ?output_conversion:output_conversion ->
  ?sample_documents:sample_documents ->
  transformer_id:transformer_id ->
  unit ->
  update_transformer_request
(** {1:operations Operations} *)

module UpdateTransformer : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceQuotaExceededException of service_quota_exceeded_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_transformer_request ->
    ( update_transformer_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_transformer_request ->
    ( update_transformer_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Updates the specified parameters for a transformer. A transformer can take an EDI file as input \
   and transform it into a JSON-or XML-formatted document. Alternatively, a transformer can take a \
   JSON-or XML-formatted document as input and transform it into an EDI file.\n"]

module UpdateProfile : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceQuotaExceededException of service_quota_exceeded_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_profile_request ->
    ( update_profile_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_profile_request ->
    ( update_profile_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Updates the specified parameters for a profile. A profile is the mechanism used to create the \
   concept of a private network.\n"]

module UpdatePartnership : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceQuotaExceededException of service_quota_exceeded_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_partnership_request ->
    ( update_partnership_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_partnership_request ->
    ( update_partnership_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Updates some of the parameters for a partnership between a customer and trading partner. A \
   partnership represents the connection between you and your trading partner. It ties together a \
   profile and one or more trading capabilities.\n"]

module UpdateCapability : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceQuotaExceededException of service_quota_exceeded_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    update_capability_request ->
    ( update_capability_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    update_capability_request ->
    ( update_capability_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Updates some of the parameters for a capability, based on the specified parameters. A trading \
   capability contains the information required to transform incoming EDI documents into JSON or \
   XML outputs.\n"]

module ListTransformers : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_transformers_request ->
    ( list_transformers_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_transformers_request ->
    ( list_transformers_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists the available transformers. A transformer can take an EDI file as input and transform it \
   into a JSON-or XML-formatted document. Alternatively, a transformer can take a JSON-or \
   XML-formatted document as input and transform it into an EDI file.\n"]

module ListProfiles : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_profiles_request ->
    ( list_profiles_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_profiles_request ->
    ( list_profiles_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists the profiles associated with your Amazon Web Services account for your current or \
   specified region. A profile is the mechanism used to create the concept of a private network.\n"]

module ListPartnerships : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_partnerships_request ->
    ( list_partnerships_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_partnerships_request ->
    ( list_partnerships_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists the partnerships associated with your Amazon Web Services account for your current or \
   specified region. A partnership represents the connection between you and your trading partner. \
   It ties together a profile and one or more trading capabilities.\n"]

module ListCapabilities : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_capabilities_request ->
    ( list_capabilities_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_capabilities_request ->
    ( list_capabilities_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists the capabilities associated with your Amazon Web Services account for your current or \
   specified region. A trading capability contains the information required to transform incoming \
   EDI documents into JSON or XML outputs.\n"]

module GetTransformer : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_transformer_request ->
    ( get_transformer_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_transformer_request ->
    ( get_transformer_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves the details for the transformer specified by the transformer ID. A transformer can \
   take an EDI file as input and transform it into a JSON-or XML-formatted document. \
   Alternatively, a transformer can take a JSON-or XML-formatted document as input and transform \
   it into an EDI file.\n"]

module GetProfile : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_profile_request ->
    ( get_profile_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_profile_request ->
    ( get_profile_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves the details for the profile specified by the profile ID. A profile is the mechanism \
   used to create the concept of a private network.\n"]

module GetPartnership : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_partnership_request ->
    ( get_partnership_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_partnership_request ->
    ( get_partnership_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves the details for a partnership, based on the partner and profile IDs specified. A \
   partnership represents the connection between you and your trading partner. It ties together a \
   profile and one or more trading capabilities.\n"]

module GetCapability : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_capability_request ->
    ( get_capability_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_capability_request ->
    ( get_capability_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Retrieves the details for the specified capability. A trading capability contains the \
   information required to transform incoming EDI documents into JSON or XML outputs.\n"]

module DeleteTransformer : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_transformer_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_transformer_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes the specified transformer. A transformer can take an EDI file as input and transform it \
   into a JSON-or XML-formatted document. Alternatively, a transformer can take a JSON-or \
   XML-formatted document as input and transform it into an EDI file.\n"]

module DeleteProfile : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_profile_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_profile_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes the specified profile. A profile is the mechanism used to create the concept of a \
   private network.\n"]

module DeletePartnership : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_partnership_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_partnership_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes the specified partnership. A partnership represents the connection between you and your \
   trading partner. It ties together a profile and one or more trading capabilities.\n"]

module DeleteCapability : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    delete_capability_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    delete_capability_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Deletes the specified capability. A trading capability contains the information required to \
   transform incoming EDI documents into JSON or XML outputs.\n"]

module CreateTransformer : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceQuotaExceededException of service_quota_exceeded_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_transformer_request ->
    ( create_transformer_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_transformer_request ->
    ( create_transformer_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a transformer. Amazon Web Services B2B Data Interchange currently supports two \
   scenarios:\n\n\
  \ {ul\n\
  \       {-   {i Inbound EDI}: the Amazon Web Services customer receives an EDI file from their \
   trading partner. Amazon Web Services B2B Data Interchange converts this EDI file into a JSON or \
   XML file with a service-defined structure. A mapping template provided by the customer, in \
   JSONata or XSLT format, is optionally applied to this file to produce a JSON or XML file with \
   the structure the customer requires.\n\
  \           \n\
  \            }\n\
  \       {-   {i Outbound EDI}: the Amazon Web Services customer has a JSON or XML file \
   containing data that they wish to use in an EDI file. A mapping template, provided by the \
   customer (in either JSONata or XSLT format) is applied to this file to generate a JSON or XML \
   file in the service-defined structure. This file is then converted to an EDI file.\n\
  \           \n\
  \            }\n\
  \       }\n\
  \    The following fields are provided for backwards compatibility only: [fileFormat], \
   [mappingTemplate], [ediType], and [sampleDocument].\n\
  \    \n\
  \     {ul\n\
  \           {-  Use the [mapping] data type in place of [mappingTemplate] and [fileFormat] \n\
  \               \n\
  \                }\n\
  \           {-  Use the [sampleDocuments] data type in place of [sampleDocument] \n\
  \               \n\
  \                }\n\
  \           {-  Use either the [inputConversion] or [outputConversion] in place of [ediType] \n\
  \               \n\
  \                }\n\
  \           }\n\
  \   "]

module CreateProfile : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceQuotaExceededException of service_quota_exceeded_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_profile_request ->
    ( create_profile_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_profile_request ->
    ( create_profile_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a customer profile. You can have up to five customer profiles, each representing a \
   distinct private network. A profile is the mechanism used to create the concept of a private \
   network.\n"]

module CreatePartnership : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceQuotaExceededException of service_quota_exceeded_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_partnership_request ->
    ( create_partnership_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_partnership_request ->
    ( create_partnership_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Creates a partnership between a customer and a trading partner, based on the supplied \
   parameters. A partnership represents the connection between you and your trading partner. It \
   ties together a profile and one or more trading capabilities.\n"]

module CreateCapability : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ServiceQuotaExceededException of service_quota_exceeded_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_capability_request ->
    ( create_capability_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_capability_request ->
    ( create_capability_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ServiceQuotaExceededException of service_quota_exceeded_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Instantiates a capability based on the specified parameters. A trading capability contains the \
   information required to transform incoming EDI documents into JSON or XML outputs.\n"]

module CreateStarterMappingTemplate : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    create_starter_mapping_template_request ->
    ( create_starter_mapping_template_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    create_starter_mapping_template_request ->
    ( create_starter_mapping_template_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Amazon Web Services B2B Data Interchange uses a mapping template in JSONata or XSLT format to \
   transform a customer input file into a JSON or XML file that can be converted to EDI.\n\n\
  \ If you provide a sample EDI file with the same structure as the EDI files that you wish to \
   generate, then the service can generate a mapping template. The starter template contains \
   placeholder values which you can replace with JSONata or XSLT expressions to take data from \
   your input file and insert it into the JSON or XML file that is used to generate the EDI.\n\
  \ \n\
  \  If you do not provide a sample EDI file, then the service can generate a mapping template \
   based on the EDI settings in the [templateDetails] parameter. \n\
  \  \n\
  \    Currently, we only support generating a template that can generate the input to produce an \
   Outbound X12 EDI file.\n\
  \   "]

module GenerateMapping : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    generate_mapping_request ->
    ( generate_mapping_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    generate_mapping_request ->
    ( generate_mapping_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Takes sample input and output documents and uses Amazon Bedrock to generate a mapping \
   automatically. Depending on the accuracy and other factors, you can then edit the mapping for \
   your needs.\n\n\
  \  Before you can use the AI-assisted feature for Amazon Web Services B2B Data Interchange you \
   must enable models in Amazon Bedrock. For details, see \
   {{:https://docs.aws.amazon.com/b2bi/latest/userguide/ai-assisted-mapping.html#ai-assist-prereq}AI-assisted \
   template mapping prerequisites} in the {i Amazon Web Services B2B Data Interchange User guide}.\n\
  \  \n\
  \    To generate a mapping, perform the following steps:\n\
  \    \n\
  \     {ol\n\
  \           {-  Start with an X12 EDI document to use as the input.\n\
  \               \n\
  \                }\n\
  \           {-  Call [TestMapping] using your EDI document.\n\
  \               \n\
  \                }\n\
  \           {-  Use the output from the [TestMapping] operation as either input or output for \
   your GenerateMapping call, along with your sample file.\n\
  \               \n\
  \                }\n\
  \           }\n\
  \  "]

module GetTransformerJob : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    get_transformer_job_request ->
    ( get_transformer_job_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    get_transformer_job_request ->
    ( get_transformer_job_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Returns the details of the transformer run, based on the Transformer job ID.\n\n\
  \  If 30 days have elapsed since your transformer job was started, the system deletes it. So, if \
   you run [GetTransformerJob] and supply a [transformerId] and [transformerJobId] for a job that \
   was started more than 30 days previously, you receive a 404 response.\n\
  \  \n\
  \   "]

module ListTagsForResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    list_tags_for_resource_request ->
    ( list_tags_for_resource_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    list_tags_for_resource_request ->
    ( list_tags_for_resource_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Lists all of the tags associated with the Amazon Resource Name (ARN) that you specify. The \
   resource can be a capability, partnership, profile, or transformer.\n"]

module StartTransformerJob : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `ConflictException of conflict_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    start_transformer_job_request ->
    ( start_transformer_job_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    start_transformer_job_request ->
    ( start_transformer_job_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `ConflictException of conflict_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Runs a job, using a transformer, to parse input EDI (electronic data interchange) file into the \
   output structures used by Amazon Web Services B2B Data Interchange.\n\n\
  \ If you only want to transform EDI (electronic data interchange) documents, you don't need to \
   create profiles, partnerships or capabilities. Just create and configure a transformer, and \
   then run the [StartTransformerJob] API to process your files.\n\
  \ \n\
  \   The system stores transformer jobs for 30 days. During that period, you can run \
   {{:https://docs.aws.amazon.com/b2bi/latest/APIReference/API_GetTransformerJob.html}GetTransformerJob} \
   and supply its [transformerId] and [transformerJobId] to return details of the job.\n\
  \   \n\
  \    "]

module TagResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    tag_resource_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    tag_resource_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Attaches a key-value pair to a resource, as identified by its Amazon Resource Name (ARN). \
   Resources are capability, partnership, profile, transformers and other entities.\n\n\
  \ There is no response returned from this call.\n\
  \ "]

module TestConversion : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    test_conversion_request ->
    ( test_conversion_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    test_conversion_request ->
    ( test_conversion_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "This operation mimics the latter half of a typical Outbound EDI request. It takes an input \
   JSON/XML in the B2Bi shape as input, converts it to an X12 EDI string, and return that string.\n"]

module TestMapping : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    test_mapping_request ->
    ( test_mapping_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    test_mapping_request ->
    ( test_mapping_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Maps the input file according to the provided template file. The API call downloads the file \
   contents from the Amazon S3 location, and passes the contents in as a string, to the \
   [inputFileContent] parameter.\n"]

module TestParsing : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `AccessDeniedException of access_denied_exception
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ThrottlingException of throttling_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    test_parsing_request ->
    ( test_parsing_response,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    test_parsing_request ->
    ( test_parsing_response Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `AccessDeniedException of access_denied_exception
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ThrottlingException of throttling_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Parses the input EDI (electronic data interchange) file. The input file has a file size limit \
   of 250 KB.\n"]

(** {1:Serialization and Deserialization} *)
module UntagResource : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `InternalServerException of internal_server_exception
    | `ResourceNotFoundException of resource_not_found_exception
    | `ValidationException of validation_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    untag_resource_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    untag_resource_request ->
    ( Smaws_Lib.Smithy_api.Types.unit_ Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `InternalServerException of internal_server_exception
      | `ResourceNotFoundException of resource_not_found_exception
      | `ValidationException of validation_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Detaches a key-value pair from the specified resource, as identified by its Amazon Resource \
   Name (ARN). Resources are capability, partnership, profile, transformers and other entities.\n"]

module Json_serializers = Json_serializers
module Json_deserializers = Json_deserializers
