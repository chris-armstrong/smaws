open Types

val make_warning : ?pages:pages -> ?error_code:error_code -> unit -> warning

val make_update_adapter_response :
  ?auto_update:auto_update ->
  ?feature_types:feature_types ->
  ?description:adapter_description ->
  ?creation_time:date_time ->
  ?adapter_name:adapter_name ->
  ?adapter_id:adapter_id ->
  unit ->
  update_adapter_response

val make_update_adapter_request :
  ?auto_update:auto_update ->
  ?adapter_name:adapter_name ->
  ?description:adapter_description ->
  adapter_id:adapter_id ->
  unit ->
  update_adapter_request

val make_untag_resource_response : unit -> unit

val make_untag_resource_request :
  tag_keys:tag_key_list -> resource_ar_n:amazon_resource_name -> unit -> untag_resource_request

val make_undetected_signature : ?page:u_integer -> unit -> undetected_signature
val make_tag_resource_response : unit -> unit

val make_tag_resource_request :
  tags:tag_map -> resource_ar_n:amazon_resource_name -> unit -> tag_resource_request

val make_start_lending_analysis_response : ?job_id:job_id -> unit -> start_lending_analysis_response

val make_s3_object :
  ?version:s3_object_version -> ?name:s3_object_name -> ?bucket:s3_bucket -> unit -> s3_object

val make_document_location : ?s3_object:s3_object -> unit -> document_location

val make_notification_channel :
  role_arn:role_arn -> sns_topic_arn:sns_topic_arn -> unit -> notification_channel

val make_output_config : ?s3_prefix:s3_object_name -> s3_bucket:s3_bucket -> unit -> output_config

val make_start_lending_analysis_request :
  ?kms_key_id:kms_key_id ->
  ?output_config:output_config ->
  ?notification_channel:notification_channel ->
  ?job_tag:job_tag ->
  ?client_request_token:client_request_token ->
  document_location:document_location ->
  unit ->
  start_lending_analysis_request

val make_start_expense_analysis_response : ?job_id:job_id -> unit -> start_expense_analysis_response

val make_start_expense_analysis_request :
  ?kms_key_id:kms_key_id ->
  ?output_config:output_config ->
  ?notification_channel:notification_channel ->
  ?job_tag:job_tag ->
  ?client_request_token:client_request_token ->
  document_location:document_location ->
  unit ->
  start_expense_analysis_request

val make_start_document_text_detection_response :
  ?job_id:job_id -> unit -> start_document_text_detection_response

val make_start_document_text_detection_request :
  ?kms_key_id:kms_key_id ->
  ?output_config:output_config ->
  ?notification_channel:notification_channel ->
  ?job_tag:job_tag ->
  ?client_request_token:client_request_token ->
  document_location:document_location ->
  unit ->
  start_document_text_detection_request

val make_start_document_analysis_response :
  ?job_id:job_id -> unit -> start_document_analysis_response

val make_query : ?pages:query_pages -> ?alias:query_input -> text:query_input -> unit -> query
val make_queries_config : queries:queries -> unit -> queries_config

val make_adapter :
  ?pages:adapter_pages -> version:adapter_version -> adapter_id:adapter_id -> unit -> adapter

val make_adapters_config : adapters:adapters -> unit -> adapters_config

val make_start_document_analysis_request :
  ?adapters_config:adapters_config ->
  ?queries_config:queries_config ->
  ?kms_key_id:kms_key_id ->
  ?output_config:output_config ->
  ?notification_channel:notification_channel ->
  ?job_tag:job_tag ->
  ?client_request_token:client_request_token ->
  feature_types:feature_types ->
  document_location:document_location ->
  unit ->
  start_document_analysis_request

val make_list_tags_for_resource_response : ?tags:tag_map -> unit -> list_tags_for_resource_response

val make_list_tags_for_resource_request :
  resource_ar_n:amazon_resource_name -> unit -> list_tags_for_resource_request

val make_adapter_version_overview :
  ?status_message:adapter_version_status_message ->
  ?status:adapter_version_status ->
  ?feature_types:feature_types ->
  ?creation_time:date_time ->
  ?adapter_version:adapter_version ->
  ?adapter_id:adapter_id ->
  unit ->
  adapter_version_overview

