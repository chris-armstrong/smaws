open Types

let make_warning ?pages:(pages_ : pages option) ?error_code:(error_code_ : error_code option) () =
  ({ pages = pages_; error_code = error_code_ } : warning)

let make_update_adapter_response ?auto_update:(auto_update_ : auto_update option)
    ?feature_types:(feature_types_ : feature_types option)
    ?description:(description_ : adapter_description option)
    ?creation_time:(creation_time_ : date_time option)
    ?adapter_name:(adapter_name_ : adapter_name option)
    ?adapter_id:(adapter_id_ : adapter_id option) () =
  ({
     auto_update = auto_update_;
     feature_types = feature_types_;
     description = description_;
     creation_time = creation_time_;
     adapter_name = adapter_name_;
     adapter_id = adapter_id_;
   }
    : update_adapter_response)

let make_update_adapter_request ?auto_update:(auto_update_ : auto_update option)
    ?adapter_name:(adapter_name_ : adapter_name option)
    ?description:(description_ : adapter_description option) ~adapter_id:(adapter_id_ : adapter_id)
    () =
  ({
     auto_update = auto_update_;
     adapter_name = adapter_name_;
     description = description_;
     adapter_id = adapter_id_;
   }
    : update_adapter_request)

let make_untag_resource_response () = (() : unit)

let make_untag_resource_request ~tag_keys:(tag_keys_ : tag_key_list)
    ~resource_ar_n:(resource_ar_n_ : amazon_resource_name) () =
  ({ tag_keys = tag_keys_; resource_ar_n = resource_ar_n_ } : untag_resource_request)

let make_undetected_signature ?page:(page_ : u_integer option) () =
  ({ page = page_ } : undetected_signature)

let make_tag_resource_response () = (() : unit)

let make_tag_resource_request ~tags:(tags_ : tag_map)
    ~resource_ar_n:(resource_ar_n_ : amazon_resource_name) () =
  ({ tags = tags_; resource_ar_n = resource_ar_n_ } : tag_resource_request)

let make_start_lending_analysis_response ?job_id:(job_id_ : job_id option) () =
  ({ job_id = job_id_ } : start_lending_analysis_response)

let make_s3_object ?version:(version_ : s3_object_version option)
    ?name:(name_ : s3_object_name option) ?bucket:(bucket_ : s3_bucket option) () =
  ({ version = version_; name = name_; bucket = bucket_ } : s3_object)

let make_document_location ?s3_object:(s3_object_ : s3_object option) () =
  ({ s3_object = s3_object_ } : document_location)

let make_notification_channel ~role_arn:(role_arn_ : role_arn)
    ~sns_topic_arn:(sns_topic_arn_ : sns_topic_arn) () =
  ({ role_arn = role_arn_; sns_topic_arn = sns_topic_arn_ } : notification_channel)

let make_output_config ?s3_prefix:(s3_prefix_ : s3_object_name option)
    ~s3_bucket:(s3_bucket_ : s3_bucket) () =
  ({ s3_prefix = s3_prefix_; s3_bucket = s3_bucket_ } : output_config)

let make_start_lending_analysis_request ?kms_key_id:(kms_key_id_ : kms_key_id option)
    ?output_config:(output_config_ : output_config option)
    ?notification_channel:(notification_channel_ : notification_channel option)
    ?job_tag:(job_tag_ : job_tag option)
    ?client_request_token:(client_request_token_ : client_request_token option)
    ~document_location:(document_location_ : document_location) () =
  ({
     kms_key_id = kms_key_id_;
     output_config = output_config_;
     notification_channel = notification_channel_;
     job_tag = job_tag_;
     client_request_token = client_request_token_;
     document_location = document_location_;
   }
    : start_lending_analysis_request)

let make_start_expense_analysis_response ?job_id:(job_id_ : job_id option) () =
  ({ job_id = job_id_ } : start_expense_analysis_response)

