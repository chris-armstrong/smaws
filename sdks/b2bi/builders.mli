open Types

val make_x12_code_list_validation_rule :
  ?codes_to_remove:code_list ->
  ?codes_to_add:code_list ->
  element_id:element_id ->
  unit ->
  x12_code_list_validation_rule

val make_x12_element_length_validation_rule :
  min_length:Smaws_Lib.Smithy_api.Types.integer ->
  max_length:Smaws_Lib.Smithy_api.Types.integer ->
  element_id:element_id ->
  unit ->
  x12_element_length_validation_rule

val make_x12_element_requirement_validation_rule :
  requirement:element_requirement ->
  element_position:element_position ->
  unit ->
  x12_element_requirement_validation_rule

val make_x12_validation_options :
  ?validation_rules:x12_validation_rules -> unit -> x12_validation_options

val make_x12_split_options : split_by:x12_split_by -> unit -> x12_split_options

val make_x12_interchange_control_headers :
  ?usage_indicator_code:x12_usage_indicator_code ->
  ?acknowledgment_requested_code:x12_acknowledgment_requested_code ->
  ?repetition_separator:x12_repetition_separator ->
  ?receiver_id:x12_receiver_id ->
  ?receiver_id_qualifier:x12_id_qualifier ->
  ?sender_id:x12_sender_id ->
  ?sender_id_qualifier:x12_id_qualifier ->
  unit ->
  x12_interchange_control_headers

val make_x12_functional_group_headers :
  ?responsible_agency_code:x12_responsible_agency_code ->
  ?application_receiver_code:x12_application_receiver_code ->
  ?application_sender_code:x12_application_sender_code ->
  unit ->
  x12_functional_group_headers

val make_x12_delimiters :
  ?segment_terminator:x12_segment_terminator ->
  ?data_element_separator:x12_data_element_separator ->
  ?component_separator:x12_component_separator ->
  unit ->
  x12_delimiters

val make_x12_control_numbers :
  ?starting_transaction_set_control_number:starting_transaction_set_control_number ->
  ?starting_functional_group_control_number:starting_functional_group_control_number ->
  ?starting_interchange_control_number:starting_interchange_control_number ->
  unit ->
  x12_control_numbers

val make_x12_outbound_edi_headers :
  ?gs05_time_format:x12gs05_time_format ->
  ?control_numbers:x12_control_numbers ->
  ?validate_edi:x12_validate_edi ->
  ?delimiters:x12_delimiters ->
  ?functional_group_headers:x12_functional_group_headers ->
  ?interchange_control_headers:x12_interchange_control_headers ->
  unit ->
  x12_outbound_edi_headers

val make_x12_acknowledgment_options :
  technical_acknowledgment:x12_technical_acknowledgment ->
  functional_acknowledgment:x12_functional_acknowledgment ->
  unit ->
  x12_acknowledgment_options

val make_x12_inbound_edi_options :
  ?acknowledgment_options:x12_acknowledgment_options -> unit -> x12_inbound_edi_options

val make_wrap_options :
  ?line_length:line_length ->
  ?line_terminator:line_terminator ->
  wrap_by:wrap_format ->
  unit ->
  wrap_options

val make_x12_envelope :
  ?wrap_options:wrap_options -> ?common:x12_outbound_edi_headers -> unit -> x12_envelope

val make_x12_details :
  ?version:x12_version -> ?transaction_set:x12_transaction_set -> unit -> x12_details

val make_x12_advanced_options :
  ?validation_options:x12_validation_options ->
  ?split_options:x12_split_options ->
  unit ->
  x12_advanced_options

val make_advanced_options : ?x12:x12_advanced_options -> unit -> advanced_options

val make_input_conversion :
  ?advanced_options:advanced_options ->
  ?format_options:format_options ->
  from_format:from_format ->
  unit ->
  input_conversion

val make_mapping :
  ?template:mapping_template -> template_language:mapping_template_language -> unit -> mapping

val make_output_conversion :
  ?advanced_options:advanced_options ->
  ?format_options:format_options ->
  to_format:to_format ->
  unit ->
  output_conversion

val make_sample_document_keys : ?output:s3_key -> ?input:s3_key -> unit -> sample_document_keys
val make_sample_documents : keys:key_list -> bucket_name:bucket_name -> unit -> sample_documents

val make_update_transformer_response :
  ?sample_documents:sample_documents ->
  ?output_conversion:output_conversion ->
  ?mapping:mapping ->
  ?input_conversion:input_conversion ->
  ?sample_document:file_location ->
  ?edi_type:edi_type ->
  ?mapping_template:mapping_template ->
  ?file_format:file_format ->
  modified_at:modified_date ->
  created_at:created_date ->
  status:transformer_status ->
  name:transformer_name ->
  transformer_arn:resource_arn ->
  transformer_id:transformer_id ->
  unit ->
  update_transformer_response

