open Types

let make_x12_code_list_validation_rule ?codes_to_remove:(codes_to_remove_ : code_list option)
    ?codes_to_add:(codes_to_add_ : code_list option) ~element_id:(element_id_ : element_id) () =
  ({ codes_to_remove = codes_to_remove_; codes_to_add = codes_to_add_; element_id = element_id_ }
    : x12_code_list_validation_rule)

let make_x12_element_length_validation_rule
    ~min_length:(min_length_ : Smaws_Lib.Smithy_api.Types.integer)
    ~max_length:(max_length_ : Smaws_Lib.Smithy_api.Types.integer)
    ~element_id:(element_id_ : element_id) () =
  ({ min_length = min_length_; max_length = max_length_; element_id = element_id_ }
    : x12_element_length_validation_rule)

let make_x12_element_requirement_validation_rule ~requirement:(requirement_ : element_requirement)
    ~element_position:(element_position_ : element_position) () =
  ({ requirement = requirement_; element_position = element_position_ }
    : x12_element_requirement_validation_rule)

let make_x12_validation_options ?validation_rules:(validation_rules_ : x12_validation_rules option)
    () =
  ({ validation_rules = validation_rules_ } : x12_validation_options)

let make_x12_split_options ~split_by:(split_by_ : x12_split_by) () =
  ({ split_by = split_by_ } : x12_split_options)

let make_x12_interchange_control_headers
    ?usage_indicator_code:(usage_indicator_code_ : x12_usage_indicator_code option)
    ?acknowledgment_requested_code:
      (acknowledgment_requested_code_ : x12_acknowledgment_requested_code option)
    ?repetition_separator:(repetition_separator_ : x12_repetition_separator option)
    ?receiver_id:(receiver_id_ : x12_receiver_id option)
    ?receiver_id_qualifier:(receiver_id_qualifier_ : x12_id_qualifier option)
    ?sender_id:(sender_id_ : x12_sender_id option)
    ?sender_id_qualifier:(sender_id_qualifier_ : x12_id_qualifier option) () =
  ({
     usage_indicator_code = usage_indicator_code_;
     acknowledgment_requested_code = acknowledgment_requested_code_;
     repetition_separator = repetition_separator_;
     receiver_id = receiver_id_;
     receiver_id_qualifier = receiver_id_qualifier_;
     sender_id = sender_id_;
     sender_id_qualifier = sender_id_qualifier_;
   }
    : x12_interchange_control_headers)

let make_x12_functional_group_headers
    ?responsible_agency_code:(responsible_agency_code_ : x12_responsible_agency_code option)
    ?application_receiver_code:(application_receiver_code_ : x12_application_receiver_code option)
    ?application_sender_code:(application_sender_code_ : x12_application_sender_code option) () =
  ({
     responsible_agency_code = responsible_agency_code_;
     application_receiver_code = application_receiver_code_;
     application_sender_code = application_sender_code_;
   }
    : x12_functional_group_headers)

let make_x12_delimiters ?segment_terminator:(segment_terminator_ : x12_segment_terminator option)
    ?data_element_separator:(data_element_separator_ : x12_data_element_separator option)
    ?component_separator:(component_separator_ : x12_component_separator option) () =
  ({
     segment_terminator = segment_terminator_;
     data_element_separator = data_element_separator_;
     component_separator = component_separator_;
   }
    : x12_delimiters)

let make_x12_control_numbers
    ?starting_transaction_set_control_number:
      (starting_transaction_set_control_number_ : starting_transaction_set_control_number option)
    ?starting_functional_group_control_number:
      (starting_functional_group_control_number_ : starting_functional_group_control_number option)
    ?starting_interchange_control_number:
      (starting_interchange_control_number_ : starting_interchange_control_number option) () =
  ({
     starting_transaction_set_control_number = starting_transaction_set_control_number_;
     starting_functional_group_control_number = starting_functional_group_control_number_;
     starting_interchange_control_number = starting_interchange_control_number_;
   }
    : x12_control_numbers)

let make_x12_outbound_edi_headers ?gs05_time_format:(gs05_time_format_ : x12gs05_time_format option)
    ?control_numbers:(control_numbers_ : x12_control_numbers option)
    ?validate_edi:(validate_edi_ : x12_validate_edi option)
    ?delimiters:(delimiters_ : x12_delimiters option)
    ?functional_group_headers:(functional_group_headers_ : x12_functional_group_headers option)
    ?interchange_control_headers:
      (interchange_control_headers_ : x12_interchange_control_headers option) () =
  ({
     gs05_time_format = gs05_time_format_;
     control_numbers = control_numbers_;
     validate_edi = validate_edi_;
     delimiters = delimiters_;
     functional_group_headers = functional_group_headers_;
     interchange_control_headers = interchange_control_headers_;
   }
    : x12_outbound_edi_headers)