let make_start_expense_analysis_request ?kms_key_id:(kms_key_id_ : kms_key_id option)
    ?output_config:(output_config_ : output_config option)
    ?notification_channel:(notification_channel_ : notification_channel option)
    ?job_tag:(job_tag_ : job_tag option)
    ?client_request_token:(client_request_token_ : client_request_token option)
    ~document_location:(document_location_ : document_location) () =
  ({
     kms_key_id = kms_key_id_;
     output_config = output_config_;
     notification_channel = notification_channel_;
     job_tag = job_tag_;
     client_request_token = client_request_token_;
     document_location = document_location_;
   }
    : start_expense_analysis_request)

let make_start_document_text_detection_response ?job_id:(job_id_ : job_id option) () =
  ({ job_id = job_id_ } : start_document_text_detection_response)

let make_start_document_text_detection_request ?kms_key_id:(kms_key_id_ : kms_key_id option)
    ?output_config:(output_config_ : output_config option)
    ?notification_channel:(notification_channel_ : notification_channel option)
    ?job_tag:(job_tag_ : job_tag option)
    ?client_request_token:(client_request_token_ : client_request_token option)
    ~document_location:(document_location_ : document_location) () =
  ({
     kms_key_id = kms_key_id_;
     output_config = output_config_;
     notification_channel = notification_channel_;
     job_tag = job_tag_;
     client_request_token = client_request_token_;
     document_location = document_location_;
   }
    : start_document_text_detection_request)

let make_start_document_analysis_response ?job_id:(job_id_ : job_id option) () =
  ({ job_id = job_id_ } : start_document_analysis_response)

let make_query ?pages:(pages_ : query_pages option) ?alias:(alias_ : query_input option)
    ~text:(text_ : query_input) () =
  ({ pages = pages_; alias = alias_; text = text_ } : query)

let make_queries_config ~queries:(queries_ : queries) () = ({ queries = queries_ } : queries_config)

let make_adapter ?pages:(pages_ : adapter_pages option) ~version:(version_ : adapter_version)
    ~adapter_id:(adapter_id_ : adapter_id) () =
  ({ version = version_; pages = pages_; adapter_id = adapter_id_ } : adapter)

let make_adapters_config ~adapters:(adapters_ : adapters) () =
  ({ adapters = adapters_ } : adapters_config)

let make_start_document_analysis_request
    ?adapters_config:(adapters_config_ : adapters_config option)
    ?queries_config:(queries_config_ : queries_config option)
    ?kms_key_id:(kms_key_id_ : kms_key_id option)
    ?output_config:(output_config_ : output_config option)
    ?notification_channel:(notification_channel_ : notification_channel option)
    ?job_tag:(job_tag_ : job_tag option)
    ?client_request_token:(client_request_token_ : client_request_token option)
    ~feature_types:(feature_types_ : feature_types)
    ~document_location:(document_location_ : document_location) () =
  ({
     adapters_config = adapters_config_;
     queries_config = queries_config_;
     kms_key_id = kms_key_id_;
     output_config = output_config_;
     notification_channel = notification_channel_;
     job_tag = job_tag_;
     client_request_token = client_request_token_;
     feature_types = feature_types_;
     document_location = document_location_;
   }
    : start_document_analysis_request)

let make_list_tags_for_resource_response ?tags:(tags_ : tag_map option) () =
  ({ tags = tags_ } : list_tags_for_resource_response)

let make_list_tags_for_resource_request ~resource_ar_n:(resource_ar_n_ : amazon_resource_name) () =
  ({ resource_ar_n = resource_ar_n_ } : list_tags_for_resource_request)

let make_adapter_version_overview
    ?status_message:(status_message_ : adapter_version_status_message option)
    ?status:(status_ : adapter_version_status option)
    ?feature_types:(feature_types_ : feature_types option)
    ?creation_time:(creation_time_ : date_time option)
    ?adapter_version:(adapter_version_ : adapter_version option)
    ?adapter_id:(adapter_id_ : adapter_id option) () =
  ({
     status_message = status_message_;
     status = status_;
     feature_types = feature_types_;
     creation_time = creation_time_;
     adapter_version = adapter_version_;
     adapter_id = adapter_id_;
   }
    : adapter_version_overview)

