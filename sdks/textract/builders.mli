open Types

val make_adapter :
  ?pages:adapter_pages -> adapter_id:adapter_id -> version:adapter_version -> unit -> adapter

val make_adapter_overview :
  ?adapter_id:adapter_id ->
  ?adapter_name:adapter_name ->
  ?creation_time:date_time ->
  ?feature_types:feature_types ->
  unit ->
  adapter_overview

val make_s3_object :
  ?bucket:s3_bucket -> ?name:s3_object_name -> ?version:s3_object_version -> unit -> s3_object

val make_adapter_version_dataset_config :
  ?manifest_s3_object:s3_object -> unit -> adapter_version_dataset_config

val make_evaluation_metric :
  ?f1_score:float_ -> ?precision:float_ -> ?recall:float_ -> unit -> evaluation_metric

val make_adapter_version_evaluation_metric :
  ?baseline:evaluation_metric ->
  ?adapter_version:evaluation_metric ->
  ?feature_type:feature_type ->
  unit ->
  adapter_version_evaluation_metric

val make_adapter_version_overview :
  ?adapter_id:adapter_id ->
  ?adapter_version:adapter_version ->
  ?creation_time:date_time ->
  ?feature_types:feature_types ->
  ?status:adapter_version_status ->
  ?status_message:adapter_version_status_message ->
  unit ->
  adapter_version_overview

val make_adapters_config : adapters:adapters -> unit -> adapters_config

val make_human_loop_activation_output :
  ?human_loop_arn:human_loop_arn ->
  ?human_loop_activation_reasons:human_loop_activation_reasons ->
  ?human_loop_activation_conditions_evaluation_results:
    synthesized_json_human_loop_activation_conditions_evaluation_results ->
  unit ->
  human_loop_activation_output

val make_query : ?alias:query_input -> ?pages:query_pages -> text:query_input -> unit -> query
val make_relationship : ?type_:relationship_type -> ?ids:id_list -> unit -> relationship
val make_point : ?x:float_ -> ?y:float_ -> unit -> point

val make_bounding_box :
  ?width:float_ -> ?height:float_ -> ?left:float_ -> ?top:float_ -> unit -> bounding_box

val make_geometry :
  ?bounding_box:bounding_box -> ?polygon:polygon -> ?rotation_angle:angle -> unit -> geometry

val make_block :
  ?block_type:block_type ->
  ?confidence:percent ->
  ?text:string_ ->
  ?text_type:text_type ->
  ?row_index:u_integer ->
  ?column_index:u_integer ->
  ?row_span:u_integer ->
  ?column_span:u_integer ->
  ?geometry:geometry ->
  ?id:non_empty_string ->
  ?relationships:relationship_list ->
  ?entity_types:entity_types ->
  ?selection_status:selection_status ->
  ?page:u_integer ->
  ?query:query ->
  unit ->
  block

val make_document_metadata : ?pages:u_integer -> unit -> document_metadata

val make_analyze_document_response :
  ?document_metadata:document_metadata ->
  ?blocks:block_list ->
  ?human_loop_activation_output:human_loop_activation_output ->
  ?analyze_document_model_version:string_ ->
  unit ->
  analyze_document_response

val make_queries_config : queries:queries -> unit -> queries_config

val make_human_loop_data_attributes :
  ?content_classifiers:content_classifiers -> unit -> human_loop_data_attributes

val make_human_loop_config :
  ?data_attributes:human_loop_data_attributes ->
  human_loop_name:human_loop_name ->
  flow_definition_arn:flow_definition_arn ->
  unit ->
  human_loop_config

val make_document : ?bytes:image_blob -> ?s3_object:s3_object -> unit -> document

val make_analyze_document_request :
  ?human_loop_config:human_loop_config ->
  ?queries_config:queries_config ->
  ?adapters_config:adapters_config ->
  document:document ->
  feature_types:feature_types ->
  unit ->
  analyze_document_request

val make_expense_group_property :
  ?types:string_list -> ?id:string_ -> unit -> expense_group_property

val make_expense_currency : ?code:string_ -> ?confidence:percent -> unit -> expense_currency

val make_expense_detection :
  ?text:string_ -> ?geometry:geometry -> ?confidence:percent -> unit -> expense_detection

