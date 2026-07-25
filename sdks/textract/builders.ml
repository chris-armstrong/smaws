open Types

let make_adapter ?pages:(pages_ : adapter_pages option) ~adapter_id:(adapter_id_ : adapter_id)
    ~version:(version_ : adapter_version) () =
  ({ adapter_id = adapter_id_; pages = pages_; version = version_ } : adapter)

let make_adapter_overview ?adapter_id:(adapter_id_ : adapter_id option)
    ?adapter_name:(adapter_name_ : adapter_name option)
    ?creation_time:(creation_time_ : date_time option)
    ?feature_types:(feature_types_ : feature_types option) () =
  ({
     adapter_id = adapter_id_;
     adapter_name = adapter_name_;
     creation_time = creation_time_;
     feature_types = feature_types_;
   }
    : adapter_overview)

let make_s3_object ?bucket:(bucket_ : s3_bucket option) ?name:(name_ : s3_object_name option)
    ?version:(version_ : s3_object_version option) () =
  ({ bucket = bucket_; name = name_; version = version_ } : s3_object)

let make_adapter_version_dataset_config ?manifest_s3_object:(manifest_s3_object_ : s3_object option)
    () =
  ({ manifest_s3_object = manifest_s3_object_ } : adapter_version_dataset_config)

let make_evaluation_metric ?f1_score:(f1_score_ : float_ option)
    ?precision:(precision_ : float_ option) ?recall:(recall_ : float_ option) () =
  ({ f1_score = f1_score_; precision = precision_; recall = recall_ } : evaluation_metric)

let make_adapter_version_evaluation_metric ?baseline:(baseline_ : evaluation_metric option)
    ?adapter_version:(adapter_version_ : evaluation_metric option)
    ?feature_type:(feature_type_ : feature_type option) () =
  ({ baseline = baseline_; adapter_version = adapter_version_; feature_type = feature_type_ }
    : adapter_version_evaluation_metric)

let make_adapter_version_overview ?adapter_id:(adapter_id_ : adapter_id option)
    ?adapter_version:(adapter_version_ : adapter_version option)
    ?creation_time:(creation_time_ : date_time option)
    ?feature_types:(feature_types_ : feature_types option)
    ?status:(status_ : adapter_version_status option)
    ?status_message:(status_message_ : adapter_version_status_message option) () =
  ({
     adapter_id = adapter_id_;
     adapter_version = adapter_version_;
     creation_time = creation_time_;
     feature_types = feature_types_;
     status = status_;
     status_message = status_message_;
   }
    : adapter_version_overview)

let make_adapters_config ~adapters:(adapters_ : adapters) () =
  ({ adapters = adapters_ } : adapters_config)

let make_human_loop_activation_output ?human_loop_arn:(human_loop_arn_ : human_loop_arn option)
    ?human_loop_activation_reasons:
      (human_loop_activation_reasons_ : human_loop_activation_reasons option)
    ?human_loop_activation_conditions_evaluation_results:
      (human_loop_activation_conditions_evaluation_results_ :
         synthesized_json_human_loop_activation_conditions_evaluation_results option) () =
  ({
     human_loop_arn = human_loop_arn_;
     human_loop_activation_reasons = human_loop_activation_reasons_;
     human_loop_activation_conditions_evaluation_results =
       human_loop_activation_conditions_evaluation_results_;
   }
    : human_loop_activation_output)

let make_query ?alias:(alias_ : query_input option) ?pages:(pages_ : query_pages option)
    ~text:(text_ : query_input) () =
  ({ text = text_; alias = alias_; pages = pages_ } : query)

let make_relationship ?type_:(type__ : relationship_type option) ?ids:(ids_ : id_list option) () =
  ({ type_ = type__; ids = ids_ } : relationship)

let make_point ?x:(x_ : float_ option) ?y:(y_ : float_ option) () = ({ x = x_; y = y_ } : point)

let make_bounding_box ?width:(width_ : float_ option) ?height:(height_ : float_ option)
    ?left:(left_ : float_ option) ?top:(top_ : float_ option) () =
  ({ width = width_; height = height_; left = left_; top = top_ } : bounding_box)