let make_x12_acknowledgment_options
    ~technical_acknowledgment:(technical_acknowledgment_ : x12_technical_acknowledgment)
    ~functional_acknowledgment:(functional_acknowledgment_ : x12_functional_acknowledgment) () =
  ({
     technical_acknowledgment = technical_acknowledgment_;
     functional_acknowledgment = functional_acknowledgment_;
   }
    : x12_acknowledgment_options)

let make_x12_inbound_edi_options
    ?acknowledgment_options:(acknowledgment_options_ : x12_acknowledgment_options option) () =
  ({ acknowledgment_options = acknowledgment_options_ } : x12_inbound_edi_options)

let make_wrap_options ?line_length:(line_length_ : line_length option)
    ?line_terminator:(line_terminator_ : line_terminator option) ~wrap_by:(wrap_by_ : wrap_format)
    () =
  ({ line_length = line_length_; line_terminator = line_terminator_; wrap_by = wrap_by_ }
    : wrap_options)

let make_x12_envelope ?wrap_options:(wrap_options_ : wrap_options option)
    ?common:(common_ : x12_outbound_edi_headers option) () =
  ({ wrap_options = wrap_options_; common = common_ } : x12_envelope)

let make_x12_details ?version:(version_ : x12_version option)
    ?transaction_set:(transaction_set_ : x12_transaction_set option) () =
  ({ version = version_; transaction_set = transaction_set_ } : x12_details)

let make_x12_advanced_options
    ?validation_options:(validation_options_ : x12_validation_options option)
    ?split_options:(split_options_ : x12_split_options option) () =
  ({ validation_options = validation_options_; split_options = split_options_ }
    : x12_advanced_options)

let make_advanced_options ?x12:(x12_ : x12_advanced_options option) () =
  ({ x12 = x12_ } : advanced_options)

let make_input_conversion ?advanced_options:(advanced_options_ : advanced_options option)
    ?format_options:(format_options_ : format_options option)
    ~from_format:(from_format_ : from_format) () =
  ({
     advanced_options = advanced_options_;
     format_options = format_options_;
     from_format = from_format_;
   }
    : input_conversion)

let make_mapping ?template:(template_ : mapping_template option)
    ~template_language:(template_language_ : mapping_template_language) () =
  ({ template = template_; template_language = template_language_ } : mapping)

let make_output_conversion ?advanced_options:(advanced_options_ : advanced_options option)
    ?format_options:(format_options_ : format_options option) ~to_format:(to_format_ : to_format) ()
    =
  ({
     advanced_options = advanced_options_;
     format_options = format_options_;
     to_format = to_format_;
   }
    : output_conversion)

let make_sample_document_keys ?output:(output_ : s3_key option) ?input:(input_ : s3_key option) () =
  ({ output = output_; input = input_ } : sample_document_keys)

let make_sample_documents ~keys:(keys_ : key_list) ~bucket_name:(bucket_name_ : bucket_name) () =
  ({ keys = keys_; bucket_name = bucket_name_ } : sample_documents)

let make_update_transformer_response ?sample_documents:(sample_documents_ : sample_documents option)
    ?output_conversion:(output_conversion_ : output_conversion option)
    ?mapping:(mapping_ : mapping option)
    ?input_conversion:(input_conversion_ : input_conversion option)
    ?sample_document:(sample_document_ : file_location option)
    ?edi_type:(edi_type_ : edi_type option)
    ?mapping_template:(mapping_template_ : mapping_template option)
    ?file_format:(file_format_ : file_format option) ~modified_at:(modified_at_ : modified_date)
    ~created_at:(created_at_ : created_date) ~status:(status_ : transformer_status)
    ~name:(name_ : transformer_name) ~transformer_arn:(transformer_arn_ : resource_arn)
    ~transformer_id:(transformer_id_ : transformer_id) () =
  ({
     sample_documents = sample_documents_;
     output_conversion = output_conversion_;
     mapping = mapping_;
     input_conversion = input_conversion_;
     sample_document = sample_document_;
     edi_type = edi_type_;
     mapping_template = mapping_template_;
     file_format = file_format_;
     modified_at = modified_at_;
     created_at = created_at_;
     status = status_;
     name = name_;
     transformer_arn = transformer_arn_;
     transformer_id = transformer_id_;
   }
    : update_transformer_response)