val make_expense_type : ?text:string_ -> ?confidence:percent -> unit -> expense_type

val make_expense_field :
  ?type_:expense_type ->
  ?label_detection:expense_detection ->
  ?value_detection:expense_detection ->
  ?page_number:u_integer ->
  ?currency:expense_currency ->
  ?group_properties:expense_group_property_list ->
  unit ->
  expense_field

val make_line_item_fields : ?line_item_expense_fields:expense_field_list -> unit -> line_item_fields

val make_line_item_group :
  ?line_item_group_index:u_integer -> ?line_items:line_item_list -> unit -> line_item_group

val make_expense_document :
  ?expense_index:u_integer ->
  ?summary_fields:expense_field_list ->
  ?line_item_groups:line_item_group_list ->
  ?blocks:block_list ->
  unit ->
  expense_document

val make_analyze_expense_response :
  ?document_metadata:document_metadata ->
  ?expense_documents:expense_document_list ->
  unit ->
  analyze_expense_response

val make_analyze_expense_request : document:document -> unit -> analyze_expense_request
val make_normalized_value : ?value:string_ -> ?value_type:value_type -> unit -> normalized_value

val make_analyze_id_detections :
  ?normalized_value:normalized_value ->
  ?confidence:percent ->
  text:string_ ->
  unit ->
  analyze_id_detections

val make_identity_document_field :
  ?type_:analyze_id_detections ->
  ?value_detection:analyze_id_detections ->
  unit ->
  identity_document_field

val make_identity_document :
  ?document_index:u_integer ->
  ?identity_document_fields:identity_document_field_list ->
  ?blocks:block_list ->
  unit ->
  identity_document

val make_analyze_id_response :
  ?identity_documents:identity_document_list ->
  ?document_metadata:document_metadata ->
  ?analyze_id_model_version:string_ ->
  unit ->
  analyze_id_response

val make_analyze_id_request : document_pages:document_pages -> unit -> analyze_id_request
val make_create_adapter_response : ?adapter_id:adapter_id -> unit -> create_adapter_response

val make_create_adapter_request :
  ?client_request_token:client_request_token ->
  ?description:adapter_description ->
  ?auto_update:auto_update ->
  ?tags:tag_map ->
  adapter_name:adapter_name ->
  feature_types:feature_types ->
  unit ->
  create_adapter_request

val make_create_adapter_version_response :
  ?adapter_id:adapter_id ->
  ?adapter_version:adapter_version ->
  unit ->
  create_adapter_version_response

val make_output_config : ?s3_prefix:s3_object_name -> s3_bucket:s3_bucket -> unit -> output_config

val make_create_adapter_version_request :
  ?client_request_token:client_request_token ->
  ?kms_key_id:kms_key_id ->
  ?tags:tag_map ->
  adapter_id:adapter_id ->
  dataset_config:adapter_version_dataset_config ->
  output_config:output_config ->
  unit ->
  create_adapter_version_request

val make_delete_adapter_response : unit -> unit
val make_delete_adapter_request : adapter_id:adapter_id -> unit -> delete_adapter_request
val make_delete_adapter_version_response : unit -> unit

val make_delete_adapter_version_request :
  adapter_id:adapter_id -> adapter_version:adapter_version -> unit -> delete_adapter_version_request

val make_detect_document_text_response :
  ?document_metadata:document_metadata ->
  ?blocks:block_list ->
  ?detect_document_text_model_version:string_ ->
  unit ->
  detect_document_text_response

val make_detect_document_text_request : document:document -> unit -> detect_document_text_request
val make_detected_signature : ?page:u_integer -> unit -> detected_signature
val make_undetected_signature : ?page:u_integer -> unit -> undetected_signature
val make_split_document : ?index:u_integer -> ?pages:page_list -> unit -> split_document

val make_document_group :
  ?type_:non_empty_string ->
  ?split_documents:split_document_list ->
  ?detected_signatures:detected_signature_list ->
  ?undetected_signatures:undetected_signature_list ->
  unit ->
  document_group

val make_document_location : ?s3_object:s3_object -> unit -> document_location

val make_signature_detection :
  ?confidence:percent -> ?geometry:geometry -> unit -> signature_detection