let make_geometry ?bounding_box:(bounding_box_ : bounding_box option)
    ?polygon:(polygon_ : polygon option) ?rotation_angle:(rotation_angle_ : angle option) () =
  ({ bounding_box = bounding_box_; polygon = polygon_; rotation_angle = rotation_angle_ }
    : geometry)

let make_block ?block_type:(block_type_ : block_type option)
    ?confidence:(confidence_ : percent option) ?text:(text_ : string_ option)
    ?text_type:(text_type_ : text_type option) ?row_index:(row_index_ : u_integer option)
    ?column_index:(column_index_ : u_integer option) ?row_span:(row_span_ : u_integer option)
    ?column_span:(column_span_ : u_integer option) ?geometry:(geometry_ : geometry option)
    ?id:(id_ : non_empty_string option) ?relationships:(relationships_ : relationship_list option)
    ?entity_types:(entity_types_ : entity_types option)
    ?selection_status:(selection_status_ : selection_status option) ?page:(page_ : u_integer option)
    ?query:(query_ : query option) () =
  ({
     block_type = block_type_;
     confidence = confidence_;
     text = text_;
     text_type = text_type_;
     row_index = row_index_;
     column_index = column_index_;
     row_span = row_span_;
     column_span = column_span_;
     geometry = geometry_;
     id = id_;
     relationships = relationships_;
     entity_types = entity_types_;
     selection_status = selection_status_;
     page = page_;
     query = query_;
   }
    : block)

let make_document_metadata ?pages:(pages_ : u_integer option) () =
  ({ pages = pages_ } : document_metadata)

let make_analyze_document_response
    ?document_metadata:(document_metadata_ : document_metadata option)
    ?blocks:(blocks_ : block_list option)
    ?human_loop_activation_output:
      (human_loop_activation_output_ : human_loop_activation_output option)
    ?analyze_document_model_version:(analyze_document_model_version_ : string_ option) () =
  ({
     document_metadata = document_metadata_;
     blocks = blocks_;
     human_loop_activation_output = human_loop_activation_output_;
     analyze_document_model_version = analyze_document_model_version_;
   }
    : analyze_document_response)

let make_queries_config ~queries:(queries_ : queries) () = ({ queries = queries_ } : queries_config)

let make_human_loop_data_attributes
    ?content_classifiers:(content_classifiers_ : content_classifiers option) () =
  ({ content_classifiers = content_classifiers_ } : human_loop_data_attributes)

let make_human_loop_config ?data_attributes:(data_attributes_ : human_loop_data_attributes option)
    ~human_loop_name:(human_loop_name_ : human_loop_name)
    ~flow_definition_arn:(flow_definition_arn_ : flow_definition_arn) () =
  ({
     human_loop_name = human_loop_name_;
     flow_definition_arn = flow_definition_arn_;
     data_attributes = data_attributes_;
   }
    : human_loop_config)

let make_document ?bytes:(bytes_ : image_blob option) ?s3_object:(s3_object_ : s3_object option) ()
    =
  ({ bytes = bytes_; s3_object = s3_object_ } : document)

let make_analyze_document_request ?human_loop_config:(human_loop_config_ : human_loop_config option)
    ?queries_config:(queries_config_ : queries_config option)
    ?adapters_config:(adapters_config_ : adapters_config option) ~document:(document_ : document)
    ~feature_types:(feature_types_ : feature_types) () =
  ({
     document = document_;
     feature_types = feature_types_;
     human_loop_config = human_loop_config_;
     queries_config = queries_config_;
     adapters_config = adapters_config_;
   }
    : analyze_document_request)

let make_expense_group_property ?types:(types_ : string_list option) ?id:(id_ : string_ option) () =
  ({ types = types_; id = id_ } : expense_group_property)

let make_expense_currency ?code:(code_ : string_ option) ?confidence:(confidence_ : percent option)
    () =
  ({ code = code_; confidence = confidence_ } : expense_currency)