let make_update_transformer_request ?sample_documents:(sample_documents_ : sample_documents option)
    ?output_conversion:(output_conversion_ : output_conversion option)
    ?mapping:(mapping_ : mapping option)
    ?input_conversion:(input_conversion_ : input_conversion option)
    ?sample_document:(sample_document_ : file_location option)
    ?edi_type:(edi_type_ : edi_type option)
    ?mapping_template:(mapping_template_ : mapping_template option)
    ?file_format:(file_format_ : file_format option) ?status:(status_ : transformer_status option)
    ?name:(name_ : transformer_name option) ~transformer_id:(transformer_id_ : transformer_id) () =
  ({
     sample_documents = sample_documents_;
     output_conversion = output_conversion_;
     mapping = mapping_;
     input_conversion = input_conversion_;
     sample_document = sample_document_;
     edi_type = edi_type_;
     mapping_template = mapping_template_;
     file_format = file_format_;
     status = status_;
     name = name_;
     transformer_id = transformer_id_;
   }
    : update_transformer_request)

let make_update_profile_response ?modified_at:(modified_at_ : modified_date option)
    ?log_group_name:(log_group_name_ : log_group_name option) ?logging:(logging_ : logging option)
    ?email:(email_ : email option) ~created_at:(created_at_ : created_date)
    ~business_name:(business_name_ : business_name) ~phone:(phone_ : phone)
    ~name:(name_ : profile_name) ~profile_arn:(profile_arn_ : resource_arn)
    ~profile_id:(profile_id_ : profile_id) () =
  ({
     modified_at = modified_at_;
     created_at = created_at_;
     log_group_name = log_group_name_;
     logging = logging_;
     business_name = business_name_;
     phone = phone_;
     email = email_;
     name = name_;
     profile_arn = profile_arn_;
     profile_id = profile_id_;
   }
    : update_profile_response)

let make_update_profile_request ?business_name:(business_name_ : business_name option)
    ?phone:(phone_ : phone option) ?email:(email_ : email option)
    ?name:(name_ : profile_name option) ~profile_id:(profile_id_ : profile_id) () =
  ({
     business_name = business_name_;
     phone = phone_;
     email = email_;
     name = name_;
     profile_id = profile_id_;
   }
    : update_profile_request)

let make_inbound_edi_options ?x12:(x12_ : x12_inbound_edi_options option) () =
  ({ x12 = x12_ } : inbound_edi_options)

let make_capability_options ?inbound_edi:(inbound_edi_ : inbound_edi_options option)
    ?outbound_edi:(outbound_edi_ : outbound_edi_options option) () =
  ({ inbound_edi = inbound_edi_; outbound_edi = outbound_edi_ } : capability_options)

let make_update_partnership_response ?modified_at:(modified_at_ : modified_date option)
    ?trading_partner_id:(trading_partner_id_ : trading_partner_id option)
    ?capability_options:(capability_options_ : capability_options option)
    ?capabilities:(capabilities_ : partnership_capabilities option) ?phone:(phone_ : phone option)
    ?email:(email_ : email option) ?name:(name_ : partner_name option)
    ~created_at:(created_at_ : created_date) ~partnership_arn:(partnership_arn_ : resource_arn)
    ~partnership_id:(partnership_id_ : partnership_id) ~profile_id:(profile_id_ : profile_id) () =
  ({
     modified_at = modified_at_;
     created_at = created_at_;
     trading_partner_id = trading_partner_id_;
     capability_options = capability_options_;
     capabilities = capabilities_;
     phone = phone_;
     email = email_;
     name = name_;
     partnership_arn = partnership_arn_;
     partnership_id = partnership_id_;
     profile_id = profile_id_;
   }
    : update_partnership_response)

let make_update_partnership_request
    ?capability_options:(capability_options_ : capability_options option)
    ?capabilities:(capabilities_ : partnership_capabilities option)
    ?name:(name_ : partner_name option) ~partnership_id:(partnership_id_ : partnership_id) () =
  ({
     capability_options = capability_options_;
     capabilities = capabilities_;
     name = name_;
     partnership_id = partnership_id_;
   }
    : update_partnership_request)

let make_s3_location ?key:(key_ : s3_key option) ?bucket_name:(bucket_name_ : bucket_name option) ()
    =
  ({ key = key_; bucket_name = bucket_name_ } : s3_location)

let make_edi_configuration
    ?capability_direction:(capability_direction_ : capability_direction option)
    ~transformer_id:(transformer_id_ : transformer_id)
    ~output_location:(output_location_ : s3_location)
    ~input_location:(input_location_ : s3_location) ~type_:(type__ : edi_type) () =
  ({
     transformer_id = transformer_id_;
     output_location = output_location_;
     input_location = input_location_;
     type_ = type__;
     capability_direction = capability_direction_;
   }
    : edi_configuration)

