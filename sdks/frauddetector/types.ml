type nonrec float_ = float [@@ocaml.doc ""]

type nonrec ati_metric_data_point = {
  cr : float_ option;
      [@ocaml.doc
        " The challenge rate. This indicates the percentage of login events that the model \
         recommends to challenge such as one-time password, multi-factor authentication, and \
         investigations. \n"]
  adr : float_ option;
      [@ocaml.doc
        " The anomaly discovery rate. This metric quantifies the percentage of anomalies that can \
         be detected by the model at the selected score threshold. A lower score threshold \
         increases the percentage of anomalies captured by the model, but would also require \
         challenging a larger percentage of login events, leading to a higher customer friction. \n"]
  threshold : float_ option;
      [@ocaml.doc
        " The model's threshold that specifies an acceptable fraud capture rate. For example, a \
         threshold of 500 means any model score 500 or above is labeled as fraud. \n"]
  atodr : float_ option;
      [@ocaml.doc
        " The account takeover discovery rate. This metric quantifies the percentage of account \
         compromise events that can be detected by the model at the selected score threshold. This \
         metric is only available if 50 or more entities with at-least one labeled account \
         takeover event is present in the ingested dataset. \n"]
}
[@@ocaml.doc " The Account Takeover Insights (ATI) model performance metrics data points. \n"]

type nonrec ati_metric_data_points_list = ati_metric_data_point list [@@ocaml.doc ""]

type nonrec ati_model_performance = {
  asi : float_ option;
      [@ocaml.doc
        " The anomaly separation index (ASI) score. This metric summarizes the overall ability of \
         the model to separate anomalous activities from the normal behavior. Depending on the \
         business, a large fraction of these anomalous activities can be malicious and correspond \
         to the account takeover attacks. A model with no separability power will have the lowest \
         possible ASI score of 0.5, whereas the a model with a high separability power will have \
         the highest possible ASI score of 1.0 \n"]
}
[@@ocaml.doc " The Account Takeover Insights (ATI) model performance score. \n"]

type nonrec ati_training_metrics_value = {
  metric_data_points : ati_metric_data_points_list option;
      [@ocaml.doc " The model's performance metrics data points. \n"]
  model_performance : ati_model_performance option;
      [@ocaml.doc " The model's overall performance scores. \n"]
}
[@@ocaml.doc " The Account Takeover Insights (ATI) model training metric details. \n"]

type nonrec string_ = string [@@ocaml.doc ""]

type nonrec validation_exception = { message : string_ [@ocaml.doc ""] }
[@@ocaml.doc "An exception indicating a specified value is not allowed.\n"]

type nonrec throttling_exception = { message : string_ [@ocaml.doc ""] }
[@@ocaml.doc "An exception indicating a throttling error.\n"]

type nonrec resource_not_found_exception = { message : string_ [@ocaml.doc ""] }
[@@ocaml.doc "An exception indicating the specified resource was not found.\n"]

type nonrec internal_server_exception = { message : string_ [@ocaml.doc ""] }
[@@ocaml.doc "An exception indicating an internal server error.\n"]

type nonrec conflict_exception = { message : string_ [@ocaml.doc ""] }
[@@ocaml.doc "An exception indicating there was a conflict during a delete operation.\n"]

type nonrec access_denied_exception = { message : string_ [@ocaml.doc ""] }
[@@ocaml.doc
  "An exception indicating Amazon Fraud Detector does not have the needed permissions. This can \
   occur if you submit a request, such as [PutExternalModel], that specifies a role that is not in \
   your account.\n"]

type nonrec update_variable_result = unit [@@ocaml.doc ""]

type nonrec update_variable_request = {
  name : string_; [@ocaml.doc "The name of the variable.\n"]
  default_value : string_ option; [@ocaml.doc "The new default value of the variable.\n"]
  description : string_ option; [@ocaml.doc "The new description.\n"]
  variable_type : string_ option;
      [@ocaml.doc
        "The variable type. For more information see \
         {{:https://docs.aws.amazon.com/frauddetector/latest/ug/create-a-variable.html#variable-types}Variable \
         types}.\n"]
}
[@@ocaml.doc ""]

type nonrec whole_number_version_string = string [@@ocaml.doc ""]

type nonrec identifier = string [@@ocaml.doc ""]

type nonrec rule = {
  detector_id : identifier; [@ocaml.doc "The detector for which the rule is associated.\n"]
  rule_id : identifier; [@ocaml.doc "The rule ID.\n"]
  rule_version : whole_number_version_string; [@ocaml.doc "The rule version.\n"]
}
[@@ocaml.doc "A rule.\n"]

type nonrec update_rule_version_result = {
  rule : rule option; [@ocaml.doc "The new rule version that was created.\n"]
}
[@@ocaml.doc ""]

type nonrec tag_value = string [@@ocaml.doc ""]

type nonrec tag_key = string [@@ocaml.doc ""]

type nonrec tag = {
  key : tag_key; [@ocaml.doc "A tag key.\n"]
  value : tag_value; [@ocaml.doc "A value assigned to a tag key.\n"]
}
[@@ocaml.doc "A key and value pair. \n"]

type nonrec tag_list = tag list [@@ocaml.doc ""]

type nonrec non_empty_list_of_strings = string_ list [@@ocaml.doc ""]

