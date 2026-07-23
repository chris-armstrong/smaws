open Types

val make_generate_data_set_request :
  ?destination_s3_prefix:destination_s3_prefix ->
  ?customer_defined_values:customer_defined_values ->
  data_set_type:data_set_type ->
  data_set_publication_date:data_set_publication_date ->
  role_name_arn:role_name_arn ->
  destination_s3_bucket_name:destination_s3_bucket_name ->
  sns_topic_arn:sns_topic_arn ->
  unit ->
  generate_data_set_request

val make_start_support_data_export_request :
  ?destination_s3_prefix:destination_s3_prefix ->
  ?customer_defined_values:customer_defined_values ->
  data_set_type:support_data_set_type ->
  from_date:from_date ->
  role_name_arn:role_name_arn ->
  destination_s3_bucket_name:destination_s3_bucket_name ->
  sns_topic_arn:sns_topic_arn ->
  unit ->
  start_support_data_export_request