val make_update_transformer_request :
  ?sample_documents:sample_documents ->
  ?output_conversion:output_conversion ->
  ?mapping:mapping ->
  ?input_conversion:input_conversion ->
  ?sample_document:file_location ->
  ?edi_type:edi_type ->
  ?mapping_template:mapping_template ->
  ?file_format:file_format ->
  ?status:transformer_status ->
  ?name:transformer_name ->
  transformer_id:transformer_id ->
  unit ->
  update_transformer_request

val make_update_profile_response :
  ?modified_at:modified_date ->
  ?log_group_name:log_group_name ->
  ?logging:logging ->
  ?email:email ->
  created_at:created_date ->
  business_name:business_name ->
  phone:phone ->
  name:profile_name ->
  profile_arn:resource_arn ->
  profile_id:profile_id ->
  unit ->
  update_profile_response

val make_update_profile_request :
  ?business_name:business_name ->
  ?phone:phone ->
  ?email:email ->
  ?name:profile_name ->
  profile_id:profile_id ->
  unit ->
  update_profile_request

val make_inbound_edi_options : ?x12:x12_inbound_edi_options -> unit -> inbound_edi_options

val make_capability_options :
  ?inbound_edi:inbound_edi_options ->
  ?outbound_edi:outbound_edi_options ->
  unit ->
  capability_options

val make_update_partnership_response :
  ?modified_at:modified_date ->
  ?trading_partner_id:trading_partner_id ->
  ?capability_options:capability_options ->
  ?capabilities:partnership_capabilities ->
  ?phone:phone ->
  ?email:email ->
  ?name:partner_name ->
  created_at:created_date ->
  partnership_arn:resource_arn ->
  partnership_id:partnership_id ->
  profile_id:profile_id ->
  unit ->
  update_partnership_response

val make_update_partnership_request :
  ?capability_options:capability_options ->
  ?capabilities:partnership_capabilities ->
  ?name:partner_name ->
  partnership_id:partnership_id ->
  unit ->
  update_partnership_request

val make_s3_location : ?key:s3_key -> ?bucket_name:bucket_name -> unit -> s3_location

val make_edi_configuration :
  ?capability_direction:capability_direction ->
  transformer_id:transformer_id ->
  output_location:s3_location ->
  input_location:s3_location ->
  type_:edi_type ->
  unit ->
  edi_configuration

val make_update_capability_response :
  ?modified_at:modified_date ->
  ?instructions_documents:instructions_documents ->
  created_at:created_date ->
  configuration:capability_configuration ->
  type_:capability_type ->
  name:capability_name ->
  capability_arn:resource_arn ->
  capability_id:capability_id ->
  unit ->
  update_capability_response

val make_update_capability_request :
  ?instructions_documents:instructions_documents ->
  ?configuration:capability_configuration ->
  ?name:capability_name ->
  capability_id:capability_id ->
  unit ->
  update_capability_request

val make_untag_resource_request :
  tag_keys:tag_key_list -> resource_ar_n:amazon_resource_name -> unit -> untag_resource_request

val make_transformer_summary :
  ?sample_documents:sample_documents ->
  ?output_conversion:output_conversion ->
  ?mapping:mapping ->
  ?input_conversion:input_conversion ->
  ?sample_document:file_location ->
  ?edi_type:edi_type ->
  ?mapping_template:mapping_template ->
  ?file_format:file_format ->
  ?modified_at:modified_date ->
  created_at:created_date ->
  status:transformer_status ->
  name:transformer_name ->
  transformer_id:transformer_id ->
  unit ->
  transformer_summary

val make_test_parsing_response :
  ?validation_messages:validation_messages ->
  ?parsed_split_file_contents:parsed_split_file_contents_list ->
  parsed_file_content:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  test_parsing_response

val make_test_parsing_request :
  ?advanced_options:advanced_options ->
  edi_type:edi_type ->
  file_format:file_format ->
  input_file:s3_location ->
  unit ->
  test_parsing_request

val make_test_mapping_response :
  mapped_file_content:Smaws_Lib.Smithy_api.Types.string_ -> unit -> test_mapping_response

val make_test_mapping_request :
  file_format:file_format ->
  mapping_template:mapping_template ->
  input_file_content:test_mapping_input_file_content ->
  unit ->
  test_mapping_request

val make_test_conversion_response :
  ?validation_messages:validation_messages ->
  converted_file_content:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  test_conversion_response

val make_conversion_source :
  input_file:input_file_source -> file_format:conversion_source_format -> unit -> conversion_source

val make_conversion_target :
  ?advanced_options:advanced_options ->
  ?output_sample_file:output_sample_file_source ->
  ?format_details:conversion_target_format_details ->
  file_format:conversion_target_format ->
  unit ->
  conversion_target

