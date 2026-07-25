open Types

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