let make_update_capability_response ?modified_at:(modified_at_ : modified_date option)
    ?instructions_documents:(instructions_documents_ : instructions_documents option)
    ~created_at:(created_at_ : created_date)
    ~configuration:(configuration_ : capability_configuration) ~type_:(type__ : capability_type)
    ~name:(name_ : capability_name) ~capability_arn:(capability_arn_ : resource_arn)
    ~capability_id:(capability_id_ : capability_id) () =
  ({
     modified_at = modified_at_;
     created_at = created_at_;
     instructions_documents = instructions_documents_;
     configuration = configuration_;
     type_ = type__;
     name = name_;
     capability_arn = capability_arn_;
     capability_id = capability_id_;
   }
    : update_capability_response)

let make_update_capability_request
    ?instructions_documents:(instructions_documents_ : instructions_documents option)
    ?configuration:(configuration_ : capability_configuration option)
    ?name:(name_ : capability_name option) ~capability_id:(capability_id_ : capability_id) () =
  ({
     instructions_documents = instructions_documents_;
     configuration = configuration_;
     name = name_;
     capability_id = capability_id_;
   }
    : update_capability_request)

let make_untag_resource_request ~tag_keys:(tag_keys_ : tag_key_list)
    ~resource_ar_n:(resource_ar_n_ : amazon_resource_name) () =
  ({ tag_keys = tag_keys_; resource_ar_n = resource_ar_n_ } : untag_resource_request)

let make_transformer_summary ?sample_documents:(sample_documents_ : sample_documents option)
    ?output_conversion:(output_conversion_ : output_conversion option)
    ?mapping:(mapping_ : mapping option)
    ?input_conversion:(input_conversion_ : input_conversion option)
    ?sample_document:(sample_document_ : file_location option)
    ?edi_type:(edi_type_ : edi_type option)
    ?mapping_template:(mapping_template_ : mapping_template option)
    ?file_format:(file_format_ : file_format option)
    ?modified_at:(modified_at_ : modified_date option) ~created_at:(created_at_ : created_date)
    ~status:(status_ : transformer_status) ~name:(name_ : transformer_name)
    ~transformer_id:(transformer_id_ : transformer_id) () =
  ({
     sample_documents = sample_documents_;
     output_conversion = output_conversion_;
     mapping = mapping_;
     input_conversion = input_conversion_;
     sample_document = sample_document_;
     edi_type = edi_type_;
     mapping_template = mapping_template_;
     file_format = file_format_;
     modified_at = modified_at_;
     created_at = created_at_;
     status = status_;
     name = name_;
     transformer_id = transformer_id_;
   }
    : transformer_summary)