let make_list_adapter_versions_response ?next_token:(next_token_ : pagination_token option)
    ?adapter_versions:(adapter_versions_ : adapter_version_list option) () =
  ({ next_token = next_token_; adapter_versions = adapter_versions_ }
    : list_adapter_versions_response)

let make_list_adapter_versions_request ?next_token:(next_token_ : pagination_token option)
    ?max_results:(max_results_ : max_results option)
    ?before_creation_time:(before_creation_time_ : date_time option)
    ?after_creation_time:(after_creation_time_ : date_time option)
    ?adapter_id:(adapter_id_ : adapter_id option) () =
  ({
     next_token = next_token_;
     max_results = max_results_;
     before_creation_time = before_creation_time_;
     after_creation_time = after_creation_time_;
     adapter_id = adapter_id_;
   }
    : list_adapter_versions_request)

let make_adapter_overview ?feature_types:(feature_types_ : feature_types option)
    ?creation_time:(creation_time_ : date_time option)
    ?adapter_name:(adapter_name_ : adapter_name option)
    ?adapter_id:(adapter_id_ : adapter_id option) () =
  ({
     feature_types = feature_types_;
     creation_time = creation_time_;
     adapter_name = adapter_name_;
     adapter_id = adapter_id_;
   }
    : adapter_overview)

let make_list_adapters_response ?next_token:(next_token_ : pagination_token option)
    ?adapters:(adapters_ : adapter_list option) () =
  ({ next_token = next_token_; adapters = adapters_ } : list_adapters_response)

let make_list_adapters_request ?next_token:(next_token_ : pagination_token option)
    ?max_results:(max_results_ : max_results option)
    ?before_creation_time:(before_creation_time_ : date_time option)
    ?after_creation_time:(after_creation_time_ : date_time option) () =
  ({
     next_token = next_token_;
     max_results = max_results_;
     before_creation_time = before_creation_time_;
     after_creation_time = after_creation_time_;
   }
    : list_adapters_request)

let make_document_metadata ?pages:(pages_ : u_integer option) () =
  ({ pages = pages_ } : document_metadata)

let make_split_document ?pages:(pages_ : page_list option) ?index:(index_ : u_integer option) () =
  ({ pages = pages_; index = index_ } : split_document)

let make_detected_signature ?page:(page_ : u_integer option) () =
  ({ page = page_ } : detected_signature)

let make_document_group
    ?undetected_signatures:(undetected_signatures_ : undetected_signature_list option)
    ?detected_signatures:(detected_signatures_ : detected_signature_list option)
    ?split_documents:(split_documents_ : split_document_list option)
    ?type_:(type__ : non_empty_string option) () =
  ({
     undetected_signatures = undetected_signatures_;
     detected_signatures = detected_signatures_;
     split_documents = split_documents_;
     type_ = type__;
   }
    : document_group)

let make_lending_summary
    ?undetected_document_types:(undetected_document_types_ : undetected_document_type_list option)
    ?document_groups:(document_groups_ : document_group_list option) () =
  ({ undetected_document_types = undetected_document_types_; document_groups = document_groups_ }
    : lending_summary)

let make_get_lending_analysis_summary_response
    ?analyze_lending_model_version:(analyze_lending_model_version_ : string_ option)
    ?status_message:(status_message_ : status_message option)
    ?warnings:(warnings_ : warnings option) ?summary:(summary_ : lending_summary option)
    ?job_status:(job_status_ : job_status option)
    ?document_metadata:(document_metadata_ : document_metadata option) () =
  ({
     analyze_lending_model_version = analyze_lending_model_version_;
     status_message = status_message_;
     warnings = warnings_;
     summary = summary_;
     job_status = job_status_;
     document_metadata = document_metadata_;
   }
    : get_lending_analysis_summary_response)

let make_get_lending_analysis_summary_request ~job_id:(job_id_ : job_id) () =
  ({ job_id = job_id_ } : get_lending_analysis_summary_request)

let make_prediction ?confidence:(confidence_ : percent option)
    ?value:(value_ : non_empty_string option) () =
  ({ confidence = confidence_; value = value_ } : prediction)