let make_expense_detection ?text:(text_ : string_ option) ?geometry:(geometry_ : geometry option)
    ?confidence:(confidence_ : percent option) () =
  ({ text = text_; geometry = geometry_; confidence = confidence_ } : expense_detection)

let make_expense_type ?text:(text_ : string_ option) ?confidence:(confidence_ : percent option) () =
  ({ text = text_; confidence = confidence_ } : expense_type)

let make_expense_field ?type_:(type__ : expense_type option)
    ?label_detection:(label_detection_ : expense_detection option)
    ?value_detection:(value_detection_ : expense_detection option)
    ?page_number:(page_number_ : u_integer option) ?currency:(currency_ : expense_currency option)
    ?group_properties:(group_properties_ : expense_group_property_list option) () =
  ({
     type_ = type__;
     label_detection = label_detection_;
     value_detection = value_detection_;
     page_number = page_number_;
     currency = currency_;
     group_properties = group_properties_;
   }
    : expense_field)

let make_line_item_fields
    ?line_item_expense_fields:(line_item_expense_fields_ : expense_field_list option) () =
  ({ line_item_expense_fields = line_item_expense_fields_ } : line_item_fields)

let make_line_item_group ?line_item_group_index:(line_item_group_index_ : u_integer option)
    ?line_items:(line_items_ : line_item_list option) () =
  ({ line_item_group_index = line_item_group_index_; line_items = line_items_ } : line_item_group)

let make_expense_document ?expense_index:(expense_index_ : u_integer option)
    ?summary_fields:(summary_fields_ : expense_field_list option)
    ?line_item_groups:(line_item_groups_ : line_item_group_list option)
    ?blocks:(blocks_ : block_list option) () =
  ({
     expense_index = expense_index_;
     summary_fields = summary_fields_;
     line_item_groups = line_item_groups_;
     blocks = blocks_;
   }
    : expense_document)

let make_analyze_expense_response ?document_metadata:(document_metadata_ : document_metadata option)
    ?expense_documents:(expense_documents_ : expense_document_list option) () =
  ({ document_metadata = document_metadata_; expense_documents = expense_documents_ }
    : analyze_expense_response)

let make_analyze_expense_request ~document:(document_ : document) () =
  ({ document = document_ } : analyze_expense_request)

let make_normalized_value ?value:(value_ : string_ option)
    ?value_type:(value_type_ : value_type option) () =
  ({ value = value_; value_type = value_type_ } : normalized_value)

let make_analyze_id_detections ?normalized_value:(normalized_value_ : normalized_value option)
    ?confidence:(confidence_ : percent option) ~text:(text_ : string_) () =
  ({ text = text_; normalized_value = normalized_value_; confidence = confidence_ }
    : analyze_id_detections)

let make_identity_document_field ?type_:(type__ : analyze_id_detections option)
    ?value_detection:(value_detection_ : analyze_id_detections option) () =
  ({ type_ = type__; value_detection = value_detection_ } : identity_document_field)

let make_identity_document ?document_index:(document_index_ : u_integer option)
    ?identity_document_fields:(identity_document_fields_ : identity_document_field_list option)
    ?blocks:(blocks_ : block_list option) () =
  ({
     document_index = document_index_;
     identity_document_fields = identity_document_fields_;
     blocks = blocks_;
   }
    : identity_document)

let make_analyze_id_response
    ?identity_documents:(identity_documents_ : identity_document_list option)
    ?document_metadata:(document_metadata_ : document_metadata option)
    ?analyze_id_model_version:(analyze_id_model_version_ : string_ option) () =
  ({
     identity_documents = identity_documents_;
     document_metadata = document_metadata_;
     analyze_id_model_version = analyze_id_model_version_;
   }
    : analyze_id_response)

let make_analyze_id_request ~document_pages:(document_pages_ : document_pages) () =
  ({ document_pages = document_pages_ } : analyze_id_request)

let make_create_adapter_response ?adapter_id:(adapter_id_ : adapter_id option) () =
  ({ adapter_id = adapter_id_ } : create_adapter_response)