val make_list_adapter_versions_response :
  ?next_token:pagination_token ->
  ?adapter_versions:adapter_version_list ->
  unit ->
  list_adapter_versions_response

val make_list_adapter_versions_request :
  ?next_token:pagination_token ->
  ?max_results:max_results ->
  ?before_creation_time:date_time ->
  ?after_creation_time:date_time ->
  ?adapter_id:adapter_id ->
  unit ->
  list_adapter_versions_request

val make_adapter_overview :
  ?feature_types:feature_types ->
  ?creation_time:date_time ->
  ?adapter_name:adapter_name ->
  ?adapter_id:adapter_id ->
  unit ->
  adapter_overview

val make_list_adapters_response :
  ?next_token:pagination_token -> ?adapters:adapter_list -> unit -> list_adapters_response

val make_list_adapters_request :
  ?next_token:pagination_token ->
  ?max_results:max_results ->
  ?before_creation_time:date_time ->
  ?after_creation_time:date_time ->
  unit ->
  list_adapters_request

val make_document_metadata : ?pages:u_integer -> unit -> document_metadata
val make_split_document : ?pages:page_list -> ?index:u_integer -> unit -> split_document
val make_detected_signature : ?page:u_integer -> unit -> detected_signature

val make_document_group :
  ?undetected_signatures:undetected_signature_list ->
  ?detected_signatures:detected_signature_list ->
  ?split_documents:split_document_list ->
  ?type_:non_empty_string ->
  unit ->
  document_group

val make_lending_summary :
  ?undetected_document_types:undetected_document_type_list ->
  ?document_groups:document_group_list ->
  unit ->
  lending_summary

val make_get_lending_analysis_summary_response :
  ?analyze_lending_model_version:string_ ->
  ?status_message:status_message ->
  ?warnings:warnings ->
  ?summary:lending_summary ->
  ?job_status:job_status ->
  ?document_metadata:document_metadata ->
  unit ->
  get_lending_analysis_summary_response

val make_get_lending_analysis_summary_request :
  job_id:job_id -> unit -> get_lending_analysis_summary_request

val make_prediction : ?confidence:percent -> ?value:non_empty_string -> unit -> prediction

val make_page_classification :
  page_number:prediction_list -> page_type:prediction_list -> unit -> page_classification

val make_bounding_box :
  ?top:float_ -> ?left:float_ -> ?height:float_ -> ?width:float_ -> unit -> bounding_box

val make_point : ?y:float_ -> ?x:float_ -> unit -> point

val make_geometry :
  ?rotation_angle:angle -> ?polygon:polygon -> ?bounding_box:bounding_box -> unit -> geometry

val make_lending_detection :
  ?confidence:percent ->
  ?geometry:geometry ->
  ?selection_status:selection_status ->
  ?text:string_ ->
  unit ->
  lending_detection

val make_lending_field :
  ?value_detections:lending_detection_list ->
  ?key_detection:lending_detection ->
  ?type_:string_ ->
  unit ->
  lending_field

val make_signature_detection :
  ?geometry:geometry -> ?confidence:percent -> unit -> signature_detection

val make_lending_document :
  ?signature_detections:signature_detection_list ->
  ?lending_fields:lending_field_list ->
  unit ->
  lending_document

val make_expense_type : ?confidence:percent -> ?text:string_ -> unit -> expense_type

val make_expense_detection :
  ?confidence:percent -> ?geometry:geometry -> ?text:string_ -> unit -> expense_detection

val make_expense_currency : ?confidence:percent -> ?code:string_ -> unit -> expense_currency

val make_expense_group_property :
  ?id:string_ -> ?types:string_list -> unit -> expense_group_property

val make_expense_field :
  ?group_properties:expense_group_property_list ->
  ?currency:expense_currency ->
  ?page_number:u_integer ->
  ?value_detection:expense_detection ->
  ?label_detection:expense_detection ->
  ?type_:expense_type ->
  unit ->
  expense_field

val make_line_item_fields : ?line_item_expense_fields:expense_field_list -> unit -> line_item_fields

val make_line_item_group :
  ?line_items:line_item_list -> ?line_item_group_index:u_integer -> unit -> line_item_group

val make_relationship : ?ids:id_list -> ?type_:relationship_type -> unit -> relationship