let make_page_classification ~page_number:(page_number_ : prediction_list)
    ~page_type:(page_type_ : prediction_list) () =
  ({ page_number = page_number_; page_type = page_type_ } : page_classification)

let make_bounding_box ?top:(top_ : float_ option) ?left:(left_ : float_ option)
    ?height:(height_ : float_ option) ?width:(width_ : float_ option) () =
  ({ top = top_; left = left_; height = height_; width = width_ } : bounding_box)

let make_point ?y:(y_ : float_ option) ?x:(x_ : float_ option) () = ({ y = y_; x = x_ } : point)

let make_geometry ?rotation_angle:(rotation_angle_ : angle option)
    ?polygon:(polygon_ : polygon option) ?bounding_box:(bounding_box_ : bounding_box option) () =
  ({ rotation_angle = rotation_angle_; polygon = polygon_; bounding_box = bounding_box_ }
    : geometry)

let make_lending_detection ?confidence:(confidence_ : percent option)
    ?geometry:(geometry_ : geometry option)
    ?selection_status:(selection_status_ : selection_status option) ?text:(text_ : string_ option)
    () =
  ({
     confidence = confidence_;
     geometry = geometry_;
     selection_status = selection_status_;
     text = text_;
   }
    : lending_detection)

let make_lending_field ?value_detections:(value_detections_ : lending_detection_list option)
    ?key_detection:(key_detection_ : lending_detection option) ?type_:(type__ : string_ option) () =
  ({ value_detections = value_detections_; key_detection = key_detection_; type_ = type__ }
    : lending_field)

let make_signature_detection ?geometry:(geometry_ : geometry option)
    ?confidence:(confidence_ : percent option) () =
  ({ geometry = geometry_; confidence = confidence_ } : signature_detection)

let make_lending_document
    ?signature_detections:(signature_detections_ : signature_detection_list option)
    ?lending_fields:(lending_fields_ : lending_field_list option) () =
  ({ signature_detections = signature_detections_; lending_fields = lending_fields_ }
    : lending_document)

let make_expense_type ?confidence:(confidence_ : percent option) ?text:(text_ : string_ option) () =
  ({ confidence = confidence_; text = text_ } : expense_type)

let make_expense_detection ?confidence:(confidence_ : percent option)
    ?geometry:(geometry_ : geometry option) ?text:(text_ : string_ option) () =
  ({ confidence = confidence_; geometry = geometry_; text = text_ } : expense_detection)

let make_expense_currency ?confidence:(confidence_ : percent option) ?code:(code_ : string_ option)
    () =
  ({ confidence = confidence_; code = code_ } : expense_currency)

let make_expense_group_property ?id:(id_ : string_ option) ?types:(types_ : string_list option) () =
  ({ id = id_; types = types_ } : expense_group_property)

let make_expense_field ?group_properties:(group_properties_ : expense_group_property_list option)
    ?currency:(currency_ : expense_currency option) ?page_number:(page_number_ : u_integer option)
    ?value_detection:(value_detection_ : expense_detection option)
    ?label_detection:(label_detection_ : expense_detection option)
    ?type_:(type__ : expense_type option) () =
  ({
     group_properties = group_properties_;
     currency = currency_;
     page_number = page_number_;
     value_detection = value_detection_;
     label_detection = label_detection_;
     type_ = type__;
   }
    : expense_field)

let make_line_item_fields
    ?line_item_expense_fields:(line_item_expense_fields_ : expense_field_list option) () =
  ({ line_item_expense_fields = line_item_expense_fields_ } : line_item_fields)

let make_line_item_group ?line_items:(line_items_ : line_item_list option)
    ?line_item_group_index:(line_item_group_index_ : u_integer option) () =
  ({ line_items = line_items_; line_item_group_index = line_item_group_index_ } : line_item_group)

let make_relationship ?ids:(ids_ : id_list option) ?type_:(type__ : relationship_type option) () =
  ({ ids = ids_; type_ = type__ } : relationship)