val make_test_conversion_request :
  target:conversion_target -> source:conversion_source -> unit -> test_conversion_request

val make_tag : value:tag_value -> key:tag_key -> unit -> tag

val make_tag_resource_request :
  tags:tag_list -> resource_ar_n:amazon_resource_name -> unit -> tag_resource_request

val make_start_transformer_job_response :
  transformer_job_id:transformer_job_id -> unit -> start_transformer_job_response

val make_start_transformer_job_request :
  ?client_token:Smaws_Lib.Smithy_api.Types.string_ ->
  transformer_id:transformer_id ->
  output_location:s3_location ->
  input_file:s3_location ->
  unit ->
  start_transformer_job_request

val make_profile_summary :
  ?modified_at:modified_date ->
  ?log_group_name:log_group_name ->
  ?logging:logging ->
  created_at:created_date ->
  business_name:business_name ->
  name:profile_name ->
  profile_id:profile_id ->
  unit ->
  profile_summary

val make_partnership_summary :
  ?modified_at:modified_date ->
  ?trading_partner_id:trading_partner_id ->
  ?capability_options:capability_options ->
  ?capabilities:partnership_capabilities ->
  ?name:partner_name ->
  created_at:created_date ->
  partnership_id:partnership_id ->
  profile_id:profile_id ->
  unit ->
  partnership_summary

val make_list_transformers_response :
  ?next_token:page_token -> transformers:transformer_list -> unit -> list_transformers_response

val make_list_transformers_request :
  ?max_results:max_results -> ?next_token:page_token -> unit -> list_transformers_request

val make_list_tags_for_resource_response : ?tags:tag_list -> unit -> list_tags_for_resource_response

val make_list_tags_for_resource_request :
  resource_ar_n:amazon_resource_name -> unit -> list_tags_for_resource_request

val make_list_profiles_response :
  ?next_token:page_token -> profiles:profile_list -> unit -> list_profiles_response

val make_list_profiles_request :
  ?max_results:max_results -> ?next_token:page_token -> unit -> list_profiles_request

val make_list_partnerships_response :
  ?next_token:page_token -> partnerships:partnership_list -> unit -> list_partnerships_response

val make_list_partnerships_request :
  ?max_results:max_results ->
  ?next_token:page_token ->
  ?profile_id:profile_id ->
  unit ->
  list_partnerships_request

val make_capability_summary :
  ?modified_at:modified_date ->
  created_at:created_date ->
  type_:capability_type ->
  name:capability_name ->
  capability_id:capability_id ->
  unit ->
  capability_summary

val make_list_capabilities_response :
  ?next_token:page_token -> capabilities:capability_list -> unit -> list_capabilities_response

val make_list_capabilities_request :
  ?max_results:max_results -> ?next_token:page_token -> unit -> list_capabilities_request

val make_get_transformer_response :
  ?sample_documents:sample_documents ->
  ?output_conversion:output_conversion ->
  ?mapping:mapping ->
  ?input_conversion:input_conversion ->
  ?sample_document:file_location ->
  ?edi_type:edi_type ->
  ?mapping_template:mapping_template ->
  ?file_format:file_format ->
  ?modified_at:modified_date ->
  created_at:created_date ->
  status:transformer_status ->
  name:transformer_name ->
  transformer_arn:resource_arn ->
  transformer_id:transformer_id ->
  unit ->
  get_transformer_response

val make_get_transformer_request : transformer_id:transformer_id -> unit -> get_transformer_request

val make_get_transformer_job_response :
  ?message:Smaws_Lib.Smithy_api.Types.string_ ->
  ?output_files:s3_location_list ->
  status:transformer_job_status ->
  unit ->
  get_transformer_job_response

val make_get_transformer_job_request :
  transformer_id:transformer_id ->
  transformer_job_id:transformer_job_id ->
  unit ->
  get_transformer_job_request

val make_get_profile_response :
  ?modified_at:modified_date ->
  ?log_group_name:log_group_name ->
  ?logging:logging ->
  ?email:email ->
  created_at:created_date ->
  business_name:business_name ->
  phone:phone ->
  name:profile_name ->
  profile_arn:resource_arn ->
  profile_id:profile_id ->
  unit ->
  get_profile_response

val make_get_profile_request : profile_id:profile_id -> unit -> get_profile_request

val make_get_partnership_response :
  ?modified_at:modified_date ->
  ?trading_partner_id:trading_partner_id ->
  ?capability_options:capability_options ->
  ?capabilities:partnership_capabilities ->
  ?phone:phone ->
  ?email:email ->
  ?name:partner_name ->
  created_at:created_date ->
  partnership_arn:resource_arn ->
  partnership_id:partnership_id ->
  profile_id:profile_id ->
  unit ->
  get_partnership_response