let make_create_adapter_request
    ?client_request_token:(client_request_token_ : client_request_token option)
    ?description:(description_ : adapter_description option)
    ?auto_update:(auto_update_ : auto_update option) ?tags:(tags_ : tag_map option)
    ~adapter_name:(adapter_name_ : adapter_name) ~feature_types:(feature_types_ : feature_types) ()
    =
  ({
     adapter_name = adapter_name_;
     client_request_token = client_request_token_;
     description = description_;
     feature_types = feature_types_;
     auto_update = auto_update_;
     tags = tags_;
   }
    : create_adapter_request)

let make_create_adapter_version_response ?adapter_id:(adapter_id_ : adapter_id option)
    ?adapter_version:(adapter_version_ : adapter_version option) () =
  ({ adapter_id = adapter_id_; adapter_version = adapter_version_ }
    : create_adapter_version_response)

let make_output_config ?s3_prefix:(s3_prefix_ : s3_object_name option)
    ~s3_bucket:(s3_bucket_ : s3_bucket) () =
  ({ s3_bucket = s3_bucket_; s3_prefix = s3_prefix_ } : output_config)

let make_create_adapter_version_request
    ?client_request_token:(client_request_token_ : client_request_token option)
    ?kms_key_id:(kms_key_id_ : kms_key_id option) ?tags:(tags_ : tag_map option)
    ~adapter_id:(adapter_id_ : adapter_id)
    ~dataset_config:(dataset_config_ : adapter_version_dataset_config)
    ~output_config:(output_config_ : output_config) () =
  ({
     adapter_id = adapter_id_;
     client_request_token = client_request_token_;
     dataset_config = dataset_config_;
     kms_key_id = kms_key_id_;
     output_config = output_config_;
     tags = tags_;
   }
    : create_adapter_version_request)

let make_delete_adapter_response () = (() : unit)

let make_delete_adapter_request ~adapter_id:(adapter_id_ : adapter_id) () =
  ({ adapter_id = adapter_id_ } : delete_adapter_request)

let make_delete_adapter_version_response () = (() : unit)

let make_delete_adapter_version_request ~adapter_id:(adapter_id_ : adapter_id)
    ~adapter_version:(adapter_version_ : adapter_version) () =
  ({ adapter_id = adapter_id_; adapter_version = adapter_version_ }
    : delete_adapter_version_request)

let make_detect_document_text_response
    ?document_metadata:(document_metadata_ : document_metadata option)
    ?blocks:(blocks_ : block_list option)
    ?detect_document_text_model_version:(detect_document_text_model_version_ : string_ option) () =
  ({
     document_metadata = document_metadata_;
     blocks = blocks_;
     detect_document_text_model_version = detect_document_text_model_version_;
   }
    : detect_document_text_response)

let make_detect_document_text_request ~document:(document_ : document) () =
  ({ document = document_ } : detect_document_text_request)

let make_detected_signature ?page:(page_ : u_integer option) () =
  ({ page = page_ } : detected_signature)

let make_undetected_signature ?page:(page_ : u_integer option) () =
  ({ page = page_ } : undetected_signature)

let make_split_document ?index:(index_ : u_integer option) ?pages:(pages_ : page_list option) () =
  ({ index = index_; pages = pages_ } : split_document)

let make_document_group ?type_:(type__ : non_empty_string option)
    ?split_documents:(split_documents_ : split_document_list option)
    ?detected_signatures:(detected_signatures_ : detected_signature_list option)
    ?undetected_signatures:(undetected_signatures_ : undetected_signature_list option) () =
  ({
     type_ = type__;
     split_documents = split_documents_;
     detected_signatures = detected_signatures_;
     undetected_signatures = undetected_signatures_;
   }
    : document_group)

let make_document_location ?s3_object:(s3_object_ : s3_object option) () =
  ({ s3_object = s3_object_ } : document_location)

let make_signature_detection ?confidence:(confidence_ : percent option)
    ?geometry:(geometry_ : geometry option) () =
  ({ confidence = confidence_; geometry = geometry_ } : signature_detection)