val make_block :
  ?query:query ->
  ?page:u_integer ->
  ?selection_status:selection_status ->
  ?entity_types:entity_types ->
  ?relationships:relationship_list ->
  ?id:non_empty_string ->
  ?geometry:geometry ->
  ?column_span:u_integer ->
  ?row_span:u_integer ->
  ?column_index:u_integer ->
  ?row_index:u_integer ->
  ?text_type:text_type ->
  ?text:string_ ->
  ?confidence:percent ->
  ?block_type:block_type ->
  unit ->
  block

val make_expense_document :
  ?blocks:block_list ->
  ?line_item_groups:line_item_group_list ->
  ?summary_fields:expense_field_list ->
  ?expense_index:u_integer ->
  unit ->
  expense_document

val make_normalized_value : ?value_type:value_type -> ?value:string_ -> unit -> normalized_value

val make_analyze_id_detections :
  ?confidence:percent ->
  ?normalized_value:normalized_value ->
  text:string_ ->
  unit ->
  analyze_id_detections

val make_identity_document_field :
  ?value_detection:analyze_id_detections ->
  ?type_:analyze_id_detections ->
  unit ->
  identity_document_field

val make_identity_document :
  ?blocks:block_list ->
  ?identity_document_fields:identity_document_field_list ->
  ?document_index:u_integer ->
  unit ->
  identity_document

val make_extraction :
  ?identity_document:identity_document ->
  ?expense_document:expense_document ->
  ?lending_document:lending_document ->
  unit ->
  extraction

val make_get_lending_analysis_response :
  ?analyze_lending_model_version:string_ ->
  ?status_message:status_message ->
  ?warnings:warnings ->
  ?results:lending_result_list ->
  ?next_token:pagination_token ->
  ?job_status:job_status ->
  ?document_metadata:document_metadata ->
  unit ->
  get_lending_analysis_response

val make_get_lending_analysis_request :
  ?next_token:pagination_token ->
  ?max_results:max_results ->
  job_id:job_id ->
  unit ->
  get_lending_analysis_request

val make_get_expense_analysis_response :
  ?analyze_expense_model_version:string_ ->
  ?status_message:status_message ->
  ?warnings:warnings ->
  ?expense_documents:expense_document_list ->
  ?next_token:pagination_token ->
  ?job_status:job_status ->
  ?document_metadata:document_metadata ->
  unit ->
  get_expense_analysis_response

val make_get_expense_analysis_request :
  ?next_token:pagination_token ->
  ?max_results:max_results ->
  job_id:job_id ->
  unit ->
  get_expense_analysis_request

val make_get_document_text_detection_response :
  ?detect_document_text_model_version:string_ ->
  ?status_message:status_message ->
  ?warnings:warnings ->
  ?blocks:block_list ->
  ?next_token:pagination_token ->
  ?job_status:job_status ->
  ?document_metadata:document_metadata ->
  unit ->
  get_document_text_detection_response

val make_get_document_text_detection_request :
  ?next_token:pagination_token ->
  ?max_results:max_results ->
  job_id:job_id ->
  unit ->
  get_document_text_detection_request

val make_get_document_analysis_response :
  ?analyze_document_model_version:string_ ->
  ?status_message:status_message ->
  ?warnings:warnings ->
  ?blocks:block_list ->
  ?next_token:pagination_token ->
  ?job_status:job_status ->
  ?document_metadata:document_metadata ->
  unit ->
  get_document_analysis_response

val make_get_document_analysis_request :
  ?next_token:pagination_token ->
  ?max_results:max_results ->
  job_id:job_id ->
  unit ->
  get_document_analysis_request

val make_adapter_version_dataset_config :
  ?manifest_s3_object:s3_object -> unit -> adapter_version_dataset_config

val make_evaluation_metric :
  ?recall:float_ -> ?precision:float_ -> ?f1_score:float_ -> unit -> evaluation_metric

val make_adapter_version_evaluation_metric :
  ?feature_type:feature_type ->
  ?adapter_version:evaluation_metric ->
  ?baseline:evaluation_metric ->
  unit ->
  adapter_version_evaluation_metric