let make_block ?query:(query_ : query option) ?page:(page_ : u_integer option)
    ?selection_status:(selection_status_ : selection_status option)
    ?entity_types:(entity_types_ : entity_types option)
    ?relationships:(relationships_ : relationship_list option) ?id:(id_ : non_empty_string option)
    ?geometry:(geometry_ : geometry option) ?column_span:(column_span_ : u_integer option)
    ?row_span:(row_span_ : u_integer option) ?column_index:(column_index_ : u_integer option)
    ?row_index:(row_index_ : u_integer option) ?text_type:(text_type_ : text_type option)
    ?text:(text_ : string_ option) ?confidence:(confidence_ : percent option)
    ?block_type:(block_type_ : block_type option) () =
  ({
     query = query_;
     page = page_;
     selection_status = selection_status_;
     entity_types = entity_types_;
     relationships = relationships_;
     id = id_;
     geometry = geometry_;
     column_span = column_span_;
     row_span = row_span_;
     column_index = column_index_;
     row_index = row_index_;
     text_type = text_type_;
     text = text_;
     confidence = confidence_;
     block_type = block_type_;
   }
    : block)

let make_expense_document ?blocks:(blocks_ : block_list option)
    ?line_item_groups:(line_item_groups_ : line_item_group_list option)
    ?summary_fields:(summary_fields_ : expense_field_list option)
    ?expense_index:(expense_index_ : u_integer option) () =
  ({
     blocks = blocks_;
     line_item_groups = line_item_groups_;
     summary_fields = summary_fields_;
     expense_index = expense_index_;
   }
    : expense_document)

let make_normalized_value ?value_type:(value_type_ : value_type option)
    ?value:(value_ : string_ option) () =
  ({ value_type = value_type_; value = value_ } : normalized_value)

let make_analyze_id_detections ?confidence:(confidence_ : percent option)
    ?normalized_value:(normalized_value_ : normalized_value option) ~text:(text_ : string_) () =
  ({ confidence = confidence_; normalized_value = normalized_value_; text = text_ }
    : analyze_id_detections)

let make_identity_document_field ?value_detection:(value_detection_ : analyze_id_detections option)
    ?type_:(type__ : analyze_id_detections option) () =
  ({ value_detection = value_detection_; type_ = type__ } : identity_document_field)

let make_identity_document ?blocks:(blocks_ : block_list option)
    ?identity_document_fields:(identity_document_fields_ : identity_document_field_list option)
    ?document_index:(document_index_ : u_integer option) () =
  ({
     blocks = blocks_;
     identity_document_fields = identity_document_fields_;
     document_index = document_index_;
   }
    : identity_document)

let make_extraction ?identity_document:(identity_document_ : identity_document option)
    ?expense_document:(expense_document_ : expense_document option)
    ?lending_document:(lending_document_ : lending_document option) () =
  ({
     identity_document = identity_document_;
     expense_document = expense_document_;
     lending_document = lending_document_;
   }
    : extraction)

let make_get_lending_analysis_response
    ?analyze_lending_model_version:(analyze_lending_model_version_ : string_ option)
    ?status_message:(status_message_ : status_message option)
    ?warnings:(warnings_ : warnings option) ?results:(results_ : lending_result_list option)
    ?next_token:(next_token_ : pagination_token option)
    ?job_status:(job_status_ : job_status option)
    ?document_metadata:(document_metadata_ : document_metadata option) () =
  ({
     analyze_lending_model_version = analyze_lending_model_version_;
     status_message = status_message_;
     warnings = warnings_;
     results = results_;
     next_token = next_token_;
     job_status = job_status_;
     document_metadata = document_metadata_;
   }
    : get_lending_analysis_response)

let make_get_lending_analysis_request ?next_token:(next_token_ : pagination_token option)
    ?max_results:(max_results_ : max_results option) ~job_id:(job_id_ : job_id) () =
  ({ next_token = next_token_; max_results = max_results_; job_id = job_id_ }
    : get_lending_analysis_request)