let make_lending_detection ?text:(text_ : string_ option)
    ?selection_status:(selection_status_ : selection_status option)
    ?geometry:(geometry_ : geometry option) ?confidence:(confidence_ : percent option) () =
  ({
     text = text_;
     selection_status = selection_status_;
     geometry = geometry_;
     confidence = confidence_;
   }
    : lending_detection)

let make_lending_field ?type_:(type__ : string_ option)
    ?key_detection:(key_detection_ : lending_detection option)
    ?value_detections:(value_detections_ : lending_detection_list option) () =
  ({ type_ = type__; key_detection = key_detection_; value_detections = value_detections_ }
    : lending_field)

let make_lending_document ?lending_fields:(lending_fields_ : lending_field_list option)
    ?signature_detections:(signature_detections_ : signature_detection_list option) () =
  ({ lending_fields = lending_fields_; signature_detections = signature_detections_ }
    : lending_document)

let make_extraction ?lending_document:(lending_document_ : lending_document option)
    ?expense_document:(expense_document_ : expense_document option)
    ?identity_document:(identity_document_ : identity_document option) () =
  ({
     lending_document = lending_document_;
     expense_document = expense_document_;
     identity_document = identity_document_;
   }
    : extraction)

let make_get_adapter_response ?adapter_id:(adapter_id_ : adapter_id option)
    ?adapter_name:(adapter_name_ : adapter_name option)
    ?creation_time:(creation_time_ : date_time option)
    ?description:(description_ : adapter_description option)
    ?feature_types:(feature_types_ : feature_types option)
    ?auto_update:(auto_update_ : auto_update option) ?tags:(tags_ : tag_map option) () =
  ({
     adapter_id = adapter_id_;
     adapter_name = adapter_name_;
     creation_time = creation_time_;
     description = description_;
     feature_types = feature_types_;
     auto_update = auto_update_;
     tags = tags_;
   }
    : get_adapter_response)

let make_get_adapter_request ~adapter_id:(adapter_id_ : adapter_id) () =
  ({ adapter_id = adapter_id_ } : get_adapter_request)

let make_get_adapter_version_response ?adapter_id:(adapter_id_ : adapter_id option)
    ?adapter_version:(adapter_version_ : adapter_version option)
    ?creation_time:(creation_time_ : date_time option)
    ?feature_types:(feature_types_ : feature_types option)
    ?status:(status_ : adapter_version_status option)
    ?status_message:(status_message_ : adapter_version_status_message option)
    ?dataset_config:(dataset_config_ : adapter_version_dataset_config option)
    ?kms_key_id:(kms_key_id_ : kms_key_id option)
    ?output_config:(output_config_ : output_config option)
    ?evaluation_metrics:(evaluation_metrics_ : adapter_version_evaluation_metrics option)
    ?tags:(tags_ : tag_map option) () =
  ({
     adapter_id = adapter_id_;
     adapter_version = adapter_version_;
     creation_time = creation_time_;
     feature_types = feature_types_;
     status = status_;
     status_message = status_message_;
     dataset_config = dataset_config_;
     kms_key_id = kms_key_id_;
     output_config = output_config_;
     evaluation_metrics = evaluation_metrics_;
     tags = tags_;
   }
    : get_adapter_version_response)

let make_get_adapter_version_request ~adapter_id:(adapter_id_ : adapter_id)
    ~adapter_version:(adapter_version_ : adapter_version) () =
  ({ adapter_id = adapter_id_; adapter_version = adapter_version_ } : get_adapter_version_request)

let make_warning ?error_code:(error_code_ : error_code option) ?pages:(pages_ : pages option) () =
  ({ error_code = error_code_; pages = pages_ } : warning)

let make_get_document_analysis_response
    ?document_metadata:(document_metadata_ : document_metadata option)
    ?job_status:(job_status_ : job_status option)
    ?next_token:(next_token_ : pagination_token option) ?blocks:(blocks_ : block_list option)
    ?warnings:(warnings_ : warnings option)
    ?status_message:(status_message_ : status_message option)
    ?analyze_document_model_version:(analyze_document_model_version_ : string_ option) () =
  ({
     document_metadata = document_metadata_;
     job_status = job_status_;
     next_token = next_token_;
     blocks = blocks_;
     warnings = warnings_;
     status_message = status_message_;
     analyze_document_model_version = analyze_document_model_version_;
   }
    : get_document_analysis_response)