let make_test_parsing_response
    ?validation_messages:(validation_messages_ : validation_messages option)
    ?parsed_split_file_contents:
      (parsed_split_file_contents_ : parsed_split_file_contents_list option)
    ~parsed_file_content:(parsed_file_content_ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({
     validation_messages = validation_messages_;
     parsed_split_file_contents = parsed_split_file_contents_;
     parsed_file_content = parsed_file_content_;
   }
    : test_parsing_response)

let make_test_parsing_request ?advanced_options:(advanced_options_ : advanced_options option)
    ~edi_type:(edi_type_ : edi_type) ~file_format:(file_format_ : file_format)
    ~input_file:(input_file_ : s3_location) () =
  ({
     advanced_options = advanced_options_;
     edi_type = edi_type_;
     file_format = file_format_;
     input_file = input_file_;
   }
    : test_parsing_request)

let make_test_mapping_response
    ~mapped_file_content:(mapped_file_content_ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({ mapped_file_content = mapped_file_content_ } : test_mapping_response)

let make_test_mapping_request ~file_format:(file_format_ : file_format)
    ~mapping_template:(mapping_template_ : mapping_template)
    ~input_file_content:(input_file_content_ : test_mapping_input_file_content) () =
  ({
     file_format = file_format_;
     mapping_template = mapping_template_;
     input_file_content = input_file_content_;
   }
    : test_mapping_request)

let make_test_conversion_response
    ?validation_messages:(validation_messages_ : validation_messages option)
    ~converted_file_content:(converted_file_content_ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({ validation_messages = validation_messages_; converted_file_content = converted_file_content_ }
    : test_conversion_response)

let make_conversion_source ~input_file:(input_file_ : input_file_source)
    ~file_format:(file_format_ : conversion_source_format) () =
  ({ input_file = input_file_; file_format = file_format_ } : conversion_source)

let make_conversion_target ?advanced_options:(advanced_options_ : advanced_options option)
    ?output_sample_file:(output_sample_file_ : output_sample_file_source option)
    ?format_details:(format_details_ : conversion_target_format_details option)
    ~file_format:(file_format_ : conversion_target_format) () =
  ({
     advanced_options = advanced_options_;
     output_sample_file = output_sample_file_;
     format_details = format_details_;
     file_format = file_format_;
   }
    : conversion_target)

let make_test_conversion_request ~target:(target_ : conversion_target)
    ~source:(source_ : conversion_source) () =
  ({ target = target_; source = source_ } : test_conversion_request)

let make_tag ~value:(value_ : tag_value) ~key:(key_ : tag_key) () =
  ({ value = value_; key = key_ } : tag)

let make_tag_resource_request ~tags:(tags_ : tag_list)
    ~resource_ar_n:(resource_ar_n_ : amazon_resource_name) () =
  ({ tags = tags_; resource_ar_n = resource_ar_n_ } : tag_resource_request)

let make_start_transformer_job_response
    ~transformer_job_id:(transformer_job_id_ : transformer_job_id) () =
  ({ transformer_job_id = transformer_job_id_ } : start_transformer_job_response)

let make_start_transformer_job_request
    ?client_token:(client_token_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~transformer_id:(transformer_id_ : transformer_id)
    ~output_location:(output_location_ : s3_location) ~input_file:(input_file_ : s3_location) () =
  ({
     client_token = client_token_;
     transformer_id = transformer_id_;
     output_location = output_location_;
     input_file = input_file_;
   }
    : start_transformer_job_request)

let make_profile_summary ?modified_at:(modified_at_ : modified_date option)
    ?log_group_name:(log_group_name_ : log_group_name option) ?logging:(logging_ : logging option)
    ~created_at:(created_at_ : created_date) ~business_name:(business_name_ : business_name)
    ~name:(name_ : profile_name) ~profile_id:(profile_id_ : profile_id) () =
  ({
     modified_at = modified_at_;
     created_at = created_at_;
     log_group_name = log_group_name_;
     logging = logging_;
     business_name = business_name_;
     name = name_;
     profile_id = profile_id_;
   }
    : profile_summary)

let make_partnership_summary ?modified_at:(modified_at_ : modified_date option)
    ?trading_partner_id:(trading_partner_id_ : trading_partner_id option)
    ?capability_options:(capability_options_ : capability_options option)
    ?capabilities:(capabilities_ : partnership_capabilities option)
    ?name:(name_ : partner_name option) ~created_at:(created_at_ : created_date)
    ~partnership_id:(partnership_id_ : partnership_id) ~profile_id:(profile_id_ : profile_id) () =
  ({
     modified_at = modified_at_;
     created_at = created_at_;
     trading_partner_id = trading_partner_id_;
     capability_options = capability_options_;
     capabilities = capabilities_;
     name = name_;
     partnership_id = partnership_id_;
     profile_id = profile_id_;
   }
    : partnership_summary)

let make_list_transformers_response ?next_token:(next_token_ : page_token option)
    ~transformers:(transformers_ : transformer_list) () =
  ({ next_token = next_token_; transformers = transformers_ } : list_transformers_response)

let make_list_transformers_request ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : page_token option) () =
  ({ max_results = max_results_; next_token = next_token_ } : list_transformers_request)

let make_list_tags_for_resource_response ?tags:(tags_ : tag_list option) () =
  ({ tags = tags_ } : list_tags_for_resource_response)

let make_list_tags_for_resource_request ~resource_ar_n:(resource_ar_n_ : amazon_resource_name) () =
  ({ resource_ar_n = resource_ar_n_ } : list_tags_for_resource_request)

let make_list_profiles_response ?next_token:(next_token_ : page_token option)
    ~profiles:(profiles_ : profile_list) () =
  ({ next_token = next_token_; profiles = profiles_ } : list_profiles_response)

let make_list_profiles_request ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : page_token option) () =
  ({ max_results = max_results_; next_token = next_token_ } : list_profiles_request)

let make_list_partnerships_response ?next_token:(next_token_ : page_token option)
    ~partnerships:(partnerships_ : partnership_list) () =
  ({ next_token = next_token_; partnerships = partnerships_ } : list_partnerships_response)

let make_list_partnerships_request ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : page_token option) ?profile_id:(profile_id_ : profile_id option) () =
  ({ max_results = max_results_; next_token = next_token_; profile_id = profile_id_ }
    : list_partnerships_request)

let make_capability_summary ?modified_at:(modified_at_ : modified_date option)
    ~created_at:(created_at_ : created_date) ~type_:(type__ : capability_type)
    ~name:(name_ : capability_name) ~capability_id:(capability_id_ : capability_id) () =
  ({
     modified_at = modified_at_;
     created_at = created_at_;
     type_ = type__;
     name = name_;
     capability_id = capability_id_;
   }
    : capability_summary)

let make_list_capabilities_response ?next_token:(next_token_ : page_token option)
    ~capabilities:(capabilities_ : capability_list) () =
  ({ next_token = next_token_; capabilities = capabilities_ } : list_capabilities_response)

let make_list_capabilities_request ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : page_token option) () =
  ({ max_results = max_results_; next_token = next_token_ } : list_capabilities_request)