val make_lending_detection :
  ?text:string_ ->
  ?selection_status:selection_status ->
  ?geometry:geometry ->
  ?confidence:percent ->
  unit ->
  lending_detection

val make_lending_field :
  ?type_:string_ ->
  ?key_detection:lending_detection ->
  ?value_detections:lending_detection_list ->
  unit ->
  lending_field

val make_lending_document :
  ?lending_fields:lending_field_list ->
  ?signature_detections:signature_detection_list ->
  unit ->
  lending_document

val make_extraction :
  ?lending_document:lending_document ->
  ?expense_document:expense_document ->
  ?identity_document:identity_document ->
  unit ->
  extraction

val make_get_adapter_response :
  ?adapter_id:adapter_id ->
  ?adapter_name:adapter_name ->
  ?creation_time:date_time ->
  ?description:adapter_description ->
  ?feature_types:feature_types ->
  ?auto_update:auto_update ->
  ?tags:tag_map ->
  unit ->
  get_adapter_response

val make_get_adapter_request : adapter_id:adapter_id -> unit -> get_adapter_request

val make_get_adapter_version_response :
  ?adapter_id:adapter_id ->
  ?adapter_version:adapter_version ->
  ?creation_time:date_time ->
  ?feature_types:feature_types ->
  ?status:adapter_version_status ->
  ?status_message:adapter_version_status_message ->
  ?dataset_config:adapter_version_dataset_config ->
  ?kms_key_id:kms_key_id ->
  ?output_config:output_config ->
  ?evaluation_metrics:adapter_version_evaluation_metrics ->
  ?tags:tag_map ->
  unit ->
  get_adapter_version_response

val make_get_adapter_version_request :
  adapter_id:adapter_id -> adapter_version:adapter_version -> unit -> get_adapter_version_request

val make_warning : ?error_code:error_code -> ?pages:pages -> unit -> warning

val make_get_document_analysis_response :
  ?document_metadata:document_metadata ->
  ?job_status:job_status ->
  ?next_token:pagination_token ->
  ?blocks:block_list ->
  ?warnings:warnings ->
  ?status_message:status_message ->
  ?analyze_document_model_version:string_ ->
  unit ->
  get_document_analysis_response

val make_get_document_analysis_request :
  ?max_results:max_results ->
  ?next_token:pagination_token ->
  job_id:job_id ->
  unit ->
  get_document_analysis_request

val make_get_document_text_detection_response :
  ?document_metadata:document_metadata ->
  ?job_status:job_status ->
  ?next_token:pagination_token ->
  ?blocks:block_list ->
  ?warnings:warnings ->
  ?status_message:status_message ->
  ?detect_document_text_model_version:string_ ->
  unit ->
  get_document_text_detection_response

val make_get_document_text_detection_request :
  ?max_results:max_results ->
  ?next_token:pagination_token ->
  job_id:job_id ->
  unit ->
  get_document_text_detection_request

val make_get_expense_analysis_response :
  ?document_metadata:document_metadata ->
  ?job_status:job_status ->
  ?next_token:pagination_token ->
  ?expense_documents:expense_document_list ->
  ?warnings:warnings ->
  ?status_message:status_message ->
  ?analyze_expense_model_version:string_ ->
  unit ->
  get_expense_analysis_response

val make_get_expense_analysis_request :
  ?max_results:max_results ->
  ?next_token:pagination_token ->
  job_id:job_id ->
  unit ->
  get_expense_analysis_request

val make_prediction : ?value:non_empty_string -> ?confidence:percent -> unit -> prediction

val make_page_classification :
  page_type:prediction_list -> page_number:prediction_list -> unit -> page_classification

val make_get_lending_analysis_response :
  ?document_metadata:document_metadata ->
  ?job_status:job_status ->
  ?next_token:pagination_token ->
  ?results:lending_result_list ->
  ?warnings:warnings ->
  ?status_message:status_message ->
  ?analyze_lending_model_version:string_ ->
  unit ->
  get_lending_analysis_response

val make_get_lending_analysis_request :
  ?max_results:max_results ->
  ?next_token:pagination_token ->
  job_id:job_id ->
  unit ->
  get_lending_analysis_request

val make_lending_summary :
  ?document_groups:document_group_list ->
  ?undetected_document_types:undetected_document_type_list ->
  unit ->
  lending_summary

