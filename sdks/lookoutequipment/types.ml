type nonrec bounded_length_string = string [@@ocaml.doc ""]

type nonrec validation_exception = { message : bounded_length_string [@ocaml.doc ""] }
[@@ocaml.doc
  " The input fails to satisfy constraints specified by Amazon Lookout for Equipment or a related \
   Amazon Web Services service that's being utilized. \n"]

type nonrec model_name = string [@@ocaml.doc ""]

type nonrec timestamp = Smaws_Lib.CoreTypes.Timestamp.t [@@ocaml.doc ""]

type nonrec retraining_frequency = string [@@ocaml.doc ""]

type nonrec lookback_window = string [@@ocaml.doc ""]

type nonrec model_promote_mode = MANUAL [@ocaml.doc ""] | MANAGED [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec update_retraining_scheduler_request = {
  promote_mode : model_promote_mode option;
      [@ocaml.doc
        "Indicates how the service will use new models. In [MANAGED] mode, new models will \
         automatically be used for inference if they have better performance than the current \
         model. In [MANUAL] mode, the new models will not be used \
         {{:https://docs.aws.amazon.com/lookout-for-equipment/latest/ug/versioning-model.html#model-activation}until \
         they are manually activated}.\n"]
  lookback_window : lookback_window option;
      [@ocaml.doc "The number of past days of data that will be used for retraining.\n"]
  retraining_frequency : retraining_frequency option;
      [@ocaml.doc
        "This parameter uses the {{:https://en.wikipedia.org/wiki/ISO_8601#Durations}ISO 8601} \
         standard to set the frequency at which you want retraining to occur in terms of Years, \
         Months, and/or Days (note: other parameters like Time are not currently supported). The \
         minimum value is 30 days (P30D) and the maximum value is 1 year (P1Y). For example, the \
         following values are valid:\n\n\
        \ {ul\n\
        \       {-  P3M15D \226\128\147 Every 3 months and 15 days\n\
        \           \n\
        \            }\n\
        \       {-  P2M \226\128\147 Every 2 months\n\
        \           \n\
        \            }\n\
        \       {-  P150D \226\128\147 Every 150 days\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  retraining_start_date : timestamp option;
      [@ocaml.doc
        "The start date for the retraining scheduler. Lookout for Equipment truncates the time you \
         provide to the nearest UTC day.\n"]
  model_name : model_name;
      [@ocaml.doc "The name of the model whose retraining scheduler you want to update. \n"]
}
[@@ocaml.doc ""]

type nonrec throttling_exception = { message : bounded_length_string [@ocaml.doc ""] }
[@@ocaml.doc "The request was denied due to request throttling.\n"]

type nonrec resource_not_found_exception = { message : bounded_length_string [@ocaml.doc ""] }
[@@ocaml.doc
  " The resource requested could not be found. Verify the resource ID and retry your request. \n"]

type nonrec internal_server_exception = { message : bounded_length_string [@ocaml.doc ""] }
[@@ocaml.doc
  " Processing of the request has failed because of an unknown error, exception or failure. \n"]

type nonrec conflict_exception = { message : bounded_length_string [@ocaml.doc ""] }
[@@ocaml.doc
  " The request could not be completed due to a conflict with the current state of the target \
   resource. \n"]

type nonrec access_denied_exception = { message : bounded_length_string [@ocaml.doc ""] }
[@@ocaml.doc
  "The request could not be completed because you do not have access to the resource. \n"]

type nonrec s3_bucket = string [@@ocaml.doc ""]

type nonrec s3_prefix = string [@@ocaml.doc ""]

type nonrec labels_s3_input_configuration = {
  prefix : s3_prefix option;
      [@ocaml.doc " The prefix for the S3 bucket used for the label data. \n"]
  bucket : s3_bucket; [@ocaml.doc "The name of the S3 bucket holding the label data. \n"]
}
[@@ocaml.doc
  "The location information (prefix and bucket name) for the s3 location being used for label data. \n"]

type nonrec label_group_name = string [@@ocaml.doc ""]

type nonrec labels_input_configuration = {
  label_group_name : label_group_name option;
      [@ocaml.doc " The name of the label group to be used for label data. \n"]
  s3_input_configuration : labels_s3_input_configuration option;
      [@ocaml.doc "Contains location information for the S3 location being used for label data. \n"]
}
[@@ocaml.doc
  "Contains the configuration information for the S3 location being used to hold label data. \n"]

type nonrec iam_role_arn = string [@@ocaml.doc ""]

type nonrec model_diagnostics_s3_output_configuration = {
  prefix : s3_prefix option;
      [@ocaml.doc
        "The Amazon S3 prefix for the location of the pointwise model diagnostics. The prefix \
         specifies the folder and evaluation result file name. ([bucket]).\n\n\
        \ When you call [CreateModel] or [UpdateModel], specify the path within the bucket that \
         you want Lookout for Equipment to save the model to. During training, Lookout for \
         Equipment creates the model evaluation model as a compressed JSON file with the name \
         [model_diagnostics_results.json.gz].\n\
        \ \n\
        \  When you call [DescribeModel] or [DescribeModelVersion], [prefix] contains the file \
         path and filename of the model evaluation file. \n\
        \  "]
  bucket : s3_bucket;
      [@ocaml.doc
        "The name of the Amazon S3 bucket where the pointwise model diagnostics are located. You \
         must be the owner of the Amazon S3 bucket. \n"]
}
[@@ocaml.doc
  "The Amazon S3 location for the pointwise model diagnostics for an Amazon Lookout for Equipment \
   model. \n"]

type nonrec name_or_arn = string [@@ocaml.doc ""]

type nonrec model_diagnostics_output_configuration = {
  kms_key_id : name_or_arn option;
      [@ocaml.doc
        "The Amazon Web Services Key Management Service (KMS) key identifier to encrypt the \
         pointwise model diagnostics files.\n"]
  s3_output_configuration : model_diagnostics_s3_output_configuration;
      [@ocaml.doc "The Amazon S3 location for the pointwise model diagnostics. \n"]
}
[@@ocaml.doc
  "Output configuration information for the pointwise model diagnostics for an Amazon Lookout for \
   Equipment model.\n"]

type nonrec update_model_request = {
  model_diagnostics_output_configuration : model_diagnostics_output_configuration option;
      [@ocaml.doc
        "The Amazon S3 location where you want Amazon Lookout for Equipment to save the pointwise \
         model diagnostics for the model. You must also specify the [RoleArn] request parameter.\n"]
  role_arn : iam_role_arn option; [@ocaml.doc "The ARN of the model to update.\n"]
  labels_input_configuration : labels_input_configuration option; [@ocaml.doc ""]
  model_name : model_name; [@ocaml.doc "The name of the model to update.\n"]
}
[@@ocaml.doc ""]

type nonrec fault_code = string [@@ocaml.doc ""]

type nonrec fault_codes = fault_code list [@@ocaml.doc ""]

type nonrec update_label_group_request = {
  fault_codes : fault_codes option;
      [@ocaml.doc
        " Updates the code indicating the type of anomaly associated with the label. \n\n\
        \ Data in this field will be retained for service usage. Follow best practices for the \
         security of your data.\n\
        \ "]
  label_group_name : label_group_name; [@ocaml.doc " The name of the label group to be updated. \n"]
}
[@@ocaml.doc ""]

type nonrec inference_scheduler_identifier = string [@@ocaml.doc ""]

type nonrec data_delay_offset_in_minutes = Smaws_Lib.CoreTypes.Int64.t [@@ocaml.doc ""]

type nonrec data_upload_frequency =
  | PT1H [@ocaml.doc ""]
  | PT30M [@ocaml.doc ""]
  | PT15M [@ocaml.doc ""]
  | PT10M [@ocaml.doc ""]
  | PT5M [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec inference_s3_input_configuration = {
  prefix : s3_prefix option;
      [@ocaml.doc "The prefix for the S3 bucket used for the input data for the inference. \n"]
  bucket : s3_bucket; [@ocaml.doc "The bucket containing the input dataset for the inference. \n"]
}
[@@ocaml.doc
  " Specifies configuration information for the input data for the inference, including input data \
   S3 location. \n"]

type nonrec time_zone_offset = string [@@ocaml.doc ""]

type nonrec file_name_timestamp_format = string [@@ocaml.doc ""]

type nonrec component_timestamp_delimiter = string [@@ocaml.doc ""]

type nonrec inference_input_name_configuration = {
  component_timestamp_delimiter : component_timestamp_delimiter option;
      [@ocaml.doc "Indicates the delimiter character used between items in the data. \n"]
  timestamp_format : file_name_timestamp_format option;
      [@ocaml.doc
        "The format of the timestamp, whether Epoch time, or standard, with or without hyphens (-). \n"]
}
[@@ocaml.doc
  "Specifies configuration information for the input data for the inference, including timestamp \
   format and delimiter. \n"]

type nonrec inference_input_configuration = {
  inference_input_name_configuration : inference_input_name_configuration option;
      [@ocaml.doc
        "Specifies configuration information for the input data for the inference, including \
         timestamp format and delimiter. \n"]
  input_time_zone_offset : time_zone_offset option;
      [@ocaml.doc
        "Indicates the difference between your time zone and Coordinated Universal Time (UTC).\n"]
  s3_input_configuration : inference_s3_input_configuration option;
      [@ocaml.doc
        " Specifies configuration information for the input data for the inference, including \
         Amazon S3 location of input data.\n"]
}
[@@ocaml.doc
  "Specifies configuration information for the input data for the inference, including Amazon S3 \
   location of input data.. \n"]

type nonrec inference_s3_output_configuration = {
  prefix : s3_prefix option;
      [@ocaml.doc
        " The prefix for the S3 bucket used for the output results from the inference. \n"]
  bucket : s3_bucket; [@ocaml.doc " The bucket containing the output results from the inference \n"]
}
[@@ocaml.doc
  " Specifies configuration information for the output results from the inference, including \
   output S3 location. \n"]

type nonrec inference_output_configuration = {
  kms_key_id : name_or_arn option;
      [@ocaml.doc "The ID number for the KMS key key used to encrypt the inference output. \n"]
  s3_output_configuration : inference_s3_output_configuration;
      [@ocaml.doc
        " Specifies configuration information for the output results from for the inference, \
         output S3 location. \n"]
}
[@@ocaml.doc
  " Specifies configuration information for the output results from for the inference, including \
   KMS key ID and output S3 location. \n"]

type nonrec update_inference_scheduler_request = {
  role_arn : iam_role_arn option;
      [@ocaml.doc
        " The Amazon Resource Name (ARN) of a role with permission to access the data source for \
         the inference scheduler. \n"]
  data_output_configuration : inference_output_configuration option;
      [@ocaml.doc
        " Specifies information for the output results from the inference scheduler, including the \
         output S3 location. \n"]
  data_input_configuration : inference_input_configuration option;
      [@ocaml.doc
        " Specifies information for the input data for the inference scheduler, including \
         delimiter, format, and dataset location. \n"]
  data_upload_frequency : data_upload_frequency option;
      [@ocaml.doc
        "How often data is uploaded to the source S3 bucket for the input data. The value chosen \
         is the length of time between data uploads. For instance, if you select 5 minutes, Amazon \
         Lookout for Equipment will upload the real-time data to the source bucket once every 5 \
         minutes. This frequency also determines how often Amazon Lookout for Equipment starts a \
         scheduled inference on your data. In this example, it starts once every 5 minutes. \n"]
  data_delay_offset_in_minutes : data_delay_offset_in_minutes option;
      [@ocaml.doc
        " A period of time (in minutes) by which inference on the data is delayed after the data \
         starts. For instance, if you select an offset delay time of five minutes, inference will \
         not begin on the data until the first data measurement after the five minute mark. For \
         example, if five minutes is selected, the inference scheduler will wake up at the \
         configured frequency with the additional five minute delay time to check the customer S3 \
         bucket. The customer can upload data at the same frequency and they don't need to stop \
         and restart the scheduler when uploading new data.\n"]
  inference_scheduler_name : inference_scheduler_identifier;
      [@ocaml.doc "The name of the inference scheduler to be updated. \n"]
}
[@@ocaml.doc ""]

type nonrec model_arn = string [@@ocaml.doc ""]

type nonrec model_version = Smaws_Lib.CoreTypes.Int64.t [@@ocaml.doc ""]

type nonrec model_version_arn = string [@@ocaml.doc ""]

type nonrec update_active_model_version_response = {
  previous_active_version_arn : model_version_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the machine learning model version that was the \
         previous active model version.\n"]
  current_active_version_arn : model_version_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the machine learning model version that is the current \
         active model version.\n"]
  previous_active_version : model_version option;
      [@ocaml.doc
        "The previous version that was active of the machine learning model for which the active \
         model version was set.\n"]
  current_active_version : model_version option;
      [@ocaml.doc
        "The version that is currently active of the machine learning model for which the active \
         model version was set.\n"]
  model_arn : model_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the machine learning model for which the active model \
         version was set.\n"]
  model_name : model_name option;
      [@ocaml.doc
        "The name of the machine learning model for which the active model version was set.\n"]
}
[@@ocaml.doc ""]

type nonrec update_active_model_version_request = {
  model_version : model_version;
      [@ocaml.doc
        "The version of the machine learning model for which the active model version is being set.\n"]
  model_name : model_name;
      [@ocaml.doc
        "The name of the machine learning model for which the active model version is being set.\n"]
}
[@@ocaml.doc ""]

type nonrec untag_resource_response = unit [@@ocaml.doc ""]

type nonrec amazon_resource_arn = string [@@ocaml.doc ""]

type nonrec tag_key = string [@@ocaml.doc ""]

type nonrec tag_key_list = tag_key list [@@ocaml.doc ""]

type nonrec untag_resource_request = {
  tag_keys : tag_key_list;
      [@ocaml.doc "Specifies the key of the tag to be removed from a specified resource. \n"]
  resource_arn : amazon_resource_arn;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the resource to which the tag is currently associated. \n"]
}
[@@ocaml.doc ""]

type nonrec integer = int [@@ocaml.doc ""]

type nonrec unsupported_timestamps = {
  total_number_of_unsupported_timestamps : integer;
      [@ocaml.doc
        " Indicates the total number of unsupported timestamps across the ingested data. \n"]
}
[@@ocaml.doc " Entity that comprises information abount unsupported timestamps in the dataset. \n"]

type nonrec target_sampling_rate =
  | PT1H [@ocaml.doc ""]
  | PT30M [@ocaml.doc ""]
  | PT15M [@ocaml.doc ""]
  | PT10M [@ocaml.doc ""]
  | PT5M [@ocaml.doc ""]
  | PT1M [@ocaml.doc ""]
  | PT30S [@ocaml.doc ""]
  | PT15S [@ocaml.doc ""]
  | PT10S [@ocaml.doc ""]
  | PT5S [@ocaml.doc ""]
  | PT1S [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec tag_value = string [@@ocaml.doc ""]

type nonrec tag_resource_response = unit [@@ocaml.doc ""]

type nonrec tag = {
  value : tag_value; [@ocaml.doc "The value for the specified tag. \n"]
  key : tag_key; [@ocaml.doc "The key for the specified tag. \n"]
}
[@@ocaml.doc "A tag is a key-value pair that can be added to a resource as metadata. \n"]

type nonrec tag_list = tag list [@@ocaml.doc ""]

type nonrec tag_resource_request = {
  tags : tag_list;
      [@ocaml.doc
        "The tag or tags to be associated with a specific resource. Both the tag key and value are \
         specified. \n"]
  resource_arn : amazon_resource_arn;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the specific resource to which the tag should be \
         associated. \n"]
}
[@@ocaml.doc ""]

type nonrec service_quota_exceeded_exception = { message : bounded_length_string [@ocaml.doc ""] }
[@@ocaml.doc " Resource limitations have been exceeded. \n"]

type nonrec synthesized_json_model_metrics = string [@@ocaml.doc ""]

type nonrec synthesized_json_inline_data_schema = string [@@ocaml.doc ""]

type nonrec retraining_scheduler_status =
  | STOPPED [@ocaml.doc ""]
  | STOPPING [@ocaml.doc ""]
  | RUNNING [@ocaml.doc ""]
  | PENDING [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec stop_retraining_scheduler_response = {
  status : retraining_scheduler_status option;
      [@ocaml.doc "The status of the retraining scheduler. \n"]
  model_arn : model_arn option;
      [@ocaml.doc "The ARN of the model whose retraining scheduler is being stopped. \n"]
  model_name : model_name option;
      [@ocaml.doc "The name of the model whose retraining scheduler is being stopped. \n"]
}
[@@ocaml.doc ""]

type nonrec stop_retraining_scheduler_request = {
  model_name : model_name;
      [@ocaml.doc "The name of the model whose retraining scheduler you want to stop.\n"]
}
[@@ocaml.doc ""]

type nonrec inference_scheduler_name = string [@@ocaml.doc ""]

type nonrec inference_scheduler_arn = string [@@ocaml.doc ""]

type nonrec inference_scheduler_status =
  | STOPPED [@ocaml.doc ""]
  | STOPPING [@ocaml.doc ""]
  | RUNNING [@ocaml.doc ""]
  | PENDING [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec stop_inference_scheduler_response = {
  status : inference_scheduler_status option;
      [@ocaml.doc "Indicates the status of the inference scheduler. \n"]
  inference_scheduler_arn : inference_scheduler_arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the inference schedule being stopped. \n"]
  inference_scheduler_name : inference_scheduler_name option;
      [@ocaml.doc "The name of the inference scheduler being stopped. \n"]
  model_name : model_name option;
      [@ocaml.doc
        "The name of the machine learning model used by the inference scheduler being stopped. \n"]
  model_arn : model_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the machine learning model used by the inference \
         scheduler being stopped. \n"]
}
[@@ocaml.doc ""]

type nonrec stop_inference_scheduler_request = {
  inference_scheduler_name : inference_scheduler_identifier;
      [@ocaml.doc "The name of the inference scheduler to be stopped. \n"]
}
[@@ocaml.doc ""]

type nonrec statistical_issue_status =
  | NO_ISSUE_DETECTED [@ocaml.doc ""]
  | POTENTIAL_ISSUE_DETECTED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec start_retraining_scheduler_response = {
  status : retraining_scheduler_status option;
      [@ocaml.doc "The status of the retraining scheduler. \n"]
  model_arn : model_arn option;
      [@ocaml.doc "The ARN of the model whose retraining scheduler is being started. \n"]
  model_name : model_name option;
      [@ocaml.doc "The name of the model whose retraining scheduler is being started. \n"]
}
[@@ocaml.doc ""]

type nonrec start_retraining_scheduler_request = {
  model_name : model_name;
      [@ocaml.doc "The name of the model whose retraining scheduler you want to start.\n"]
}
[@@ocaml.doc ""]

type nonrec start_inference_scheduler_response = {
  status : inference_scheduler_status option;
      [@ocaml.doc "Indicates the status of the inference scheduler. \n"]
  inference_scheduler_arn : inference_scheduler_arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the inference scheduler being started. \n"]
  inference_scheduler_name : inference_scheduler_name option;
      [@ocaml.doc "The name of the inference scheduler being started. \n"]
  model_name : model_name option;
      [@ocaml.doc
        "The name of the machine learning model being used by the inference scheduler. \n"]
  model_arn : model_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the machine learning model being used by the inference \
         scheduler. \n"]
}
[@@ocaml.doc ""]

type nonrec start_inference_scheduler_request = {
  inference_scheduler_name : inference_scheduler_identifier;
      [@ocaml.doc "The name of the inference scheduler to be started. \n"]
}
[@@ocaml.doc ""]

type nonrec ingestion_job_id = string [@@ocaml.doc ""]

type nonrec ingestion_job_status =
  | IMPORT_IN_PROGRESS [@ocaml.doc ""]
  | FAILED [@ocaml.doc ""]
  | SUCCESS [@ocaml.doc ""]
  | IN_PROGRESS [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec start_data_ingestion_job_response = {
  status : ingestion_job_status option;
      [@ocaml.doc "Indicates the status of the [StartDataIngestionJob] operation. \n"]
  job_id : ingestion_job_id option; [@ocaml.doc "Indicates the job ID of the data ingestion job. \n"]
}
[@@ocaml.doc ""]

type nonrec dataset_identifier = string [@@ocaml.doc ""]

type nonrec key_pattern = string [@@ocaml.doc ""]

type nonrec ingestion_s3_input_configuration = {
  key_pattern : key_pattern option;
      [@ocaml.doc
        " The pattern for matching the Amazon S3 files that will be used for ingestion. If the \
         schema was created previously without any KeyPattern, then the default KeyPattern \
         \\{prefix\\}/\\{component_name\\}/* is used to download files from Amazon S3 according to \
         the schema. This field is required when ingestion is being done for the first time.\n\n\
        \ Valid Values: \\{prefix\\}/\\{component_name\\}_* | \\{prefix\\}/\\{component_name\\}/* \
         | \\{prefix\\}/\\{component_name\\}\\[DELIMITER\\]* (Allowed delimiters : space, dot, \
         underscore, hyphen)\n\
        \ "]
  prefix : s3_prefix option;
      [@ocaml.doc
        "The prefix for the S3 location being used for the input data for the data ingestion. \n"]
  bucket : s3_bucket;
      [@ocaml.doc "The name of the S3 bucket used for the input data for the data ingestion. \n"]
}
[@@ocaml.doc
  " Specifies S3 configuration information for the input data for the data ingestion job. \n"]

type nonrec ingestion_input_configuration = {
  s3_input_configuration : ingestion_s3_input_configuration;
      [@ocaml.doc
        "The location information for the S3 bucket used for input data for the data ingestion. \n"]
}
[@@ocaml.doc
  " Specifies configuration information for the input data for the data ingestion job, including \
   input data S3 location. \n"]

type nonrec idempotence_token = string [@@ocaml.doc ""]

type nonrec start_data_ingestion_job_request = {
  client_token : idempotence_token;
      [@ocaml.doc
        " A unique identifier for the request. If you do not set the client request token, Amazon \
         Lookout for Equipment generates one. \n"]
  role_arn : iam_role_arn;
      [@ocaml.doc
        " The Amazon Resource Name (ARN) of a role with permission to access the data source for \
         the data ingestion job. \n"]
  ingestion_input_configuration : ingestion_input_configuration;
      [@ocaml.doc
        " Specifies information for the input data for the data ingestion job, including dataset \
         S3 location. \n"]
  dataset_name : dataset_identifier;
      [@ocaml.doc "The name of the dataset being used by the data ingestion job. \n"]
}
[@@ocaml.doc ""]

type nonrec sensors_with_short_date_range = {
  affected_sensor_count : integer;
      [@ocaml.doc " Indicates the number of sensors that have less than 14 days of data. \n"]
}
[@@ocaml.doc " Entity that comprises information on sensors that have shorter date range. \n"]

type nonrec component_name = string [@@ocaml.doc ""]

type nonrec sensor_name = string [@@ocaml.doc ""]

type nonrec boolean_ = bool [@@ocaml.doc ""]

type nonrec float_ = float [@@ocaml.doc ""]

type nonrec count_percent = {
  percentage : float_;
      [@ocaml.doc " Indicates the percentage of occurances of the given statistic. \n"]
  count : integer; [@ocaml.doc " Indicates the count of occurences of the given statistic. \n"]
}
[@@ocaml.doc " Entity that comprises information of count and percentage. \n"]

type nonrec categorical_values = {
  number_of_category : integer option;
      [@ocaml.doc " Indicates the number of categories in the data. \n"]
  status : statistical_issue_status;
      [@ocaml.doc
        " Indicates whether there is a potential data issue related to categorical values. \n"]
}
[@@ocaml.doc " Entity that comprises information on categorical values in data. \n"]

type nonrec multiple_operating_modes = {
  status : statistical_issue_status;
      [@ocaml.doc
        " Indicates whether there is a potential data issue related to having multiple operating \
         modes. \n"]
}
[@@ocaml.doc " Entity that comprises information on operating modes in data. \n"]

type nonrec large_timestamp_gaps = {
  max_timestamp_gap_in_days : integer option;
      [@ocaml.doc " Indicates the size of the largest timestamp gap, in days. \n"]
  number_of_large_timestamp_gaps : integer option;
      [@ocaml.doc " Indicates the number of large timestamp gaps, if there are any. \n"]
  status : statistical_issue_status;
      [@ocaml.doc
        " Indicates whether there is a potential data issue related to large gaps in timestamps. \n"]
}
[@@ocaml.doc
  " Entity that comprises information on large gaps between consecutive timestamps in data. \n"]

type nonrec monotonicity =
  | STATIC [@ocaml.doc ""]
  | INCREASING [@ocaml.doc ""]
  | DECREASING [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec monotonic_values = {
  monotonicity : monotonicity option;
      [@ocaml.doc
        " Indicates the monotonicity of values. Can be INCREASING, DECREASING, or STATIC. \n"]
  status : statistical_issue_status;
      [@ocaml.doc
        " Indicates whether there is a potential data issue related to having monotonic values. \n"]
}
[@@ocaml.doc " Entity that comprises information on monotonic values in the data. \n"]

type nonrec sensor_statistics_summary = {
  data_end_time : timestamp option;
      [@ocaml.doc
        " Indicates the time reference to indicate the end of valid data associated with the \
         sensor that the statistics belong to. \n"]
  data_start_time : timestamp option;
      [@ocaml.doc
        " Indicates the time reference to indicate the beginning of valid data associated with the \
         sensor that the statistics belong to. \n"]
  monotonic_values : monotonic_values option;
      [@ocaml.doc
        " Parameter that describes potential risk about whether data associated with the sensor is \
         mostly monotonic. \n"]
  large_timestamp_gaps : large_timestamp_gaps option;
      [@ocaml.doc
        " Parameter that describes potential risk about whether data associated with the sensor \
         contains one or more large gaps between consecutive timestamps. \n"]
  multiple_operating_modes : multiple_operating_modes option;
      [@ocaml.doc
        " Parameter that describes potential risk about whether data associated with the sensor \
         has more than one operating mode. \n"]
  categorical_values : categorical_values option;
      [@ocaml.doc
        " Parameter that describes potential risk about whether data associated with the sensor is \
         categorical. \n"]
  duplicate_timestamps : count_percent option;
      [@ocaml.doc
        " Parameter that describes the total number of duplicate timestamp records associated with \
         the sensor that the statistics belong to. \n"]
  invalid_date_entries : count_percent option;
      [@ocaml.doc
        " Parameter that describes the total number of invalid date entries associated with the \
         sensor that the statistics belong to. \n"]
  invalid_values : count_percent option;
      [@ocaml.doc
        " Parameter that describes the total number of, and percentage of, values that are invalid \
         for the sensor that the statistics belong to. \n"]
  missing_values : count_percent option;
      [@ocaml.doc
        " Parameter that describes the total number of, and percentage of, values that are missing \
         for the sensor that the statistics belong to. \n"]
  data_exists : boolean_ option;
      [@ocaml.doc
        " Parameter that indicates whether data exists for the sensor that the statistics belong \
         to. \n"]
  sensor_name : sensor_name option;
      [@ocaml.doc " Name of the sensor that the statistics belong to. \n"]
  component_name : component_name option;
      [@ocaml.doc
        " Name of the component to which the particular sensor belongs for which the statistics \
         belong to. \n"]
}
[@@ocaml.doc
  " Summary of ingestion statistics like whether data exists, number of missing values, number of \
   invalid values and so on related to the particular sensor. \n"]

type nonrec sensor_statistics_summaries = sensor_statistics_summary list [@@ocaml.doc ""]

type nonrec s3_key = string [@@ocaml.doc ""]

type nonrec s3_object = {
  key : s3_key;
      [@ocaml.doc
        "The Amazon Web Services Key Management Service (KMS key) key being used to encrypt the S3 \
         object. Without this key, data in the bucket is not accessible. \n"]
  bucket : s3_bucket; [@ocaml.doc "The name of the specific S3 bucket. \n"]
}
[@@ocaml.doc "Contains information about an S3 bucket. \n"]

type nonrec retraining_scheduler_summary = {
  lookback_window : lookback_window option;
      [@ocaml.doc "The number of past days of data used for retraining.\n"]
  retraining_frequency : retraining_frequency option;
      [@ocaml.doc
        "The frequency at which the model retraining is set. This follows the \
         {{:https://en.wikipedia.org/wiki/ISO_8601#Durations}ISO 8601} guidelines.\n"]
  retraining_start_date : timestamp option;
      [@ocaml.doc
        "The start date for the retraining scheduler. Lookout for Equipment truncates the time you \
         provide to the nearest UTC day.\n"]
  status : retraining_scheduler_status option;
      [@ocaml.doc "The status of the retraining scheduler. \n"]
  model_arn : model_arn option;
      [@ocaml.doc "The ARN of the model that the retraining scheduler is attached to. \n"]
  model_name : model_name option;
      [@ocaml.doc "The name of the model that the retraining scheduler is attached to. \n"]
}
[@@ocaml.doc
  "Provides information about the specified retraining scheduler, including model name, status, \
   start date, frequency, and lookback window. \n"]

type nonrec retraining_scheduler_summaries = retraining_scheduler_summary list [@@ocaml.doc ""]

type nonrec resource_arn = string [@@ocaml.doc ""]

type nonrec policy_revision_id = string [@@ocaml.doc ""]

type nonrec put_resource_policy_response = {
  policy_revision_id : policy_revision_id option;
      [@ocaml.doc "A unique identifier for a revision of the resource policy.\n"]
  resource_arn : resource_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the resource for which the policy was created.\n"]
}
[@@ocaml.doc ""]

type nonrec policy = string [@@ocaml.doc ""]

type nonrec put_resource_policy_request = {
  client_token : idempotence_token;
      [@ocaml.doc
        "A unique identifier for the request. If you do not set the client request token, Amazon \
         Lookout for Equipment generates one. \n"]
  policy_revision_id : policy_revision_id option;
      [@ocaml.doc "A unique identifier for a revision of the resource policy.\n"]
  resource_policy : policy; [@ocaml.doc "The JSON-formatted resource policy to create.\n"]
  resource_arn : resource_arn;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the resource for which the policy is being created.\n"]
}
[@@ocaml.doc ""]

type nonrec off_condition = string [@@ocaml.doc ""]

type nonrec next_token = string [@@ocaml.doc ""]

type nonrec model_version_status =
  | CANCELED [@ocaml.doc ""]
  | IMPORT_IN_PROGRESS [@ocaml.doc ""]
  | FAILED [@ocaml.doc ""]
  | SUCCESS [@ocaml.doc ""]
  | IN_PROGRESS [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec model_version_source_type =
  | IMPORT [@ocaml.doc ""]
  | RETRAINING [@ocaml.doc ""]
  | TRAINING [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec model_quality =
  | POOR_QUALITY_DETECTED [@ocaml.doc ""]
  | CANNOT_DETERMINE_QUALITY [@ocaml.doc ""]
  | QUALITY_THRESHOLD_MET [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec model_version_summary = {
  model_quality : model_quality option;
      [@ocaml.doc
        "Provides a quality assessment for a model that uses labels. If Lookout for Equipment \
         determines that the model quality is poor based on training metrics, the value is \
         [POOR_QUALITY_DETECTED]. Otherwise, the value is [QUALITY_THRESHOLD_MET]. \n\n\
        \ If the model is unlabeled, the model quality can't be assessed and the value of \
         [ModelQuality] is [CANNOT_DETERMINE_QUALITY]. In this situation, you can get a model \
         quality assessment by adding labels to the input dataset and retraining the model.\n\
        \ \n\
        \  For information about improving the quality of a model, see \
         {{:https://docs.aws.amazon.com/lookout-for-equipment/latest/ug/best-practices.html}Best \
         practices with Amazon Lookout for Equipment}.\n\
        \  "]
  source_type : model_version_source_type option;
      [@ocaml.doc "Indicates how this model version was generated.\n"]
  status : model_version_status option; [@ocaml.doc "The current status of the model version.\n"]
  created_at : timestamp option; [@ocaml.doc "The time when this model version was created.\n"]
  model_version_arn : model_version_arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the model version.\n"]
  model_version : model_version option; [@ocaml.doc "The version of the model.\n"]
  model_arn : model_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the model that this model version is a version of.\n"]
  model_name : model_name option;
      [@ocaml.doc "The name of the model that this model version is a version of.\n"]
}
[@@ocaml.doc "Contains information about the specific model version.\n"]

type nonrec model_version_summaries = model_version_summary list [@@ocaml.doc ""]

type nonrec dataset_name = string [@@ocaml.doc ""]

type nonrec dataset_arn = string [@@ocaml.doc ""]

type nonrec model_status =
  | IMPORT_IN_PROGRESS [@ocaml.doc ""]
  | FAILED [@ocaml.doc ""]
  | SUCCESS [@ocaml.doc ""]
  | IN_PROGRESS [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec model_summary = {
  model_quality : model_quality option;
      [@ocaml.doc
        "Provides a quality assessment for a model that uses labels. If Lookout for Equipment \
         determines that the model quality is poor based on training metrics, the value is \
         [POOR_QUALITY_DETECTED]. Otherwise, the value is [QUALITY_THRESHOLD_MET].\n\n\
        \ If the model is unlabeled, the model quality can't be assessed and the value of \
         [ModelQuality] is [CANNOT_DETERMINE_QUALITY]. In this situation, you can get a model \
         quality assessment by adding labels to the input dataset and retraining the model.\n\
        \ \n\
        \  For information about using labels with your models, see \
         {{:https://docs.aws.amazon.com/lookout-for-equipment/latest/ug/understanding-labeling.html}Understanding \
         labeling}.\n\
        \  \n\
        \   For information about improving the quality of a model, see \
         {{:https://docs.aws.amazon.com/lookout-for-equipment/latest/ug/best-practices.html}Best \
         practices with Amazon Lookout for Equipment}.\n\
        \   "]
  model_diagnostics_output_configuration : model_diagnostics_output_configuration option;
      [@ocaml.doc ""]
  retraining_scheduler_status : retraining_scheduler_status option;
      [@ocaml.doc "Indicates the status of the retraining scheduler. \n"]
  next_scheduled_retraining_start_date : timestamp option;
      [@ocaml.doc
        "Indicates the date that the next scheduled retraining run will start on. Lookout for \
         Equipment truncates the time you provide to \
         {{:https://docs.aws.amazon.com/https:/docs.aws.amazon.com/cli/latest/userguide/cli-usage-parameters-types.html#parameter-type-timestamp}the \
         nearest UTC day}.\n"]
  latest_scheduled_retraining_start_time : timestamp option;
      [@ocaml.doc "Indicates the start time of the most recent scheduled retraining run. \n"]
  latest_scheduled_retraining_model_version : model_version option;
      [@ocaml.doc "Indicates the most recent model version that was generated by retraining. \n"]
  latest_scheduled_retraining_status : model_version_status option;
      [@ocaml.doc "Indicates the status of the most recent scheduled retraining run. \n"]
  active_model_version_arn : model_version_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the model version that is set as active. The active \
         model version is the model version that the inference scheduler uses to run an inference \
         execution.\n"]
  active_model_version : model_version option;
      [@ocaml.doc
        "The model version that the inference scheduler uses to run an inference execution.\n"]
  created_at : timestamp option; [@ocaml.doc "The time at which the specific model was created. \n"]
  status : model_status option;
      [@ocaml.doc "Indicates the status of the machine learning model. \n"]
  dataset_arn : dataset_arn option;
      [@ocaml.doc " The Amazon Resource Name (ARN) of the dataset used to create the model. \n"]
  dataset_name : dataset_name option;
      [@ocaml.doc "The name of the dataset being used for the machine learning model. \n"]
  model_arn : model_arn option;
      [@ocaml.doc " The Amazon Resource Name (ARN) of the machine learning model. \n"]
  model_name : model_name option; [@ocaml.doc "The name of the machine learning model. \n"]
}
[@@ocaml.doc
  "Provides information about the specified machine learning model, including dataset and model \
   names and ARNs, as well as status. \n"]

type nonrec model_summaries = model_summary list [@@ocaml.doc ""]

type nonrec model_metrics = string [@@ocaml.doc ""]

type nonrec missing_sensor_data = {
  total_number_of_missing_values : integer;
      [@ocaml.doc " Indicates the total number of missing values across all the sensors. \n"]
  affected_sensor_count : integer;
      [@ocaml.doc " Indicates the number of sensors that have atleast some data missing. \n"]
}
[@@ocaml.doc " Entity that comprises aggregated information on sensors having missing data. \n"]

type nonrec missing_complete_sensor_data = {
  affected_sensor_count : integer;
      [@ocaml.doc " Indicates the number of sensors that have data missing completely. \n"]
}
[@@ocaml.doc
  " Entity that comprises information on sensors that have sensor data completely missing. \n"]

type nonrec max_results = int [@@ocaml.doc ""]

type nonrec list_tags_for_resource_response = {
  tags : tag_list option; [@ocaml.doc " Any tags associated with the resource. \n"]
}
[@@ocaml.doc ""]

type nonrec list_tags_for_resource_request = {
  resource_arn : amazon_resource_arn;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the resource (such as the dataset or model) that is the \
         focus of the [ListTagsForResource] operation. \n"]
}
[@@ocaml.doc ""]

type nonrec list_sensor_statistics_response = {
  next_token : next_token option;
      [@ocaml.doc
        "An opaque pagination token indicating where to continue the listing of sensor statistics. \n"]
  sensor_statistics_summaries : sensor_statistics_summaries option;
      [@ocaml.doc
        "Provides ingestion-based statistics regarding the specified sensor with respect to \
         various validation types, such as whether data exists, the number and percentage of \
         missing values, and the number and percentage of duplicate timestamps. \n"]
}
[@@ocaml.doc ""]

type nonrec list_sensor_statistics_request = {
  next_token : next_token option;
      [@ocaml.doc
        "An opaque pagination token indicating where to continue the listing of sensor statistics. \n"]
  max_results : max_results option;
      [@ocaml.doc "Specifies the maximum number of sensors for which to retrieve statistics. \n"]
  ingestion_job_id : ingestion_job_id option;
      [@ocaml.doc
        " The ingestion job id associated with the list of Sensor Statistics. To get sensor \
         statistics for a particular ingestion job id, both dataset name and ingestion job id must \
         be submitted as inputs. \n"]
  dataset_name : dataset_name;
      [@ocaml.doc " The name of the dataset associated with the list of Sensor Statistics. \n"]
}
[@@ocaml.doc ""]

type nonrec list_retraining_schedulers_response = {
  next_token : next_token option;
      [@ocaml.doc
        "If the number of results exceeds the maximum, this pagination token is returned. Use this \
         token in the request to show the next page of retraining schedulers.\n"]
  retraining_scheduler_summaries : retraining_scheduler_summaries option;
      [@ocaml.doc
        "Provides information on the specified retraining scheduler, including the model name, \
         model ARN, status, and start date. \n"]
}
[@@ocaml.doc ""]

type nonrec list_retraining_schedulers_request = {
  max_results : max_results option;
      [@ocaml.doc "Specifies the maximum number of retraining schedulers to list. \n"]
  next_token : next_token option;
      [@ocaml.doc
        "If the number of results exceeds the maximum, a pagination token is returned. Use the \
         token in the request to show the next page of retraining schedulers.\n"]
  status : retraining_scheduler_status option;
      [@ocaml.doc
        "Specify this field to only list retraining schedulers whose status matches the value you \
         specify. \n"]
  model_name_begins_with : model_name option;
      [@ocaml.doc
        "Specify this field to only list retraining schedulers whose machine learning models begin \
         with the value you specify. \n"]
}
[@@ocaml.doc ""]

type nonrec list_of_discarded_files = s3_object list [@@ocaml.doc ""]

type nonrec list_models_response = {
  model_summaries : model_summaries option;
      [@ocaml.doc
        "Provides information on the specified model, including created time, model and dataset \
         ARNs, and status. \n"]
  next_token : next_token option;
      [@ocaml.doc
        " An opaque pagination token indicating where to continue the listing of machine learning \
         models. \n"]
}
[@@ocaml.doc ""]

type nonrec list_models_request = {
  dataset_name_begins_with : dataset_name option;
      [@ocaml.doc
        "The beginning of the name of the dataset of the machine learning models to be listed. \n"]
  model_name_begins_with : model_name option;
      [@ocaml.doc "The beginning of the name of the machine learning models being listed. \n"]
  status : model_status option; [@ocaml.doc "The status of the machine learning model. \n"]
  max_results : max_results option;
      [@ocaml.doc " Specifies the maximum number of machine learning models to list. \n"]
  next_token : next_token option;
      [@ocaml.doc
        " An opaque pagination token indicating where to continue the listing of machine learning \
         models. \n"]
}
[@@ocaml.doc ""]

type nonrec list_model_versions_response = {
  model_version_summaries : model_version_summaries option;
      [@ocaml.doc
        "Provides information on the specified model version, including the created time, model \
         and dataset ARNs, and status.\n\n\
        \  If you don't supply the [ModelName] request parameter, or if you supply the name of a \
         model that doesn't exist, [ListModelVersions] returns an empty array in \
         [ModelVersionSummaries]. \n\
        \  \n\
        \   "]
  next_token : next_token option;
      [@ocaml.doc
        "If the total number of results exceeds the limit that the response can display, the \
         response returns an opaque pagination token indicating where to continue the listing of \
         machine learning model versions. Use this token in the [NextToken] field in the request \
         to list the next page of results.\n"]
}
[@@ocaml.doc ""]

type nonrec list_model_versions_request = {
  min_model_version : model_version option;
      [@ocaml.doc "Specifies the lowest version of the model to return in the list.\n"]
  max_model_version : model_version option;
      [@ocaml.doc "Specifies the highest version of the model to return in the list.\n"]
  created_at_start_time : timestamp option;
      [@ocaml.doc "Filter results to return all the model versions created after this time.\n"]
  created_at_end_time : timestamp option;
      [@ocaml.doc "Filter results to return all the model versions created before this time.\n"]
  source_type : model_version_source_type option;
      [@ocaml.doc "Filter the results based on the way the model version was generated.\n"]
  status : model_version_status option;
      [@ocaml.doc "Filter the results based on the current status of the model version.\n"]
  max_results : max_results option;
      [@ocaml.doc "Specifies the maximum number of machine learning model versions to list.\n"]
  next_token : next_token option;
      [@ocaml.doc
        "If the total number of results exceeds the limit that the response can display, the \
         response returns an opaque pagination token indicating where to continue the listing of \
         machine learning model versions. Use this token in the [NextToken] field in the request \
         to list the next page of results.\n"]
  model_name : model_name;
      [@ocaml.doc
        "Then name of the machine learning model for which the model versions are to be listed.\n"]
}
[@@ocaml.doc ""]

type nonrec label_id = string [@@ocaml.doc ""]

type nonrec label_group_arn = string [@@ocaml.doc ""]

type nonrec label_rating =
  | NEUTRAL [@ocaml.doc ""]
  | NO_ANOMALY [@ocaml.doc ""]
  | ANOMALY [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec equipment = string [@@ocaml.doc ""]

type nonrec label_summary = {
  created_at : timestamp option; [@ocaml.doc " The time at which the label was created. \n"]
  equipment : equipment option;
      [@ocaml.doc " Indicates that a label pertains to a particular piece of equipment. \n"]
  fault_code : fault_code option;
      [@ocaml.doc
        " Indicates the type of anomaly associated with the label. \n\n\
        \ Data in this field will be retained for service usage. Follow best practices for the \
         security of your data.\n\
        \ "]
  rating : label_rating option;
      [@ocaml.doc " Indicates whether a labeled event represents an anomaly. \n"]
  end_time : timestamp option; [@ocaml.doc " The timestamp indicating the end of the label. \n"]
  start_time : timestamp option; [@ocaml.doc " The timestamp indicating the start of the label. \n"]
  label_group_arn : label_group_arn option;
      [@ocaml.doc " The Amazon Resource Name (ARN) of the label group. \n"]
  label_id : label_id option; [@ocaml.doc " The ID of the label. \n"]
  label_group_name : label_group_name option; [@ocaml.doc " The name of the label group. \n"]
}
[@@ocaml.doc " Information about the label. \n"]

type nonrec label_summaries = label_summary list [@@ocaml.doc ""]

type nonrec list_labels_response = {
  label_summaries : label_summaries option;
      [@ocaml.doc
        " A summary of the items in the label group. \n\n\
        \  If you don't supply the [LabelGroupName] request parameter, or if you supply the name \
         of a label group that doesn't exist, [ListLabels] returns an empty array in \
         [LabelSummaries].\n\
        \  \n\
        \   "]
  next_token : next_token option;
      [@ocaml.doc
        " An opaque pagination token indicating where to continue the listing of datasets. \n"]
}
[@@ocaml.doc ""]

type nonrec list_labels_request = {
  max_results : max_results option;
      [@ocaml.doc " Specifies the maximum number of labels to list. \n"]
  next_token : next_token option;
      [@ocaml.doc
        " An opaque pagination token indicating where to continue the listing of label groups. \n"]
  equipment : equipment option;
      [@ocaml.doc " Lists the labels that pertain to a particular piece of equipment. \n"]
  fault_code : fault_code option; [@ocaml.doc " Returns labels with a particular fault code. \n"]
  interval_end_time : timestamp option;
      [@ocaml.doc " Returns all labels with a start time earlier than the end time given. \n"]
  interval_start_time : timestamp option;
      [@ocaml.doc
        " Returns all the labels with a end time equal to or later than the start time given. \n"]
  label_group_name : label_group_name; [@ocaml.doc " Returns the name of the label group. \n"]
}
[@@ocaml.doc ""]

type nonrec label_group_summary = {
  updated_at : timestamp option; [@ocaml.doc " The time at which the label group was updated. \n"]
  created_at : timestamp option; [@ocaml.doc " The time at which the label group was created. \n"]
  label_group_arn : label_group_arn option;
      [@ocaml.doc " The Amazon Resource Name (ARN) of the label group. \n"]
  label_group_name : label_group_name option; [@ocaml.doc " The name of the label group. \n"]
}
[@@ocaml.doc " Contains information about the label group. \n"]

type nonrec label_group_summaries = label_group_summary list [@@ocaml.doc ""]

type nonrec list_label_groups_response = {
  label_group_summaries : label_group_summaries option;
      [@ocaml.doc " A summary of the label groups. \n"]
  next_token : next_token option;
      [@ocaml.doc
        " An opaque pagination token indicating where to continue the listing of label groups. \n"]
}
[@@ocaml.doc ""]

type nonrec list_label_groups_request = {
  max_results : max_results option;
      [@ocaml.doc " Specifies the maximum number of label groups to list. \n"]
  next_token : next_token option;
      [@ocaml.doc
        " An opaque pagination token indicating where to continue the listing of label groups. \n"]
  label_group_name_begins_with : label_group_name option;
      [@ocaml.doc " The beginning of the name of the label groups to be listed. \n"]
}
[@@ocaml.doc ""]

type nonrec latest_inference_result = NORMAL [@ocaml.doc ""] | ANOMALOUS [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec inference_scheduler_summary = {
  latest_inference_result : latest_inference_result option;
      [@ocaml.doc
        "Indicates whether the latest execution for the inference scheduler was Anomalous \
         (anomalous events found) or Normal (no anomalous events found).\n"]
  data_upload_frequency : data_upload_frequency option;
      [@ocaml.doc
        "How often data is uploaded to the source S3 bucket for the input data. This value is the \
         length of time between data uploads. For instance, if you select 5 minutes, Amazon \
         Lookout for Equipment will upload the real-time data to the source bucket once every 5 \
         minutes. This frequency also determines how often Amazon Lookout for Equipment starts a \
         scheduled inference on your data. In this example, it starts once every 5 minutes. \n"]
  data_delay_offset_in_minutes : data_delay_offset_in_minutes option;
      [@ocaml.doc
        "A period of time (in minutes) by which inference on the data is delayed after the data \
         starts. For instance, if an offset delay time of five minutes was selected, inference \
         will not begin on the data until the first data measurement after the five minute mark. \
         For example, if five minutes is selected, the inference scheduler will wake up at the \
         configured frequency with the additional five minute delay time to check the customer S3 \
         bucket. The customer can upload data at the same frequency and they don't need to stop \
         and restart the scheduler when uploading new data. \n"]
  status : inference_scheduler_status option;
      [@ocaml.doc "Indicates the status of the inference scheduler. \n"]
  inference_scheduler_arn : inference_scheduler_arn option;
      [@ocaml.doc " The Amazon Resource Name (ARN) of the inference scheduler. \n"]
  inference_scheduler_name : inference_scheduler_name option;
      [@ocaml.doc "The name of the inference scheduler. \n"]
  model_arn : model_arn option;
      [@ocaml.doc
        " The Amazon Resource Name (ARN) of the machine learning model used by the inference \
         scheduler. \n"]
  model_name : model_name option;
      [@ocaml.doc "The name of the machine learning model used for the inference scheduler. \n"]
}
[@@ocaml.doc
  "Contains information about the specific inference scheduler, including data delay offset, model \
   name and ARN, status, and so on. \n"]

type nonrec inference_scheduler_summaries = inference_scheduler_summary list [@@ocaml.doc ""]

type nonrec list_inference_schedulers_response = {
  inference_scheduler_summaries : inference_scheduler_summaries option;
      [@ocaml.doc
        "Provides information about the specified inference scheduler, including data upload \
         frequency, model name and ARN, and status. \n"]
  next_token : next_token option;
      [@ocaml.doc
        " An opaque pagination token indicating where to continue the listing of inference \
         schedulers. \n"]
}
[@@ocaml.doc ""]

type nonrec list_inference_schedulers_request = {
  status : inference_scheduler_status option;
      [@ocaml.doc "Specifies the current status of the inference schedulers.\n"]
  model_name : model_name option;
      [@ocaml.doc
        "The name of the machine learning model used by the inference scheduler to be listed. \n"]
  inference_scheduler_name_begins_with : inference_scheduler_identifier option;
      [@ocaml.doc "The beginning of the name of the inference schedulers to be listed. \n"]
  max_results : max_results option;
      [@ocaml.doc " Specifies the maximum number of inference schedulers to list. \n"]
  next_token : next_token option;
      [@ocaml.doc
        " An opaque pagination token indicating where to continue the listing of inference \
         schedulers. \n"]
}
[@@ocaml.doc ""]

type nonrec inference_execution_status =
  | FAILED [@ocaml.doc ""]
  | SUCCESS [@ocaml.doc ""]
  | IN_PROGRESS [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec inference_execution_summary = {
  model_version_arn : model_version_arn option;
      [@ocaml.doc
        "The Amazon Resource Number (ARN) of the model version used for the inference execution.\n"]
  model_version : model_version option;
      [@ocaml.doc "The model version used for the inference execution.\n"]
  failed_reason : bounded_length_string option;
      [@ocaml.doc " Specifies the reason for failure when an inference execution has failed. \n"]
  status : inference_execution_status option;
      [@ocaml.doc "Indicates the status of the inference execution. \n"]
  customer_result_object : s3_object option;
      [@ocaml.doc "The S3 object that the inference execution results were uploaded to.\n"]
  data_output_configuration : inference_output_configuration option;
      [@ocaml.doc
        " Specifies configuration information for the output results from for the inference \
         execution, including the output Amazon S3 location. \n"]
  data_input_configuration : inference_input_configuration option;
      [@ocaml.doc
        " Specifies configuration information for the input data for the inference scheduler, \
         including delimiter, format, and dataset location. \n"]
  data_end_time : timestamp option;
      [@ocaml.doc
        "Indicates the time reference in the dataset at which the inference execution stopped. \n"]
  data_start_time : timestamp option;
      [@ocaml.doc
        "Indicates the time reference in the dataset at which the inference execution began. \n"]
  scheduled_start_time : timestamp option;
      [@ocaml.doc
        "Indicates the start time at which the inference scheduler began the specific inference \
         execution. \n"]
  inference_scheduler_arn : inference_scheduler_arn option;
      [@ocaml.doc
        " The Amazon Resource Name (ARN) of the inference scheduler being used for the inference \
         execution. \n"]
  inference_scheduler_name : inference_scheduler_name option;
      [@ocaml.doc "The name of the inference scheduler being used for the inference execution. \n"]
  model_arn : model_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the machine learning model used for the inference \
         execution. \n"]
  model_name : model_name option;
      [@ocaml.doc
        "The name of the machine learning model being used for the inference execution. \n"]
}
[@@ocaml.doc
  "Contains information about the specific inference execution, including input and output data \
   configuration, inference scheduling information, status, and so on. \n"]

type nonrec inference_execution_summaries = inference_execution_summary list [@@ocaml.doc ""]

type nonrec list_inference_executions_response = {
  inference_execution_summaries : inference_execution_summaries option;
      [@ocaml.doc
        "Provides an array of information about the individual inference executions returned from \
         the [ListInferenceExecutions] operation, including model used, inference scheduler, data \
         configuration, and so on. \n\n\
        \  If you don't supply the [InferenceSchedulerName] request parameter, or if you supply \
         the name of an inference scheduler that doesn't exist, [ListInferenceExecutions] returns \
         an empty array in [InferenceExecutionSummaries].\n\
        \  \n\
        \   "]
  next_token : next_token option;
      [@ocaml.doc
        " An opaque pagination token indicating where to continue the listing of inference \
         executions. \n"]
}
[@@ocaml.doc ""]

type nonrec list_inference_executions_request = {
  status : inference_execution_status option;
      [@ocaml.doc "The status of the inference execution. \n"]
  data_end_time_before : timestamp option;
      [@ocaml.doc
        "The time reference in the inferenced dataset before which Amazon Lookout for Equipment \
         stopped the inference execution. \n"]
  data_start_time_after : timestamp option;
      [@ocaml.doc
        "The time reference in the inferenced dataset after which Amazon Lookout for Equipment \
         started the inference execution. \n"]
  inference_scheduler_name : inference_scheduler_identifier;
      [@ocaml.doc "The name of the inference scheduler for the inference execution listed. \n"]
  max_results : max_results option;
      [@ocaml.doc "Specifies the maximum number of inference executions to list. \n"]
  next_token : next_token option;
      [@ocaml.doc
        "An opaque pagination token indicating where to continue the listing of inference \
         executions.\n"]
}
[@@ocaml.doc ""]

type nonrec event_duration_in_seconds = Smaws_Lib.CoreTypes.Int64.t [@@ocaml.doc ""]

type nonrec inference_event_summary = {
  event_duration_in_seconds : event_duration_in_seconds option;
      [@ocaml.doc " Indicates the size of an inference event in seconds. \n"]
  diagnostics : model_metrics option;
      [@ocaml.doc
        " An array which specifies the names and values of all sensors contributing to an \
         inference event.\n"]
  event_end_time : timestamp option;
      [@ocaml.doc "Indicates the ending time of an inference event. \n"]
  event_start_time : timestamp option;
      [@ocaml.doc "Indicates the starting time of an inference event. \n"]
  inference_scheduler_name : inference_scheduler_name option;
      [@ocaml.doc "The name of the inference scheduler being used for the inference events. \n"]
  inference_scheduler_arn : inference_scheduler_arn option;
      [@ocaml.doc
        " The Amazon Resource Name (ARN) of the inference scheduler being used for the inference \
         event. \n"]
}
[@@ocaml.doc
  "Contains information about the specific inference event, including start and end time, \
   diagnostics information, event duration and so on.\n"]

type nonrec inference_event_summaries = inference_event_summary list [@@ocaml.doc ""]

type nonrec list_inference_events_response = {
  inference_event_summaries : inference_event_summaries option;
      [@ocaml.doc
        "Provides an array of information about the individual inference events returned from the \
         [ListInferenceEvents] operation, including scheduler used, event start time, event end \
         time, diagnostics, and so on. \n"]
  next_token : next_token option;
      [@ocaml.doc
        "An opaque pagination token indicating where to continue the listing of inference \
         executions. \n"]
}
[@@ocaml.doc ""]

type nonrec list_inference_events_request = {
  interval_end_time : timestamp;
      [@ocaml.doc
        "Returns all the inference events with an end start time equal to or greater than less \
         than the end time given.\n"]
  interval_start_time : timestamp;
      [@ocaml.doc
        " Lookout for Equipment will return all the inference events with an end time equal to or \
         greater than the start time given.\n"]
  inference_scheduler_name : inference_scheduler_identifier;
      [@ocaml.doc "The name of the inference scheduler for the inference events listed. \n"]
  max_results : max_results option;
      [@ocaml.doc "Specifies the maximum number of inference events to list. \n"]
  next_token : next_token option;
      [@ocaml.doc
        "An opaque pagination token indicating where to continue the listing of inference events.\n"]
}
[@@ocaml.doc ""]

type nonrec dataset_status =
  | IMPORT_IN_PROGRESS [@ocaml.doc ""]
  | ACTIVE [@ocaml.doc ""]
  | INGESTION_IN_PROGRESS [@ocaml.doc ""]
  | CREATED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec dataset_summary = {
  created_at : timestamp option;
      [@ocaml.doc "The time at which the dataset was created in Amazon Lookout for Equipment. \n"]
  status : dataset_status option; [@ocaml.doc "Indicates the status of the dataset. \n"]
  dataset_arn : dataset_arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the specified dataset. \n"]
  dataset_name : dataset_name option; [@ocaml.doc "The name of the dataset. \n"]
}
[@@ocaml.doc
  "Contains information about the specific data set, including name, ARN, and status. \n"]

type nonrec dataset_summaries = dataset_summary list [@@ocaml.doc ""]

type nonrec list_datasets_response = {
  dataset_summaries : dataset_summaries option;
      [@ocaml.doc
        "Provides information about the specified dataset, including creation time, dataset ARN, \
         and status. \n"]
  next_token : next_token option;
      [@ocaml.doc
        " An opaque pagination token indicating where to continue the listing of datasets. \n"]
}
[@@ocaml.doc ""]

type nonrec list_datasets_request = {
  dataset_name_begins_with : dataset_name option;
      [@ocaml.doc "The beginning of the name of the datasets to be listed. \n"]
  max_results : max_results option;
      [@ocaml.doc " Specifies the maximum number of datasets to list. \n"]
  next_token : next_token option;
      [@ocaml.doc
        " An opaque pagination token indicating where to continue the listing of datasets. \n"]
}
[@@ocaml.doc ""]

type nonrec data_ingestion_job_summary = {
  status : ingestion_job_status option;
      [@ocaml.doc "Indicates the status of the data ingestion job. \n"]
  ingestion_input_configuration : ingestion_input_configuration option;
      [@ocaml.doc
        " Specifies information for the input data for the data inference job, including data \
         Amazon S3 location parameters. \n"]
  dataset_arn : dataset_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the dataset used in the data ingestion job. \n"]
  dataset_name : dataset_name option;
      [@ocaml.doc "The name of the dataset used for the data ingestion job. \n"]
  job_id : ingestion_job_id option; [@ocaml.doc "Indicates the job ID of the data ingestion job. \n"]
}
[@@ocaml.doc
  "Provides information about a specified data ingestion job, including dataset information, data \
   ingestion configuration, and status. \n"]

type nonrec data_ingestion_job_summaries = data_ingestion_job_summary list [@@ocaml.doc ""]

type nonrec list_data_ingestion_jobs_response = {
  data_ingestion_job_summaries : data_ingestion_job_summaries option;
      [@ocaml.doc
        "Specifies information about the specific data ingestion job, including dataset name and \
         status. \n"]
  next_token : next_token option;
      [@ocaml.doc
        " An opaque pagination token indicating where to continue the listing of data ingestion \
         jobs. \n"]
}
[@@ocaml.doc ""]

type nonrec list_data_ingestion_jobs_request = {
  status : ingestion_job_status option;
      [@ocaml.doc "Indicates the status of the data ingestion job. \n"]
  max_results : max_results option;
      [@ocaml.doc " Specifies the maximum number of data ingestion jobs to list. \n"]
  next_token : next_token option;
      [@ocaml.doc
        "An opaque pagination token indicating where to continue the listing of data ingestion \
         jobs. \n"]
  dataset_name : dataset_name option;
      [@ocaml.doc "The name of the dataset being used for the data ingestion job. \n"]
}
[@@ocaml.doc ""]

type nonrec kms_key_arn = string [@@ocaml.doc ""]

type nonrec invalid_sensor_data = {
  total_number_of_invalid_values : integer;
      [@ocaml.doc " Indicates the total number of invalid values across all the sensors. \n"]
  affected_sensor_count : integer;
      [@ocaml.doc " Indicates the number of sensors that have at least some invalid values. \n"]
}
[@@ocaml.doc
  " Entity that comprises aggregated information on sensors having insufficient data. \n"]

type nonrec insufficient_sensor_data = {
  sensors_with_short_date_range : sensors_with_short_date_range;
      [@ocaml.doc
        " Parameter that describes the total number of sensors that have a short date range of \
         less than 14 days of data overall. \n"]
  missing_complete_sensor_data : missing_complete_sensor_data;
      [@ocaml.doc
        " Parameter that describes the total number of sensors that have data completely missing \
         for it. \n"]
}
[@@ocaml.doc
  " Entity that comprises aggregated information on sensors having insufficient data. \n"]

type nonrec inline_data_schema = string [@@ocaml.doc ""]

type nonrec ingested_files_summary = {
  discarded_files : list_of_discarded_files option;
      [@ocaml.doc
        "Indicates the number of files that were discarded. A file could be discarded because its \
         format is invalid (for example, a jpg or pdf) or not readable.\n"]
  ingested_number_of_files : integer;
      [@ocaml.doc "Indicates the number of files that were successfully ingested.\n"]
  total_number_of_files : integer;
      [@ocaml.doc "Indicates the total number of files that were submitted for ingestion.\n"]
}
[@@ocaml.doc
  "Gives statistics about how many files have been ingested, and which files have not been \
   ingested, for a particular ingestion job.\n"]

type nonrec inference_data_import_strategy =
  | OVERWRITE [@ocaml.doc ""]
  | ADD_WHEN_EMPTY [@ocaml.doc ""]
  | NO_IMPORT [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec import_model_version_response = {
  status : model_version_status option;
      [@ocaml.doc "The status of the [ImportModelVersion] operation. \n"]
  model_version : model_version option; [@ocaml.doc "The version of the model being created.\n"]
  model_version_arn : model_version_arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the model version being created. \n"]
  model_arn : model_arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the model being created. \n"]
  model_name : model_name option; [@ocaml.doc "The name for the machine learning model.\n"]
}
[@@ocaml.doc ""]

type nonrec import_model_version_request = {
  inference_data_import_strategy : inference_data_import_strategy option;
      [@ocaml.doc
        "Indicates how to import the accumulated inference data when a model version is imported. \
         The possible values are as follows:\n\n\
        \ {ul\n\
        \       {-  NO_IMPORT \226\128\147 Don't import the data.\n\
        \           \n\
        \            }\n\
        \       {-  ADD_WHEN_EMPTY \226\128\147 Only import the data from the source model if \
         there is no existing data in the target model.\n\
        \           \n\
        \            }\n\
        \       {-  OVERWRITE \226\128\147 Import the data from the source model and overwrite the \
         existing data in the target model.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  tags : tag_list option;
      [@ocaml.doc "The tags associated with the machine learning model to be created. \n"]
  server_side_kms_key_id : name_or_arn option;
      [@ocaml.doc
        "Provides the identifier of the KMS key key used to encrypt model data by Amazon Lookout \
         for Equipment. \n"]
  role_arn : iam_role_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of a role with permission to access the data source being \
         used to create the machine learning model. \n"]
  client_token : idempotence_token;
      [@ocaml.doc
        "A unique identifier for the request. If you do not set the client request token, Amazon \
         Lookout for Equipment generates one. \n"]
  labels_input_configuration : labels_input_configuration option; [@ocaml.doc ""]
  dataset_name : dataset_identifier;
      [@ocaml.doc "The name of the dataset for the machine learning model being imported. \n"]
  model_name : model_name option;
      [@ocaml.doc
        "The name for the machine learning model to be created. If the model already exists, \
         Amazon Lookout for Equipment creates a new version. If you do not specify this field, it \
         is filled with the name of the source model.\n"]
  source_model_version_arn : model_version_arn;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the model version to import.\n"]
}
[@@ocaml.doc ""]

type nonrec import_dataset_response = {
  job_id : ingestion_job_id option;
      [@ocaml.doc "A unique identifier for the job of importing the dataset.\n"]
  status : dataset_status option; [@ocaml.doc "The status of the [ImportDataset] operation.\n"]
  dataset_arn : dataset_arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the dataset that was imported.\n"]
  dataset_name : dataset_name option;
      [@ocaml.doc "The name of the created machine learning dataset.\n"]
}
[@@ocaml.doc ""]

type nonrec import_dataset_request = {
  tags : tag_list option; [@ocaml.doc "Any tags associated with the dataset to be created.\n"]
  server_side_kms_key_id : name_or_arn option;
      [@ocaml.doc
        "Provides the identifier of the KMS key key used to encrypt model data by Amazon Lookout \
         for Equipment. \n"]
  client_token : idempotence_token;
      [@ocaml.doc
        "A unique identifier for the request. If you do not set the client request token, Amazon \
         Lookout for Equipment generates one. \n"]
  dataset_name : dataset_name option;
      [@ocaml.doc
        "The name of the machine learning dataset to be created. If the dataset already exists, \
         Amazon Lookout for Equipment overwrites the existing dataset. If you don't specify this \
         field, it is filled with the name of the source dataset.\n"]
  source_dataset_arn : dataset_arn;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the dataset to import.\n"]
}
[@@ocaml.doc ""]

type nonrec duplicate_timestamps = {
  total_number_of_duplicate_timestamps : integer;
      [@ocaml.doc " Indicates the total number of duplicate timestamps. \n"]
}
[@@ocaml.doc " Entity that comprises information abount duplicate timestamps in the dataset. \n"]

type nonrec describe_retraining_scheduler_response = {
  updated_at : timestamp option;
      [@ocaml.doc "Indicates the time and date at which the retraining scheduler was updated. \n"]
  created_at : timestamp option;
      [@ocaml.doc "Indicates the time and date at which the retraining scheduler was created. \n"]
  promote_mode : model_promote_mode option;
      [@ocaml.doc
        "Indicates how the service uses new models. In [MANAGED] mode, new models are used for \
         inference if they have better performance than the current model. In [MANUAL] mode, the \
         new models are not used until they are \
         {{:https://docs.aws.amazon.com/lookout-for-equipment/latest/ug/versioning-model.html#model-activation}manually \
         activated}.\n"]
  status : retraining_scheduler_status option;
      [@ocaml.doc "The status of the retraining scheduler. \n"]
  lookback_window : lookback_window option;
      [@ocaml.doc "The number of past days of data used for retraining.\n"]
  retraining_frequency : retraining_frequency option;
      [@ocaml.doc
        "The frequency at which the model retraining is set. This follows the \
         {{:https://en.wikipedia.org/wiki/ISO_8601#Durations}ISO 8601} guidelines.\n"]
  retraining_start_date : timestamp option;
      [@ocaml.doc
        "The start date for the retraining scheduler. Lookout for Equipment truncates the time you \
         provide to the nearest UTC day.\n"]
  model_arn : model_arn option;
      [@ocaml.doc "The ARN of the model that the retraining scheduler is attached to. \n"]
  model_name : model_name option;
      [@ocaml.doc "The name of the model that the retraining scheduler is attached to. \n"]
}
[@@ocaml.doc ""]

type nonrec describe_retraining_scheduler_request = {
  model_name : model_name;
      [@ocaml.doc "The name of the model that the retraining scheduler is attached to. \n"]
}
[@@ocaml.doc ""]

type nonrec describe_resource_policy_response = {
  last_modified_time : timestamp option;
      [@ocaml.doc "The time when the resource policy was last modified.\n"]
  creation_time : timestamp option; [@ocaml.doc "The time when the resource policy was created.\n"]
  resource_policy : policy option; [@ocaml.doc "The resource policy in a JSON-formatted string.\n"]
  policy_revision_id : policy_revision_id option;
      [@ocaml.doc "A unique identifier for a revision of the resource policy.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_resource_policy_request = {
  resource_arn : resource_arn;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the resource that is associated with the resource policy.\n"]
}
[@@ocaml.doc ""]

type nonrec data_pre_processing_configuration = {
  target_sampling_rate : target_sampling_rate option;
      [@ocaml.doc
        "The sampling rate of the data after post processing by Amazon Lookout for Equipment. For \
         example, if you provide data that has been collected at a 1 second level and you want the \
         system to resample the data at a 1 minute rate before training, the [TargetSamplingRate] \
         is 1 minute.\n\n\
        \ When providing a value for the [TargetSamplingRate], you must attach the prefix \"PT\" \
         to the rate you want. The value for a 1 second rate is therefore {i PT1S}, the value for \
         a 15 minute rate is {i PT15M}, and the value for a 1 hour rate is {i PT1H} \n\
        \ "]
}
[@@ocaml.doc
  "The configuration is the [TargetSamplingRate], which is the sampling rate of the data after \
   post processing by Amazon Lookout for Equipment. For example, if you provide data that has been \
   collected at a 1 second level and you want the system to resample the data at a 1 minute rate \
   before training, the [TargetSamplingRate] is 1 minute.\n\n\
  \ When providing a value for the [TargetSamplingRate], you must attach the prefix \"PT\" to the \
   rate you want. The value for a 1 second rate is therefore {i PT1S}, the value for a 15 minute \
   rate is {i PT15M}, and the value for a 1 hour rate is {i PT1H} \n\
  \ "]

type nonrec data_size_in_bytes = Smaws_Lib.CoreTypes.Int64.t [@@ocaml.doc ""]

type nonrec auto_promotion_result =
  | RETRAINING_CANCELLED [@ocaml.doc ""]
  | RETRAINING_CUSTOMER_ERROR [@ocaml.doc ""]
  | RETRAINING_INTERNAL_ERROR [@ocaml.doc ""]
  | MODEL_NOT_PROMOTED [@ocaml.doc ""]
  | MODEL_PROMOTED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec auto_promotion_result_reason = string [@@ocaml.doc ""]

type nonrec describe_model_version_response = {
  model_quality : model_quality option;
      [@ocaml.doc
        "Provides a quality assessment for a model that uses labels. If Lookout for Equipment \
         determines that the model quality is poor based on training metrics, the value is \
         [POOR_QUALITY_DETECTED]. Otherwise, the value is [QUALITY_THRESHOLD_MET].\n\n\
        \ If the model is unlabeled, the model quality can't be assessed and the value of \
         [ModelQuality] is [CANNOT_DETERMINE_QUALITY]. In this situation, you can get a model \
         quality assessment by adding labels to the input dataset and retraining the model.\n\
        \ \n\
        \  For information about using labels with your models, see \
         {{:https://docs.aws.amazon.com/lookout-for-equipment/latest/ug/understanding-labeling.html}Understanding \
         labeling}.\n\
        \  \n\
        \   For information about improving the quality of a model, see \
         {{:https://docs.aws.amazon.com/lookout-for-equipment/latest/ug/best-practices.html}Best \
         practices with Amazon Lookout for Equipment}.\n\
        \   "]
  model_diagnostics_results_object : s3_object option;
      [@ocaml.doc
        "The Amazon S3 output prefix for where Lookout for Equipment saves the pointwise model \
         diagnostics for the model version.\n"]
  model_diagnostics_output_configuration : model_diagnostics_output_configuration option;
      [@ocaml.doc
        "The Amazon S3 location where Amazon Lookout for Equipment saves the pointwise model \
         diagnostics for the model version.\n"]
  auto_promotion_result_reason : auto_promotion_result_reason option;
      [@ocaml.doc
        "Indicates the reason for the [AutoPromotionResult]. For example, a model might not be \
         promoted if its performance was worse than the active version, if there was an error \
         during training, or if the retraining scheduler was using [MANUAL] promote mode. The \
         model will be promoted in [MANAGED] promote mode if the performance is better than the \
         previous model. \n"]
  auto_promotion_result : auto_promotion_result option;
      [@ocaml.doc
        "Indicates whether the model version was promoted to be the active version after \
         retraining or if there was an error with or cancellation of the retraining. \n"]
  retraining_available_data_in_days : integer option;
      [@ocaml.doc
        "Indicates the number of days of data used in the most recent scheduled retraining run. \n"]
  prior_model_metrics : model_metrics option;
      [@ocaml.doc
        "If the model version was retrained, this field shows a summary of the performance of the \
         prior model on the new training range. You can use the information in this JSON-formatted \
         object to compare the new model version and the prior model version.\n"]
  imported_data_size_in_bytes : data_size_in_bytes option;
      [@ocaml.doc
        "The size in bytes of the imported data. This field appears if the model version was \
         imported.\n"]
  import_job_end_time : timestamp option;
      [@ocaml.doc
        "The date and time when the import job completed. This field appears if the model version \
         was imported.\n"]
  import_job_start_time : timestamp option;
      [@ocaml.doc
        "The date and time when the import job began. This field appears if the model version was \
         imported.\n"]
  source_model_version_arn : model_version_arn option;
      [@ocaml.doc
        "If model version was imported, then this field is the arn of the source model version.\n"]
  off_condition : off_condition option;
      [@ocaml.doc
        "Indicates that the asset associated with this sensor has been shut off. As long as this \
         condition is met, Lookout for Equipment will not use data from this asset for training, \
         evaluation, or inference.\n"]
  server_side_kms_key_id : kms_key_arn option;
      [@ocaml.doc
        "The identifier of the KMS key key used to encrypt model version data by Amazon Lookout \
         for Equipment.\n"]
  created_at : timestamp option;
      [@ocaml.doc
        "Indicates the time and date at which the machine learning model version was created.\n"]
  last_updated_time : timestamp option;
      [@ocaml.doc "Indicates the last time the machine learning model version was updated.\n"]
  model_metrics : model_metrics option;
      [@ocaml.doc
        "Shows an aggregated summary, in JSON format, of the model's performance within the \
         evaluation time range. These metrics are created when evaluating the model.\n"]
  failed_reason : bounded_length_string option;
      [@ocaml.doc "The failure message if the training of the model version failed.\n"]
  training_execution_end_time : timestamp option;
      [@ocaml.doc "The time when the training of the version completed.\n"]
  training_execution_start_time : timestamp option;
      [@ocaml.doc "The time when the training of the version began.\n"]
  data_pre_processing_configuration : data_pre_processing_configuration option; [@ocaml.doc ""]
  role_arn : iam_role_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the role that was used to train the model version.\n"]
  evaluation_data_end_time : timestamp option;
      [@ocaml.doc
        "The date on which the data in the evaluation set began being gathered. If you imported \
         the version, this is the date that the evaluation set data in the source version finished \
         being gathered.\n"]
  evaluation_data_start_time : timestamp option;
      [@ocaml.doc
        "The date on which the data in the evaluation set began being gathered. If you imported \
         the version, this is the date that the evaluation set data in the source version began \
         being gathered.\n"]
  training_data_end_time : timestamp option;
      [@ocaml.doc
        "The date on which the training data finished being gathered. If you imported the version, \
         this is the date that the training data in the source version finished being gathered.\n"]
  training_data_start_time : timestamp option;
      [@ocaml.doc
        "The date on which the training data began being gathered. If you imported the version, \
         this is the date that the training data in the source version began being gathered.\n"]
  labels_input_configuration : labels_input_configuration option; [@ocaml.doc ""]
  schema : inline_data_schema option;
      [@ocaml.doc "The schema of the data used to train the model version.\n"]
  dataset_arn : dataset_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the dataset used to train the model version.\n"]
  dataset_name : dataset_name option;
      [@ocaml.doc "The name of the dataset used to train the model version.\n"]
  source_type : model_version_source_type option;
      [@ocaml.doc "Indicates whether this model version was created by training or by importing.\n"]
  status : model_version_status option; [@ocaml.doc "The current status of the model version.\n"]
  model_version_arn : model_version_arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the model version.\n"]
  model_version : model_version option; [@ocaml.doc "The version of the machine learning model.\n"]
  model_arn : model_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the parent machine learning model that this version \
         belong to.\n"]
  model_name : model_name option;
      [@ocaml.doc "The name of the machine learning model that this version belongs to.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_model_version_request = {
  model_version : model_version; [@ocaml.doc "The version of the machine learning model.\n"]
  model_name : model_name;
      [@ocaml.doc "The name of the machine learning model that this version belongs to.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_model_response = {
  model_quality : model_quality option;
      [@ocaml.doc
        "Provides a quality assessment for a model that uses labels. If Lookout for Equipment \
         determines that the model quality is poor based on training metrics, the value is \
         [POOR_QUALITY_DETECTED]. Otherwise, the value is [QUALITY_THRESHOLD_MET].\n\n\
        \ If the model is unlabeled, the model quality can't be assessed and the value of \
         [ModelQuality] is [CANNOT_DETERMINE_QUALITY]. In this situation, you can get a model \
         quality assessment by adding labels to the input dataset and retraining the model.\n\
        \ \n\
        \  For information about using labels with your models, see \
         {{:https://docs.aws.amazon.com/lookout-for-equipment/latest/ug/understanding-labeling.html}Understanding \
         labeling}.\n\
        \  \n\
        \   For information about improving the quality of a model, see \
         {{:https://docs.aws.amazon.com/lookout-for-equipment/latest/ug/best-practices.html}Best \
         practices with Amazon Lookout for Equipment}.\n\
        \   "]
  model_diagnostics_output_configuration : model_diagnostics_output_configuration option;
      [@ocaml.doc "Configuration information for the model's pointwise model diagnostics.\n"]
  retraining_scheduler_status : retraining_scheduler_status option;
      [@ocaml.doc "Indicates the status of the retraining scheduler. \n"]
  accumulated_inference_data_end_time : timestamp option;
      [@ocaml.doc "Indicates the end time of the inference data that has been accumulated. \n"]
  accumulated_inference_data_start_time : timestamp option;
      [@ocaml.doc "Indicates the start time of the inference data that has been accumulated. \n"]
  next_scheduled_retraining_start_date : timestamp option;
      [@ocaml.doc
        "Indicates the date and time that the next scheduled retraining run will start on. Lookout \
         for Equipment truncates the time you provide to the nearest UTC day.\n"]
  latest_scheduled_retraining_available_data_in_days : integer option;
      [@ocaml.doc
        "Indicates the number of days of data used in the most recent scheduled retraining run. \n"]
  latest_scheduled_retraining_start_time : timestamp option;
      [@ocaml.doc "Indicates the start time of the most recent scheduled retraining run. \n"]
  latest_scheduled_retraining_model_version : model_version option;
      [@ocaml.doc "Indicates the most recent model version that was generated by retraining. \n"]
  latest_scheduled_retraining_status : model_version_status option;
      [@ocaml.doc "Indicates the status of the most recent scheduled retraining run. \n"]
  latest_scheduled_retraining_failed_reason : bounded_length_string option;
      [@ocaml.doc
        "If the model version was generated by retraining and the training failed, this indicates \
         the reason for that failure. \n"]
  prior_model_metrics : synthesized_json_model_metrics option;
      [@ocaml.doc
        "If the model version was retrained, this field shows a summary of the performance of the \
         prior model on the new training range. You can use the information in this JSON-formatted \
         object to compare the new model version and the prior model version.\n"]
  previous_model_version_activated_at : timestamp option;
      [@ocaml.doc "The date and time when the previous active model version was activated.\n"]
  previous_active_model_version_arn : model_version_arn option;
      [@ocaml.doc
        "The ARN of the model version that was set as the active model version prior to the \
         current active model version.\n"]
  previous_active_model_version : model_version option;
      [@ocaml.doc
        "The model version that was set as the active model version prior to the current active \
         model version.\n"]
  model_version_activated_at : timestamp option;
      [@ocaml.doc "The date the active model version was activated.\n"]
  active_model_version_arn : model_version_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the model version used by the inference scheduler when \
         running a scheduled inference execution.\n"]
  active_model_version : model_version option;
      [@ocaml.doc
        "The name of the model version used by the inference schedular when running a scheduled \
         inference execution.\n"]
  import_job_end_time : timestamp option;
      [@ocaml.doc
        "The date and time when the import job was completed. This field appears if the active \
         model version was imported.\n"]
  import_job_start_time : timestamp option;
      [@ocaml.doc
        "The date and time when the import job was started. This field appears if the active model \
         version was imported.\n"]
  source_model_version_arn : model_version_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the source model version. This field appears if the \
         active model version was imported.\n"]
  off_condition : off_condition option;
      [@ocaml.doc
        "Indicates that the asset associated with this sensor has been shut off. As long as this \
         condition is met, Lookout for Equipment will not use data from this asset for training, \
         evaluation, or inference.\n"]
  server_side_kms_key_id : kms_key_arn option;
      [@ocaml.doc
        "Provides the identifier of the KMS key used to encrypt model data by Amazon Lookout for \
         Equipment. \n"]
  created_at : timestamp option;
      [@ocaml.doc "Indicates the time and date at which the machine learning model was created. \n"]
  last_updated_time : timestamp option;
      [@ocaml.doc
        "Indicates the last time the machine learning model was updated. The type of update is not \
         specified. \n"]
  model_metrics : synthesized_json_model_metrics option;
      [@ocaml.doc
        "The Model Metrics show an aggregated summary of the model's performance within the \
         evaluation time range. This is the JSON content of the metrics created when evaluating \
         the model. \n"]
  failed_reason : bounded_length_string option;
      [@ocaml.doc
        "If the training of the machine learning model failed, this indicates the reason for that \
         failure. \n"]
  training_execution_end_time : timestamp option;
      [@ocaml.doc
        "Indicates the time at which the training of the machine learning model was completed. \n"]
  training_execution_start_time : timestamp option;
      [@ocaml.doc
        "Indicates the time at which the training of the machine learning model began. \n"]
  status : model_status option;
      [@ocaml.doc
        "Specifies the current status of the model being described. Status describes the status of \
         the most recent action of the model. \n"]
  data_pre_processing_configuration : data_pre_processing_configuration option;
      [@ocaml.doc
        "The configuration is the [TargetSamplingRate], which is the sampling rate of the data \
         after post processing by Amazon Lookout for Equipment. For example, if you provide data \
         that has been collected at a 1 second level and you want the system to resample the data \
         at a 1 minute rate before training, the [TargetSamplingRate] is 1 minute.\n\n\
        \ When providing a value for the [TargetSamplingRate], you must attach the prefix \"PT\" \
         to the rate you want. The value for a 1 second rate is therefore {i PT1S}, the value for \
         a 15 minute rate is {i PT15M}, and the value for a 1 hour rate is {i PT1H} \n\
        \ "]
  role_arn : iam_role_arn option;
      [@ocaml.doc
        " The Amazon Resource Name (ARN) of a role with permission to access the data source for \
         the machine learning model being described. \n"]
  evaluation_data_end_time : timestamp option;
      [@ocaml.doc
        " Indicates the time reference in the dataset that was used to end the subset of \
         evaluation data for the machine learning model. \n"]
  evaluation_data_start_time : timestamp option;
      [@ocaml.doc
        " Indicates the time reference in the dataset that was used to begin the subset of \
         evaluation data for the machine learning model. \n"]
  training_data_end_time : timestamp option;
      [@ocaml.doc
        " Indicates the time reference in the dataset that was used to end the subset of training \
         data for the machine learning model. \n"]
  training_data_start_time : timestamp option;
      [@ocaml.doc
        " Indicates the time reference in the dataset that was used to begin the subset of \
         training data for the machine learning model. \n"]
  labels_input_configuration : labels_input_configuration option;
      [@ocaml.doc
        "Specifies configuration information about the labels input, including its S3 location. \n"]
  schema : synthesized_json_inline_data_schema option;
      [@ocaml.doc
        "A JSON description of the data that is in each time series dataset, including names, \
         column names, and data types. \n"]
  dataset_arn : dataset_arn option;
      [@ocaml.doc
        "The Amazon Resouce Name (ARN) of the dataset used to create the machine learning model \
         being described. \n"]
  dataset_name : dataset_name option;
      [@ocaml.doc "The name of the dataset being used by the machine learning being described. \n"]
  model_arn : model_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the machine learning model being described. \n"]
  model_name : model_name option;
      [@ocaml.doc "The name of the machine learning model being described. \n"]
}
[@@ocaml.doc ""]

type nonrec describe_model_request = {
  model_name : model_name; [@ocaml.doc "The name of the machine learning model to be described. \n"]
}
[@@ocaml.doc ""]

type nonrec comments = string [@@ocaml.doc ""]

type nonrec describe_label_response = {
  created_at : timestamp option; [@ocaml.doc " The time at which the label was created. \n"]
  equipment : equipment option;
      [@ocaml.doc " Indicates that a label pertains to a particular piece of equipment. \n"]
  notes : comments option;
      [@ocaml.doc
        "Metadata providing additional information about the label.\n\n\
        \ Data in this field will be retained for service usage. Follow best practices for the \
         security of your data.\n\
        \ "]
  fault_code : fault_code option;
      [@ocaml.doc
        " Indicates the type of anomaly associated with the label. \n\n\
        \ Data in this field will be retained for service usage. Follow best practices for the \
         security of your data.\n\
        \ "]
  rating : label_rating option;
      [@ocaml.doc " Indicates whether a labeled event represents an anomaly. \n"]
  end_time : timestamp option; [@ocaml.doc " The end time of the requested label. \n"]
  start_time : timestamp option; [@ocaml.doc " The start time of the requested label. \n"]
  label_id : label_id option; [@ocaml.doc " The ID of the requested label. \n"]
  label_group_arn : label_group_arn option;
      [@ocaml.doc " The Amazon Resource Name (ARN) of the requested label group. \n"]
  label_group_name : label_group_name option;
      [@ocaml.doc " The name of the requested label group. \n"]
}
[@@ocaml.doc ""]

type nonrec describe_label_request = {
  label_id : label_id; [@ocaml.doc " Returns the ID of the label. \n"]
  label_group_name : label_group_name;
      [@ocaml.doc " Returns the name of the group containing the label. \n"]
}
[@@ocaml.doc ""]

type nonrec describe_label_group_response = {
  updated_at : timestamp option; [@ocaml.doc " The time at which the label group was updated. \n"]
  created_at : timestamp option; [@ocaml.doc " The time at which the label group was created. \n"]
  fault_codes : fault_codes option;
      [@ocaml.doc
        " Codes indicating the type of anomaly associated with the labels in the lagbel group. \n"]
  label_group_arn : label_group_arn option;
      [@ocaml.doc " The Amazon Resource Name (ARN) of the label group. \n"]
  label_group_name : label_group_name option; [@ocaml.doc " The name of the label group. \n"]
}
[@@ocaml.doc ""]

type nonrec describe_label_group_request = {
  label_group_name : label_group_name; [@ocaml.doc " Returns the name of the label group. \n"]
}
[@@ocaml.doc ""]

type nonrec describe_inference_scheduler_response = {
  latest_inference_result : latest_inference_result option;
      [@ocaml.doc
        "Indicates whether the latest execution for the inference scheduler was Anomalous \
         (anomalous events found) or Normal (no anomalous events found).\n"]
  server_side_kms_key_id : kms_key_arn option;
      [@ocaml.doc
        "Provides the identifier of the KMS key used to encrypt inference scheduler data by Amazon \
         Lookout for Equipment. \n"]
  role_arn : iam_role_arn option;
      [@ocaml.doc
        " The Amazon Resource Name (ARN) of a role with permission to access the data source for \
         the inference scheduler being described. \n"]
  data_output_configuration : inference_output_configuration option;
      [@ocaml.doc
        " Specifies information for the output results for the inference scheduler, including the \
         output S3 location. \n"]
  data_input_configuration : inference_input_configuration option;
      [@ocaml.doc
        " Specifies configuration information for the input data for the inference scheduler, \
         including delimiter, format, and dataset location. \n"]
  updated_at : timestamp option;
      [@ocaml.doc
        "Specifies the time at which the inference scheduler was last updated, if it was. \n"]
  created_at : timestamp option;
      [@ocaml.doc "Specifies the time at which the inference scheduler was created. \n"]
  data_upload_frequency : data_upload_frequency option;
      [@ocaml.doc
        "Specifies how often data is uploaded to the source S3 bucket for the input data. This \
         value is the length of time between data uploads. For instance, if you select 5 minutes, \
         Amazon Lookout for Equipment will upload the real-time data to the source bucket once \
         every 5 minutes. This frequency also determines how often Amazon Lookout for Equipment \
         starts a scheduled inference on your data. In this example, it starts once every 5 \
         minutes. \n"]
  data_delay_offset_in_minutes : data_delay_offset_in_minutes option;
      [@ocaml.doc
        " A period of time (in minutes) by which inference on the data is delayed after the data \
         starts. For instance, if you select an offset delay time of five minutes, inference will \
         not begin on the data until the first data measurement after the five minute mark. For \
         example, if five minutes is selected, the inference scheduler will wake up at the \
         configured frequency with the additional five minute delay time to check the customer S3 \
         bucket. The customer can upload data at the same frequency and they don't need to stop \
         and restart the scheduler when uploading new data.\n"]
  status : inference_scheduler_status option;
      [@ocaml.doc "Indicates the status of the inference scheduler. \n"]
  inference_scheduler_arn : inference_scheduler_arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the inference scheduler being described. \n"]
  inference_scheduler_name : inference_scheduler_name option;
      [@ocaml.doc "The name of the inference scheduler being described. \n"]
  model_name : model_name option;
      [@ocaml.doc
        "The name of the machine learning model of the inference scheduler being described. \n"]
  model_arn : model_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the machine learning model of the inference scheduler \
         being described. \n"]
}
[@@ocaml.doc ""]

type nonrec describe_inference_scheduler_request = {
  inference_scheduler_name : inference_scheduler_identifier;
      [@ocaml.doc "The name of the inference scheduler being described. \n"]
}
[@@ocaml.doc ""]

type nonrec data_quality_summary = {
  duplicate_timestamps : duplicate_timestamps;
      [@ocaml.doc
        " Parameter that gives information about duplicate timestamps in the input data. \n"]
  unsupported_timestamps : unsupported_timestamps;
      [@ocaml.doc
        " Parameter that gives information about unsupported timestamps in the input data. \n"]
  invalid_sensor_data : invalid_sensor_data;
      [@ocaml.doc
        " Parameter that gives information about data that is invalid over all the sensors in the \
         input data. \n"]
  missing_sensor_data : missing_sensor_data;
      [@ocaml.doc
        " Parameter that gives information about data that is missing over all the sensors in the \
         input data. \n"]
  insufficient_sensor_data : insufficient_sensor_data;
      [@ocaml.doc
        " Parameter that gives information about insufficient data for sensors in the dataset. \
         This includes information about those sensors that have complete data missing and those \
         with a short date range. \n"]
}
[@@ocaml.doc
  " DataQualitySummary gives aggregated statistics over all the sensors about a completed \
   ingestion job. It primarily gives more information about statistics over different incorrect \
   data like MissingCompleteSensorData, MissingSensorData, UnsupportedDateFormats, \
   InsufficientSensorData, DuplicateTimeStamps. \n"]

type nonrec describe_dataset_response = {
  source_dataset_arn : dataset_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the source dataset from which the current data being \
         described was imported from.\n"]
  data_end_time : timestamp option;
      [@ocaml.doc
        " Indicates the latest timestamp corresponding to data that was successfully ingested \
         during the most recent ingestion of this particular dataset. \n"]
  data_start_time : timestamp option;
      [@ocaml.doc
        " Indicates the earliest timestamp corresponding to data that was successfully ingested \
         during the most recent ingestion of this particular dataset. \n"]
  role_arn : iam_role_arn option;
      [@ocaml.doc
        " The Amazon Resource Name (ARN) of the IAM role that you are using for this the data \
         ingestion job. \n"]
  ingested_files_summary : ingested_files_summary option;
      [@ocaml.doc
        "IngestedFilesSummary associated with the given dataset for the latest successful \
         associated ingestion job id. \n"]
  data_quality_summary : data_quality_summary option;
      [@ocaml.doc
        " Gives statistics associated with the given dataset for the latest successful associated \
         ingestion job id. These statistics primarily relate to quantifying incorrect data such as \
         MissingCompleteSensorData, MissingSensorData, UnsupportedDateFormats, \
         InsufficientSensorData, and DuplicateTimeStamps. \n"]
  ingestion_input_configuration : ingestion_input_configuration option;
      [@ocaml.doc
        "Specifies the S3 location configuration for the data input for the data ingestion job. \n"]
  server_side_kms_key_id : kms_key_arn option;
      [@ocaml.doc
        "Provides the identifier of the KMS key used to encrypt dataset data by Amazon Lookout for \
         Equipment. \n"]
  schema : synthesized_json_inline_data_schema option;
      [@ocaml.doc
        "A JSON description of the data that is in each time series dataset, including names, \
         column names, and data types. \n"]
  status : dataset_status option; [@ocaml.doc "Indicates the status of the dataset. \n"]
  last_updated_at : timestamp option;
      [@ocaml.doc "Specifies the time the dataset was last updated, if it was. \n"]
  created_at : timestamp option;
      [@ocaml.doc "Specifies the time the dataset was created in Lookout for Equipment. \n"]
  dataset_arn : dataset_arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the dataset being described. \n"]
  dataset_name : dataset_name option; [@ocaml.doc "The name of the dataset being described. \n"]
}
[@@ocaml.doc ""]

type nonrec describe_dataset_request = {
  dataset_name : dataset_identifier; [@ocaml.doc "The name of the dataset to be described. \n"]
}
[@@ocaml.doc ""]

type nonrec describe_data_ingestion_job_response = {
  source_dataset_arn : dataset_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the source dataset from which the data used for the \
         data ingestion job was imported from.\n"]
  data_end_time : timestamp option;
      [@ocaml.doc
        " Indicates the latest timestamp corresponding to data that was successfully ingested \
         during this specific ingestion job. \n"]
  data_start_time : timestamp option;
      [@ocaml.doc
        " Indicates the earliest timestamp corresponding to data that was successfully ingested \
         during this specific ingestion job. \n"]
  ingested_data_size : data_size_in_bytes option;
      [@ocaml.doc " Indicates the size of the ingested dataset. \n"]
  status_detail : bounded_length_string option;
      [@ocaml.doc
        " Provides details about status of the ingestion job that is currently in progress. \n"]
  ingested_files_summary : ingested_files_summary option; [@ocaml.doc ""]
  data_quality_summary : data_quality_summary option;
      [@ocaml.doc
        " Gives statistics about a completed ingestion job. These statistics primarily relate to \
         quantifying incorrect data such as MissingCompleteSensorData, MissingSensorData, \
         UnsupportedDateFormats, InsufficientSensorData, and DuplicateTimeStamps. \n"]
  failed_reason : bounded_length_string option;
      [@ocaml.doc "Specifies the reason for failure when a data ingestion job has failed. \n"]
  status : ingestion_job_status option;
      [@ocaml.doc "Indicates the status of the [DataIngestionJob] operation. \n"]
  created_at : timestamp option;
      [@ocaml.doc "The time at which the data ingestion job was created. \n"]
  role_arn : iam_role_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of an IAM role with permission to access the data source \
         being ingested. \n"]
  ingestion_input_configuration : ingestion_input_configuration option;
      [@ocaml.doc
        "Specifies the S3 location configuration for the data input for the data ingestion job. \n"]
  dataset_arn : dataset_arn option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the dataset being used in the data ingestion job. \n"]
  job_id : ingestion_job_id option; [@ocaml.doc "Indicates the job ID of the data ingestion job. \n"]
}
[@@ocaml.doc ""]

type nonrec describe_data_ingestion_job_request = {
  job_id : ingestion_job_id; [@ocaml.doc "The job ID of the data ingestion job. \n"]
}
[@@ocaml.doc ""]

type nonrec delete_retraining_scheduler_request = {
  model_name : model_name;
      [@ocaml.doc "The name of the model whose retraining scheduler you want to delete. \n"]
}
[@@ocaml.doc ""]

type nonrec delete_resource_policy_request = {
  resource_arn : resource_arn;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the resource for which the resource policy should be \
         deleted.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_model_request = {
  model_name : model_name; [@ocaml.doc "The name of the machine learning model to be deleted. \n"]
}
[@@ocaml.doc ""]

type nonrec delete_label_request = {
  label_id : label_id; [@ocaml.doc " The ID of the label that you want to delete. \n"]
  label_group_name : label_group_name;
      [@ocaml.doc
        " The name of the label group that contains the label that you want to delete. Data in \
         this field will be retained for service usage. Follow best practices for the security of \
         your data. \n"]
}
[@@ocaml.doc ""]

type nonrec delete_label_group_request = {
  label_group_name : label_group_name;
      [@ocaml.doc
        " The name of the label group that you want to delete. Data in this field will be retained \
         for service usage. Follow best practices for the security of your data. \n"]
}
[@@ocaml.doc ""]

type nonrec delete_inference_scheduler_request = {
  inference_scheduler_name : inference_scheduler_identifier;
      [@ocaml.doc "The name of the inference scheduler to be deleted. \n"]
}
[@@ocaml.doc ""]

type nonrec delete_dataset_request = {
  dataset_name : dataset_identifier; [@ocaml.doc "The name of the dataset to be deleted. \n"]
}
[@@ocaml.doc ""]

type nonrec dataset_schema = {
  inline_data_schema : synthesized_json_inline_data_schema option;
      [@ocaml.doc "The data schema used within the given dataset.\n"]
}
[@@ocaml.doc "Provides information about the data schema used with the given dataset. \n"]

type nonrec create_retraining_scheduler_response = {
  status : retraining_scheduler_status option;
      [@ocaml.doc "The status of the retraining scheduler. \n"]
  model_arn : model_arn option;
      [@ocaml.doc "The ARN of the model that you added the retraining scheduler to. \n"]
  model_name : model_name option;
      [@ocaml.doc "The name of the model that you added the retraining scheduler to. \n"]
}
[@@ocaml.doc ""]

type nonrec create_retraining_scheduler_request = {
  client_token : idempotence_token;
      [@ocaml.doc
        "A unique identifier for the request. If you do not set the client request token, Amazon \
         Lookout for Equipment generates one. \n"]
  promote_mode : model_promote_mode option;
      [@ocaml.doc
        "Indicates how the service will use new models. In [MANAGED] mode, new models will \
         automatically be used for inference if they have better performance than the current \
         model. In [MANUAL] mode, the new models will not be used \
         {{:https://docs.aws.amazon.com/lookout-for-equipment/latest/ug/versioning-model.html#model-activation}until \
         they are manually activated}.\n"]
  lookback_window : lookback_window;
      [@ocaml.doc "The number of past days of data that will be used for retraining.\n"]
  retraining_frequency : retraining_frequency;
      [@ocaml.doc
        "This parameter uses the {{:https://en.wikipedia.org/wiki/ISO_8601#Durations}ISO 8601} \
         standard to set the frequency at which you want retraining to occur in terms of Years, \
         Months, and/or Days (note: other parameters like Time are not currently supported). The \
         minimum value is 30 days (P30D) and the maximum value is 1 year (P1Y). For example, the \
         following values are valid:\n\n\
        \ {ul\n\
        \       {-  P3M15D \226\128\147 Every 3 months and 15 days\n\
        \           \n\
        \            }\n\
        \       {-  P2M \226\128\147 Every 2 months\n\
        \           \n\
        \            }\n\
        \       {-  P150D \226\128\147 Every 150 days\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  retraining_start_date : timestamp option;
      [@ocaml.doc
        "The start date for the retraining scheduler. Lookout for Equipment truncates the time you \
         provide to the nearest UTC day.\n"]
  model_name : model_name;
      [@ocaml.doc "The name of the model to add the retraining scheduler to. \n"]
}
[@@ocaml.doc ""]

type nonrec create_model_response = {
  status : model_status option;
      [@ocaml.doc "Indicates the status of the [CreateModel] operation. \n"]
  model_arn : model_arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the model being created. \n"]
}
[@@ocaml.doc ""]

type nonrec create_model_request = {
  model_diagnostics_output_configuration : model_diagnostics_output_configuration option;
      [@ocaml.doc
        "The Amazon S3 location where you want Amazon Lookout for Equipment to save the pointwise \
         model diagnostics. You must also specify the [RoleArn] request parameter.\n"]
  off_condition : off_condition option;
      [@ocaml.doc
        "Indicates that the asset associated with this sensor has been shut off. As long as this \
         condition is met, Lookout for Equipment will not use data from this asset for training, \
         evaluation, or inference.\n"]
  tags : tag_list option;
      [@ocaml.doc " Any tags associated with the machine learning model being created. \n"]
  server_side_kms_key_id : name_or_arn option;
      [@ocaml.doc
        "Provides the identifier of the KMS key used to encrypt model data by Amazon Lookout for \
         Equipment. \n"]
  data_pre_processing_configuration : data_pre_processing_configuration option;
      [@ocaml.doc
        "The configuration is the [TargetSamplingRate], which is the sampling rate of the data \
         after post processing by Amazon Lookout for Equipment. For example, if you provide data \
         that has been collected at a 1 second level and you want the system to resample the data \
         at a 1 minute rate before training, the [TargetSamplingRate] is 1 minute.\n\n\
        \ When providing a value for the [TargetSamplingRate], you must attach the prefix \"PT\" \
         to the rate you want. The value for a 1 second rate is therefore {i PT1S}, the value for \
         a 15 minute rate is {i PT15M}, and the value for a 1 hour rate is {i PT1H} \n\
        \ "]
  role_arn : iam_role_arn option;
      [@ocaml.doc
        " The Amazon Resource Name (ARN) of a role with permission to access the data source being \
         used to create the machine learning model. \n"]
  evaluation_data_end_time : timestamp option;
      [@ocaml.doc
        " Indicates the time reference in the dataset that should be used to end the subset of \
         evaluation data for the machine learning model. \n"]
  evaluation_data_start_time : timestamp option;
      [@ocaml.doc
        "Indicates the time reference in the dataset that should be used to begin the subset of \
         evaluation data for the machine learning model. \n"]
  training_data_end_time : timestamp option;
      [@ocaml.doc
        "Indicates the time reference in the dataset that should be used to end the subset of \
         training data for the machine learning model. \n"]
  training_data_start_time : timestamp option;
      [@ocaml.doc
        "Indicates the time reference in the dataset that should be used to begin the subset of \
         training data for the machine learning model. \n"]
  client_token : idempotence_token;
      [@ocaml.doc
        "A unique identifier for the request. If you do not set the client request token, Amazon \
         Lookout for Equipment generates one. \n"]
  labels_input_configuration : labels_input_configuration option;
      [@ocaml.doc
        "The input configuration for the labels being used for the machine learning model that's \
         being created. \n"]
  dataset_schema : dataset_schema option;
      [@ocaml.doc "The data schema for the machine learning model being created. \n"]
  dataset_name : dataset_identifier;
      [@ocaml.doc "The name of the dataset for the machine learning model being created. \n"]
  model_name : model_name; [@ocaml.doc "The name for the machine learning model to be created.\n"]
}
[@@ocaml.doc ""]

type nonrec create_label_response = {
  label_id : label_id option; [@ocaml.doc " The ID of the label that you have created. \n"]
}
[@@ocaml.doc ""]

type nonrec create_label_request = {
  client_token : idempotence_token;
      [@ocaml.doc
        " A unique identifier for the request to create a label. If you do not set the client \
         request token, Lookout for Equipment generates one. \n"]
  equipment : equipment option;
      [@ocaml.doc
        " Indicates that a label pertains to a particular piece of equipment. \n\n\
        \ Data in this field will be retained for service usage. Follow best practices for the \
         security of your data.\n\
        \ "]
  notes : comments option;
      [@ocaml.doc
        " Metadata providing additional information about the label. \n\n\
        \ Data in this field will be retained for service usage. Follow best practices for the \
         security of your data.\n\
        \ "]
  fault_code : fault_code option;
      [@ocaml.doc
        " Provides additional information about the label. The fault code must be defined in the \
         FaultCodes attribute of the label group.\n\n\
        \ Data in this field will be retained for service usage. Follow best practices for the \
         security of your data. \n\
        \ "]
  rating : label_rating; [@ocaml.doc " Indicates whether a labeled event represents an anomaly. \n"]
  end_time : timestamp; [@ocaml.doc " The end time of the labeled event. \n"]
  start_time : timestamp; [@ocaml.doc " The start time of the labeled event. \n"]
  label_group_name : label_group_name;
      [@ocaml.doc
        " The name of a group of labels. \n\n\
        \ Data in this field will be retained for service usage. Follow best practices for the \
         security of your data. \n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec create_label_group_response = {
  label_group_arn : label_group_arn option;
      [@ocaml.doc " The Amazon Resource Name (ARN) of the label group that you have created. \n"]
  label_group_name : label_group_name option;
      [@ocaml.doc
        " The name of the label group that you have created. Data in this field will be retained \
         for service usage. Follow best practices for the security of your data. \n"]
}
[@@ocaml.doc ""]

type nonrec create_label_group_request = {
  tags : tag_list option;
      [@ocaml.doc
        " Tags that provide metadata about the label group you are creating. \n\n\
        \ Data in this field will be retained for service usage. Follow best practices for the \
         security of your data.\n\
        \ "]
  client_token : idempotence_token;
      [@ocaml.doc
        " A unique identifier for the request to create a label group. If you do not set the \
         client request token, Lookout for Equipment generates one. \n"]
  fault_codes : fault_codes option;
      [@ocaml.doc
        " The acceptable fault codes (indicating the type of anomaly associated with the label) \
         that can be used with this label group.\n\n\
        \ Data in this field will be retained for service usage. Follow best practices for the \
         security of your data.\n\
        \ "]
  label_group_name : label_group_name;
      [@ocaml.doc
        " Names a group of labels.\n\n\
        \ Data in this field will be retained for service usage. Follow best practices for the \
         security of your data. \n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec create_inference_scheduler_response = {
  model_quality : model_quality option;
      [@ocaml.doc
        "Provides a quality assessment for a model that uses labels. If Lookout for Equipment \
         determines that the model quality is poor based on training metrics, the value is \
         [POOR_QUALITY_DETECTED]. Otherwise, the value is [QUALITY_THRESHOLD_MET]. \n\n\
        \ If the model is unlabeled, the model quality can't be assessed and the value of \
         [ModelQuality] is [CANNOT_DETERMINE_QUALITY]. In this situation, you can get a model \
         quality assessment by adding labels to the input dataset and retraining the model.\n\
        \ \n\
        \  For information about using labels with your models, see \
         {{:https://docs.aws.amazon.com/lookout-for-equipment/latest/ug/understanding-labeling.html}Understanding \
         labeling}.\n\
        \  \n\
        \   For information about improving the quality of a model, see \
         {{:https://docs.aws.amazon.com/lookout-for-equipment/latest/ug/best-practices.html}Best \
         practices with Amazon Lookout for Equipment}.\n\
        \   "]
  status : inference_scheduler_status option;
      [@ocaml.doc "Indicates the status of the [CreateInferenceScheduler] operation. \n"]
  inference_scheduler_name : inference_scheduler_name option;
      [@ocaml.doc "The name of inference scheduler being created. \n"]
  inference_scheduler_arn : inference_scheduler_arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the inference scheduler being created. \n"]
}
[@@ocaml.doc ""]

type nonrec create_inference_scheduler_request = {
  tags : tag_list option; [@ocaml.doc "Any tags associated with the inference scheduler. \n"]
  client_token : idempotence_token;
      [@ocaml.doc
        " A unique identifier for the request. If you do not set the client request token, Amazon \
         Lookout for Equipment generates one. \n"]
  server_side_kms_key_id : name_or_arn option;
      [@ocaml.doc
        "Provides the identifier of the KMS key used to encrypt inference scheduler data by Amazon \
         Lookout for Equipment. \n"]
  role_arn : iam_role_arn;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of a role with permission to access the data source being \
         used for the inference. \n"]
  data_output_configuration : inference_output_configuration;
      [@ocaml.doc
        "Specifies configuration information for the output results for the inference scheduler, \
         including the S3 location for the output. \n"]
  data_input_configuration : inference_input_configuration;
      [@ocaml.doc
        "Specifies configuration information for the input data for the inference scheduler, \
         including delimiter, format, and dataset location. \n"]
  data_upload_frequency : data_upload_frequency;
      [@ocaml.doc
        " How often data is uploaded to the source Amazon S3 bucket for the input data. The value \
         chosen is the length of time between data uploads. For instance, if you select 5 minutes, \
         Amazon Lookout for Equipment will upload the real-time data to the source bucket once \
         every 5 minutes. This frequency also determines how often Amazon Lookout for Equipment \
         runs inference on your data.\n\n\
        \ For more information, see \
         {{:https://docs.aws.amazon.com/lookout-for-equipment/latest/ug/understanding-inference-process.html}Understanding \
         the inference process}.\n\
        \ "]
  data_delay_offset_in_minutes : data_delay_offset_in_minutes option;
      [@ocaml.doc
        "The interval (in minutes) of planned delay at the start of each inference segment. For \
         example, if inference is set to run every ten minutes, the delay is set to five minutes \
         and the time is 09:08. The inference scheduler will wake up at the configured interval \
         (which, without a delay configured, would be 09:10) plus the additional five minute delay \
         time (so 09:15) to check your Amazon S3 bucket. The delay provides a buffer for you to \
         upload data at the same frequency, so that you don't have to stop and restart the \
         scheduler when uploading new data.\n\n\
        \ For more information, see \
         {{:https://docs.aws.amazon.com/lookout-for-equipment/latest/ug/understanding-inference-process.html}Understanding \
         the inference process}.\n\
        \ "]
  inference_scheduler_name : inference_scheduler_name;
      [@ocaml.doc "The name of the inference scheduler being created. \n"]
  model_name : model_name;
      [@ocaml.doc
        "The name of the previously trained machine learning model being used to create the \
         inference scheduler. \n"]
}
[@@ocaml.doc ""]

type nonrec create_dataset_response = {
  status : dataset_status option;
      [@ocaml.doc "Indicates the status of the [CreateDataset] operation. \n"]
  dataset_arn : dataset_arn option;
      [@ocaml.doc " The Amazon Resource Name (ARN) of the dataset being created. \n"]
  dataset_name : dataset_name option; [@ocaml.doc "The name of the dataset being created. \n"]
}
[@@ocaml.doc ""]

type nonrec create_dataset_request = {
  tags : tag_list option;
      [@ocaml.doc "Any tags associated with the ingested data described in the dataset. \n"]
  client_token : idempotence_token;
      [@ocaml.doc
        " A unique identifier for the request. If you do not set the client request token, Amazon \
         Lookout for Equipment generates one. \n"]
  server_side_kms_key_id : name_or_arn option;
      [@ocaml.doc
        "Provides the identifier of the KMS key used to encrypt dataset data by Amazon Lookout for \
         Equipment. \n"]
  dataset_schema : dataset_schema option;
      [@ocaml.doc
        "A JSON description of the data that is in each time series dataset, including names, \
         column names, and data types. \n"]
  dataset_name : dataset_name; [@ocaml.doc "The name of the dataset being created. \n"]
}
[@@ocaml.doc ""]
