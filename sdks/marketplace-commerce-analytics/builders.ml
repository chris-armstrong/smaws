open Types

let make_start_support_data_export_request
    ?customer_defined_values:(customer_defined_values_ : customer_defined_values option)
    ?destination_s3_prefix:(destination_s3_prefix_ : destination_s3_prefix option)
    ~sns_topic_arn:(sns_topic_arn_ : sns_topic_arn)
    ~destination_s3_bucket_name:(destination_s3_bucket_name_ : destination_s3_bucket_name)
    ~role_name_arn:(role_name_arn_ : role_name_arn) ~from_date:(from_date_ : from_date)
    ~data_set_type:(data_set_type_ : support_data_set_type) () =
  ({
     customer_defined_values = customer_defined_values_;
     sns_topic_arn = sns_topic_arn_;
     destination_s3_prefix = destination_s3_prefix_;
     destination_s3_bucket_name = destination_s3_bucket_name_;
     role_name_arn = role_name_arn_;
     from_date = from_date_;
     data_set_type = data_set_type_;
   }
    : start_support_data_export_request)

let make_generate_data_set_request
    ?customer_defined_values:(customer_defined_values_ : customer_defined_values option)
    ?destination_s3_prefix:(destination_s3_prefix_ : destination_s3_prefix option)
    ~sns_topic_arn:(sns_topic_arn_ : sns_topic_arn)
    ~destination_s3_bucket_name:(destination_s3_bucket_name_ : destination_s3_bucket_name)
    ~role_name_arn:(role_name_arn_ : role_name_arn)
    ~data_set_publication_date:(data_set_publication_date_ : data_set_publication_date)
    ~data_set_type:(data_set_type_ : data_set_type) () =
  ({
     customer_defined_values = customer_defined_values_;
     sns_topic_arn = sns_topic_arn_;
     destination_s3_prefix = destination_s3_prefix_;
     destination_s3_bucket_name = destination_s3_bucket_name_;
     role_name_arn = role_name_arn_;
     data_set_publication_date = data_set_publication_date_;
     data_set_type = data_set_type_;
   }
    : generate_data_set_request)