let make_get_document_analysis_request ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : pagination_token option) ~job_id:(job_id_ : job_id) () =
  ({ job_id = job_id_; max_results = max_results_; next_token = next_token_ }
    : get_document_analysis_request)

let make_get_document_text_detection_response
    ?document_metadata:(document_metadata_ : document_metadata option)
    ?job_status:(job_status_ : job_status option)
    ?next_token:(next_token_ : pagination_token option) ?blocks:(blocks_ : block_list option)
    ?warnings:(warnings_ : warnings option)
    ?status_message:(status_message_ : status_message option)
    ?detect_document_text_model_version:(detect_document_text_model_version_ : string_ option) () =
  ({
     document_metadata = document_metadata_;
     job_status = job_status_;
     next_token = next_token_;
     blocks = blocks_;
     warnings = warnings_;
     status_message = status_message_;
     detect_document_text_model_version = detect_document_text_model_version_;
   }
    : get_document_text_detection_response)

let make_get_document_text_detection_request ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : pagination_token option) ~job_id:(job_id_ : job_id) () =
  ({ job_id = job_id_; max_results = max_results_; next_token = next_token_ }
    : get_document_text_detection_request)

let make_get_expense_analysis_response
    ?document_metadata:(document_metadata_ : document_metadata option)
    ?job_status:(job_status_ : job_status option)
    ?next_token:(next_token_ : pagination_token option)
    ?expense_documents:(expense_documents_ : expense_document_list option)
    ?warnings:(warnings_ : warnings option)
    ?status_message:(status_message_ : status_message option)
    ?analyze_expense_model_version:(analyze_expense_model_version_ : string_ option) () =
  ({
     document_metadata = document_metadata_;
     job_status = job_status_;
     next_token = next_token_;
     expense_documents = expense_documents_;
     warnings = warnings_;
     status_message = status_message_;
     analyze_expense_model_version = analyze_expense_model_version_;
   }
    : get_expense_analysis_response)

let make_get_expense_analysis_request ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : pagination_token option) ~job_id:(job_id_ : job_id) () =
  ({ job_id = job_id_; max_results = max_results_; next_token = next_token_ }
    : get_expense_analysis_request)

let make_prediction ?value:(value_ : non_empty_string option)
    ?confidence:(confidence_ : percent option) () =
  ({ value = value_; confidence = confidence_ } : prediction)

let make_page_classification ~page_type:(page_type_ : prediction_list)
    ~page_number:(page_number_ : prediction_list) () =
  ({ page_type = page_type_; page_number = page_number_ } : page_classification)

let make_get_lending_analysis_response
    ?document_metadata:(document_metadata_ : document_metadata option)
    ?job_status:(job_status_ : job_status option)
    ?next_token:(next_token_ : pagination_token option)
    ?results:(results_ : lending_result_list option) ?warnings:(warnings_ : warnings option)
    ?status_message:(status_message_ : status_message option)
    ?analyze_lending_model_version:(analyze_lending_model_version_ : string_ option) () =
  ({
     document_metadata = document_metadata_;
     job_status = job_status_;
     next_token = next_token_;
     results = results_;
     warnings = warnings_;
     status_message = status_message_;
     analyze_lending_model_version = analyze_lending_model_version_;
   }
    : get_lending_analysis_response)

let make_get_lending_analysis_request ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : pagination_token option) ~job_id:(job_id_ : job_id) () =
  ({ job_id = job_id_; max_results = max_results_; next_token = next_token_ }
    : get_lending_analysis_request)

let make_lending_summary ?document_groups:(document_groups_ : document_group_list option)
    ?undetected_document_types:(undetected_document_types_ : undetected_document_type_list option)
    () =
  ({ document_groups = document_groups_; undetected_document_types = undetected_document_types_ }
    : lending_summary)