let make_get_transformer_response ?sample_documents:(sample_documents_ : sample_documents option)
    ?output_conversion:(output_conversion_ : output_conversion option)
    ?mapping:(mapping_ : mapping option)
    ?input_conversion:(input_conversion_ : input_conversion option)
    ?sample_document:(sample_document_ : file_location option)
    ?edi_type:(edi_type_ : edi_type option)
    ?mapping_template:(mapping_template_ : mapping_template option)
    ?file_format:(file_format_ : file_format option)
    ?modified_at:(modified_at_ : modified_date option) ~created_at:(created_at_ : created_date)
    ~status:(status_ : transformer_status) ~name:(name_ : transformer_name)
    ~transformer_arn:(transformer_arn_ : resource_arn)
    ~transformer_id:(transformer_id_ : transformer_id) () =
  ({
     sample_documents = sample_documents_;
     output_conversion = output_conversion_;
     mapping = mapping_;
     input_conversion = input_conversion_;
     sample_document = sample_document_;
     edi_type = edi_type_;
     mapping_template = mapping_template_;
     file_format = file_format_;
     modified_at = modified_at_;
     created_at = created_at_;
     status = status_;
     name = name_;
     transformer_arn = transformer_arn_;
     transformer_id = transformer_id_;
   }
    : get_transformer_response)

let make_get_transformer_request ~transformer_id:(transformer_id_ : transformer_id) () =
  ({ transformer_id = transformer_id_ } : get_transformer_request)