let make_get_expense_analysis_response
    ?analyze_expense_model_version:(analyze_expense_model_version_ : string_ option)
    ?status_message:(status_message_ : status_message option)
    ?warnings:(warnings_ : warnings option)
    ?expense_documents:(expense_documents_ : expense_document_list option)
    ?next_token:(next_token_ : pagination_token option)
    ?job_status:(job_status_ : job_status option)
    ?document_metadata:(document_metadata_ : document_metadata option) () =
  ({
     analyze_expense_model_version = analyze_expense_model_version_;
     status_message = status_message_;
     warnings = warnings_;
     expense_documents = expense_documents_;
     next_token = next_token_;
     job_status = job_status_;
     document_metadata = document_metadata_;
   }
    : get_expense_analysis_response)

let make_get_expense_analysis_request ?next_token:(next_token_ : pagination_token option)
    ?max_results:(max_results_ : max_results option) ~job_id:(job_id_ : job_id) () =
  ({ next_token = next_token_; max_results = max_results_; job_id = job_id_ }
    : get_expense_analysis_request)

let make_get_document_text_detection_response
    ?detect_document_text_model_version:(detect_document_text_model_version_ : string_ option)
    ?status_message:(status_message_ : status_message option)
    ?warnings:(warnings_ : warnings option) ?blocks:(blocks_ : block_list option)
    ?next_token:(next_token_ : pagination_token option)
    ?job_status:(job_status_ : job_status option)
    ?document_metadata:(document_metadata_ : document_metadata option) () =
  ({
     detect_document_text_model_version = detect_document_text_model_version_;
     status_message = status_message_;
     warnings = warnings_;
     blocks = blocks_;
     next_token = next_token_;
     job_status = job_status_;
     document_metadata = document_metadata_;
   }
    : get_document_text_detection_response)

let make_get_document_text_detection_request ?next_token:(next_token_ : pagination_token option)
    ?max_results:(max_results_ : max_results option) ~job_id:(job_id_ : job_id) () =
  ({ next_token = next_token_; max_results = max_results_; job_id = job_id_ }
    : get_document_text_detection_request)

let make_get_document_analysis_response
    ?analyze_document_model_version:(analyze_document_model_version_ : string_ option)
    ?status_message:(status_message_ : status_message option)
    ?warnings:(warnings_ : warnings option) ?blocks:(blocks_ : block_list option)
    ?next_token:(next_token_ : pagination_token option)
    ?job_status:(job_status_ : job_status option)
    ?document_metadata:(document_metadata_ : document_metadata option) () =
  ({
     analyze_document_model_version = analyze_document_model_version_;
     status_message = status_message_;
     warnings = warnings_;
     blocks = blocks_;
     next_token = next_token_;
     job_status = job_status_;
     document_metadata = document_metadata_;
   }
    : get_document_analysis_response)

let make_get_document_analysis_request ?next_token:(next_token_ : pagination_token option)
    ?max_results:(max_results_ : max_results option) ~job_id:(job_id_ : job_id) () =
  ({ next_token = next_token_; max_results = max_results_; job_id = job_id_ }
    : get_document_analysis_request)

let make_adapter_version_dataset_config ?manifest_s3_object:(manifest_s3_object_ : s3_object option)
    () =
  ({ manifest_s3_object = manifest_s3_object_ } : adapter_version_dataset_config)

let make_evaluation_metric ?recall:(recall_ : float_ option) ?precision:(precision_ : float_ option)
    ?f1_score:(f1_score_ : float_ option) () =
  ({ recall = recall_; precision = precision_; f1_score = f1_score_ } : evaluation_metric)

let make_adapter_version_evaluation_metric ?feature_type:(feature_type_ : feature_type option)
    ?adapter_version:(adapter_version_ : evaluation_metric option)
    ?baseline:(baseline_ : evaluation_metric option) () =
  ({ feature_type = feature_type_; adapter_version = adapter_version_; baseline = baseline_ }
    : adapter_version_evaluation_metric)

