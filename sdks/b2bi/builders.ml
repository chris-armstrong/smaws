open Types

let make_x12_element_requirement_validation_rule
    ~element_position:(element_position_ : element_position)
    ~requirement:(requirement_ : element_requirement) () =
  ({ element_position = element_position_; requirement = requirement_ }
    : x12_element_requirement_validation_rule)

let make_x12_element_length_validation_rule ~element_id:(element_id_ : element_id)
    ~max_length:(max_length_ : Smaws_Lib.Smithy_api.Types.integer)
    ~min_length:(min_length_ : Smaws_Lib.Smithy_api.Types.integer) () =
  ({ element_id = element_id_; max_length = max_length_; min_length = min_length_ }
    : x12_element_length_validation_rule)

let make_x12_code_list_validation_rule ?codes_to_add:(codes_to_add_ : code_list option)
    ?codes_to_remove:(codes_to_remove_ : code_list option) ~element_id:(element_id_ : element_id) ()
    =
  ({ element_id = element_id_; codes_to_add = codes_to_add_; codes_to_remove = codes_to_remove_ }
    : x12_code_list_validation_rule)

let make_x12_validation_options ?validation_rules:(validation_rules_ : x12_validation_rules option)
    () =
  ({ validation_rules = validation_rules_ } : x12_validation_options)

let make_x12_split_options ~split_by:(split_by_ : x12_split_by) () =
  ({ split_by = split_by_ } : x12_split_options)

let make_x12_advanced_options ?split_options:(split_options_ : x12_split_options option)
    ?validation_options:(validation_options_ : x12_validation_options option) () =
  ({ split_options = split_options_; validation_options = validation_options_ }
    : x12_advanced_options)

let make_advanced_options ?x12:(x12_ : x12_advanced_options option) () =
  ({ x12 = x12_ } : advanced_options)

let make_untag_resource_request ~resource_ar_n:(resource_ar_n_ : amazon_resource_name)
    ~tag_keys:(tag_keys_ : tag_key_list) () =
  ({ resource_ar_n = resource_ar_n_; tag_keys = tag_keys_ } : untag_resource_request)