let make_get_lending_analysis_summary_response
    ?document_metadata:(document_metadata_ : document_metadata option)
    ?job_status:(job_status_ : job_status option) ?summary:(summary_ : lending_summary option)
    ?warnings:(warnings_ : warnings option)
    ?status_message:(status_message_ : status_message option)
    ?analyze_lending_model_version:(analyze_lending_model_version_ : string_ option) () =
  ({
     document_metadata = document_metadata_;
     job_status = job_status_;
     summary = summary_;
     warnings = warnings_;
     status_message = status_message_;
     analyze_lending_model_version = analyze_lending_model_version_;
   }
    : get_lending_analysis_summary_response)

let make_get_lending_analysis_summary_request ~job_id:(job_id_ : job_id) () =
  ({ job_id = job_id_ } : get_lending_analysis_summary_request)

let make_list_adapter_versions_response
    ?adapter_versions:(adapter_versions_ : adapter_version_list option)
    ?next_token:(next_token_ : pagination_token option) () =
  ({ adapter_versions = adapter_versions_; next_token = next_token_ }
    : list_adapter_versions_response)

let make_list_adapter_versions_request ?adapter_id:(adapter_id_ : adapter_id option)
    ?after_creation_time:(after_creation_time_ : date_time option)
    ?before_creation_time:(before_creation_time_ : date_time option)
    ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : pagination_token option) () =
  ({
     adapter_id = adapter_id_;
     after_creation_time = after_creation_time_;
     before_creation_time = before_creation_time_;
     max_results = max_results_;
     next_token = next_token_;
   }
    : list_adapter_versions_request)

let make_list_adapters_response ?adapters:(adapters_ : adapter_list option)
    ?next_token:(next_token_ : pagination_token option) () =
  ({ adapters = adapters_; next_token = next_token_ } : list_adapters_response)

let make_list_adapters_request ?after_creation_time:(after_creation_time_ : date_time option)
    ?before_creation_time:(before_creation_time_ : date_time option)
    ?max_results:(max_results_ : max_results option)
    ?next_token:(next_token_ : pagination_token option) () =
  ({
     after_creation_time = after_creation_time_;
     before_creation_time = before_creation_time_;
     max_results = max_results_;
     next_token = next_token_;
   }
    : list_adapters_request)

let make_list_tags_for_resource_response ?tags:(tags_ : tag_map option) () =
  ({ tags = tags_ } : list_tags_for_resource_response)

let make_list_tags_for_resource_request ~resource_ar_n:(resource_ar_n_ : amazon_resource_name) () =
  ({ resource_ar_n = resource_ar_n_ } : list_tags_for_resource_request)

let make_notification_channel ~sns_topic_arn:(sns_topic_arn_ : sns_topic_arn)
    ~role_arn:(role_arn_ : role_arn) () =
  ({ sns_topic_arn = sns_topic_arn_; role_arn = role_arn_ } : notification_channel)

let make_start_document_analysis_response ?job_id:(job_id_ : job_id option) () =
  ({ job_id = job_id_ } : start_document_analysis_response)

let make_start_document_analysis_request
    ?client_request_token:(client_request_token_ : client_request_token option)
    ?job_tag:(job_tag_ : job_tag option)
    ?notification_channel:(notification_channel_ : notification_channel option)
    ?output_config:(output_config_ : output_config option)
    ?kms_key_id:(kms_key_id_ : kms_key_id option)
    ?queries_config:(queries_config_ : queries_config option)
    ?adapters_config:(adapters_config_ : adapters_config option)
    ~document_location:(document_location_ : document_location)
    ~feature_types:(feature_types_ : feature_types) () =
  ({
     document_location = document_location_;
     feature_types = feature_types_;
     client_request_token = client_request_token_;
     job_tag = job_tag_;
     notification_channel = notification_channel_;
     output_config = output_config_;
     kms_key_id = kms_key_id_;
     queries_config = queries_config_;
     adapters_config = adapters_config_;
   }
    : start_document_analysis_request)