let make_get_adapter_version_response ?tags:(tags_ : tag_map option)
    ?evaluation_metrics:(evaluation_metrics_ : adapter_version_evaluation_metrics option)
    ?output_config:(output_config_ : output_config option)
    ?kms_key_id:(kms_key_id_ : kms_key_id option)
    ?dataset_config:(dataset_config_ : adapter_version_dataset_config option)
    ?status_message:(status_message_ : adapter_version_status_message option)
    ?status:(status_ : adapter_version_status option)
    ?feature_types:(feature_types_ : feature_types option)
    ?creation_time:(creation_time_ : date_time option)
    ?adapter_version:(adapter_version_ : adapter_version option)
    ?adapter_id:(adapter_id_ : adapter_id option) () =
  ({
     tags = tags_;
     evaluation_metrics = evaluation_metrics_;
     output_config = output_config_;
     kms_key_id = kms_key_id_;
     dataset_config = dataset_config_;
     status_message = status_message_;
     status = status_;
     feature_types = feature_types_;
     creation_time = creation_time_;
     adapter_version = adapter_version_;
     adapter_id = adapter_id_;
   }
    : get_adapter_version_response)

let make_get_adapter_version_request ~adapter_version:(adapter_version_ : adapter_version)
    ~adapter_id:(adapter_id_ : adapter_id) () =
  ({ adapter_version = adapter_version_; adapter_id = adapter_id_ } : get_adapter_version_request)

let make_get_adapter_response ?tags:(tags_ : tag_map option)
    ?auto_update:(auto_update_ : auto_update option)
    ?feature_types:(feature_types_ : feature_types option)
    ?description:(description_ : adapter_description option)
    ?creation_time:(creation_time_ : date_time option)
    ?adapter_name:(adapter_name_ : adapter_name option)
    ?adapter_id:(adapter_id_ : adapter_id option) () =
  ({
     tags = tags_;
     auto_update = auto_update_;
     feature_types = feature_types_;
     description = description_;
     creation_time = creation_time_;
     adapter_name = adapter_name_;
     adapter_id = adapter_id_;
   }
    : get_adapter_response)

let make_get_adapter_request ~adapter_id:(adapter_id_ : adapter_id) () =
  ({ adapter_id = adapter_id_ } : get_adapter_request)

let make_detect_document_text_response
    ?detect_document_text_model_version:(detect_document_text_model_version_ : string_ option)
    ?blocks:(blocks_ : block_list option)
    ?document_metadata:(document_metadata_ : document_metadata option) () =
  ({
     detect_document_text_model_version = detect_document_text_model_version_;
     blocks = blocks_;
     document_metadata = document_metadata_;
   }
    : detect_document_text_response)

let make_document ?s3_object:(s3_object_ : s3_object option) ?bytes:(bytes_ : image_blob option) ()
    =
  ({ s3_object = s3_object_; bytes = bytes_ } : document)

let make_detect_document_text_request ~document:(document_ : document) () =
  ({ document = document_ } : detect_document_text_request)

let make_delete_adapter_version_response () = (() : unit)

let make_delete_adapter_version_request ~adapter_version:(adapter_version_ : adapter_version)
    ~adapter_id:(adapter_id_ : adapter_id) () =
  ({ adapter_version = adapter_version_; adapter_id = adapter_id_ }
    : delete_adapter_version_request)

let make_delete_adapter_response () = (() : unit)

let make_delete_adapter_request ~adapter_id:(adapter_id_ : adapter_id) () =
  ({ adapter_id = adapter_id_ } : delete_adapter_request)

let make_create_adapter_version_response
    ?adapter_version:(adapter_version_ : adapter_version option)
    ?adapter_id:(adapter_id_ : adapter_id option) () =
  ({ adapter_version = adapter_version_; adapter_id = adapter_id_ }
    : create_adapter_version_response)

let make_create_adapter_version_request ?tags:(tags_ : tag_map option)
    ?kms_key_id:(kms_key_id_ : kms_key_id option)
    ?client_request_token:(client_request_token_ : client_request_token option)
    ~output_config:(output_config_ : output_config)
    ~dataset_config:(dataset_config_ : adapter_version_dataset_config)
    ~adapter_id:(adapter_id_ : adapter_id) () =
  ({
     tags = tags_;
     output_config = output_config_;
     kms_key_id = kms_key_id_;
     dataset_config = dataset_config_;
     client_request_token = client_request_token_;
     adapter_id = adapter_id_;
   }
    : create_adapter_version_request)