let make_test_parsing_response
    ?parsed_split_file_contents:
      (parsed_split_file_contents_ : parsed_split_file_contents_list option)
    ?validation_messages:(validation_messages_ : validation_messages option)
    ~parsed_file_content:(parsed_file_content_ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({
     parsed_file_content = parsed_file_content_;
     parsed_split_file_contents = parsed_split_file_contents_;
     validation_messages = validation_messages_;
   }
    : test_parsing_response)

let make_x12_details ?transaction_set:(transaction_set_ : x12_transaction_set option)
    ?version:(version_ : x12_version option) () =
  ({ transaction_set = transaction_set_; version = version_ } : x12_details)

let make_s3_location ?bucket_name:(bucket_name_ : bucket_name option) ?key:(key_ : s3_key option) ()
    =
  ({ bucket_name = bucket_name_; key = key_ } : s3_location)

let make_test_parsing_request ?advanced_options:(advanced_options_ : advanced_options option)
    ~input_file:(input_file_ : s3_location) ~file_format:(file_format_ : file_format)
    ~edi_type:(edi_type_ : edi_type) () =
  ({
     input_file = input_file_;
     file_format = file_format_;
     edi_type = edi_type_;
     advanced_options = advanced_options_;
   }
    : test_parsing_request)

let make_test_mapping_response
    ~mapped_file_content:(mapped_file_content_ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({ mapped_file_content = mapped_file_content_ } : test_mapping_response)

let make_test_mapping_request
    ~input_file_content:(input_file_content_ : test_mapping_input_file_content)
    ~mapping_template:(mapping_template_ : mapping_template)
    ~file_format:(file_format_ : file_format) () =
  ({
     input_file_content = input_file_content_;
     mapping_template = mapping_template_;
     file_format = file_format_;
   }
    : test_mapping_request)

let make_test_conversion_response
    ?validation_messages:(validation_messages_ : validation_messages option)
    ~converted_file_content:(converted_file_content_ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({ converted_file_content = converted_file_content_; validation_messages = validation_messages_ }
    : test_conversion_response)

let make_conversion_target
    ?format_details:(format_details_ : conversion_target_format_details option)
    ?output_sample_file:(output_sample_file_ : output_sample_file_source option)
    ?advanced_options:(advanced_options_ : advanced_options option)
    ~file_format:(file_format_ : conversion_target_format) () =
  ({
     file_format = file_format_;
     format_details = format_details_;
     output_sample_file = output_sample_file_;
     advanced_options = advanced_options_;
   }
    : conversion_target)

let make_conversion_source ~file_format:(file_format_ : conversion_source_format)
    ~input_file:(input_file_ : input_file_source) () =
  ({ file_format = file_format_; input_file = input_file_ } : conversion_source)

let make_test_conversion_request ~source:(source_ : conversion_source)
    ~target:(target_ : conversion_target) () =
  ({ source = source_; target = target_ } : test_conversion_request)

let make_tag ~key:(key_ : tag_key) ~value:(value_ : tag_value) () =
  ({ key = key_; value = value_ } : tag)

let make_tag_resource_request ~resource_ar_n:(resource_ar_n_ : amazon_resource_name)
    ~tags:(tags_ : tag_list) () =
  ({ resource_ar_n = resource_ar_n_; tags = tags_ } : tag_resource_request)

let make_start_transformer_job_response
    ~transformer_job_id:(transformer_job_id_ : transformer_job_id) () =
  ({ transformer_job_id = transformer_job_id_ } : start_transformer_job_response)

let make_start_transformer_job_request
    ?client_token:(client_token_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~input_file:(input_file_ : s3_location) ~output_location:(output_location_ : s3_location)
    ~transformer_id:(transformer_id_ : transformer_id) () =
  ({
     input_file = input_file_;
     output_location = output_location_;
     transformer_id = transformer_id_;
     client_token = client_token_;
   }
    : start_transformer_job_request)

let make_list_tags_for_resource_response ?tags:(tags_ : tag_list option) () =
  ({ tags = tags_ } : list_tags_for_resource_response)

let make_list_tags_for_resource_request ~resource_ar_n:(resource_ar_n_ : amazon_resource_name) () =
  ({ resource_ar_n = resource_ar_n_ } : list_tags_for_resource_request)

let make_get_transformer_job_response ?output_files:(output_files_ : s3_location_list option)
    ?message:(message_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ~status:(status_ : transformer_job_status) () =
  ({ status = status_; output_files = output_files_; message = message_ }
    : get_transformer_job_response)

let make_get_transformer_job_request ~transformer_job_id:(transformer_job_id_ : transformer_job_id)
    ~transformer_id:(transformer_id_ : transformer_id) () =
  ({ transformer_job_id = transformer_job_id_; transformer_id = transformer_id_ }
    : get_transformer_job_request)

let make_generate_mapping_response
    ?mapping_accuracy:(mapping_accuracy_ : Smaws_Lib.Smithy_api.Types.float_ option)
    ~mapping_template:(mapping_template_ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({ mapping_template = mapping_template_; mapping_accuracy = mapping_accuracy_ }
    : generate_mapping_response)

let make_generate_mapping_request
    ~input_file_content:(input_file_content_ : generate_mapping_input_file_content)
    ~output_file_content:(output_file_content_ : generate_mapping_output_file_content)
    ~mapping_type:(mapping_type_ : mapping_type) () =
  ({
     input_file_content = input_file_content_;
     output_file_content = output_file_content_;
     mapping_type = mapping_type_;
   }
    : generate_mapping_request)

let make_create_starter_mapping_template_response
    ~mapping_template:(mapping_template_ : Smaws_Lib.Smithy_api.Types.string_) () =
  ({ mapping_template = mapping_template_ } : create_starter_mapping_template_response)

let make_create_starter_mapping_template_request
    ?output_sample_location:(output_sample_location_ : s3_location option)
    ~mapping_type:(mapping_type_ : mapping_type)
    ~template_details:(template_details_ : template_details) () =
  ({
     output_sample_location = output_sample_location_;
     mapping_type = mapping_type_;
     template_details = template_details_;
   }
    : create_starter_mapping_template_request)

let make_edi_configuration
    ?capability_direction:(capability_direction_ : capability_direction option)
    ~type_:(type__ : edi_type) ~input_location:(input_location_ : s3_location)
    ~output_location:(output_location_ : s3_location)
    ~transformer_id:(transformer_id_ : transformer_id) () =
  ({
     capability_direction = capability_direction_;
     type_ = type__;
     input_location = input_location_;
     output_location = output_location_;
     transformer_id = transformer_id_;
   }
    : edi_configuration)

let make_capability_summary ?modified_at:(modified_at_ : modified_date option)
    ~capability_id:(capability_id_ : capability_id) ~name:(name_ : capability_name)
    ~type_:(type__ : capability_type) ~created_at:(created_at_ : created_date) () =
  ({
     capability_id = capability_id_;
     name = name_;
     type_ = type__;
     created_at = created_at_;
     modified_at = modified_at_;
   }
    : capability_summary)

let make_x12_acknowledgment_options
    ~functional_acknowledgment:(functional_acknowledgment_ : x12_functional_acknowledgment)
    ~technical_acknowledgment:(technical_acknowledgment_ : x12_technical_acknowledgment) () =
  ({
     functional_acknowledgment = functional_acknowledgment_;
     technical_acknowledgment = technical_acknowledgment_;
   }
    : x12_acknowledgment_options)

let make_x12_inbound_edi_options
    ?acknowledgment_options:(acknowledgment_options_ : x12_acknowledgment_options option) () =
  ({ acknowledgment_options = acknowledgment_options_ } : x12_inbound_edi_options)

let make_inbound_edi_options ?x12:(x12_ : x12_inbound_edi_options option) () =
  ({ x12 = x12_ } : inbound_edi_options)

let make_wrap_options ?line_terminator:(line_terminator_ : line_terminator option)
    ?line_length:(line_length_ : line_length option) ~wrap_by:(wrap_by_ : wrap_format) () =
  ({ wrap_by = wrap_by_; line_terminator = line_terminator_; line_length = line_length_ }
    : wrap_options)

let make_x12_control_numbers
    ?starting_interchange_control_number:
      (starting_interchange_control_number_ : starting_interchange_control_number option)
    ?starting_functional_group_control_number:
      (starting_functional_group_control_number_ : starting_functional_group_control_number option)
    ?starting_transaction_set_control_number:
      (starting_transaction_set_control_number_ : starting_transaction_set_control_number option) ()
    =
  ({
     starting_interchange_control_number = starting_interchange_control_number_;
     starting_functional_group_control_number = starting_functional_group_control_number_;
     starting_transaction_set_control_number = starting_transaction_set_control_number_;
   }
    : x12_control_numbers)

let make_x12_delimiters ?component_separator:(component_separator_ : x12_component_separator option)
    ?data_element_separator:(data_element_separator_ : x12_data_element_separator option)
    ?segment_terminator:(segment_terminator_ : x12_segment_terminator option) () =
  ({
     component_separator = component_separator_;
     data_element_separator = data_element_separator_;
     segment_terminator = segment_terminator_;
   }
    : x12_delimiters)

let make_x12_functional_group_headers
    ?application_sender_code:(application_sender_code_ : x12_application_sender_code option)
    ?application_receiver_code:(application_receiver_code_ : x12_application_receiver_code option)
    ?responsible_agency_code:(responsible_agency_code_ : x12_responsible_agency_code option) () =
  ({
     application_sender_code = application_sender_code_;
     application_receiver_code = application_receiver_code_;
     responsible_agency_code = responsible_agency_code_;
   }
    : x12_functional_group_headers)

let make_x12_interchange_control_headers
    ?sender_id_qualifier:(sender_id_qualifier_ : x12_id_qualifier option)
    ?sender_id:(sender_id_ : x12_sender_id option)
    ?receiver_id_qualifier:(receiver_id_qualifier_ : x12_id_qualifier option)
    ?receiver_id:(receiver_id_ : x12_receiver_id option)
    ?repetition_separator:(repetition_separator_ : x12_repetition_separator option)
    ?acknowledgment_requested_code:
      (acknowledgment_requested_code_ : x12_acknowledgment_requested_code option)
    ?usage_indicator_code:(usage_indicator_code_ : x12_usage_indicator_code option) () =
  ({
     sender_id_qualifier = sender_id_qualifier_;
     sender_id = sender_id_;
     receiver_id_qualifier = receiver_id_qualifier_;
     receiver_id = receiver_id_;
     repetition_separator = repetition_separator_;
     acknowledgment_requested_code = acknowledgment_requested_code_;
     usage_indicator_code = usage_indicator_code_;
   }
    : x12_interchange_control_headers)

let make_x12_outbound_edi_headers
    ?interchange_control_headers:
      (interchange_control_headers_ : x12_interchange_control_headers option)
    ?functional_group_headers:(functional_group_headers_ : x12_functional_group_headers option)
    ?delimiters:(delimiters_ : x12_delimiters option)
    ?validate_edi:(validate_edi_ : x12_validate_edi option)
    ?control_numbers:(control_numbers_ : x12_control_numbers option)
    ?gs05_time_format:(gs05_time_format_ : x12gs05_time_format option) () =
  ({
     interchange_control_headers = interchange_control_headers_;
     functional_group_headers = functional_group_headers_;
     delimiters = delimiters_;
     validate_edi = validate_edi_;
     control_numbers = control_numbers_;
     gs05_time_format = gs05_time_format_;
   }
    : x12_outbound_edi_headers)

let make_x12_envelope ?common:(common_ : x12_outbound_edi_headers option)
    ?wrap_options:(wrap_options_ : wrap_options option) () =
  ({ common = common_; wrap_options = wrap_options_ } : x12_envelope)

let make_capability_options ?outbound_edi:(outbound_edi_ : outbound_edi_options option)
    ?inbound_edi:(inbound_edi_ : inbound_edi_options option) () =
  ({ outbound_edi = outbound_edi_; inbound_edi = inbound_edi_ } : capability_options)

let make_create_capability_response
    ?instructions_documents:(instructions_documents_ : instructions_documents option)
    ~capability_id:(capability_id_ : capability_id) ~capability_arn:(capability_arn_ : resource_arn)
    ~name:(name_ : capability_name) ~type_:(type__ : capability_type)
    ~configuration:(configuration_ : capability_configuration)
    ~created_at:(created_at_ : created_date) () =
  ({
     capability_id = capability_id_;
     capability_arn = capability_arn_;
     name = name_;
     type_ = type__;
     configuration = configuration_;
     instructions_documents = instructions_documents_;
     created_at = created_at_;
   }
    : create_capability_response)

let make_create_capability_request
    ?instructions_documents:(instructions_documents_ : instructions_documents option)
    ?client_token:(client_token_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?tags:(tags_ : tag_list option) ~name:(name_ : capability_name)
    ~type_:(type__ : capability_type) ~configuration:(configuration_ : capability_configuration) ()
    =
  ({
     name = name_;
     type_ = type__;
     configuration = configuration_;
     instructions_documents = instructions_documents_;
     client_token = client_token_;
     tags = tags_;
   }
    : create_capability_request)

let make_create_partnership_response ?name:(name_ : partner_name option)
    ?email:(email_ : email option) ?phone:(phone_ : phone option)
    ?capabilities:(capabilities_ : partnership_capabilities option)
    ?capability_options:(capability_options_ : capability_options option)
    ?trading_partner_id:(trading_partner_id_ : trading_partner_id option)
    ~profile_id:(profile_id_ : profile_id) ~partnership_id:(partnership_id_ : partnership_id)
    ~partnership_arn:(partnership_arn_ : resource_arn) ~created_at:(created_at_ : created_date) () =
  ({
     profile_id = profile_id_;
     partnership_id = partnership_id_;
     partnership_arn = partnership_arn_;
     name = name_;
     email = email_;
     phone = phone_;
     capabilities = capabilities_;
     capability_options = capability_options_;
     trading_partner_id = trading_partner_id_;
     created_at = created_at_;
   }
    : create_partnership_response)

let make_create_partnership_request ?phone:(phone_ : phone option)
    ?capability_options:(capability_options_ : capability_options option)
    ?client_token:(client_token_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?tags:(tags_ : tag_list option) ~profile_id:(profile_id_ : profile_id)
    ~name:(name_ : partner_name) ~email:(email_ : email)
    ~capabilities:(capabilities_ : partnership_capabilities) () =
  ({
     profile_id = profile_id_;
     name = name_;
     email = email_;
     phone = phone_;
     capabilities = capabilities_;
     capability_options = capability_options_;
     client_token = client_token_;
     tags = tags_;
   }
    : create_partnership_request)

let make_create_profile_response ?email:(email_ : email option) ?logging:(logging_ : logging option)
    ?log_group_name:(log_group_name_ : log_group_name option) ~profile_id:(profile_id_ : profile_id)
    ~profile_arn:(profile_arn_ : resource_arn) ~name:(name_ : profile_name)
    ~business_name:(business_name_ : business_name) ~phone:(phone_ : phone)
    ~created_at:(created_at_ : created_date) () =
  ({
     profile_id = profile_id_;
     profile_arn = profile_arn_;
     name = name_;
     business_name = business_name_;
     phone = phone_;
     email = email_;
     logging = logging_;
     log_group_name = log_group_name_;
     created_at = created_at_;
   }
    : create_profile_response)

let make_create_profile_request ?email:(email_ : email option)
    ?client_token:(client_token_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?tags:(tags_ : tag_list option) ~name:(name_ : profile_name) ~phone:(phone_ : phone)
    ~business_name:(business_name_ : business_name) ~logging:(logging_ : logging) () =
  ({
     name = name_;
     email = email_;
     phone = phone_;
     business_name = business_name_;
     logging = logging_;
     client_token = client_token_;
     tags = tags_;
   }
    : create_profile_request)

let make_sample_document_keys ?input:(input_ : s3_key option) ?output:(output_ : s3_key option) () =
  ({ input = input_; output = output_ } : sample_document_keys)

let make_sample_documents ~bucket_name:(bucket_name_ : bucket_name) ~keys:(keys_ : key_list) () =
  ({ bucket_name = bucket_name_; keys = keys_ } : sample_documents)

let make_output_conversion ?format_options:(format_options_ : format_options option)
    ?advanced_options:(advanced_options_ : advanced_options option)
    ~to_format:(to_format_ : to_format) () =
  ({
     to_format = to_format_;
     format_options = format_options_;
     advanced_options = advanced_options_;
   }
    : output_conversion)

let make_mapping ?template:(template_ : mapping_template option)
    ~template_language:(template_language_ : mapping_template_language) () =
  ({ template_language = template_language_; template = template_ } : mapping)

let make_input_conversion ?format_options:(format_options_ : format_options option)
    ?advanced_options:(advanced_options_ : advanced_options option)
    ~from_format:(from_format_ : from_format) () =
  ({
     from_format = from_format_;
     format_options = format_options_;
     advanced_options = advanced_options_;
   }
    : input_conversion)

let make_create_transformer_response ?file_format:(file_format_ : file_format option)
    ?mapping_template:(mapping_template_ : mapping_template option)
    ?edi_type:(edi_type_ : edi_type option)
    ?sample_document:(sample_document_ : file_location option)
    ?input_conversion:(input_conversion_ : input_conversion option)
    ?mapping:(mapping_ : mapping option)
    ?output_conversion:(output_conversion_ : output_conversion option)
    ?sample_documents:(sample_documents_ : sample_documents option)
    ~transformer_id:(transformer_id_ : transformer_id)
    ~transformer_arn:(transformer_arn_ : resource_arn) ~name:(name_ : transformer_name)
    ~status:(status_ : transformer_status) ~created_at:(created_at_ : created_date) () =
  ({
     transformer_id = transformer_id_;
     transformer_arn = transformer_arn_;
     name = name_;
     status = status_;
     created_at = created_at_;
     file_format = file_format_;
     mapping_template = mapping_template_;
     edi_type = edi_type_;
     sample_document = sample_document_;
     input_conversion = input_conversion_;
     mapping = mapping_;
     output_conversion = output_conversion_;
     sample_documents = sample_documents_;
   }
    : create_transformer_response)

let make_create_transformer_request
    ?client_token:(client_token_ : Smaws_Lib.Smithy_api.Types.string_ option)
    ?tags:(tags_ : tag_list option) ?file_format:(file_format_ : file_format option)
    ?mapping_template:(mapping_template_ : mapping_template option)
    ?edi_type:(edi_type_ : edi_type option)
    ?sample_document:(sample_document_ : file_location option)
    ?input_conversion:(input_conversion_ : input_conversion option)
    ?mapping:(mapping_ : mapping option)
    ?output_conversion:(output_conversion_ : output_conversion option)
    ?sample_documents:(sample_documents_ : sample_documents option) ~name:(name_ : transformer_name)
    () =
  ({
     name = name_;
     client_token = client_token_;
     tags = tags_;
     file_format = file_format_;
     mapping_template = mapping_template_;
     edi_type = edi_type_;
     sample_document = sample_document_;
     input_conversion = input_conversion_;
     mapping = mapping_;
     output_conversion = output_conversion_;
     sample_documents = sample_documents_;
   }
    : create_transformer_request)

let make_delete_capability_request ~capability_id:(capability_id_ : capability_id) () =
  ({ capability_id = capability_id_ } : delete_capability_request)

let make_delete_partnership_request ~partnership_id:(partnership_id_ : partnership_id) () =
  ({ partnership_id = partnership_id_ } : delete_partnership_request)

let make_delete_profile_request ~profile_id:(profile_id_ : profile_id) () =
  ({ profile_id = profile_id_ } : delete_profile_request)

let make_delete_transformer_request ~transformer_id:(transformer_id_ : transformer_id) () =
  ({ transformer_id = transformer_id_ } : delete_transformer_request)

let make_get_capability_response
    ?instructions_documents:(instructions_documents_ : instructions_documents option)
    ?modified_at:(modified_at_ : modified_date option)
    ~capability_id:(capability_id_ : capability_id) ~capability_arn:(capability_arn_ : resource_arn)
    ~name:(name_ : capability_name) ~type_:(type__ : capability_type)
    ~configuration:(configuration_ : capability_configuration)
    ~created_at:(created_at_ : created_date) () =
  ({
     capability_id = capability_id_;
     capability_arn = capability_arn_;
     name = name_;
     type_ = type__;
     configuration = configuration_;
     instructions_documents = instructions_documents_;
     created_at = created_at_;
     modified_at = modified_at_;
   }
    : get_capability_response)

let make_get_capability_request ~capability_id:(capability_id_ : capability_id) () =
  ({ capability_id = capability_id_ } : get_capability_request)

let make_get_partnership_response ?name:(name_ : partner_name option) ?email:(email_ : email option)
    ?phone:(phone_ : phone option) ?capabilities:(capabilities_ : partnership_capabilities option)
    ?capability_options:(capability_options_ : capability_options option)
    ?trading_partner_id:(trading_partner_id_ : trading_partner_id option)
    ?modified_at:(modified_at_ : modified_date option) ~profile_id:(profile_id_ : profile_id)
    ~partnership_id:(partnership_id_ : partnership_id)
    ~partnership_arn:(partnership_arn_ : resource_arn) ~created_at:(created_at_ : created_date) () =
  ({
     profile_id = profile_id_;
     partnership_id = partnership_id_;
     partnership_arn = partnership_arn_;
     name = name_;
     email = email_;
     phone = phone_;
     capabilities = capabilities_;
     capability_options = capability_options_;
     trading_partner_id = trading_partner_id_;
     created_at = created_at_;
     modified_at = modified_at_;
   }
    : get_partnership_response)

let make_get_partnership_request ~partnership_id:(partnership_id_ : partnership_id) () =
  ({ partnership_id = partnership_id_ } : get_partnership_request)

let make_get_profile_response ?email:(email_ : email option) ?logging:(logging_ : logging option)
    ?log_group_name:(log_group_name_ : log_group_name option)
    ?modified_at:(modified_at_ : modified_date option) ~profile_id:(profile_id_ : profile_id)
    ~profile_arn:(profile_arn_ : resource_arn) ~name:(name_ : profile_name) ~phone:(phone_ : phone)
    ~business_name:(business_name_ : business_name) ~created_at:(created_at_ : created_date) () =
  ({
     profile_id = profile_id_;
     profile_arn = profile_arn_;
     name = name_;
     email = email_;
     phone = phone_;
     business_name = business_name_;
     logging = logging_;
     log_group_name = log_group_name_;
     created_at = created_at_;
     modified_at = modified_at_;
   }
    : get_profile_response)

let make_get_profile_request ~profile_id:(profile_id_ : profile_id) () =
  ({ profile_id = profile_id_ } : get_profile_request)

let make_get_transformer_response ?modified_at:(modified_at_ : modified_date option)
    ?file_format:(file_format_ : file_format option)
    ?mapping_template:(mapping_template_ : mapping_template option)
    ?edi_type:(edi_type_ : edi_type option)
    ?sample_document:(sample_document_ : file_location option)
    ?input_conversion:(input_conversion_ : input_conversion option)
    ?mapping:(mapping_ : mapping option)
    ?output_conversion:(output_conversion_ : output_conversion option)
    ?sample_documents:(sample_documents_ : sample_documents option)
    ~transformer_id:(transformer_id_ : transformer_id)
    ~transformer_arn:(transformer_arn_ : resource_arn) ~name:(name_ : transformer_name)
    ~status:(status_ : transformer_status) ~created_at:(created_at_ : created_date) () =
  ({
     transformer_id = transformer_id_;
     transformer_arn = transformer_arn_;
     name = name_;
     status = status_;
     created_at = created_at_;
     modified_at = modified_at_;
     file_format = file_format_;
     mapping_template = mapping_template_;
     edi_type = edi_type_;
     sample_document = sample_document_;
     input_conversion = input_conversion_;
     mapping = mapping_;
     output_conversion = output_conversion_;
     sample_documents = sample_documents_;
   }
    : get_transformer_response)

let make_get_transformer_request ~transformer_id:(transformer_id_ : transformer_id) () =
  ({ transformer_id = transformer_id_ } : get_transformer_request)

let make_list_capabilities_response ?next_token:(next_token_ : page_token option)
    ~capabilities:(capabilities_ : capability_list) () =
  ({ capabilities = capabilities_; next_token = next_token_ } : list_capabilities_response)

let make_list_capabilities_request ?next_token:(next_token_ : page_token option)
    ?max_results:(max_results_ : max_results option) () =
  ({ next_token = next_token_; max_results = max_results_ } : list_capabilities_request)

let make_partnership_summary ?name:(name_ : partner_name option)
    ?capabilities:(capabilities_ : partnership_capabilities option)
    ?capability_options:(capability_options_ : capability_options option)
    ?trading_partner_id:(trading_partner_id_ : trading_partner_id option)
    ?modified_at:(modified_at_ : modified_date option) ~profile_id:(profile_id_ : profile_id)
    ~partnership_id:(partnership_id_ : partnership_id) ~created_at:(created_at_ : created_date) () =
  ({
     profile_id = profile_id_;
     partnership_id = partnership_id_;
     name = name_;
     capabilities = capabilities_;
     capability_options = capability_options_;
     trading_partner_id = trading_partner_id_;
     created_at = created_at_;
     modified_at = modified_at_;
   }
    : partnership_summary)

let make_list_partnerships_response ?next_token:(next_token_ : page_token option)
    ~partnerships:(partnerships_ : partnership_list) () =
  ({ partnerships = partnerships_; next_token = next_token_ } : list_partnerships_response)

let make_list_partnerships_request ?profile_id:(profile_id_ : profile_id option)
    ?next_token:(next_token_ : page_token option) ?max_results:(max_results_ : max_results option)
    () =
  ({ profile_id = profile_id_; next_token = next_token_; max_results = max_results_ }
    : list_partnerships_request)

let make_profile_summary ?logging:(logging_ : logging option)
    ?log_group_name:(log_group_name_ : log_group_name option)
    ?modified_at:(modified_at_ : modified_date option) ~profile_id:(profile_id_ : profile_id)
    ~name:(name_ : profile_name) ~business_name:(business_name_ : business_name)
    ~created_at:(created_at_ : created_date) () =
  ({
     profile_id = profile_id_;
     name = name_;
     business_name = business_name_;
     logging = logging_;
     log_group_name = log_group_name_;
     created_at = created_at_;
     modified_at = modified_at_;
   }
    : profile_summary)

let make_list_profiles_response ?next_token:(next_token_ : page_token option)
    ~profiles:(profiles_ : profile_list) () =
  ({ profiles = profiles_; next_token = next_token_ } : list_profiles_response)

let make_list_profiles_request ?next_token:(next_token_ : page_token option)
    ?max_results:(max_results_ : max_results option) () =
  ({ next_token = next_token_; max_results = max_results_ } : list_profiles_request)

let make_transformer_summary ?modified_at:(modified_at_ : modified_date option)
    ?file_format:(file_format_ : file_format option)
    ?mapping_template:(mapping_template_ : mapping_template option)
    ?edi_type:(edi_type_ : edi_type option)
    ?sample_document:(sample_document_ : file_location option)
    ?input_conversion:(input_conversion_ : input_conversion option)
    ?mapping:(mapping_ : mapping option)
    ?output_conversion:(output_conversion_ : output_conversion option)
    ?sample_documents:(sample_documents_ : sample_documents option)
    ~transformer_id:(transformer_id_ : transformer_id) ~name:(name_ : transformer_name)
    ~status:(status_ : transformer_status) ~created_at:(created_at_ : created_date) () =
  ({
     transformer_id = transformer_id_;
     name = name_;
     status = status_;
     created_at = created_at_;
     modified_at = modified_at_;
     file_format = file_format_;
     mapping_template = mapping_template_;
     edi_type = edi_type_;
     sample_document = sample_document_;
     input_conversion = input_conversion_;
     mapping = mapping_;
     output_conversion = output_conversion_;
     sample_documents = sample_documents_;
   }
    : transformer_summary)

let make_list_transformers_response ?next_token:(next_token_ : page_token option)
    ~transformers:(transformers_ : transformer_list) () =
  ({ transformers = transformers_; next_token = next_token_ } : list_transformers_response)

let make_list_transformers_request ?next_token:(next_token_ : page_token option)
    ?max_results:(max_results_ : max_results option) () =
  ({ next_token = next_token_; max_results = max_results_ } : list_transformers_request)

let make_update_capability_response
    ?instructions_documents:(instructions_documents_ : instructions_documents option)
    ?modified_at:(modified_at_ : modified_date option)
    ~capability_id:(capability_id_ : capability_id) ~capability_arn:(capability_arn_ : resource_arn)
    ~name:(name_ : capability_name) ~type_:(type__ : capability_type)
    ~configuration:(configuration_ : capability_configuration)
    ~created_at:(created_at_ : created_date) () =
  ({
     capability_id = capability_id_;
     capability_arn = capability_arn_;
     name = name_;
     type_ = type__;
     configuration = configuration_;
     instructions_documents = instructions_documents_;
     created_at = created_at_;
     modified_at = modified_at_;
   }
    : update_capability_response)

let make_update_capability_request ?name:(name_ : capability_name option)
    ?configuration:(configuration_ : capability_configuration option)
    ?instructions_documents:(instructions_documents_ : instructions_documents option)
    ~capability_id:(capability_id_ : capability_id) () =
  ({
     capability_id = capability_id_;
     name = name_;
     configuration = configuration_;
     instructions_documents = instructions_documents_;
   }
    : update_capability_request)

let make_update_partnership_response ?name:(name_ : partner_name option)
    ?email:(email_ : email option) ?phone:(phone_ : phone option)
    ?capabilities:(capabilities_ : partnership_capabilities option)
    ?capability_options:(capability_options_ : capability_options option)
    ?trading_partner_id:(trading_partner_id_ : trading_partner_id option)
    ?modified_at:(modified_at_ : modified_date option) ~profile_id:(profile_id_ : profile_id)
    ~partnership_id:(partnership_id_ : partnership_id)
    ~partnership_arn:(partnership_arn_ : resource_arn) ~created_at:(created_at_ : created_date) () =
  ({
     profile_id = profile_id_;
     partnership_id = partnership_id_;
     partnership_arn = partnership_arn_;
     name = name_;
     email = email_;
     phone = phone_;
     capabilities = capabilities_;
     capability_options = capability_options_;
     trading_partner_id = trading_partner_id_;
     created_at = created_at_;
     modified_at = modified_at_;
   }
    : update_partnership_response)

let make_update_partnership_request ?name:(name_ : partner_name option)
    ?capabilities:(capabilities_ : partnership_capabilities option)
    ?capability_options:(capability_options_ : capability_options option)
    ~partnership_id:(partnership_id_ : partnership_id) () =
  ({
     partnership_id = partnership_id_;
     name = name_;
     capabilities = capabilities_;
     capability_options = capability_options_;
   }
    : update_partnership_request)

let make_update_profile_response ?email:(email_ : email option) ?logging:(logging_ : logging option)
    ?log_group_name:(log_group_name_ : log_group_name option)
    ?modified_at:(modified_at_ : modified_date option) ~profile_id:(profile_id_ : profile_id)
    ~profile_arn:(profile_arn_ : resource_arn) ~name:(name_ : profile_name) ~phone:(phone_ : phone)
    ~business_name:(business_name_ : business_name) ~created_at:(created_at_ : created_date) () =
  ({
     profile_id = profile_id_;
     profile_arn = profile_arn_;
     name = name_;
     email = email_;
     phone = phone_;
     business_name = business_name_;
     logging = logging_;
     log_group_name = log_group_name_;
     created_at = created_at_;
     modified_at = modified_at_;
   }
    : update_profile_response)

let make_update_profile_request ?name:(name_ : profile_name option) ?email:(email_ : email option)
    ?phone:(phone_ : phone option) ?business_name:(business_name_ : business_name option)
    ~profile_id:(profile_id_ : profile_id) () =
  ({
     profile_id = profile_id_;
     name = name_;
     email = email_;
     phone = phone_;
     business_name = business_name_;
   }
    : update_profile_request)

let make_update_transformer_response ?file_format:(file_format_ : file_format option)
    ?mapping_template:(mapping_template_ : mapping_template option)
    ?edi_type:(edi_type_ : edi_type option)
    ?sample_document:(sample_document_ : file_location option)
    ?input_conversion:(input_conversion_ : input_conversion option)
    ?mapping:(mapping_ : mapping option)
    ?output_conversion:(output_conversion_ : output_conversion option)
    ?sample_documents:(sample_documents_ : sample_documents option)
    ~transformer_id:(transformer_id_ : transformer_id)
    ~transformer_arn:(transformer_arn_ : resource_arn) ~name:(name_ : transformer_name)
    ~status:(status_ : transformer_status) ~created_at:(created_at_ : created_date)
    ~modified_at:(modified_at_ : modified_date) () =
  ({
     transformer_id = transformer_id_;
     transformer_arn = transformer_arn_;
     name = name_;
     status = status_;
     created_at = created_at_;
     modified_at = modified_at_;
     file_format = file_format_;
     mapping_template = mapping_template_;
     edi_type = edi_type_;
     sample_document = sample_document_;
     input_conversion = input_conversion_;
     mapping = mapping_;
     output_conversion = output_conversion_;
     sample_documents = sample_documents_;
   }
    : update_transformer_response)

let make_update_transformer_request ?name:(name_ : transformer_name option)
    ?status:(status_ : transformer_status option) ?file_format:(file_format_ : file_format option)
    ?mapping_template:(mapping_template_ : mapping_template option)
    ?edi_type:(edi_type_ : edi_type option)
    ?sample_document:(sample_document_ : file_location option)
    ?input_conversion:(input_conversion_ : input_conversion option)
    ?mapping:(mapping_ : mapping option)
    ?output_conversion:(output_conversion_ : output_conversion option)
    ?sample_documents:(sample_documents_ : sample_documents option)
    ~transformer_id:(transformer_id_ : transformer_id) () =
  ({
     transformer_id = transformer_id_;
     name = name_;
     status = status_;
     file_format = file_format_;
     mapping_template = mapping_template_;
     edi_type = edi_type_;
     sample_document = sample_document_;
     input_conversion = input_conversion_;
     mapping = mapping_;
     output_conversion = output_conversion_;
     sample_documents = sample_documents_;
   }
    : update_transformer_request)