val make_get_partnership_request : partnership_id:partnership_id -> unit -> get_partnership_request

val make_get_capability_response :
  ?modified_at:modified_date ->
  ?instructions_documents:instructions_documents ->
  created_at:created_date ->
  configuration:capability_configuration ->
  type_:capability_type ->
  name:capability_name ->
  capability_arn:resource_arn ->
  capability_id:capability_id ->
  unit ->
  get_capability_response

val make_get_capability_request : capability_id:capability_id -> unit -> get_capability_request

val make_generate_mapping_response :
  ?mapping_accuracy:Smaws_Lib.Smithy_api.Types.float_ ->
  mapping_template:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  generate_mapping_response

val make_generate_mapping_request :
  mapping_type:mapping_type ->
  output_file_content:generate_mapping_output_file_content ->
  input_file_content:generate_mapping_input_file_content ->
  unit ->
  generate_mapping_request

val make_delete_transformer_request :
  transformer_id:transformer_id -> unit -> delete_transformer_request

val make_delete_profile_request : profile_id:profile_id -> unit -> delete_profile_request

val make_delete_partnership_request :
  partnership_id:partnership_id -> unit -> delete_partnership_request

val make_delete_capability_request :
  capability_id:capability_id -> unit -> delete_capability_request

val make_create_transformer_response :
  ?sample_documents:sample_documents ->
  ?output_conversion:output_conversion ->
  ?mapping:mapping ->
  ?input_conversion:input_conversion ->
  ?sample_document:file_location ->
  ?edi_type:edi_type ->
  ?mapping_template:mapping_template ->
  ?file_format:file_format ->
  created_at:created_date ->
  status:transformer_status ->
  name:transformer_name ->
  transformer_arn:resource_arn ->
  transformer_id:transformer_id ->
  unit ->
  create_transformer_response

val make_create_transformer_request :
  ?sample_documents:sample_documents ->
  ?output_conversion:output_conversion ->
  ?mapping:mapping ->
  ?input_conversion:input_conversion ->
  ?sample_document:file_location ->
  ?edi_type:edi_type ->
  ?mapping_template:mapping_template ->
  ?file_format:file_format ->
  ?tags:tag_list ->
  ?client_token:Smaws_Lib.Smithy_api.Types.string_ ->
  name:transformer_name ->
  unit ->
  create_transformer_request

val make_create_starter_mapping_template_response :
  mapping_template:Smaws_Lib.Smithy_api.Types.string_ ->
  unit ->
  create_starter_mapping_template_response

val make_create_starter_mapping_template_request :
  ?output_sample_location:s3_location ->
  template_details:template_details ->
  mapping_type:mapping_type ->
  unit ->
  create_starter_mapping_template_request

val make_create_profile_response :
  ?log_group_name:log_group_name ->
  ?logging:logging ->
  ?email:email ->
  created_at:created_date ->
  phone:phone ->
  business_name:business_name ->
  name:profile_name ->
  profile_arn:resource_arn ->
  profile_id:profile_id ->
  unit ->
  create_profile_response

val make_create_profile_request :
  ?tags:tag_list ->
  ?client_token:Smaws_Lib.Smithy_api.Types.string_ ->
  ?email:email ->
  logging:logging ->
  business_name:business_name ->
  phone:phone ->
  name:profile_name ->
  unit ->
  create_profile_request

val make_create_partnership_response :
  ?trading_partner_id:trading_partner_id ->
  ?capability_options:capability_options ->
  ?capabilities:partnership_capabilities ->
  ?phone:phone ->
  ?email:email ->
  ?name:partner_name ->
  created_at:created_date ->
  partnership_arn:resource_arn ->
  partnership_id:partnership_id ->
  profile_id:profile_id ->
  unit ->
  create_partnership_response

val make_create_partnership_request :
  ?tags:tag_list ->
  ?client_token:Smaws_Lib.Smithy_api.Types.string_ ->
  ?capability_options:capability_options ->
  ?phone:phone ->
  capabilities:partnership_capabilities ->
  email:email ->
  name:partner_name ->
  profile_id:profile_id ->
  unit ->
  create_partnership_request

val make_create_capability_response :
  ?instructions_documents:instructions_documents ->
  created_at:created_date ->
  configuration:capability_configuration ->
  type_:capability_type ->
  name:capability_name ->
  capability_arn:resource_arn ->
  capability_id:capability_id ->
  unit ->
  create_capability_response

val make_create_capability_request :
  ?tags:tag_list ->
  ?client_token:Smaws_Lib.Smithy_api.Types.string_ ->
  ?instructions_documents:instructions_documents ->
  configuration:capability_configuration ->
  type_:capability_type ->
  name:capability_name ->
  unit ->
  create_capability_request