let make_start_document_text_detection_response ?job_id:(job_id_ : job_id option) () =
  ({ job_id = job_id_ } : start_document_text_detection_response)

let make_start_document_text_detection_request
    ?client_request_token:(client_request_token_ : client_request_token option)
    ?job_tag:(job_tag_ : job_tag option)
    ?notification_channel:(notification_channel_ : notification_channel option)
    ?output_config:(output_config_ : output_config option)
    ?kms_key_id:(kms_key_id_ : kms_key_id option)
    ~document_location:(document_location_ : document_location) () =
  ({
     document_location = document_location_;
     client_request_token = client_request_token_;
     job_tag = job_tag_;
     notification_channel = notification_channel_;
     output_config = output_config_;
     kms_key_id = kms_key_id_;
   }
    : start_document_text_detection_request)

let make_start_expense_analysis_response ?job_id:(job_id_ : job_id option) () =
  ({ job_id = job_id_ } : start_expense_analysis_response)

let make_start_expense_analysis_request
    ?client_request_token:(client_request_token_ : client_request_token option)
    ?job_tag:(job_tag_ : job_tag option)
    ?notification_channel:(notification_channel_ : notification_channel option)
    ?output_config:(output_config_ : output_config option)
    ?kms_key_id:(kms_key_id_ : kms_key_id option)
    ~document_location:(document_location_ : document_location) () =
  ({
     document_location = document_location_;
     client_request_token = client_request_token_;
     job_tag = job_tag_;
     notification_channel = notification_channel_;
     output_config = output_config_;
     kms_key_id = kms_key_id_;
   }
    : start_expense_analysis_request)

let make_start_lending_analysis_response ?job_id:(job_id_ : job_id option) () =
  ({ job_id = job_id_ } : start_lending_analysis_response)

let make_start_lending_analysis_request
    ?client_request_token:(client_request_token_ : client_request_token option)
    ?job_tag:(job_tag_ : job_tag option)
    ?notification_channel:(notification_channel_ : notification_channel option)
    ?output_config:(output_config_ : output_config option)
    ?kms_key_id:(kms_key_id_ : kms_key_id option)
    ~document_location:(document_location_ : document_location) () =
  ({
     document_location = document_location_;
     client_request_token = client_request_token_;
     job_tag = job_tag_;
     notification_channel = notification_channel_;
     output_config = output_config_;
     kms_key_id = kms_key_id_;
   }
    : start_lending_analysis_request)

let make_tag_resource_response () = (() : unit)

let make_tag_resource_request ~resource_ar_n:(resource_ar_n_ : amazon_resource_name)
    ~tags:(tags_ : tag_map) () =
  ({ resource_ar_n = resource_ar_n_; tags = tags_ } : tag_resource_request)

let make_update_adapter_response ?adapter_id:(adapter_id_ : adapter_id option)
    ?adapter_name:(adapter_name_ : adapter_name option)
    ?creation_time:(creation_time_ : date_time option)
    ?description:(description_ : adapter_description option)
    ?feature_types:(feature_types_ : feature_types option)
    ?auto_update:(auto_update_ : auto_update option) () =
  ({
     adapter_id = adapter_id_;
     adapter_name = adapter_name_;
     creation_time = creation_time_;
     description = description_;
     feature_types = feature_types_;
     auto_update = auto_update_;
   }
    : update_adapter_response)

let make_update_adapter_request ?description:(description_ : adapter_description option)
    ?adapter_name:(adapter_name_ : adapter_name option)
    ?auto_update:(auto_update_ : auto_update option) ~adapter_id:(adapter_id_ : adapter_id) () =
  ({
     adapter_id = adapter_id_;
     description = description_;
     adapter_name = adapter_name_;
     auto_update = auto_update_;
   }
    : update_adapter_request)

let make_untag_resource_response () = (() : unit)

let make_untag_resource_request ~resource_ar_n:(resource_ar_n_ : amazon_resource_name)
    ~tag_keys:(tag_keys_ : tag_key_list) () =
  ({ resource_ar_n = resource_ar_n_; tag_keys = tag_keys_ } : untag_resource_request)