val make_get_lending_analysis_summary_response :
  ?document_metadata:document_metadata ->
  ?job_status:job_status ->
  ?summary:lending_summary ->
  ?warnings:warnings ->
  ?status_message:status_message ->
  ?analyze_lending_model_version:string_ ->
  unit ->
  get_lending_analysis_summary_response

val make_get_lending_analysis_summary_request :
  job_id:job_id -> unit -> get_lending_analysis_summary_request

val make_list_adapter_versions_response :
  ?adapter_versions:adapter_version_list ->
  ?next_token:pagination_token ->
  unit ->
  list_adapter_versions_response

val make_list_adapter_versions_request :
  ?adapter_id:adapter_id ->
  ?after_creation_time:date_time ->
  ?before_creation_time:date_time ->
  ?max_results:max_results ->
  ?next_token:pagination_token ->
  unit ->
  list_adapter_versions_request

val make_list_adapters_response :
  ?adapters:adapter_list -> ?next_token:pagination_token -> unit -> list_adapters_response

val make_list_adapters_request :
  ?after_creation_time:date_time ->
  ?before_creation_time:date_time ->
  ?max_results:max_results ->
  ?next_token:pagination_token ->
  unit ->
  list_adapters_request

val make_list_tags_for_resource_response : ?tags:tag_map -> unit -> list_tags_for_resource_response

val make_list_tags_for_resource_request :
  resource_ar_n:amazon_resource_name -> unit -> list_tags_for_resource_request

val make_notification_channel :
  sns_topic_arn:sns_topic_arn -> role_arn:role_arn -> unit -> notification_channel

val make_start_document_analysis_response :
  ?job_id:job_id -> unit -> start_document_analysis_response

val make_start_document_analysis_request :
  ?client_request_token:client_request_token ->
  ?job_tag:job_tag ->
  ?notification_channel:notification_channel ->
  ?output_config:output_config ->
  ?kms_key_id:kms_key_id ->
  ?queries_config:queries_config ->
  ?adapters_config:adapters_config ->
  document_location:document_location ->
  feature_types:feature_types ->
  unit ->
  start_document_analysis_request

val make_start_document_text_detection_response :
  ?job_id:job_id -> unit -> start_document_text_detection_response

val make_start_document_text_detection_request :
  ?client_request_token:client_request_token ->
  ?job_tag:job_tag ->
  ?notification_channel:notification_channel ->
  ?output_config:output_config ->
  ?kms_key_id:kms_key_id ->
  document_location:document_location ->
  unit ->
  start_document_text_detection_request

val make_start_expense_analysis_response : ?job_id:job_id -> unit -> start_expense_analysis_response

val make_start_expense_analysis_request :
  ?client_request_token:client_request_token ->
  ?job_tag:job_tag ->
  ?notification_channel:notification_channel ->
  ?output_config:output_config ->
  ?kms_key_id:kms_key_id ->
  document_location:document_location ->
  unit ->
  start_expense_analysis_request

val make_start_lending_analysis_response : ?job_id:job_id -> unit -> start_lending_analysis_response

val make_start_lending_analysis_request :
  ?client_request_token:client_request_token ->
  ?job_tag:job_tag ->
  ?notification_channel:notification_channel ->
  ?output_config:output_config ->
  ?kms_key_id:kms_key_id ->
  document_location:document_location ->
  unit ->
  start_lending_analysis_request

val make_tag_resource_response : unit -> unit

val make_tag_resource_request :
  resource_ar_n:amazon_resource_name -> tags:tag_map -> unit -> tag_resource_request

val make_update_adapter_response :
  ?adapter_id:adapter_id ->
  ?adapter_name:adapter_name ->
  ?creation_time:date_time ->
  ?description:adapter_description ->
  ?feature_types:feature_types ->
  ?auto_update:auto_update ->
  unit ->
  update_adapter_response

val make_update_adapter_request :
  ?description:adapter_description ->
  ?adapter_name:adapter_name ->
  ?auto_update:auto_update ->
  adapter_id:adapter_id ->
  unit ->
  update_adapter_request

val make_untag_resource_response : unit -> unit

val make_untag_resource_request :
  resource_ar_n:amazon_resource_name -> tag_keys:tag_key_list -> unit -> untag_resource_request