val make_get_adapter_version_response :
  ?tags:tag_map ->
  ?evaluation_metrics:adapter_version_evaluation_metrics ->
  ?output_config:output_config ->
  ?kms_key_id:kms_key_id ->
  ?dataset_config:adapter_version_dataset_config ->
  ?status_message:adapter_version_status_message ->
  ?status:adapter_version_status ->
  ?feature_types:feature_types ->
  ?creation_time:date_time ->
  ?adapter_version:adapter_version ->
  ?adapter_id:adapter_id ->
  unit ->
  get_adapter_version_response

val make_get_adapter_version_request :
  adapter_version:adapter_version -> adapter_id:adapter_id -> unit -> get_adapter_version_request

val make_get_adapter_response :
  ?tags:tag_map ->
  ?auto_update:auto_update ->
  ?feature_types:feature_types ->
  ?description:adapter_description ->
  ?creation_time:date_time ->
  ?adapter_name:adapter_name ->
  ?adapter_id:adapter_id ->
  unit ->
  get_adapter_response

val make_get_adapter_request : adapter_id:adapter_id -> unit -> get_adapter_request

val make_detect_document_text_response :
  ?detect_document_text_model_version:string_ ->
  ?blocks:block_list ->
  ?document_metadata:document_metadata ->
  unit ->
  detect_document_text_response

val make_document : ?s3_object:s3_object -> ?bytes:image_blob -> unit -> document
val make_detect_document_text_request : document:document -> unit -> detect_document_text_request
val make_delete_adapter_version_response : unit -> unit

val make_delete_adapter_version_request :
  adapter_version:adapter_version -> adapter_id:adapter_id -> unit -> delete_adapter_version_request

val make_delete_adapter_response : unit -> unit
val make_delete_adapter_request : adapter_id:adapter_id -> unit -> delete_adapter_request

val make_create_adapter_version_response :
  ?adapter_version:adapter_version ->
  ?adapter_id:adapter_id ->
  unit ->
  create_adapter_version_response

val make_create_adapter_version_request :
  ?tags:tag_map ->
  ?kms_key_id:kms_key_id ->
  ?client_request_token:client_request_token ->
  output_config:output_config ->
  dataset_config:adapter_version_dataset_config ->
  adapter_id:adapter_id ->
  unit ->
  create_adapter_version_request

val make_create_adapter_response : ?adapter_id:adapter_id -> unit -> create_adapter_response

val make_create_adapter_request :
  ?tags:tag_map ->
  ?auto_update:auto_update ->
  ?description:adapter_description ->
  ?client_request_token:client_request_token ->
  feature_types:feature_types ->
  adapter_name:adapter_name ->
  unit ->
  create_adapter_request

val make_analyze_id_response :
  ?analyze_id_model_version:string_ ->
  ?document_metadata:document_metadata ->
  ?identity_documents:identity_document_list ->
  unit ->
  analyze_id_response

val make_analyze_id_request : document_pages:document_pages -> unit -> analyze_id_request

val make_analyze_expense_response :
  ?expense_documents:expense_document_list ->
  ?document_metadata:document_metadata ->
  unit ->
  analyze_expense_response

val make_analyze_expense_request : document:document -> unit -> analyze_expense_request

val make_human_loop_activation_output :
  ?human_loop_activation_conditions_evaluation_results:
    synthesized_json_human_loop_activation_conditions_evaluation_results ->
  ?human_loop_activation_reasons:human_loop_activation_reasons ->
  ?human_loop_arn:human_loop_arn ->
  unit ->
  human_loop_activation_output

val make_analyze_document_response :
  ?analyze_document_model_version:string_ ->
  ?human_loop_activation_output:human_loop_activation_output ->
  ?blocks:block_list ->
  ?document_metadata:document_metadata ->
  unit ->
  analyze_document_response

val make_human_loop_data_attributes :
  ?content_classifiers:content_classifiers -> unit -> human_loop_data_attributes

val make_human_loop_config :
  ?data_attributes:human_loop_data_attributes ->
  flow_definition_arn:flow_definition_arn ->
  human_loop_name:human_loop_name ->
  unit ->
  human_loop_config

val make_analyze_document_request :
  ?adapters_config:adapters_config ->
  ?queries_config:queries_config ->
  ?human_loop_config:human_loop_config ->
  feature_types:feature_types ->
  document:document ->
  unit ->
  analyze_document_request