let make_get_transformer_job_response
    ?message:(message_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?output_files:(output_files_ : s3_location_list option)
    ~status:(status_ : transformer_job_status) () =
  ({ message = message_; output_files = output_files_; status = status_ }
    : get_transformer_job_response)

let make_get_transformer_job_request ~transformer_id:(transformer_id_ : transformer_id)
    ~transformer_job_id:(transformer_job_id_ : transformer_job_id) () =
  ({ transformer_id = transformer_id_; transformer_job_id = transformer_job_id_ }
    : get_transformer_job_request)

let make_get_profile_response ?modified_at:(modified_at_ : modified_date option)
    ?log_group_name:(log_group_name_ : log_group_name option) ?logging:(logging_ : logging option)
    ?email:(email_ : email option) ~created_at:(created_at_ : created_date)
    ~business_name:(business_name_ : business_name) ~phone:(phone_ : phone)
    ~name:(name_ : profile_name) ~profile_arn:(profile_arn_ : resource_arn)
    ~profile_id:(profile_id_ : profile_id) () =
  ({
     modified_at = modified_at_;
     created_at = created_at_;
     log_group_name = log_group_name_;
     logging = logging_;
     business_name = business_name_;
     phone = phone_;
     email = email_;
     name = name_;
     profile_arn = profile_arn_;
     profile_id = profile_id_;
   }
    : get_profile_response)

let make_get_profile_request ~profile_id:(profile_id_ : profile_id) () =
  ({ profile_id = profile_id_ } : get_profile_request)

let make_get_partnership_response ?modified_at:(modified_at_ : modified_date option)
    ?trading_partner_id:(trading_partner_id_ : trading_partner_id option)
    ?capability_options:(capability_options_ : capability_options option)
    ?capabilities:(capabilities_ : partnership_capabilities option) ?phone:(phone_ : phone option)
    ?email:(email_ : email option) ?name:(name_ : partner_name option)
    ~created_at:(created_at_ : created_date) ~partnership_arn:(partnership_arn_ : resource_arn)
    ~partnership_id:(partnership_id_ : partnership_id) ~profile_id:(profile_id_ : profile_id) () =
  ({
     modified_at = modified_at_;
     created_at = created_at_;
     trading_partner_id = trading_partner_id_;
     capability_options = capability_options_;
     capabilities = capabilities_;
     phone = phone_;
     email = email_;
     name = name_;
     partnership_arn = partnership_arn_;
     partnership_id = partnership_id_;
     profile_id = profile_id_;
   }
    : get_partnership_response)

let make_get_partnership_request ~partnership_id:(partnership_id_ : partnership_id) () =
  ({ partnership_id = partnership_id_ } : get_partnership_request)

let make_get_capability_response ?modified_at:(modified_at_ : modified_date option)
    ?instructions_documents:(instructions_documents_ : instructions_documents option)
    ~created_at:(created_at_ : created_date)
    ~configuration:(configuration_ : capability_configuration) ~type_:(type__ : capability_type)
    ~name:(name_ : capability_name) ~capability_arn:(capability_arn_ : resource_arn)
    ~capability_id:(capability_id_ : capability_id) () =
  ({
     modified_at = modified_at_;
     created_at = created_at_;
     instructions_documents = instructions_documents_;
     configuration = configuration_;
     type_ = type__;
     name = name_;
     capability_arn = capability_arn_;
     capability_id = capability_id_;
   }
    : get_capability_response)

let make_get_capability_request ~capability_id:(capability_id_ : capability_id) () =
  ({ capability_id = capability_id_ } : get_capability_request)

let make_generate_mapping_response
    ?mapping_accuracy:(mapping_accuracy_ : Smaws_Lib.Smithy_api.Types.float_ option)
    ~mapping_template:(mapping_template_ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({ mapping_accuracy = mapping_accuracy_; mapping_template = mapping_template_ }
    : generate_mapping_response)

let make_generate_mapping_request ~mapping_type:(mapping_type_ : mapping_type)
    ~output_file_content:(output_file_content_ : generate_mapping_output_file_content)
    ~input_file_content:(input_file_content_ : generate_mapping_input_file_content) () =
  ({
     mapping_type = mapping_type_;
     output_file_content = output_file_content_;
     input_file_content = input_file_content_;
   }
    : generate_mapping_request)

let make_delete_transformer_request ~transformer_id:(transformer_id_ : transformer_id) () =
  ({ transformer_id = transformer_id_ } : delete_transformer_request)

let make_delete_profile_request ~profile_id:(profile_id_ : profile_id) () =
  ({ profile_id = profile_id_ } : delete_profile_request)

let make_delete_partnership_request ~partnership_id:(partnership_id_ : partnership_id) () =
  ({ partnership_id = partnership_id_ } : delete_partnership_request)

let make_delete_capability_request ~capability_id:(capability_id_ : capability_id) () =
  ({ capability_id = capability_id_ } : delete_capability_request)

let make_create_transformer_response ?sample_documents:(sample_documents_ : sample_documents option)
    ?output_conversion:(output_conversion_ : output_conversion option)
    ?mapping:(mapping_ : mapping option)
    ?input_conversion:(input_conversion_ : input_conversion option)
    ?sample_document:(sample_document_ : file_location option)
    ?edi_type:(edi_type_ : edi_type option)
    ?mapping_template:(mapping_template_ : mapping_template option)
    ?file_format:(file_format_ : file_format option) ~created_at:(created_at_ : created_date)
    ~status:(status_ : transformer_status) ~name:(name_ : transformer_name)
    ~transformer_arn:(transformer_arn_ : resource_arn)
    ~transformer_id:(transformer_id_ : transformer_id) () =
  ({
     sample_documents = sample_documents_;
     output_conversion = output_conversion_;
     mapping = mapping_;
     input_conversion = input_conversion_;
     sample_document = sample_document_;
     edi_type = edi_type_;
     mapping_template = mapping_template_;
     file_format = file_format_;
     created_at = created_at_;
     status = status_;
     name = name_;
     transformer_arn = transformer_arn_;
     transformer_id = transformer_id_;
   }
    : create_transformer_response)

let make_create_transformer_request ?sample_documents:(sample_documents_ : sample_documents option)
    ?output_conversion:(output_conversion_ : output_conversion option)
    ?mapping:(mapping_ : mapping option)
    ?input_conversion:(input_conversion_ : input_conversion option)
    ?sample_document:(sample_document_ : file_location option)
    ?edi_type:(edi_type_ : edi_type option)
    ?mapping_template:(mapping_template_ : mapping_template option)
    ?file_format:(file_format_ : file_format option) ?tags:(tags_ : tag_list option)
    ?client_token:(client_token_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~name:(name_ : transformer_name) () =
  ({
     sample_documents = sample_documents_;
     output_conversion = output_conversion_;
     mapping = mapping_;
     input_conversion = input_conversion_;
     sample_document = sample_document_;
     edi_type = edi_type_;
     mapping_template = mapping_template_;
     file_format = file_format_;
     tags = tags_;
     client_token = client_token_;
     name = name_;
   }
    : create_transformer_request)

let make_create_starter_mapping_template_response
    ~mapping_template:(mapping_template_ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({ mapping_template = mapping_template_ } : create_starter_mapping_template_response)

let make_create_starter_mapping_template_request
    ?output_sample_location:(output_sample_location_ : s3_location option)
    ~template_details:(template_details_ : template_details)
    ~mapping_type:(mapping_type_ : mapping_type) () =
  ({
     template_details = template_details_;
     mapping_type = mapping_type_;
     output_sample_location = output_sample_location_;
   }
    : create_starter_mapping_template_request)

let make_create_profile_response ?log_group_name:(log_group_name_ : log_group_name option)
    ?logging:(logging_ : logging option) ?email:(email_ : email option)
    ~created_at:(created_at_ : created_date) ~phone:(phone_ : phone)
    ~business_name:(business_name_ : business_name) ~name:(name_ : profile_name)
    ~profile_arn:(profile_arn_ : resource_arn) ~profile_id:(profile_id_ : profile_id) () =
  ({
     created_at = created_at_;
     log_group_name = log_group_name_;
     logging = logging_;
     email = email_;
     phone = phone_;
     business_name = business_name_;
     name = name_;
     profile_arn = profile_arn_;
     profile_id = profile_id_;
   }
    : create_profile_response)

let make_create_profile_request ?tags:(tags_ : tag_list option)
    ?client_token:(client_token_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?email:(email_ : email option) ~logging:(logging_ : logging)
    ~business_name:(business_name_ : business_name) ~phone:(phone_ : phone)
    ~name:(name_ : profile_name) () =
  ({
     tags = tags_;
     client_token = client_token_;
     logging = logging_;
     business_name = business_name_;
     phone = phone_;
     email = email_;
     name = name_;
   }
    : create_profile_request)

let make_create_partnership_response
    ?trading_partner_id:(trading_partner_id_ : trading_partner_id option)
    ?capability_options:(capability_options_ : capability_options option)
    ?capabilities:(capabilities_ : partnership_capabilities option) ?phone:(phone_ : phone option)
    ?email:(email_ : email option) ?name:(name_ : partner_name option)
    ~created_at:(created_at_ : created_date) ~partnership_arn:(partnership_arn_ : resource_arn)
    ~partnership_id:(partnership_id_ : partnership_id) ~profile_id:(profile_id_ : profile_id) () =
  ({
     created_at = created_at_;
     trading_partner_id = trading_partner_id_;
     capability_options = capability_options_;
     capabilities = capabilities_;
     phone = phone_;
     email = email_;
     name = name_;
     partnership_arn = partnership_arn_;
     partnership_id = partnership_id_;
     profile_id = profile_id_;
   }
    : create_partnership_response)

let make_create_partnership_request ?tags:(tags_ : tag_list option)
    ?client_token:(client_token_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?capability_options:(capability_options_ : capability_options option)
    ?phone:(phone_ : phone option) ~capabilities:(capabilities_ : partnership_capabilities)
    ~email:(email_ : email) ~name:(name_ : partner_name) ~profile_id:(profile_id_ : profile_id) () =
  ({
     tags = tags_;
     client_token = client_token_;
     capability_options = capability_options_;
     capabilities = capabilities_;
     phone = phone_;
     email = email_;
     name = name_;
     profile_id = profile_id_;
   }
    : create_partnership_request)

let make_create_capability_response
    ?instructions_documents:(instructions_documents_ : instructions_documents option)
    ~created_at:(created_at_ : created_date)
    ~configuration:(configuration_ : capability_configuration) ~type_:(type__ : capability_type)
    ~name:(name_ : capability_name) ~capability_arn:(capability_arn_ : resource_arn)
    ~capability_id:(capability_id_ : capability_id) () =
  ({
     created_at = created_at_;
     instructions_documents = instructions_documents_;
     configuration = configuration_;
     type_ = type__;
     name = name_;
     capability_arn = capability_arn_;
     capability_id = capability_id_;
   }
    : create_capability_response)

let make_create_capability_request ?tags:(tags_ : tag_list option)
    ?client_token:(client_token_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?instructions_documents:(instructions_documents_ : instructions_documents option)
    ~configuration:(configuration_ : capability_configuration) ~type_:(type__ : capability_type)
    ~name:(name_ : capability_name) () =
  ({
     tags = tags_;
     client_token = client_token_;
     instructions_documents = instructions_documents_;
     configuration = configuration_;
     type_ = type__;
     name = name_;
   }
    : create_capability_request)