let make_create_adapter_response ?adapter_id:(adapter_id_ : adapter_id option) () =
  ({ adapter_id = adapter_id_ } : create_adapter_response)

let make_create_adapter_request ?tags:(tags_ : tag_map option)
    ?auto_update:(auto_update_ : auto_update option)
    ?description:(description_ : adapter_description option)
    ?client_request_token:(client_request_token_ : client_request_token option)
    ~feature_types:(feature_types_ : feature_types) ~adapter_name:(adapter_name_ : adapter_name) ()
    =
  ({
     tags = tags_;
     auto_update = auto_update_;
     feature_types = feature_types_;
     description = description_;
     client_request_token = client_request_token_;
     adapter_name = adapter_name_;
   }
    : create_adapter_request)

let make_analyze_id_response ?analyze_id_model_version:(analyze_id_model_version_ : string_ option)
    ?document_metadata:(document_metadata_ : document_metadata option)
    ?identity_documents:(identity_documents_ : identity_document_list option) () =
  ({
     analyze_id_model_version = analyze_id_model_version_;
     document_metadata = document_metadata_;
     identity_documents = identity_documents_;
   }
    : analyze_id_response)

let make_analyze_id_request ~document_pages:(document_pages_ : document_pages) () =
  ({ document_pages = document_pages_ } : analyze_id_request)

let make_analyze_expense_response
    ?expense_documents:(expense_documents_ : expense_document_list option)
    ?document_metadata:(document_metadata_ : document_metadata option) () =
  ({ expense_documents = expense_documents_; document_metadata = document_metadata_ }
    : analyze_expense_response)

let make_analyze_expense_request ~document:(document_ : document) () =
  ({ document = document_ } : analyze_expense_request)

let make_human_loop_activation_output
    ?human_loop_activation_conditions_evaluation_results:
      (human_loop_activation_conditions_evaluation_results_ :
         synthesized_json_human_loop_activation_conditions_evaluation_results option)
    ?human_loop_activation_reasons:
      (human_loop_activation_reasons_ : human_loop_activation_reasons option)
    ?human_loop_arn:(human_loop_arn_ : human_loop_arn option) () =
  ({
     human_loop_activation_conditions_evaluation_results =
       human_loop_activation_conditions_evaluation_results_;
     human_loop_activation_reasons = human_loop_activation_reasons_;
     human_loop_arn = human_loop_arn_;
   }
    : human_loop_activation_output)

let make_analyze_document_response
    ?analyze_document_model_version:(analyze_document_model_version_ : string_ option)
    ?human_loop_activation_output:
      (human_loop_activation_output_ : human_loop_activation_output option)
    ?blocks:(blocks_ : block_list option)
    ?document_metadata:(document_metadata_ : document_metadata option) () =
  ({
     analyze_document_model_version = analyze_document_model_version_;
     human_loop_activation_output = human_loop_activation_output_;
     blocks = blocks_;
     document_metadata = document_metadata_;
   }
    : analyze_document_response)

let make_human_loop_data_attributes
    ?content_classifiers:(content_classifiers_ : content_classifiers option) () =
  ({ content_classifiers = content_classifiers_ } : human_loop_data_attributes)

let make_human_loop_config ?data_attributes:(data_attributes_ : human_loop_data_attributes option)
    ~flow_definition_arn:(flow_definition_arn_ : flow_definition_arn)
    ~human_loop_name:(human_loop_name_ : human_loop_name) () =
  ({
     data_attributes = data_attributes_;
     flow_definition_arn = flow_definition_arn_;
     human_loop_name = human_loop_name_;
   }
    : human_loop_config)

let make_analyze_document_request ?adapters_config:(adapters_config_ : adapters_config option)
    ?queries_config:(queries_config_ : queries_config option)
    ?human_loop_config:(human_loop_config_ : human_loop_config option)
    ~feature_types:(feature_types_ : feature_types) ~document:(document_ : document) () =
  ({
     adapters_config = adapters_config_;
     queries_config = queries_config_;
     human_loop_config = human_loop_config_;
     feature_types = feature_types_;
     document = document_;
   }
    : analyze_document_request)