type nonrec language = DETECTORPL [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec rule_expression = string [@@ocaml.doc ""]

type nonrec description = string [@@ocaml.doc ""]

type nonrec update_rule_version_request = {
  rule : rule; [@ocaml.doc "The rule to update.\n"]
  description : description option; [@ocaml.doc "The description.\n"]
  expression : rule_expression; [@ocaml.doc "The rule expression.\n"]
  language : language; [@ocaml.doc "The language.\n"]
  outcomes : non_empty_list_of_strings; [@ocaml.doc "The outcomes.\n"]
  tags : tag_list option; [@ocaml.doc "The tags to assign to the rule version.\n"]
}
[@@ocaml.doc ""]

type nonrec update_rule_metadata_result = unit [@@ocaml.doc ""]

type nonrec update_rule_metadata_request = {
  rule : rule; [@ocaml.doc "The rule to update.\n"]
  description : description; [@ocaml.doc "The rule description.\n"]
}
[@@ocaml.doc ""]

type nonrec update_model_version_status_result = unit [@@ocaml.doc ""]

type nonrec model_version_status =
  | ACTIVE [@ocaml.doc ""]
  | INACTIVE [@ocaml.doc ""]
  | TRAINING_CANCELLED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec float_version_string = string [@@ocaml.doc ""]

type nonrec model_type_enum =
  | ONLINE_FRAUD_INSIGHTS [@ocaml.doc ""]
  | TRANSACTION_FRAUD_INSIGHTS [@ocaml.doc ""]
  | ACCOUNT_TAKEOVER_INSIGHTS [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec model_identifier = string [@@ocaml.doc ""]

type nonrec update_model_version_status_request = {
  model_id : model_identifier; [@ocaml.doc "The model ID of the model version to update.\n"]
  model_type : model_type_enum; [@ocaml.doc "The model type.\n"]
  model_version_number : float_version_string; [@ocaml.doc "The model version number.\n"]
  status : model_version_status; [@ocaml.doc "The model version status.\n"]
}
[@@ocaml.doc ""]

type nonrec update_model_version_result = {
  model_id : model_identifier option; [@ocaml.doc "The model ID.\n"]
  model_type : model_type_enum option; [@ocaml.doc "The model type.\n"]
  model_version_number : float_version_string option;
      [@ocaml.doc "The model version number of the model version updated.\n"]
  status : string_ option; [@ocaml.doc "The status of the updated model version.\n"]
}
[@@ocaml.doc ""]

type nonrec time = string [@@ocaml.doc ""]

type nonrec ingested_events_time_window = {
  start_time : time; [@ocaml.doc "Timestamp of the first ingensted event.\n"]
  end_time : time; [@ocaml.doc "Timestamp of the final ingested event.\n"]
}
[@@ocaml.doc "The start and stop time of the ingested events.\n"]

type nonrec ingested_events_detail = {
  ingested_events_time_window : ingested_events_time_window;
      [@ocaml.doc "The start and stop time of the ingested events.\n"]
}
[@@ocaml.doc "The details of the ingested event.\n"]

type nonrec iam_role_arn = string [@@ocaml.doc ""]

type nonrec s3_bucket_location = string [@@ocaml.doc ""]

type nonrec external_events_detail = {
  data_location : s3_bucket_location; [@ocaml.doc "The Amazon S3 bucket location for the data.\n"]
  data_access_role_arn : iam_role_arn;
      [@ocaml.doc
        "The ARN of the role that provides Amazon Fraud Detector access to the data location.\n"]
}
[@@ocaml.doc "Details for the external events data used for model version training.\n"]

type nonrec update_model_version_request = {
  model_id : model_identifier; [@ocaml.doc "The model ID.\n"]
  model_type : model_type_enum; [@ocaml.doc "The model type.\n"]
  major_version_number : whole_number_version_string; [@ocaml.doc "The major version number.\n"]
  external_events_detail : external_events_detail option;
      [@ocaml.doc
        "The details of the external events data used for training the model version. Required if \
         [trainingDataSource] is [EXTERNAL_EVENTS].\n"]
  ingested_events_detail : ingested_events_detail option;
      [@ocaml.doc
        "The details of the ingested event used for training the model version. Required if your \
         [trainingDataSource] is [INGESTED_EVENTS].\n"]
  tags : tag_list option; [@ocaml.doc "A collection of key and value pairs.\n"]
}
[@@ocaml.doc ""]

type nonrec update_model_result = unit [@@ocaml.doc ""]

type nonrec update_model_request = {
  model_id : model_identifier; [@ocaml.doc "The model ID.\n"]
  model_type : model_type_enum; [@ocaml.doc "The model type.\n"]
  description : description option; [@ocaml.doc "The new model description.\n"]
}
[@@ocaml.doc ""]

type nonrec update_list_result = unit [@@ocaml.doc ""]

type nonrec variable_type = string [@@ocaml.doc ""]

type nonrec list_update_mode =
  | REPLACE [@ocaml.doc ""]
  | APPEND [@ocaml.doc ""]
  | REMOVE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec elements = string [@@ocaml.doc ""]

type nonrec elements_list = elements list [@@ocaml.doc ""]

type nonrec no_dash_identifier = string [@@ocaml.doc ""]

type nonrec update_list_request = {
  name : no_dash_identifier; [@ocaml.doc " The name of the list to update. \n"]
  elements : elements_list option;
      [@ocaml.doc
        " One or more list elements to add or replace. If you are providing the elements, make \
         sure to specify the [updateMode] to use. \n\n\
        \ If you are deleting all elements from the list, use [REPLACE] for the [updateMode] and \
         provide an empty list (0 elements).\n\
        \ "]
  description : description option; [@ocaml.doc " The new description. \n"]
  update_mode : list_update_mode option;
      [@ocaml.doc
        " The update mode (type). \n\n\
        \ {ul\n\
        \       {-  Use [APPEND] if you are adding elements to the list.\n\
        \           \n\
        \            }\n\
        \       {-  Use [REPLACE] if you replacing existing elements in the list.\n\
        \           \n\
        \            }\n\
        \       {-  Use [REMOVE] if you are removing elements from the list.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  variable_type : variable_type option;
      [@ocaml.doc
        " The variable type you want to assign to the list. \n\n\
        \  You cannot update a variable type of a list that already has a variable type assigned \
         to it. You can assign a variable type to a list only if the list does not already have a \
         variable type.\n\
        \  \n\
        \   "]
}
[@@ocaml.doc ""]

type nonrec update_event_label_result = unit [@@ocaml.doc ""]

type nonrec utc_timestamp_is_o8601 = string [@@ocaml.doc ""]

type nonrec update_event_label_request = {
  event_id : identifier; [@ocaml.doc "The ID of the event associated with the label to update.\n"]
  event_type_name : identifier;
      [@ocaml.doc "The event type of the event associated with the label to update.\n"]
  assigned_label : identifier; [@ocaml.doc "The new label to assign to the event.\n"]
  label_timestamp : utc_timestamp_is_o8601;
      [@ocaml.doc
        "The timestamp associated with the label. The timestamp must be specified using ISO 8601 \
         standard in UTC. \n"]
}
[@@ocaml.doc ""]

type nonrec update_detector_version_status_result = unit [@@ocaml.doc ""]

type nonrec detector_version_status =
  | DRAFT [@ocaml.doc ""]
  | ACTIVE [@ocaml.doc ""]
  | INACTIVE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec update_detector_version_status_request = {
  detector_id : identifier; [@ocaml.doc "The detector ID. \n"]
  detector_version_id : whole_number_version_string; [@ocaml.doc "The detector version ID. \n"]
  status : detector_version_status;
      [@ocaml.doc "The new status.\n\n The only supported values are [ACTIVE] and [INACTIVE] \n "]
}
[@@ocaml.doc ""]

type nonrec update_detector_version_metadata_result = unit [@@ocaml.doc ""]

type nonrec update_detector_version_metadata_request = {
  detector_id : identifier; [@ocaml.doc "The detector ID.\n"]
  detector_version_id : whole_number_version_string; [@ocaml.doc "The detector version ID. \n"]
  description : description; [@ocaml.doc "The description.\n"]
}
[@@ocaml.doc ""]

type nonrec update_detector_version_result = unit [@@ocaml.doc ""]

type nonrec rule_execution_mode = ALL_MATCHED [@ocaml.doc ""] | FIRST_MATCHED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec fraud_detector_arn = string [@@ocaml.doc ""]

type nonrec model_version = {
  model_id : model_identifier; [@ocaml.doc "The model ID.\n"]
  model_type : model_type_enum; [@ocaml.doc "The model type.\n"]
  model_version_number : float_version_string; [@ocaml.doc "The model version number.\n"]
  arn : fraud_detector_arn option; [@ocaml.doc "The model version ARN.\n"]
}
[@@ocaml.doc "The model version.\n"]

type nonrec list_of_model_versions = model_version list [@@ocaml.doc ""]

type nonrec rule_list = rule list [@@ocaml.doc ""]

type nonrec list_of_strings = string_ list [@@ocaml.doc ""]

type nonrec update_detector_version_request = {
  detector_id : identifier;
      [@ocaml.doc "The parent detector ID for the detector version you want to update.\n"]
  detector_version_id : whole_number_version_string; [@ocaml.doc "The detector version ID. \n"]
  external_model_endpoints : list_of_strings;
      [@ocaml.doc "The Amazon SageMaker model endpoints to include in the detector version.\n"]
  rules : rule_list; [@ocaml.doc "The rules to include in the detector version.\n"]
  description : description option; [@ocaml.doc "The detector version description. \n"]
  model_versions : list_of_model_versions option;
      [@ocaml.doc "The model versions to include in the detector version.\n"]
  rule_execution_mode : rule_execution_mode option;
      [@ocaml.doc
        "The rule execution mode to add to the detector.\n\n\
        \ If you specify [FIRST_MATCHED], Amazon Fraud Detector evaluates rules sequentially, \
         first to last, stopping at the first matched rule. Amazon Fraud dectector then provides \
         the outcomes for that single rule.\n\
        \ \n\
        \  If you specifiy [ALL_MATCHED], Amazon Fraud Detector evaluates all rules and returns \
         the outcomes for all matched rules. You can define and edit the rule mode at the detector \
         version level, when it is in draft status.\n\
        \  \n\
        \   The default behavior is [FIRST_MATCHED].\n\
        \   "]
}
[@@ocaml.doc ""]

type nonrec untag_resource_result = unit [@@ocaml.doc ""]

type nonrec tag_key_list = tag_key list [@@ocaml.doc ""]

type nonrec untag_resource_request = {
  resource_ar_n : fraud_detector_arn;
      [@ocaml.doc "The ARN of the resource from which to remove the tag.\n"]
  tag_keys : tag_key_list; [@ocaml.doc "The resource ARN.\n"]
}
[@@ocaml.doc ""]

type nonrec tag_resource_result = unit [@@ocaml.doc ""]

type nonrec tag_resource_request = {
  resource_ar_n : fraud_detector_arn; [@ocaml.doc "The resource ARN.\n"]
  tags : tag_list; [@ocaml.doc "The tags to assign to the resource.\n"]
}
[@@ocaml.doc ""]

type nonrec send_event_result = unit [@@ocaml.doc ""]

type nonrec entity_restricted_string = string [@@ocaml.doc ""]

type nonrec entity = {
  entity_type : string_; [@ocaml.doc "The entity type.\n"]
  entity_id : entity_restricted_string;
      [@ocaml.doc
        "The entity ID. If you do not know the [entityId], you can pass [unknown], which is \
         areserved string literal.\n"]
}
[@@ocaml.doc "The entity details. \n"]

type nonrec list_of_entities = entity list [@@ocaml.doc ""]

type nonrec variable_value = string [@@ocaml.doc ""]

type nonrec variable_name = string [@@ocaml.doc ""]

type nonrec event_variable_map = (variable_name * variable_value) list [@@ocaml.doc ""]

type nonrec send_event_request = {
  event_id : identifier; [@ocaml.doc "The event ID to upload.\n"]
  event_type_name : identifier; [@ocaml.doc "The event type name of the event.\n"]
  event_timestamp : utc_timestamp_is_o8601;
      [@ocaml.doc
        "The timestamp that defines when the event under evaluation occurred. The timestamp must \
         be specified using ISO 8601 standard in UTC.\n"]
  event_variables : event_variable_map;
      [@ocaml.doc
        "Names of the event type's variables you defined in Amazon Fraud Detector to represent \
         data elements and their corresponding values for the event you are sending for evaluation.\n"]
  assigned_label : identifier option;
      [@ocaml.doc
        "The label to associate with the event. Required if specifying [labelTimestamp].\n"]
  label_timestamp : utc_timestamp_is_o8601 option;
      [@ocaml.doc
        "The timestamp associated with the label. Required if specifying [assignedLabel].\n"]
  entities : list_of_entities; [@ocaml.doc "An array of entities.\n"]
}
[@@ocaml.doc ""]

type nonrec put_outcome_result = unit [@@ocaml.doc ""]

type nonrec put_outcome_request = {
  name : identifier; [@ocaml.doc "The name of the outcome.\n"]
  description : description option; [@ocaml.doc "The outcome description.\n"]
  tags : tag_list option; [@ocaml.doc "A collection of key and value pairs.\n"]
}
[@@ocaml.doc ""]

type nonrec put_label_result = unit [@@ocaml.doc ""]

type nonrec put_label_request = {
  name : identifier; [@ocaml.doc "The label name.\n"]
  description : description option; [@ocaml.doc "The label description.\n"]
  tags : tag_list option; [@ocaml.doc "A collection of key and value pairs.\n"]
}
[@@ocaml.doc ""]

type nonrec put_kms_encryption_key_result = unit [@@ocaml.doc ""]

type nonrec kms_encryption_key_arn = string [@@ocaml.doc ""]

type nonrec put_kms_encryption_key_request = {
  kms_encryption_key_arn : kms_encryption_key_arn;
      [@ocaml.doc
        "The KMS encryption key ARN.\n\n\
        \ The KMS key must be single-Region key. Amazon Fraud Detector does not support \
         multi-Region KMS key.\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec put_external_model_result = unit [@@ocaml.doc ""]

type nonrec model_endpoint_status = ASSOCIATED [@ocaml.doc ""] | DISSOCIATED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec csv_index_to_variable_map = (string_ * string_) list [@@ocaml.doc ""]

type nonrec json_key_to_variable_map = (string_ * string_) list [@@ocaml.doc ""]

type nonrec model_output_data_format = CSV [@ocaml.doc ""] | JSONLINES [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec model_output_configuration = {
  format : model_output_data_format; [@ocaml.doc "The format of the model output configuration.\n"]
  json_key_to_variable_map : json_key_to_variable_map option;
      [@ocaml.doc
        "A map of JSON keys in response from SageMaker to the Amazon Fraud Detector variables. \n"]
  csv_index_to_variable_map : csv_index_to_variable_map option;
      [@ocaml.doc
        "A map of CSV index values in the SageMaker response to the Amazon Fraud Detector \
         variables. \n"]
}
[@@ocaml.doc "Provides the Amazon Sagemaker model output configuration.\n"]

type nonrec model_input_template = string [@@ocaml.doc ""]

type nonrec use_event_variables = bool [@@ocaml.doc ""]

type nonrec model_input_data_format = CSV [@ocaml.doc ""] | JSON [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec model_input_configuration = {
  event_type_name : identifier option; [@ocaml.doc "The event type name.\n"]
  format : model_input_data_format option;
      [@ocaml.doc
        " The format of the model input configuration. The format differs depending on if it is \
         passed through to SageMaker or constructed by Amazon Fraud Detector.\n"]
  use_event_variables : use_event_variables; [@ocaml.doc "The event variables.\n"]
  json_input_template : model_input_template option;
      [@ocaml.doc
        " Template for constructing the JSON input-data sent to SageMaker. At event-evaluation, \
         the placeholders for variable names in the template will be replaced with the variable \
         values before being sent to SageMaker. \n"]
  csv_input_template : model_input_template option;
      [@ocaml.doc
        " Template for constructing the CSV input-data sent to SageMaker. At event-evaluation, the \
         placeholders for variable-names in the template will be replaced with the variable values \
         before being sent to SageMaker. \n"]
}
[@@ocaml.doc "The Amazon SageMaker model input configuration.\n"]

type nonrec model_source = SAGEMAKER [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec sage_maker_endpoint_identifier = string [@@ocaml.doc ""]

type nonrec put_external_model_request = {
  model_endpoint : sage_maker_endpoint_identifier; [@ocaml.doc "The model endpoints name.\n"]
  model_source : model_source; [@ocaml.doc "The source of the model.\n"]
  invoke_model_endpoint_role_arn : string_;
      [@ocaml.doc "The IAM role used to invoke the model endpoint.\n"]
  input_configuration : model_input_configuration;
      [@ocaml.doc "The model endpoint input configuration.\n"]
  output_configuration : model_output_configuration;
      [@ocaml.doc "The model endpoint output configuration.\n"]
  model_endpoint_status : model_endpoint_status;
      [@ocaml.doc "The model endpoint\226\128\153s status in Amazon Fraud Detector.\n"]
  tags : tag_list option; [@ocaml.doc "A collection of key and value pairs.\n"]
}
[@@ocaml.doc ""]

type nonrec put_event_type_result = unit [@@ocaml.doc ""]

type nonrec boolean_ = bool [@@ocaml.doc ""]

type nonrec event_orchestration = {
  event_bridge_enabled : boolean_;
      [@ocaml.doc "Specifies if event orchestration is enabled through Amazon EventBridge.\n"]
}
[@@ocaml.doc " The event orchestration status. \n"]

type nonrec event_ingestion = ENABLED [@ocaml.doc ""] | DISABLED [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec put_event_type_request = {
  name : identifier; [@ocaml.doc "The name.\n"]
  description : description option; [@ocaml.doc "The description of the event type.\n"]
  event_variables : non_empty_list_of_strings; [@ocaml.doc "The event type variables.\n"]
  labels : list_of_strings option; [@ocaml.doc "The event type labels.\n"]
  entity_types : non_empty_list_of_strings;
      [@ocaml.doc
        "The entity type for the event type. Example entity types: customer, merchant, account.\n"]
  event_ingestion : event_ingestion option;
      [@ocaml.doc "Specifies if ingestion is enabled or disabled.\n"]
  tags : tag_list option; [@ocaml.doc "A collection of key and value pairs.\n"]
  event_orchestration : event_orchestration option;
      [@ocaml.doc
        "Enables or disables event orchestration. If enabled, you can send event predictions to \
         select AWS services for downstream processing of the events.\n"]
}
[@@ocaml.doc ""]

type nonrec put_entity_type_result = unit [@@ocaml.doc ""]

type nonrec put_entity_type_request = {
  name : identifier; [@ocaml.doc "The name of the entity type.\n"]
  description : description option; [@ocaml.doc "The description.\n"]
  tags : tag_list option; [@ocaml.doc "A collection of key and value pairs.\n"]
}
[@@ocaml.doc ""]

type nonrec put_detector_result = unit [@@ocaml.doc ""]

type nonrec put_detector_request = {
  detector_id : identifier; [@ocaml.doc "The detector ID. \n"]
  description : description option; [@ocaml.doc "The description of the detector.\n"]
  event_type_name : identifier; [@ocaml.doc "The name of the event type.\n"]
  tags : tag_list option; [@ocaml.doc "A collection of key and value pairs.\n"]
}
[@@ocaml.doc ""]

type nonrec list_tags_for_resource_result = {
  tags : tag_list option; [@ocaml.doc "A collection of key and value pairs.\n"]
  next_token : string_ option; [@ocaml.doc "The next token for subsequent requests. \n"]
}
[@@ocaml.doc ""]

type nonrec tags_max_results = int [@@ocaml.doc ""]

type nonrec list_tags_for_resource_request = {
  resource_ar_n : fraud_detector_arn;
      [@ocaml.doc "The ARN that specifies the resource whose tags you want to list.\n"]
  next_token : string_ option; [@ocaml.doc "The next token from the previous results.\n"]
  max_results : tags_max_results option;
      [@ocaml.doc "The maximum number of objects to return for the request. \n"]
}
[@@ocaml.doc ""]

type nonrec event_prediction_summary = {
  event_id : identifier option; [@ocaml.doc " The event ID. \n"]
  event_type_name : identifier option; [@ocaml.doc " The event type. \n"]
  event_timestamp : time option; [@ocaml.doc " The timestamp of the event. \n"]
  prediction_timestamp : time option;
      [@ocaml.doc " The timestamp when the prediction was generated. \n"]
  detector_id : identifier option; [@ocaml.doc " The detector ID. \n"]
  detector_version_id : whole_number_version_string option;
      [@ocaml.doc " The detector version ID. \n"]
}
[@@ocaml.doc " Information about the summary of an event prediction. \n"]

type nonrec list_of_event_prediction_summaries = event_prediction_summary list [@@ocaml.doc ""]

type nonrec list_event_predictions_result = {
  event_prediction_summaries : list_of_event_prediction_summaries option;
      [@ocaml.doc " The summary of the past predictions. \n"]
  next_token : string_ option;
      [@ocaml.doc
        " Identifies the next page of results to return. Use the token to make the call again to \
         retrieve the next page. Keep all other arguments unchanged. Each pagination token expires \
         after 24 hours. \n"]
}
[@@ocaml.doc ""]

type nonrec event_predictions_max_results = int [@@ocaml.doc ""]

type nonrec prediction_time_range = {
  start_time : time;
      [@ocaml.doc " The start time of the time period for when the predictions were generated. \n"]
  end_time : time;
      [@ocaml.doc " The end time of the time period for when the predictions were generated. \n"]
}
[@@ocaml.doc " The time period for when the predictions were generated. \n"]

type nonrec filter_string = string [@@ocaml.doc ""]

type nonrec filter_condition = {
  value : filter_string option;
      [@ocaml.doc
        " A statement containing a resource property and a value to specify filter condition. \n"]
}
[@@ocaml.doc " A conditional statement for filtering a list of past predictions. \n"]

type nonrec list_event_predictions_request = {
  event_id : filter_condition option; [@ocaml.doc " The event ID. \n"]
  event_type : filter_condition option;
      [@ocaml.doc " The event type associated with the detector. \n"]
  detector_id : filter_condition option; [@ocaml.doc " The detector ID. \n"]
  detector_version_id : filter_condition option; [@ocaml.doc " The detector version ID. \n"]
  prediction_time_range : prediction_time_range option;
      [@ocaml.doc " The time period for when the predictions were generated. \n"]
  next_token : string_ option;
      [@ocaml.doc
        " Identifies the next page of results to return. Use the token to make the call again to \
         retrieve the next page. Keep all other arguments unchanged. Each pagination token expires \
         after 24 hours. \n"]
  max_results : event_predictions_max_results option;
      [@ocaml.doc " The maximum number of predictions to return for the request. \n"]
}
[@@ocaml.doc ""]

type nonrec data_source =
  | EVENT [@ocaml.doc ""]
  | MODEL_SCORE [@ocaml.doc ""]
  | EXTERNAL_MODEL_SCORE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec data_type =
  | STRING [@ocaml.doc ""]
  | INTEGER [@ocaml.doc ""]
  | FLOAT [@ocaml.doc ""]
  | BOOLEAN [@ocaml.doc ""]
  | DATETIME [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec variable = {
  name : string_ option; [@ocaml.doc "The name of the variable.\n"]
  data_type : data_type option;
      [@ocaml.doc
        "The data type of the variable. For more information see \
         {{:https://docs.aws.amazon.com/frauddetector/latest/ug/create-a-variable.html#variable-types}Variable \
         types}.\n"]
  data_source : data_source option; [@ocaml.doc "The data source of the variable.\n"]
  default_value : string_ option; [@ocaml.doc "The default value of the variable.\n"]
  description : string_ option; [@ocaml.doc "The description of the variable. \n"]
  variable_type : string_ option;
      [@ocaml.doc
        "The variable type of the variable.\n\n\
        \ Valid Values: [AUTH_CODE | AVS | BILLING_ADDRESS_L1 | BILLING_ADDRESS_L2 | BILLING_CITY \
         | BILLING_COUNTRY | BILLING_NAME | BILLING_PHONE | BILLING_STATE | BILLING_ZIP | CARD_BIN \
         | CATEGORICAL | CURRENCY_CODE | EMAIL_ADDRESS | FINGERPRINT | FRAUD_LABEL | \
         FREE_FORM_TEXT | IP_ADDRESS | NUMERIC | ORDER_ID | PAYMENT_TYPE | PHONE_NUMBER | PRICE | \
         PRODUCT_CATEGORY | SHIPPING_ADDRESS_L1 | SHIPPING_ADDRESS_L2 | SHIPPING_CITY | \
         SHIPPING_COUNTRY | SHIPPING_NAME | SHIPPING_PHONE | SHIPPING_STATE | SHIPPING_ZIP | \
         USERAGENT ] \n\
        \ "]
  last_updated_time : time option; [@ocaml.doc "The time when variable was last updated.\n"]
  created_time : time option; [@ocaml.doc "The time when the variable was created.\n"]
  arn : fraud_detector_arn option; [@ocaml.doc "The ARN of the variable.\n"]
}
[@@ocaml.doc "The variable.\n"]

type nonrec variable_list = variable list [@@ocaml.doc ""]

type nonrec get_variables_result = {
  variables : variable_list option; [@ocaml.doc "The names of the variables returned. \n"]
  next_token : string_ option;
      [@ocaml.doc "The next page token to be used in subsequent requests. \n"]
}
[@@ocaml.doc ""]

type nonrec variables_max_results = int [@@ocaml.doc ""]

type nonrec get_variables_request = {
  name : string_ option; [@ocaml.doc "The name of the variable. \n"]
  next_token : string_ option; [@ocaml.doc "The next page token of the get variable request. \n"]
  max_results : variables_max_results option;
      [@ocaml.doc "The max size per page determined for the get variable request. \n"]
}
[@@ocaml.doc ""]

type nonrec rule_detail = {
  rule_id : identifier option; [@ocaml.doc "The rule ID.\n"]
  description : description option; [@ocaml.doc "The rule description.\n"]
  detector_id : identifier option; [@ocaml.doc "The detector for which the rule is associated.\n"]
  rule_version : whole_number_version_string option; [@ocaml.doc "The rule version.\n"]
  expression : rule_expression option; [@ocaml.doc "The rule expression.\n"]
  language : language option; [@ocaml.doc "The rule language.\n"]
  outcomes : non_empty_list_of_strings option; [@ocaml.doc "The rule outcomes.\n"]
  last_updated_time : time option; [@ocaml.doc "Timestamp of the last time the rule was updated.\n"]
  created_time : time option; [@ocaml.doc "The timestamp of when the rule was created.\n"]
  arn : fraud_detector_arn option; [@ocaml.doc "The rule ARN.\n"]
}
[@@ocaml.doc "The details of the rule.\n"]

type nonrec rule_detail_list = rule_detail list [@@ocaml.doc ""]

type nonrec get_rules_result = {
  rule_details : rule_detail_list option; [@ocaml.doc "The details of the requested rule.\n"]
  next_token : string_ option;
      [@ocaml.doc "The next page token to be used in subsequent requests.\n"]
}
[@@ocaml.doc ""]

type nonrec rules_max_results = int [@@ocaml.doc ""]

type nonrec get_rules_request = {
  rule_id : identifier option; [@ocaml.doc "The rule ID.\n"]
  detector_id : identifier; [@ocaml.doc "The detector ID.\n"]
  rule_version : whole_number_version_string option; [@ocaml.doc "The rule version.\n"]
  next_token : string_ option; [@ocaml.doc "The next page token.\n"]
  max_results : rules_max_results option;
      [@ocaml.doc "The maximum number of rules to return for the request.\n"]
}
[@@ocaml.doc ""]

type nonrec outcome = {
  name : identifier option; [@ocaml.doc "The outcome name.\n"]
  description : description option; [@ocaml.doc "The outcome description.\n"]
  last_updated_time : time option; [@ocaml.doc "The timestamp when the outcome was last updated.\n"]
  created_time : time option; [@ocaml.doc "The timestamp when the outcome was created.\n"]
  arn : fraud_detector_arn option; [@ocaml.doc "The outcome ARN.\n"]
}
[@@ocaml.doc "The outcome.\n"]

type nonrec outcome_list = outcome list [@@ocaml.doc ""]

type nonrec get_outcomes_result = {
  outcomes : outcome_list option; [@ocaml.doc "The outcomes. \n"]
  next_token : string_ option; [@ocaml.doc "The next page token for subsequent requests.\n"]
}
[@@ocaml.doc ""]

type nonrec outcomes_max_results = int [@@ocaml.doc ""]

type nonrec get_outcomes_request = {
  name : identifier option; [@ocaml.doc "The name of the outcome or outcomes to get.\n"]
  next_token : string_ option; [@ocaml.doc "The next page token for the request. \n"]
  max_results : outcomes_max_results option;
      [@ocaml.doc "The maximum number of objects to return for the request. \n"]
}
[@@ocaml.doc ""]

type nonrec unlabeled_events_treatment =
  | IGNORE [@ocaml.doc ""]
  | FRAUD [@ocaml.doc ""]
  | LEGIT [@ocaml.doc ""]
  | AUTO [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec label_mapper = (string_ * list_of_strings) list [@@ocaml.doc ""]

type nonrec label_schema = {
  label_mapper : label_mapper option;
      [@ocaml.doc
        "The label mapper maps the Amazon Fraud Detector supported model classification labels \
         ([FRAUD], [LEGIT]) to the appropriate event type labels. For example, if \"[FRAUD]\" and \
         \"[LEGIT]\" are Amazon Fraud Detector supported labels, this mapper could be: [{\"FRAUD\" \
         => \\[\"0\"\\]], [\"LEGIT\" => \\[\"1\"\\]}] or [{\"FRAUD\" => \\[\"false\"\\]], \
         [\"LEGIT\" => \\[\"true\"\\]}] or [{\"FRAUD\" => \\[\"fraud\", \"abuse\"\\]], [\"LEGIT\" \
         => \\[\"legit\", \"safe\"\\]}]. The value part of the mapper is a list, because you may \
         have multiple label variants from your event type for a single Amazon Fraud Detector \
         label. \n"]
  unlabeled_events_treatment : unlabeled_events_treatment option;
      [@ocaml.doc
        "The action to take for unlabeled events.\n\n\
        \ {ul\n\
        \       {-  Use [IGNORE] if you want the unlabeled events to be ignored. This is \
         recommended when the majority of the events in the dataset are labeled.\n\
        \           \n\
        \            }\n\
        \       {-  Use [FRAUD] if you want to categorize all unlabeled events as \
         \226\128\156Fraud\226\128\157. This is recommended when most of the events in your \
         dataset are fraudulent.\n\
        \           \n\
        \            }\n\
        \       {-  Use [LEGIT] if you want to categorize all unlabeled events as \
         \226\128\156Legit\226\128\157. This is recommended when most of the events in your \
         dataset are legitimate.\n\
        \           \n\
        \            }\n\
        \       {-  Use [AUTO] if you want Amazon Fraud Detector to decide how to use the \
         unlabeled data. This is recommended when there is significant unlabeled events in the \
         dataset.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \   By default, Amazon Fraud Detector ignores the unlabeled data.\n\
        \   "]
}
[@@ocaml.doc "The label schema.\n"]

type nonrec training_data_schema = {
  model_variables : list_of_strings; [@ocaml.doc "The training data schema variables.\n"]
  label_schema : label_schema option; [@ocaml.doc ""]
}
[@@ocaml.doc "The training data schema.\n"]

type nonrec training_data_source_enum =
  | EXTERNAL_EVENTS [@ocaml.doc ""]
  | INGESTED_EVENTS [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec get_model_version_result = {
  model_id : model_identifier option; [@ocaml.doc "The model ID.\n"]
  model_type : model_type_enum option; [@ocaml.doc "The model type.\n"]
  model_version_number : float_version_string option; [@ocaml.doc "The model version number.\n"]
  training_data_source : training_data_source_enum option;
      [@ocaml.doc "The training data source.\n"]
  training_data_schema : training_data_schema option; [@ocaml.doc "The training data schema.\n"]
  external_events_detail : external_events_detail option;
      [@ocaml.doc
        "The details of the external events data used for training the model version. This will be \
         populated if the [trainingDataSource] is [EXTERNAL_EVENTS] \n"]
  ingested_events_detail : ingested_events_detail option;
      [@ocaml.doc
        "The details of the ingested events data used for training the model version. This will be \
         populated if the [trainingDataSource] is [INGESTED_EVENTS].\n"]
  status : string_ option;
      [@ocaml.doc
        "The model version status.\n\n\
        \ Possible values are:\n\
        \ \n\
        \  {ul\n\
        \        {-   [TRAINING_IN_PROGRESS] \n\
        \            \n\
        \             }\n\
        \        {-   [TRAINING_COMPLETE] \n\
        \            \n\
        \             }\n\
        \        {-   [ACTIVATE_REQUESTED] \n\
        \            \n\
        \             }\n\
        \        {-   [ACTIVATE_IN_PROGRESS] \n\
        \            \n\
        \             }\n\
        \        {-   [ACTIVE] \n\
        \            \n\
        \             }\n\
        \        {-   [INACTIVATE_REQUESTED] \n\
        \            \n\
        \             }\n\
        \        {-   [INACTIVATE_IN_PROGRESS] \n\
        \            \n\
        \             }\n\
        \        {-   [INACTIVE] \n\
        \            \n\
        \             }\n\
        \        {-   [ERROR] \n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  arn : fraud_detector_arn option; [@ocaml.doc "The model version ARN.\n"]
}
[@@ocaml.doc ""]

type nonrec get_model_version_request = {
  model_id : model_identifier; [@ocaml.doc "The model ID.\n"]
  model_type : model_type_enum; [@ocaml.doc "The model type.\n"]
  model_version_number : float_version_string; [@ocaml.doc "The model version number.\n"]
}
[@@ocaml.doc ""]

type nonrec model = {
  model_id : model_identifier option; [@ocaml.doc "The model ID.\n"]
  model_type : model_type_enum option; [@ocaml.doc "The model type.\n"]
  description : description option; [@ocaml.doc "The model description.\n"]
  event_type_name : string_ option; [@ocaml.doc "The name of the event type.\n"]
  created_time : time option; [@ocaml.doc "Timestamp of when the model was created.\n"]
  last_updated_time : time option; [@ocaml.doc "Timestamp of last time the model was updated.\n"]
  arn : fraud_detector_arn option; [@ocaml.doc "The ARN of the model.\n"]
}
[@@ocaml.doc "The model.\n"]

type nonrec model_list = model list [@@ocaml.doc ""]

type nonrec get_models_result = {
  next_token : string_ option;
      [@ocaml.doc "The next page token to be used in subsequent requests.\n"]
  models : model_list option; [@ocaml.doc "The array of models.\n"]
}
[@@ocaml.doc ""]

type nonrec models_max_page_size = int [@@ocaml.doc ""]

type nonrec get_models_request = {
  model_id : model_identifier option; [@ocaml.doc "The model ID.\n"]
  model_type : model_type_enum option; [@ocaml.doc "The model type.\n"]
  next_token : string_ option; [@ocaml.doc "The next token for the subsequent request.\n"]
  max_results : models_max_page_size option;
      [@ocaml.doc "The maximum number of objects to return for the request. \n"]
}
[@@ocaml.doc ""]

type nonrec next_token = string [@@ocaml.doc ""]

type nonrec allow_deny_list = {
  name : no_dash_identifier; [@ocaml.doc " The name of the list. \n"]
  description : description option; [@ocaml.doc " The description of the list. \n"]
  variable_type : variable_type option; [@ocaml.doc " The variable type of the list. \n"]
  created_time : time option; [@ocaml.doc " The time the list was created. \n"]
  updated_time : time option; [@ocaml.doc " The time the list was last updated. \n"]
  arn : fraud_detector_arn option; [@ocaml.doc " The ARN of the list. \n"]
}
[@@ocaml.doc " The metadata of a list. \n"]

type nonrec allow_deny_lists = allow_deny_list list [@@ocaml.doc ""]

type nonrec get_lists_metadata_result = {
  lists : allow_deny_lists option;
      [@ocaml.doc " The metadata of the specified list or all lists under the account. \n"]
  next_token : next_token option; [@ocaml.doc " The next page token. \n"]
}
[@@ocaml.doc ""]

type nonrec lists_metadata_max_results = int [@@ocaml.doc ""]

type nonrec get_lists_metadata_request = {
  name : no_dash_identifier option; [@ocaml.doc " The name of the list. \n"]
  next_token : next_token option; [@ocaml.doc " The next token for the subsequent request. \n"]
  max_results : lists_metadata_max_results option;
      [@ocaml.doc " The maximum number of objects to return for the request. \n"]
}
[@@ocaml.doc ""]

type nonrec get_list_elements_result = {
  elements : elements_list option; [@ocaml.doc " The list elements. \n"]
  next_token : next_token option; [@ocaml.doc " The next page token. \n"]
}
[@@ocaml.doc ""]

type nonrec lists_elements_max_results = int [@@ocaml.doc ""]

type nonrec get_list_elements_request = {
  name : no_dash_identifier; [@ocaml.doc " The name of the list. \n"]
  next_token : next_token option; [@ocaml.doc " The next token for the subsequent request. \n"]
  max_results : lists_elements_max_results option;
      [@ocaml.doc " The maximum number of objects to return for the request. \n"]
}
[@@ocaml.doc ""]

type nonrec label = {
  name : string_ option; [@ocaml.doc "The label name.\n"]
  description : description option; [@ocaml.doc "The label description.\n"]
  last_updated_time : time option; [@ocaml.doc "Timestamp of when the label was last updated.\n"]
  created_time : time option; [@ocaml.doc "Timestamp of when the event type was created.\n"]
  arn : fraud_detector_arn option; [@ocaml.doc "The label ARN.\n"]
}
[@@ocaml.doc "The label details.\n"]

type nonrec label_list = label list [@@ocaml.doc ""]

type nonrec get_labels_result = {
  labels : label_list option; [@ocaml.doc "An array of labels.\n"]
  next_token : string_ option; [@ocaml.doc "The next page token.\n"]
}
[@@ocaml.doc ""]

type nonrec labels_max_results = int [@@ocaml.doc ""]

type nonrec get_labels_request = {
  name : identifier option; [@ocaml.doc "The name of the label or labels to get.\n"]
  next_token : string_ option; [@ocaml.doc "The next token for the subsequent request.\n"]
  max_results : labels_max_results option;
      [@ocaml.doc "The maximum number of objects to return for the request.\n"]
}
[@@ocaml.doc ""]

type nonrec kms_key = {
  kms_encryption_key_arn : kms_encryption_key_arn option; [@ocaml.doc "The encryption key ARN.\n"]
}
[@@ocaml.doc "The KMS key details.\n"]

type nonrec get_kms_encryption_key_result = {
  kms_key : kms_key option; [@ocaml.doc "The KMS encryption key.\n"]
}
[@@ocaml.doc ""]

type nonrec external_model = {
  model_endpoint : string_ option; [@ocaml.doc "The Amazon SageMaker model endpoints.\n"]
  model_source : model_source option; [@ocaml.doc "The source of the model.\n"]
  invoke_model_endpoint_role_arn : string_ option;
      [@ocaml.doc "The role used to invoke the model. \n"]
  input_configuration : model_input_configuration option; [@ocaml.doc "The input configuration.\n"]
  output_configuration : model_output_configuration option;
      [@ocaml.doc "The output configuration.\n"]
  model_endpoint_status : model_endpoint_status option;
      [@ocaml.doc "The Amazon Fraud Detector status for the external model endpoint\n"]
  last_updated_time : time option; [@ocaml.doc "Timestamp of when the model was last updated.\n"]
  created_time : time option; [@ocaml.doc "Timestamp of when the model was last created.\n"]
  arn : fraud_detector_arn option; [@ocaml.doc "The model ARN.\n"]
}
[@@ocaml.doc "The Amazon SageMaker model.\n"]

type nonrec external_model_list = external_model list [@@ocaml.doc ""]

type nonrec get_external_models_result = {
  external_models : external_model_list option; [@ocaml.doc "Gets the Amazon SageMaker models.\n"]
  next_token : string_ option;
      [@ocaml.doc "The next page token to be used in subsequent requests.\n"]
}
[@@ocaml.doc ""]

type nonrec external_models_max_results = int [@@ocaml.doc ""]

type nonrec get_external_models_request = {
  model_endpoint : string_ option; [@ocaml.doc "The Amazon SageMaker model endpoint.\n"]
  next_token : string_ option; [@ocaml.doc "The next page token for the request.\n"]
  max_results : external_models_max_results option;
      [@ocaml.doc "The maximum number of objects to return for the request.\n"]
}
[@@ocaml.doc ""]

type nonrec long = Smaws_Lib.CoreTypes.Int64.t [@@ocaml.doc ""]

type nonrec ingested_event_statistics = {
  number_of_events : long option; [@ocaml.doc "The number of stored events.\n"]
  event_data_size_in_bytes : long option; [@ocaml.doc "The total size of the stored events.\n"]
  least_recent_event : time option; [@ocaml.doc "The oldest stored event.\n"]
  most_recent_event : time option; [@ocaml.doc "The newest stored event.\n"]
  last_updated_time : time option;
      [@ocaml.doc "Timestamp of when the stored event was last updated. \n"]
}
[@@ocaml.doc "Data about the stored events.\n"]

type nonrec event_type = {
  name : string_ option; [@ocaml.doc "The event type name.\n"]
  description : description option; [@ocaml.doc "The event type description.\n"]
  event_variables : list_of_strings option; [@ocaml.doc "The event type event variables.\n"]
  labels : list_of_strings option; [@ocaml.doc "The event type labels.\n"]
  entity_types : non_empty_list_of_strings option; [@ocaml.doc "The event type entity types.\n"]
  event_ingestion : event_ingestion option;
      [@ocaml.doc
        "If [Enabled], Amazon Fraud Detector stores event data when you generate a prediction and \
         uses that data to update calculated variables in near real-time. Amazon Fraud Detector \
         uses this data, known as [INGESTED_EVENTS], to train your model and improve fraud \
         predictions.\n"]
  ingested_event_statistics : ingested_event_statistics option;
      [@ocaml.doc "Data about the stored events.\n"]
  last_updated_time : time option;
      [@ocaml.doc "Timestamp of when the event type was last updated.\n"]
  created_time : time option; [@ocaml.doc "Timestamp of when the event type was created.\n"]
  arn : fraud_detector_arn option; [@ocaml.doc "The entity type ARN.\n"]
  event_orchestration : event_orchestration option; [@ocaml.doc "The event orchestration status. \n"]
}
[@@ocaml.doc "The event type details.\n"]

type nonrec event_type_list = event_type list [@@ocaml.doc ""]

type nonrec get_event_types_result = {
  event_types : event_type_list option; [@ocaml.doc "An array of event types.\n"]
  next_token : string_ option; [@ocaml.doc "The next page token.\n"]
}
[@@ocaml.doc ""]

type nonrec event_types_max_results = int [@@ocaml.doc ""]

type nonrec get_event_types_request = {
  name : identifier option; [@ocaml.doc "The name.\n"]
  next_token : string_ option; [@ocaml.doc "The next token for the subsequent request.\n"]
  max_results : event_types_max_results option;
      [@ocaml.doc "The maximum number of objects to return for the request.\n"]
}
[@@ocaml.doc ""]

type nonrec map_of_strings = (string_ * string_) list [@@ocaml.doc ""]

type nonrec evaluated_external_model = {
  model_endpoint : string_ option;
      [@ocaml.doc " The endpoint of the external (Amazon Sagemaker) model. \n"]
  use_event_variables : boolean_ option;
      [@ocaml.doc " Indicates whether event variables were used to generate predictions. \n"]
  input_variables : map_of_strings option;
      [@ocaml.doc " Input variables use for generating predictions. \n"]
  output_variables : map_of_strings option; [@ocaml.doc " Output variables. \n"]
}
[@@ocaml.doc
  " The details of the external (Amazon Sagemaker) model evaluated for generating predictions. \n"]

type nonrec list_of_evaluated_external_models = evaluated_external_model list [@@ocaml.doc ""]

type nonrec aggregated_variables_impact_explanation = {
  event_variable_names : list_of_strings option;
      [@ocaml.doc
        " The names of all the event variables that were used to derive the aggregated variables. \n"]
  relative_impact : string_ option;
      [@ocaml.doc
        " The relative impact of the aggregated variables in terms of magnitude on the prediction \
         scores. \n"]
  log_odds_impact : float_ option;
      [@ocaml.doc
        " The raw, uninterpreted value represented as log-odds of the fraud. These values are \
         usually between -10 to +10, but range from -infinity to +infinity.\n\n\
        \ {ul\n\
        \       {-  A positive value indicates that the variables drove the risk score up.\n\
        \           \n\
        \            }\n\
        \       {-  A negative value indicates that the variables drove the risk score down.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc
  " The details of the impact of aggregated variables on the prediction score. \n\n\
  \ Account Takeover Insights (ATI) model uses the login data you provide to continuously \
   calculate a set of variables (aggregated variables) based on historical events. For example, \
   the model might calculate the number of times an user has logged in using the same IP address. \
   In this case, event variables used to derive the aggregated variables are [IP address] and \
   [user].\n\
  \ "]

type nonrec list_of_aggregated_variables_impact_explanations =
  aggregated_variables_impact_explanation list
[@@ocaml.doc ""]

type nonrec variable_impact_explanation = {
  event_variable_name : string_ option; [@ocaml.doc " The event variable name. \n"]
  relative_impact : string_ option;
      [@ocaml.doc
        " The event variable's relative impact in terms of magnitude on the prediction scores. The \
         relative impact values consist of a numerical rating (0-5, 5 being the highest) and \
         direction (increased/decreased) impact of the fraud risk. \n"]
  log_odds_impact : float_ option;
      [@ocaml.doc
        " The raw, uninterpreted value represented as log-odds of the fraud. These values are \
         usually between -10 to +10, but range from - infinity to + infinity.\n\n\
        \ {ul\n\
        \       {-  A positive value indicates that the variable drove the risk score up.\n\
        \           \n\
        \            }\n\
        \       {-  A negative value indicates that the variable drove the risk score down.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
}
[@@ocaml.doc " The details of the event variable's impact on the prediction score. \n"]

type nonrec list_of_variable_impact_explanations = variable_impact_explanation list [@@ocaml.doc ""]

type nonrec prediction_explanations = {
  variable_impact_explanations : list_of_variable_impact_explanations option;
      [@ocaml.doc " The details of the event variable's impact on the prediction score. \n"]
  aggregated_variables_impact_explanations : list_of_aggregated_variables_impact_explanations option;
      [@ocaml.doc
        " The details of the aggregated variables impact on the prediction score. \n\n\
        \ Account Takeover Insights (ATI) model uses event variables from the login data you \
         provide to continuously calculate a set of variables (aggregated variables) based on \
         historical events. For example, your ATI model might calculate the number of times an \
         user has logged in using the same IP address. In this case, event variables used to \
         derive the aggregated variables are [IP address] and [user].\n\
        \ "]
}
[@@ocaml.doc
  " The prediction explanations that provide insight into how each event variable impacted the \
   model version's fraud prediction score. \n"]

type nonrec model_version_evaluation = {
  output_variable_name : string_ option; [@ocaml.doc " The output variable name. \n"]
  evaluation_score : string_ option;
      [@ocaml.doc " The evaluation score generated for the model version. \n"]
  prediction_explanations : prediction_explanations option;
      [@ocaml.doc " The prediction explanations generated for the model version. \n"]
}
[@@ocaml.doc " The model version evalutions. \n"]

type nonrec list_of_model_version_evaluations = model_version_evaluation list [@@ocaml.doc ""]

type nonrec evaluated_model_version = {
  model_id : string_ option; [@ocaml.doc " The model ID. \n"]
  model_version : string_ option; [@ocaml.doc " The model version. \n"]
  model_type : string_ option;
      [@ocaml.doc
        "The model type. \n\n\
        \ Valid values: [ONLINE_FRAUD_INSIGHTS] | [TRANSACTION_FRAUD_INSIGHTS] \n\
        \ "]
  evaluations : list_of_model_version_evaluations option;
      [@ocaml.doc " Evaluations generated for the model version. \n"]
}
[@@ocaml.doc " The model version evaluated for generating prediction. \n"]

type nonrec list_of_evaluated_model_versions = evaluated_model_version list [@@ocaml.doc ""]

type nonrec sensitive_string = string [@@ocaml.doc ""]

type nonrec evaluated_rule = {
  rule_id : identifier option; [@ocaml.doc " The rule ID. \n"]
  rule_version : whole_number_version_string option; [@ocaml.doc " The rule version. \n"]
  expression : sensitive_string option; [@ocaml.doc " The rule expression. \n"]
  expression_with_values : sensitive_string option; [@ocaml.doc " The rule expression value. \n"]
  outcomes : list_of_strings option; [@ocaml.doc " The rule outcome. \n"]
  evaluated : boolean_ option; [@ocaml.doc " Indicates whether the rule was evaluated. \n"]
  matched : boolean_ option; [@ocaml.doc " Indicates whether the rule matched. \n"]
}
[@@ocaml.doc " The details of the rule used for evaluating variable values. \n"]

type nonrec evaluated_rule_list = evaluated_rule list [@@ocaml.doc ""]

type nonrec event_variable_summary = {
  name : sensitive_string option; [@ocaml.doc " The event variable name. \n"]
  value : sensitive_string option; [@ocaml.doc " The value of the event variable. \n"]
  source : sensitive_string option; [@ocaml.doc " The event variable source. \n"]
}
[@@ocaml.doc
  " Information about the summary of an event variable that was evaluated for generating \
   prediction. \n"]

type nonrec list_of_event_variable_summaries = event_variable_summary list [@@ocaml.doc ""]

type nonrec get_event_prediction_metadata_result = {
  event_id : identifier option; [@ocaml.doc " The event ID. \n"]
  event_type_name : identifier option;
      [@ocaml.doc " The event type associated with the detector specified for this prediction. \n"]
  entity_id : string_ option; [@ocaml.doc " The entity ID. \n"]
  entity_type : string_ option; [@ocaml.doc " The entity type. \n"]
  event_timestamp : time option;
      [@ocaml.doc
        " The timestamp for when the prediction was generated for the associated event ID. \n"]
  detector_id : identifier option; [@ocaml.doc " The detector ID. \n"]
  detector_version_id : whole_number_version_string option;
      [@ocaml.doc " The detector version ID. \n"]
  detector_version_status : string_ option; [@ocaml.doc " The status of the detector version. \n"]
  event_variables : list_of_event_variable_summaries option;
      [@ocaml.doc " A list of event variables that influenced the prediction scores. \n"]
  rules : evaluated_rule_list option;
      [@ocaml.doc
        " List of rules associated with the detector version that were used for evaluating \
         variable values. \n"]
  rule_execution_mode : rule_execution_mode option;
      [@ocaml.doc " The execution mode of the rule used for evaluating variable values. \n"]
  outcomes : list_of_strings option;
      [@ocaml.doc " The outcomes of the matched rule, based on the rule execution mode. \n"]
  evaluated_model_versions : list_of_evaluated_model_versions option;
      [@ocaml.doc " Model versions that were evaluated for generating predictions. \n"]
  evaluated_external_models : list_of_evaluated_external_models option;
      [@ocaml.doc
        " External (Amazon SageMaker) models that were evaluated for generating predictions. \n"]
  prediction_timestamp : time option;
      [@ocaml.doc "The timestamp that defines when the prediction was generated. \n"]
}
[@@ocaml.doc ""]

type nonrec get_event_prediction_metadata_request = {
  event_id : identifier; [@ocaml.doc " The event ID. \n"]
  event_type_name : identifier;
      [@ocaml.doc " The event type associated with the detector specified for the prediction. \n"]
  detector_id : identifier; [@ocaml.doc " The detector ID. \n"]
  detector_version_id : whole_number_version_string; [@ocaml.doc " The detector version ID. \n"]
  prediction_timestamp : time;
      [@ocaml.doc
        " The timestamp that defines when the prediction was generated. The timestamp must be \
         specified using ISO 8601 standard in UTC.\n\n\
        \ We recommend calling \
         {{:https://docs.aws.amazon.com/frauddetector/latest/api/API_ListEventPredictions.html}ListEventPredictions} \
         first, and using the [predictionTimestamp] value in the response to provide an accurate \
         prediction timestamp value.\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec resource_unavailable_exception = { message : string_ option [@ocaml.doc ""] }
[@@ocaml.doc
  "An exception indicating that the attached customer-owned (external) model threw an exception \
   when Amazon Fraud Detector invoked the model.\n"]

type nonrec external_model_prediction_map = (string_ * string_) list [@@ocaml.doc ""]

type nonrec external_model_summary = {
  model_endpoint : string_ option; [@ocaml.doc "The endpoint of the Amazon SageMaker model.\n"]
  model_source : model_source option; [@ocaml.doc "The source of the model.\n"]
}
[@@ocaml.doc "The Amazon SageMaker model.\n"]

type nonrec external_model_outputs = {
  external_model : external_model_summary option; [@ocaml.doc "The Amazon SageMaker model.\n"]
  outputs : external_model_prediction_map option;
      [@ocaml.doc "The fraud prediction scores from Amazon SageMaker model.\n"]
}
[@@ocaml.doc "The fraud prediction scores from Amazon SageMaker model.\n"]

type nonrec list_of_external_model_outputs = external_model_outputs list [@@ocaml.doc ""]

type nonrec rule_result = {
  rule_id : string_ option;
      [@ocaml.doc "The rule ID that was matched, based on the rule execution mode.\n"]
  outcomes : list_of_strings option;
      [@ocaml.doc "The outcomes of the matched rule, based on the rule execution mode.\n"]
}
[@@ocaml.doc "The rule results.\n"]

type nonrec list_of_rule_results = rule_result list [@@ocaml.doc ""]

type nonrec model_prediction_map = (string_ * float_) list [@@ocaml.doc ""]

type nonrec model_scores = {
  model_version : model_version option; [@ocaml.doc "The model version.\n"]
  scores : model_prediction_map option; [@ocaml.doc "The model's fraud prediction scores.\n"]
}
[@@ocaml.doc "The fraud prediction scores.\n"]

type nonrec list_of_model_scores = model_scores list [@@ocaml.doc ""]

type nonrec get_event_prediction_result = {
  model_scores : list_of_model_scores option;
      [@ocaml.doc
        "The model scores. Amazon Fraud Detector generates model scores between 0 and 1000, where \
         0 is low fraud risk and 1000 is high fraud risk. Model scores are directly related to the \
         false positive rate (FPR). For example, a score of 600 corresponds to an estimated 10% \
         false positive rate whereas a score of 900 corresponds to an estimated 2% false positive \
         rate.\n"]
  rule_results : list_of_rule_results option; [@ocaml.doc "The results from the rules.\n"]
  external_model_outputs : list_of_external_model_outputs option;
      [@ocaml.doc "The model scores for Amazon SageMaker models.\n"]
}
[@@ocaml.doc ""]

type nonrec content_type = string [@@ocaml.doc ""]

type nonrec blob = bytes [@@ocaml.doc ""]

type nonrec model_endpoint_data_blob = {
  byte_buffer : blob option;
      [@ocaml.doc "The byte buffer of the Amazon SageMaker model endpoint input data blob.\n"]
  content_type : content_type option;
      [@ocaml.doc "The content type of the Amazon SageMaker model endpoint input data blob. \n"]
}
[@@ocaml.doc
  "A pre-formed Amazon SageMaker model input you can include if your detector version includes an \
   imported Amazon SageMaker model endpoint with pass-through input configuration.\n"]

type nonrec external_model_endpoint_data_blob_map =
  (sage_maker_endpoint_identifier * model_endpoint_data_blob) list
[@@ocaml.doc ""]

type nonrec get_event_prediction_request = {
  detector_id : string_; [@ocaml.doc "The detector ID.\n"]
  detector_version_id : whole_number_version_string option;
      [@ocaml.doc "The detector version ID.\n"]
  event_id : string_; [@ocaml.doc "The unique ID used to identify the event.\n"]
  event_type_name : string_;
      [@ocaml.doc "The event type associated with the detector specified for the prediction.\n"]
  entities : list_of_entities;
      [@ocaml.doc
        "The entity type (associated with the detector's event type) and specific entity ID \
         representing who performed the event. If an entity id is not available, use \"UNKNOWN.\"\n"]
  event_timestamp : utc_timestamp_is_o8601;
      [@ocaml.doc
        "Timestamp that defines when the event under evaluation occurred. The timestamp must be \
         specified using ISO 8601 standard in UTC.\n"]
  event_variables : event_variable_map;
      [@ocaml.doc
        "Names of the event type's variables you defined in Amazon Fraud Detector to represent \
         data elements and their corresponding values for the event you are sending for \
         evaluation.\n\n\
        \  You must provide at least one eventVariable\n\
        \  \n\
        \    To ensure most accurate fraud prediction and to simplify your data preparation, \
         Amazon Fraud Detector will replace all missing variables or values as follows:\n\
        \    \n\
        \      {b For Amazon Fraud Detector trained models:} \n\
        \     \n\
        \      If a null value is provided explicitly for a variable or if a variable is missing, \
         model will replace the null value or the missing variable (no variable name in the \
         eventVariables map) with calculated default mean/medians for numeric variables and with \
         special values for categorical variables.\n\
        \      \n\
        \        {b For imported SageMaker models:} \n\
        \       \n\
        \        If a null value is provided explicitly for a variable, the model and rules will \
         use \226\128\156null\226\128\157 as the value. If a variable is not provided (no variable \
         name in the eventVariables map), model and rules will use the default value that is \
         provided for the variable. \n\
        \        "]
  external_model_endpoint_data_blobs : external_model_endpoint_data_blob_map option;
      [@ocaml.doc "The Amazon SageMaker model endpoint input data blobs.\n"]
}
[@@ocaml.doc ""]

type nonrec attribute_value = string [@@ocaml.doc ""]

type nonrec attribute_key = string [@@ocaml.doc ""]

type nonrec event_attribute_map = (attribute_key * attribute_value) list [@@ocaml.doc ""]

type nonrec event = {
  event_id : string_ option; [@ocaml.doc "The event ID.\n"]
  event_type_name : string_ option; [@ocaml.doc "The event type.\n"]
  event_timestamp : string_ option;
      [@ocaml.doc
        "The timestamp that defines when the event under evaluation occurred. The timestamp must \
         be specified using ISO 8601 standard in UTC.\n"]
  event_variables : event_attribute_map option;
      [@ocaml.doc
        "Names of the event type's variables you defined in Amazon Fraud Detector to represent \
         data elements and their corresponding values for the event you are sending for evaluation.\n"]
  current_label : string_ option; [@ocaml.doc "The label associated with the event.\n"]
  label_timestamp : string_ option;
      [@ocaml.doc
        "The timestamp associated with the label to update. The timestamp must be specified using \
         ISO 8601 standard in UTC.\n"]
  entities : list_of_entities option; [@ocaml.doc "The event entities.\n"]
}
[@@ocaml.doc "The event details.\n"]

type nonrec get_event_result = { event : event option [@ocaml.doc "The details of the event.\n"] }
[@@ocaml.doc ""]

type nonrec get_event_request = {
  event_id : string_; [@ocaml.doc "The ID of the event to retrieve.\n"]
  event_type_name : string_; [@ocaml.doc "The event type of the event to retrieve.\n"]
}
[@@ocaml.doc ""]

type nonrec entity_type = {
  name : string_ option; [@ocaml.doc "The entity type name.\n"]
  description : description option; [@ocaml.doc "The entity type description.\n"]
  last_updated_time : time option;
      [@ocaml.doc "Timestamp of when the entity type was last updated.\n"]
  created_time : time option; [@ocaml.doc "Timestamp of when the entity type was created.\n"]
  arn : fraud_detector_arn option; [@ocaml.doc "The entity type ARN.\n"]
}
[@@ocaml.doc "The entity type details.\n"]

type nonrec entity_type_list = entity_type list [@@ocaml.doc ""]

type nonrec get_entity_types_result = {
  entity_types : entity_type_list option; [@ocaml.doc "An array of entity types.\n"]
  next_token : string_ option; [@ocaml.doc "The next page token.\n"]
}
[@@ocaml.doc ""]

type nonrec entity_types_max_results = int [@@ocaml.doc ""]

type nonrec get_entity_types_request = {
  name : identifier option; [@ocaml.doc "The name.\n"]
  next_token : string_ option; [@ocaml.doc "The next token for the subsequent request.\n"]
  max_results : entity_types_max_results option;
      [@ocaml.doc "The maximum number of objects to return for the request.\n"]
}
[@@ocaml.doc ""]

type nonrec get_detector_version_result = {
  detector_id : identifier option; [@ocaml.doc "The detector ID.\n"]
  detector_version_id : whole_number_version_string option;
      [@ocaml.doc "The detector version ID.\n"]
  description : description option; [@ocaml.doc "The detector version description.\n"]
  external_model_endpoints : list_of_strings option;
      [@ocaml.doc "The Amazon SageMaker model endpoints included in the detector version.\n"]
  model_versions : list_of_model_versions option;
      [@ocaml.doc "The model versions included in the detector version. \n"]
  rules : rule_list option; [@ocaml.doc "The rules included in the detector version.\n"]
  status : detector_version_status option; [@ocaml.doc "The status of the detector version.\n"]
  last_updated_time : time option;
      [@ocaml.doc "The timestamp when the detector version was last updated. \n"]
  created_time : time option; [@ocaml.doc "The timestamp when the detector version was created. \n"]
  rule_execution_mode : rule_execution_mode option;
      [@ocaml.doc
        "The execution mode of the rule in the dectector\n\n\
        \  [FIRST_MATCHED] indicates that Amazon Fraud Detector evaluates rules sequentially, \
         first to last, stopping at the first matched rule. Amazon Fraud dectector then provides \
         the outcomes for that single rule.\n\
        \ \n\
        \   [ALL_MATCHED] indicates that Amazon Fraud Detector evaluates all rules and returns the \
         outcomes for all matched rules. You can define and edit the rule mode at the detector \
         version level, when it is in draft status.\n\
        \  "]
  arn : fraud_detector_arn option; [@ocaml.doc "The detector version ARN.\n"]
}
[@@ocaml.doc ""]

type nonrec get_detector_version_request = {
  detector_id : identifier; [@ocaml.doc "The detector ID.\n"]
  detector_version_id : whole_number_version_string; [@ocaml.doc "The detector version ID.\n"]
}
[@@ocaml.doc ""]

type nonrec detector = {
  detector_id : identifier option; [@ocaml.doc "The detector ID.\n"]
  description : description option; [@ocaml.doc "The detector description.\n"]
  event_type_name : identifier option; [@ocaml.doc "The name of the event type.\n"]
  last_updated_time : time option; [@ocaml.doc "Timestamp of when the detector was last updated.\n"]
  created_time : time option; [@ocaml.doc "Timestamp of when the detector was created.\n"]
  arn : fraud_detector_arn option; [@ocaml.doc "The detector ARN.\n"]
}
[@@ocaml.doc "The detector.\n"]

type nonrec detector_list = detector list [@@ocaml.doc ""]

type nonrec get_detectors_result = {
  detectors : detector_list option; [@ocaml.doc "The detectors.\n"]
  next_token : string_ option; [@ocaml.doc "The next page token.\n"]
}
[@@ocaml.doc ""]

type nonrec detectors_max_results = int [@@ocaml.doc ""]

type nonrec get_detectors_request = {
  detector_id : identifier option; [@ocaml.doc "The detector ID.\n"]
  next_token : string_ option; [@ocaml.doc "The next token for the subsequent request.\n"]
  max_results : detectors_max_results option;
      [@ocaml.doc "The maximum number of objects to return for the request.\n"]
}
[@@ocaml.doc ""]

type nonrec async_job_status =
  | IN_PROGRESS_INITIALIZING [@ocaml.doc ""]
  | IN_PROGRESS [@ocaml.doc ""]
  | CANCEL_IN_PROGRESS [@ocaml.doc ""]
  | CANCELED [@ocaml.doc ""]
  | COMPLETE [@ocaml.doc ""]
  | FAILED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec get_delete_events_by_event_type_status_result = {
  event_type_name : identifier option; [@ocaml.doc "The event type name.\n"]
  events_deletion_status : async_job_status option; [@ocaml.doc "The deletion status.\n"]
}
[@@ocaml.doc ""]

type nonrec get_delete_events_by_event_type_status_request = {
  event_type_name : identifier;
      [@ocaml.doc "Name of event type for which to get the deletion status.\n"]
}
[@@ocaml.doc ""]

type nonrec integer = int [@@ocaml.doc ""]

type nonrec batch_prediction = {
  job_id : identifier option; [@ocaml.doc "The job ID for the batch prediction.\n"]
  status : async_job_status option; [@ocaml.doc "The batch prediction status.\n"]
  failure_reason : string_ option; [@ocaml.doc "The reason a batch prediction job failed.\n"]
  start_time : time option; [@ocaml.doc "Timestamp of when the batch prediction job started.\n"]
  completion_time : time option;
      [@ocaml.doc "Timestamp of when the batch prediction job completed.\n"]
  last_heartbeat_time : time option;
      [@ocaml.doc
        "Timestamp of most recent heartbeat indicating the batch prediction job was making progress.\n"]
  input_path : s3_bucket_location option;
      [@ocaml.doc "The Amazon S3 location of your training file.\n"]
  output_path : s3_bucket_location option;
      [@ocaml.doc "The Amazon S3 location of your output file.\n"]
  event_type_name : identifier option; [@ocaml.doc "The name of the event type.\n"]
  detector_name : identifier option; [@ocaml.doc "The name of the detector.\n"]
  detector_version : float_version_string option; [@ocaml.doc "The detector version. \n"]
  iam_role_arn : iam_role_arn option;
      [@ocaml.doc "The ARN of the IAM role to use for this job request.\n"]
  arn : fraud_detector_arn option; [@ocaml.doc "The ARN of batch prediction job.\n"]
  processed_records_count : integer option;
      [@ocaml.doc "The number of records processed by the batch prediction job.\n"]
  total_records_count : integer option;
      [@ocaml.doc "The total number of records in the batch prediction job.\n"]
}
[@@ocaml.doc "The batch prediction details.\n"]

type nonrec batch_prediction_list = batch_prediction list [@@ocaml.doc ""]

type nonrec get_batch_prediction_jobs_result = {
  batch_predictions : batch_prediction_list option;
      [@ocaml.doc "An array containing the details of each batch prediction job.\n"]
  next_token : string_ option; [@ocaml.doc "The next token for the subsequent request.\n"]
}
[@@ocaml.doc ""]

type nonrec batch_predictions_max_page_size = int [@@ocaml.doc ""]

type nonrec get_batch_prediction_jobs_request = {
  job_id : identifier option;
      [@ocaml.doc "The batch prediction job for which to get the details.\n"]
  max_results : batch_predictions_max_page_size option;
      [@ocaml.doc "The maximum number of objects to return for the request.\n"]
  next_token : string_ option; [@ocaml.doc "The next token from the previous request.\n"]
}
[@@ocaml.doc ""]

type nonrec batch_import = {
  job_id : identifier option; [@ocaml.doc "The ID of the batch import job. \n"]
  status : async_job_status option; [@ocaml.doc "The status of the batch import job.\n"]
  failure_reason : string_ option; [@ocaml.doc "The reason batch import job failed.\n"]
  start_time : time option; [@ocaml.doc "Timestamp of when the batch import job started.\n"]
  completion_time : time option; [@ocaml.doc "Timestamp of when batch import job completed.\n"]
  input_path : s3_bucket_location option;
      [@ocaml.doc "The Amazon S3 location of your data file for batch import.\n"]
  output_path : s3_bucket_location option;
      [@ocaml.doc "The Amazon S3 location of your output file.\n"]
  event_type_name : identifier option; [@ocaml.doc "The name of the event type.\n"]
  iam_role_arn : iam_role_arn option;
      [@ocaml.doc "The ARN of the IAM role to use for this job request.\n"]
  arn : fraud_detector_arn option; [@ocaml.doc "The ARN of the batch import job.\n"]
  processed_records_count : integer option;
      [@ocaml.doc "The number of records processed by batch import job.\n"]
  failed_records_count : integer option;
      [@ocaml.doc "The number of records that failed to import. \n"]
  total_records_count : integer option;
      [@ocaml.doc "The total number of records in the batch import job.\n"]
}
[@@ocaml.doc "The batch import job details.\n"]

type nonrec batch_import_list = batch_import list [@@ocaml.doc ""]

type nonrec get_batch_import_jobs_result = {
  batch_imports : batch_import_list option;
      [@ocaml.doc "An array containing the details of each batch import job.\n"]
  next_token : string_ option; [@ocaml.doc "The next token for the subsequent resquest.\n"]
}
[@@ocaml.doc ""]

type nonrec batch_imports_max_page_size = int [@@ocaml.doc ""]

type nonrec get_batch_import_jobs_request = {
  job_id : identifier option; [@ocaml.doc "The ID of the batch import job to get.\n"]
  max_results : batch_imports_max_page_size option;
      [@ocaml.doc "The maximum number of objects to return for request.\n"]
  next_token : string_ option; [@ocaml.doc "The next token from the previous request.\n"]
}
[@@ocaml.doc ""]

type nonrec aggregated_log_odds_metric = {
  variable_names : list_of_strings; [@ocaml.doc " The names of all the variables. \n"]
  aggregated_variables_importance : float_;
      [@ocaml.doc
        " The relative importance of the variables in the list to the other event variable. \n"]
}
[@@ocaml.doc
  "The log odds metric details.\n\n\
  \ Account Takeover Insights (ATI) model uses event variables from the login data you provide to \
   continuously calculate a set of variables (aggregated variables) based on historical events. \
   For example, your ATI model might calculate the number of times an user has logged in using the \
   same IP address. In this case, event variables used to derive the aggregated variables are [IP \
   address] and [user].\n\
  \ "]

type nonrec list_of_aggregated_log_odds_metrics = aggregated_log_odds_metric list [@@ocaml.doc ""]

type nonrec aggregated_variables_importance_metrics = {
  log_odds_metrics : list_of_aggregated_log_odds_metrics option;
      [@ocaml.doc " List of variables' metrics. \n"]
}
[@@ocaml.doc
  "The details of the relative importance of the aggregated variables.\n\n\
  \ Account Takeover Insights (ATI) model uses event variables from the login data you provide to \
   continuously calculate a set of variables (aggregated variables) based on historical events. \
   For example, your ATI model might calculate the number of times an user has logged in using the \
   same IP address. In this case, event variables used to derive the aggregated variables are [IP \
   address] and [user].\n\
  \ "]

type nonrec log_odds_metric = {
  variable_name : string_; [@ocaml.doc "The name of the variable.\n"]
  variable_type : string_; [@ocaml.doc "The type of variable.\n"]
  variable_importance : float_;
      [@ocaml.doc
        "The relative importance of the variable. For more information, see \
         {{:https://docs.aws.amazon.com/frauddetector/latest/ug/model-variable-importance.html}Model \
         variable importance}.\n"]
}
[@@ocaml.doc "The log odds metric details.\n"]

type nonrec list_of_log_odds_metrics = log_odds_metric list [@@ocaml.doc ""]

type nonrec variable_importance_metrics = {
  log_odds_metrics : list_of_log_odds_metrics option; [@ocaml.doc "List of variable metrics.\n"]
}
[@@ocaml.doc "The variable importance metrics details.\n"]

type nonrec uncertainty_range = {
  lower_bound_value : float_;
      [@ocaml.doc " The lower bound value of the area under curve (auc). \n"]
  upper_bound_value : float_; [@ocaml.doc " The upper bound value of the area under curve (auc). \n"]
}
[@@ocaml.doc
  " Range of area under curve (auc) expected from the model. A range greater than 0.1 indicates \
   higher model uncertainity. A range is the difference between upper and lower bound of auc. \n"]

type nonrec tfi_model_performance = {
  auc : float_ option;
      [@ocaml.doc
        " The area under the curve (auc). This summarizes the total positive rate (tpr) and false \
         positive rate (FPR) across all possible model score thresholds. \n"]
  uncertainty_range : uncertainty_range option;
      [@ocaml.doc
        " Indicates the range of area under curve (auc) expected from the TFI model. A range \
         greater than 0.1 indicates higher model uncertainity. \n"]
}
[@@ocaml.doc " The Transaction Fraud Insights (TFI) model performance score. \n"]

type nonrec tfi_metric_data_point = {
  fpr : float_ option;
      [@ocaml.doc
        " The false positive rate. This is the percentage of total legitimate events that are \
         incorrectly predicted as fraud. \n"]
  precision : float_ option;
      [@ocaml.doc
        " The percentage of fraud events correctly predicted as fraudulent as compared to all \
         events predicted as fraudulent. \n"]
  tpr : float_ option;
      [@ocaml.doc
        " The true positive rate. This is the percentage of total fraud the model detects. Also \
         known as capture rate. \n"]
  threshold : float_ option;
      [@ocaml.doc
        " The model threshold that specifies an acceptable fraud capture rate. For example, a \
         threshold of 500 means any model score 500 or above is labeled as fraud. \n"]
}
[@@ocaml.doc " The performance metrics data points for Transaction Fraud Insights (TFI) model. \n"]

type nonrec tfi_metric_data_points_list = tfi_metric_data_point list [@@ocaml.doc ""]

type nonrec tfi_training_metrics_value = {
  metric_data_points : tfi_metric_data_points_list option;
      [@ocaml.doc " The model's performance metrics data points. \n"]
  model_performance : tfi_model_performance option; [@ocaml.doc " The model performance score. \n"]
}
[@@ocaml.doc " The Transaction Fraud Insights (TFI) model training metric details. \n"]

type nonrec ofi_model_performance = {
  auc : float_ option;
      [@ocaml.doc
        " The area under the curve (auc). This summarizes the total positive rate (tpr) and false \
         positive rate (FPR) across all possible model score thresholds. \n"]
  uncertainty_range : uncertainty_range option;
      [@ocaml.doc
        " Indicates the range of area under curve (auc) expected from the OFI model. A range \
         greater than 0.1 indicates higher model uncertainity. \n"]
}
[@@ocaml.doc " The Online Fraud Insights (OFI) model performance score. \n"]

type nonrec ofi_metric_data_point = {
  fpr : float_ option;
      [@ocaml.doc
        " The false positive rate. This is the percentage of total legitimate events that are \
         incorrectly predicted as fraud. \n"]
  precision : float_ option;
      [@ocaml.doc
        " The percentage of fraud events correctly predicted as fraudulent as compared to all \
         events predicted as fraudulent. \n"]
  tpr : float_ option;
      [@ocaml.doc
        " The true positive rate. This is the percentage of total fraud the model detects. Also \
         known as capture rate. \n"]
  threshold : float_ option;
      [@ocaml.doc
        " The model threshold that specifies an acceptable fraud capture rate. For example, a \
         threshold of 500 means any model score 500 or above is labeled as fraud. \n"]
}
[@@ocaml.doc " The Online Fraud Insights (OFI) model performance metrics data points. \n"]

type nonrec ofi_metric_data_points_list = ofi_metric_data_point list [@@ocaml.doc ""]

type nonrec ofi_training_metrics_value = {
  metric_data_points : ofi_metric_data_points_list option;
      [@ocaml.doc " The model's performance metrics data points. \n"]
  model_performance : ofi_model_performance option;
      [@ocaml.doc " The model's overall performance score. \n"]
}
[@@ocaml.doc " The Online Fraud Insights (OFI) model training metric details. \n"]

type nonrec training_metrics_v2 = {
  ofi : ofi_training_metrics_value option;
      [@ocaml.doc " The Online Fraud Insights (OFI) model training metric details. \n"]
  tfi : tfi_training_metrics_value option;
      [@ocaml.doc " The Transaction Fraud Insights (TFI) model training metric details. \n"]
  ati : ati_training_metrics_value option;
      [@ocaml.doc " The Account Takeover Insights (ATI) model training metric details. \n"]
}
[@@ocaml.doc " The training metrics details. \n"]

type nonrec field_validation_message = {
  field_name : string_ option; [@ocaml.doc "The field name.\n"]
  identifier : string_ option; [@ocaml.doc "The message ID.\n"]
  title : string_ option; [@ocaml.doc "The message title.\n"]
  content : string_ option; [@ocaml.doc "The message content.\n"]
  type_ : string_ option; [@ocaml.doc "The message type.\n"]
}
[@@ocaml.doc "The message details.\n"]

type nonrec field_validation_message_list = field_validation_message list [@@ocaml.doc ""]

type nonrec file_validation_message = {
  title : string_ option; [@ocaml.doc "The message title.\n"]
  content : string_ option; [@ocaml.doc "The message content.\n"]
  type_ : string_ option; [@ocaml.doc "The message type.\n"]
}
[@@ocaml.doc "The message details.\n"]

type nonrec file_validation_message_list = file_validation_message list [@@ocaml.doc ""]

type nonrec data_validation_metrics = {
  file_level_messages : file_validation_message_list option;
      [@ocaml.doc "The file-specific model training data validation messages.\n"]
  field_level_messages : field_validation_message_list option;
      [@ocaml.doc "The field-specific model training validation messages.\n"]
}
[@@ocaml.doc "The model training data validation metrics.\n"]

type nonrec training_result_v2 = {
  data_validation_metrics : data_validation_metrics option; [@ocaml.doc ""]
  training_metrics_v2 : training_metrics_v2 option; [@ocaml.doc " The training metric details. \n"]
  variable_importance_metrics : variable_importance_metrics option; [@ocaml.doc ""]
  aggregated_variables_importance_metrics : aggregated_variables_importance_metrics option;
      [@ocaml.doc
        " The variable importance metrics of the aggregated variables. \n\n\
        \ Account Takeover Insights (ATI) model uses event variables from the login data you \
         provide to continuously calculate a set of variables (aggregated variables) based on \
         historical events. For example, your ATI model might calculate the number of times an \
         user has logged in using the same IP address. In this case, event variables used to \
         derive the aggregated variables are [IP address] and [user].\n\
        \ "]
}
[@@ocaml.doc " The training result details. \n"]

type nonrec metric_data_point = {
  fpr : float_ option;
      [@ocaml.doc
        "The false positive rate. This is the percentage of total legitimate events that are \
         incorrectly predicted as fraud.\n"]
  precision : float_ option;
      [@ocaml.doc
        "The percentage of fraud events correctly predicted as fraudulent as compared to all \
         events predicted as fraudulent.\n"]
  tpr : float_ option;
      [@ocaml.doc
        "The true positive rate. This is the percentage of total fraud the model detects. Also \
         known as capture rate.\n"]
  threshold : float_ option;
      [@ocaml.doc
        "The model threshold that specifies an acceptable fraud capture rate. For example, a \
         threshold of 500 means any model score 500 or above is labeled as fraud.\n"]
}
[@@ocaml.doc "Model performance metrics data points.\n"]

type nonrec metric_data_points_list = metric_data_point list [@@ocaml.doc ""]

type nonrec training_metrics = {
  auc : float_ option;
      [@ocaml.doc
        "The area under the curve. This summarizes true positive rate (TPR) and false positive \
         rate (FPR) across all possible model score thresholds. A model with no predictive power \
         has an AUC of 0.5, whereas a perfect model has a score of 1.0.\n"]
  metric_data_points : metric_data_points_list option; [@ocaml.doc "The data points details.\n"]
}
[@@ocaml.doc "The training metric details.\n"]

type nonrec training_result = {
  data_validation_metrics : data_validation_metrics option; [@ocaml.doc "The validation metrics.\n"]
  training_metrics : training_metrics option; [@ocaml.doc "The training metric details.\n"]
  variable_importance_metrics : variable_importance_metrics option;
      [@ocaml.doc "The variable importance metrics.\n"]
}
[@@ocaml.doc "The training result details.\n"]

type nonrec model_version_detail = {
  model_id : model_identifier option; [@ocaml.doc "The model ID.\n"]
  model_type : model_type_enum option; [@ocaml.doc "The model type.\n"]
  model_version_number : float_version_string option; [@ocaml.doc "The model version number.\n"]
  status : string_ option; [@ocaml.doc "The status of the model version.\n"]
  training_data_source : training_data_source_enum option;
      [@ocaml.doc "The model version training data source.\n"]
  training_data_schema : training_data_schema option; [@ocaml.doc "The training data schema.\n"]
  external_events_detail : external_events_detail option;
      [@ocaml.doc
        "The external events data details. This will be populated if the [trainingDataSource] for \
         the model version is specified as [EXTERNAL_EVENTS].\n"]
  ingested_events_detail : ingested_events_detail option;
      [@ocaml.doc
        "The ingested events data details. This will be populated if the [trainingDataSource] for \
         the model version is specified as [INGESTED_EVENTS].\n"]
  training_result : training_result option; [@ocaml.doc "The training results.\n"]
  last_updated_time : time option; [@ocaml.doc "The timestamp when the model was last updated.\n"]
  created_time : time option; [@ocaml.doc "The timestamp when the model was created.\n"]
  arn : fraud_detector_arn option; [@ocaml.doc "The model version ARN.\n"]
  training_result_v2 : training_result_v2 option;
      [@ocaml.doc
        " The training result details. The details include the relative importance of the \
         variables. \n"]
}
[@@ocaml.doc "The details of the model version.\n"]

type nonrec model_version_detail_list = model_version_detail list [@@ocaml.doc ""]

type nonrec describe_model_versions_result = {
  model_version_details : model_version_detail_list option;
      [@ocaml.doc "The model version details.\n"]
  next_token : string_ option; [@ocaml.doc "The next token.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_model_versions_request = {
  model_id : model_identifier option; [@ocaml.doc "The model ID.\n"]
  model_version_number : float_version_string option; [@ocaml.doc "The model version number.\n"]
  model_type : model_type_enum option; [@ocaml.doc "The model type.\n"]
  next_token : string_ option; [@ocaml.doc "The next token from the previous results.\n"]
  max_results : models_max_page_size option;
      [@ocaml.doc "The maximum number of results to return.\n"]
}
[@@ocaml.doc ""]

type nonrec detector_version_summary = {
  detector_version_id : whole_number_version_string option;
      [@ocaml.doc "The detector version ID. \n"]
  status : detector_version_status option; [@ocaml.doc "The detector version status. \n"]
  description : description option; [@ocaml.doc "The detector version description. \n"]
  last_updated_time : time option;
      [@ocaml.doc "Timestamp of when the detector version was last updated.\n"]
}
[@@ocaml.doc "The summary of the detector version.\n"]

type nonrec detector_version_summary_list = detector_version_summary list [@@ocaml.doc ""]

type nonrec describe_detector_result = {
  detector_id : identifier option; [@ocaml.doc "The detector ID.\n"]
  detector_version_summaries : detector_version_summary_list option;
      [@ocaml.doc "The status and description for each detector version.\n"]
  next_token : string_ option; [@ocaml.doc "The next token to be used for subsequent requests.\n"]
  arn : fraud_detector_arn option; [@ocaml.doc "The detector ARN.\n"]
}
[@@ocaml.doc ""]

type nonrec detector_version_max_results = int [@@ocaml.doc ""]

type nonrec describe_detector_request = {
  detector_id : identifier; [@ocaml.doc "The detector ID.\n"]
  next_token : string_ option; [@ocaml.doc "The next token from the previous response.\n"]
  max_results : detector_version_max_results option;
      [@ocaml.doc "The maximum number of results to return for the request.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_variable_result = unit [@@ocaml.doc ""]

type nonrec delete_variable_request = {
  name : string_; [@ocaml.doc "The name of the variable to delete.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_rule_result = unit [@@ocaml.doc ""]

type nonrec delete_rule_request = { rule : rule [@ocaml.doc ""] } [@@ocaml.doc ""]

type nonrec delete_outcome_result = unit [@@ocaml.doc ""]

type nonrec delete_outcome_request = {
  name : identifier; [@ocaml.doc "The name of the outcome to delete.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_model_version_result = unit [@@ocaml.doc ""]

type nonrec delete_model_version_request = {
  model_id : model_identifier; [@ocaml.doc "The model ID of the model version to delete.\n"]
  model_type : model_type_enum; [@ocaml.doc "The model type of the model version to delete.\n"]
  model_version_number : float_version_string;
      [@ocaml.doc "The model version number of the model version to delete.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_model_result = unit [@@ocaml.doc ""]

type nonrec delete_model_request = {
  model_id : model_identifier; [@ocaml.doc "The model ID of the model to delete.\n"]
  model_type : model_type_enum; [@ocaml.doc "The model type of the model to delete.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_list_result = unit [@@ocaml.doc ""]

type nonrec delete_list_request = {
  name : no_dash_identifier; [@ocaml.doc " The name of the list to delete. \n"]
}
[@@ocaml.doc ""]

type nonrec delete_label_result = unit [@@ocaml.doc ""]

type nonrec delete_label_request = {
  name : identifier; [@ocaml.doc "The name of the label to delete.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_external_model_result = unit [@@ocaml.doc ""]

type nonrec delete_external_model_request = {
  model_endpoint : sage_maker_endpoint_identifier;
      [@ocaml.doc "The endpoint of the Amazon Sagemaker model to delete.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_event_type_result = unit [@@ocaml.doc ""]

type nonrec delete_event_type_request = {
  name : identifier; [@ocaml.doc "The name of the event type to delete.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_events_by_event_type_result = {
  event_type_name : identifier option;
      [@ocaml.doc "Name of event type for which to delete the events.\n"]
  events_deletion_status : string_ option; [@ocaml.doc "The status of the delete request.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_events_by_event_type_request = {
  event_type_name : identifier; [@ocaml.doc "The name of the event type.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_event_result = unit [@@ocaml.doc ""]

type nonrec delete_audit_history = bool [@@ocaml.doc ""]

type nonrec delete_event_request = {
  event_id : identifier; [@ocaml.doc "The ID of the event to delete.\n"]
  event_type_name : identifier; [@ocaml.doc "The name of the event type.\n"]
  delete_audit_history : delete_audit_history option;
      [@ocaml.doc
        "Specifies whether or not to delete any predictions associated with the event. If set to \
         [True], \n"]
}
[@@ocaml.doc ""]

type nonrec delete_entity_type_result = unit [@@ocaml.doc ""]

type nonrec delete_entity_type_request = {
  name : identifier; [@ocaml.doc "The name of the entity type to delete.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_detector_version_result = unit [@@ocaml.doc ""]

type nonrec delete_detector_version_request = {
  detector_id : identifier;
      [@ocaml.doc "The ID of the parent detector for the detector version to delete.\n"]
  detector_version_id : whole_number_version_string;
      [@ocaml.doc "The ID of the detector version to delete.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_detector_result = unit [@@ocaml.doc ""]

type nonrec delete_detector_request = {
  detector_id : identifier; [@ocaml.doc "The ID of the detector to delete.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_batch_prediction_job_result = unit [@@ocaml.doc ""]

type nonrec delete_batch_prediction_job_request = {
  job_id : identifier; [@ocaml.doc "The ID of the batch prediction job to delete.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_batch_import_job_result = unit [@@ocaml.doc ""]

type nonrec delete_batch_import_job_request = {
  job_id : identifier; [@ocaml.doc "The ID of the batch import job to delete. \n"]
}
[@@ocaml.doc ""]

type nonrec create_variable_result = unit [@@ocaml.doc ""]

type nonrec create_variable_request = {
  name : string_; [@ocaml.doc "The name of the variable.\n"]
  data_type : data_type; [@ocaml.doc "The data type of the variable.\n"]
  data_source : data_source; [@ocaml.doc "The source of the data.\n"]
  default_value : string_;
      [@ocaml.doc "The default value for the variable when no value is received.\n"]
  description : string_ option; [@ocaml.doc "The description.\n"]
  variable_type : string_ option;
      [@ocaml.doc
        "The variable type. For more information see \
         {{:https://docs.aws.amazon.com/frauddetector/latest/ug/create-a-variable.html#variable-types}Variable \
         types}. \n\n\
        \ Valid Values: [AUTH_CODE | AVS | BILLING_ADDRESS_L1 | BILLING_ADDRESS_L2 | BILLING_CITY \
         | BILLING_COUNTRY | BILLING_NAME | BILLING_PHONE | BILLING_STATE | BILLING_ZIP | CARD_BIN \
         | CATEGORICAL | CURRENCY_CODE | EMAIL_ADDRESS | FINGERPRINT | FRAUD_LABEL | \
         FREE_FORM_TEXT | IP_ADDRESS | NUMERIC | ORDER_ID | PAYMENT_TYPE | PHONE_NUMBER | PRICE | \
         PRODUCT_CATEGORY | SHIPPING_ADDRESS_L1 | SHIPPING_ADDRESS_L2 | SHIPPING_CITY | \
         SHIPPING_COUNTRY | SHIPPING_NAME | SHIPPING_PHONE | SHIPPING_STATE | SHIPPING_ZIP | \
         USERAGENT] \n\
        \ "]
  tags : tag_list option; [@ocaml.doc "A collection of key and value pairs.\n"]
}
[@@ocaml.doc ""]

type nonrec create_rule_result = { rule : rule option [@ocaml.doc "The created rule.\n"] }
[@@ocaml.doc ""]

type nonrec create_rule_request = {
  rule_id : identifier; [@ocaml.doc "The rule ID.\n"]
  detector_id : identifier; [@ocaml.doc "The detector ID for the rule's parent detector.\n"]
  description : description option; [@ocaml.doc "The rule description.\n"]
  expression : rule_expression; [@ocaml.doc "The rule expression.\n"]
  language : language; [@ocaml.doc "The language of the rule.\n"]
  outcomes : non_empty_list_of_strings;
      [@ocaml.doc "The outcome or outcomes returned when the rule expression matches.\n"]
  tags : tag_list option; [@ocaml.doc "A collection of key and value pairs.\n"]
}
[@@ocaml.doc ""]

type nonrec create_model_version_result = {
  model_id : model_identifier option; [@ocaml.doc "The model ID.\n"]
  model_type : model_type_enum option; [@ocaml.doc "The model type.\n"]
  model_version_number : float_version_string option;
      [@ocaml.doc "The model version number of the model version created.\n"]
  status : string_ option; [@ocaml.doc "The model version status. \n"]
}
[@@ocaml.doc ""]

type nonrec create_model_version_request = {
  model_id : model_identifier; [@ocaml.doc "The model ID. \n"]
  model_type : model_type_enum; [@ocaml.doc "The model type.\n"]
  training_data_source : training_data_source_enum;
      [@ocaml.doc "The training data source location in Amazon S3. \n"]
  training_data_schema : training_data_schema; [@ocaml.doc "The training data schema.\n"]
  external_events_detail : external_events_detail option;
      [@ocaml.doc
        "Details of the external events data used for model version training. Required if \
         [trainingDataSource] is [EXTERNAL_EVENTS].\n"]
  ingested_events_detail : ingested_events_detail option;
      [@ocaml.doc
        "Details of the ingested events data used for model version training. Required if \
         [trainingDataSource] is [INGESTED_EVENTS].\n"]
  tags : tag_list option; [@ocaml.doc "A collection of key and value pairs.\n"]
}
[@@ocaml.doc ""]

type nonrec create_model_result = unit [@@ocaml.doc ""]

type nonrec create_model_request = {
  model_id : model_identifier; [@ocaml.doc "The model ID.\n"]
  model_type : model_type_enum; [@ocaml.doc "The model type. \n"]
  description : description option; [@ocaml.doc "The model description. \n"]
  event_type_name : string_; [@ocaml.doc "The name of the event type.\n"]
  tags : tag_list option; [@ocaml.doc "A collection of key and value pairs.\n"]
}
[@@ocaml.doc ""]

type nonrec create_list_result = unit [@@ocaml.doc ""]

type nonrec create_list_request = {
  name : no_dash_identifier; [@ocaml.doc " The name of the list. \n"]
  elements : elements_list option;
      [@ocaml.doc
        " The names of the elements, if providing. You can also create an empty list and add \
         elements later using the \
         {{:https://docs.aws.amazon.com/frauddetector/latest/api/API_Updatelist.html}UpdateList} \
         API. \n"]
  variable_type : variable_type option;
      [@ocaml.doc
        " The variable type of the list. You can only assign the variable type with String data \
         type. For more information, see \
         {{:https://docs.aws.amazon.com/frauddetector/latest/ug/create-a-variable.html#variable-types}Variable \
         types}. \n"]
  description : description option; [@ocaml.doc " The description of the list. \n"]
  tags : tag_list option; [@ocaml.doc " A collection of the key and value pairs. \n"]
}
[@@ocaml.doc ""]

type nonrec create_detector_version_result = {
  detector_id : identifier option;
      [@ocaml.doc "The ID for the created version's parent detector.\n"]
  detector_version_id : whole_number_version_string option;
      [@ocaml.doc "The ID for the created detector. \n"]
  status : detector_version_status option; [@ocaml.doc "The status of the detector version.\n"]
}
[@@ocaml.doc ""]

type nonrec create_detector_version_request = {
  detector_id : identifier;
      [@ocaml.doc "The ID of the detector under which you want to create a new version.\n"]
  description : description option; [@ocaml.doc "The description of the detector version.\n"]
  external_model_endpoints : list_of_strings option;
      [@ocaml.doc "The Amazon Sagemaker model endpoints to include in the detector version.\n"]
  rules : rule_list; [@ocaml.doc "The rules to include in the detector version.\n"]
  model_versions : list_of_model_versions option;
      [@ocaml.doc "The model versions to include in the detector version.\n"]
  rule_execution_mode : rule_execution_mode option;
      [@ocaml.doc
        "The rule execution mode for the rules included in the detector version.\n\n\
        \ You can define and edit the rule mode at the detector version level, when it is in draft \
         status.\n\
        \ \n\
        \  If you specify [FIRST_MATCHED], Amazon Fraud Detector evaluates rules sequentially, \
         first to last, stopping at the first matched rule. Amazon Fraud dectector then provides \
         the outcomes for that single rule.\n\
        \  \n\
        \   If you specifiy [ALL_MATCHED], Amazon Fraud Detector evaluates all rules and returns \
         the outcomes for all matched rules. \n\
        \   \n\
        \    The default behavior is [FIRST_MATCHED].\n\
        \    "]
  tags : tag_list option; [@ocaml.doc "A collection of key and value pairs.\n"]
}
[@@ocaml.doc ""]

type nonrec create_batch_prediction_job_result = unit [@@ocaml.doc ""]

type nonrec create_batch_prediction_job_request = {
  job_id : identifier; [@ocaml.doc "The ID of the batch prediction job.\n"]
  input_path : s3_bucket_location; [@ocaml.doc "The Amazon S3 location of your training file.\n"]
  output_path : s3_bucket_location; [@ocaml.doc "The Amazon S3 location of your output file.\n"]
  event_type_name : identifier; [@ocaml.doc "The name of the event type.\n"]
  detector_name : identifier; [@ocaml.doc "The name of the detector.\n"]
  detector_version : whole_number_version_string option; [@ocaml.doc "The detector version.\n"]
  iam_role_arn : iam_role_arn;
      [@ocaml.doc
        "The ARN of the IAM role to use for this job request.\n\n\
        \ The IAM Role must have read permissions to your input S3 bucket and write permissions to \
         your output S3 bucket. For more information about bucket permissions, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/example-policies-s3.html}User \
         policy examples} in the {i Amazon S3 User Guide}.\n\
        \ "]
  tags : tag_list option; [@ocaml.doc "A collection of key and value pairs.\n"]
}
[@@ocaml.doc ""]

type nonrec create_batch_import_job_result = unit [@@ocaml.doc ""]

type nonrec create_batch_import_job_request = {
  job_id : identifier;
      [@ocaml.doc
        "The ID of the batch import job. The ID cannot be of a past job, unless the job exists in \
         [CREATE_FAILED] state.\n"]
  input_path : s3_bucket_location;
      [@ocaml.doc "The URI that points to the Amazon S3 location of your data file.\n"]
  output_path : s3_bucket_location;
      [@ocaml.doc "The URI that points to the Amazon S3 location for storing your results. \n"]
  event_type_name : identifier; [@ocaml.doc "The name of the event type.\n"]
  iam_role_arn : iam_role_arn;
      [@ocaml.doc
        "The ARN of the IAM role created for Amazon S3 bucket that holds your data file.\n\n\
        \ The IAM role must have read permissions to your input S3 bucket and write permissions to \
         your output S3 bucket. For more information about bucket permissions, see \
         {{:https://docs.aws.amazon.com/AmazonS3/latest/userguide/example-policies-s3.html}User \
         policy examples} in the {i Amazon S3 User Guide}.\n\
        \ "]
  tags : tag_list option;
      [@ocaml.doc "A collection of key-value pairs associated with this request. \n"]
}
[@@ocaml.doc ""]

type nonrec cancel_batch_prediction_job_result = unit [@@ocaml.doc ""]

type nonrec cancel_batch_prediction_job_request = {
  job_id : identifier; [@ocaml.doc "The ID of the batch prediction job to cancel.\n"]
}
[@@ocaml.doc ""]

type nonrec cancel_batch_import_job_result = unit [@@ocaml.doc ""]

type nonrec cancel_batch_import_job_request = {
  job_id : identifier;
      [@ocaml.doc
        " The ID of an in-progress batch import job to cancel. \n\n\
        \ Amazon Fraud Detector will throw an error if the batch import job is in [FAILED], \
         [CANCELED], or [COMPLETED] state.\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec integer2 = int [@@ocaml.doc ""]

type nonrec batch_get_variable_error = {
  name : string_ option; [@ocaml.doc "The error name. \n"]
  code : integer2 option; [@ocaml.doc "The error code. \n"]
  message : string_ option; [@ocaml.doc "The error message.\n"]
}
[@@ocaml.doc "Provides the error of the batch get variable API.\n"]

type nonrec batch_get_variable_error_list = batch_get_variable_error list [@@ocaml.doc ""]

type nonrec batch_get_variable_result = {
  variables : variable_list option; [@ocaml.doc "The returned variables.\n"]
  errors : batch_get_variable_error_list option; [@ocaml.doc "The errors from the request.\n"]
}
[@@ocaml.doc ""]

type nonrec name_list = string_ list [@@ocaml.doc ""]

type nonrec batch_get_variable_request = {
  names : name_list; [@ocaml.doc "The list of variable names to get.\n"]
}
[@@ocaml.doc ""]

type nonrec batch_create_variable_error = {
  name : string_ option; [@ocaml.doc "The name.\n"]
  code : integer2 option; [@ocaml.doc "The error code. \n"]
  message : string_ option; [@ocaml.doc "The error message.\n"]
}
[@@ocaml.doc "Provides the error of the batch create variable API.\n"]

type nonrec batch_create_variable_error_list = batch_create_variable_error list [@@ocaml.doc ""]

type nonrec batch_create_variable_result = {
  errors : batch_create_variable_error_list option;
      [@ocaml.doc "Provides the errors for the [BatchCreateVariable] request.\n"]
}
[@@ocaml.doc ""]

type nonrec variable_entry = {
  name : string_ option; [@ocaml.doc "The name of the variable.\n"]
  data_type : string_ option; [@ocaml.doc "The data type of the variable.\n"]
  data_source : string_ option; [@ocaml.doc "The data source of the variable.\n"]
  default_value : string_ option; [@ocaml.doc "The default value of the variable.\n"]
  description : string_ option; [@ocaml.doc "The description of the variable.\n"]
  variable_type : string_ option;
      [@ocaml.doc
        "The type of the variable. For more information see \
         {{:https://docs.aws.amazon.com/frauddetector/latest/ug/create-a-variable.html#variable-types}Variable \
         types}.\n\n\
        \ Valid Values: [AUTH_CODE | AVS | BILLING_ADDRESS_L1 | BILLING_ADDRESS_L2 | BILLING_CITY \
         | BILLING_COUNTRY | BILLING_NAME | BILLING_PHONE | BILLING_STATE | BILLING_ZIP | CARD_BIN \
         | CATEGORICAL | CURRENCY_CODE | EMAIL_ADDRESS | FINGERPRINT | FRAUD_LABEL | \
         FREE_FORM_TEXT | IP_ADDRESS | NUMERIC | ORDER_ID | PAYMENT_TYPE | PHONE_NUMBER | PRICE | \
         PRODUCT_CATEGORY | SHIPPING_ADDRESS_L1 | SHIPPING_ADDRESS_L2 | SHIPPING_CITY | \
         SHIPPING_COUNTRY | SHIPPING_NAME | SHIPPING_PHONE | SHIPPING_STATE | SHIPPING_ZIP | \
         USERAGENT ] \n\
        \ "]
}
[@@ocaml.doc "A variable in the list of variables for the batch create variable request.\n"]

type nonrec variable_entry_list = variable_entry list [@@ocaml.doc ""]

type nonrec batch_create_variable_request = {
  variable_entries : variable_entry_list;
      [@ocaml.doc "The list of variables for the batch create variable request.\n"]
  tags : tag_list option; [@ocaml.doc "A collection of key and value pairs.\n"]
}
[@@ocaml.doc ""]
