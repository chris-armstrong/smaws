open Types

val make_start_support_data_export_request :
  ?customer_defined_values:customer_defined_values ->
  ?destination_s3_prefix:destination_s3_prefix ->
  sns_topic_arn:sns_topic_arn ->
  destination_s3_bucket_name:destination_s3_bucket_name ->
  role_name_arn:role_name_arn ->
  from_date:from_date ->
  data_set_type:support_data_set_type ->
  unit ->
  start_support_data_export_request

val make_generate_data_set_request :
  ?customer_defined_values:customer_defined_values ->
  ?destination_s3_prefix:destination_s3_prefix ->
  sns_topic_arn:sns_topic_arn ->
  destination_s3_bucket_name:destination_s3_bucket_name ->
  role_name_arn:role_name_arn ->
  data_set_publication_date:data_set_publication_date ->
  data_set_type:data_set_type ->
  unit ->
  generate_data_set_request
