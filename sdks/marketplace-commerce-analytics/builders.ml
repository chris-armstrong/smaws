open Types

let make_generate_data_set_request
    ?destination_s3_prefix:(destination_s3_prefix_ : destination_s3_prefix option)
    ?customer_defined_values:(customer_defined_values_ : customer_defined_values option)
    ~data_set_type:(data_set_type_ : data_set_type)
    ~data_set_publication_date:(data_set_publication_date_ : data_set_publication_date)
    ~role_name_arn:(role_name_arn_ : role_name_arn)
    ~destination_s3_bucket_name:(destination_s3_bucket_name_ : destination_s3_bucket_name)
    ~sns_topic_arn:(sns_topic_arn_ : sns_topic_arn) () =
  ({
     data_set_type = data_set_type_;
     data_set_publication_date = data_set_publication_date_;
     role_name_arn = role_name_arn_;
     destination_s3_bucket_name = destination_s3_bucket_name_;
     destination_s3_prefix = destination_s3_prefix_;
     sns_topic_arn = sns_topic_arn_;
     customer_defined_values = customer_defined_values_;
   }
    : generate_data_set_request)

let make_start_support_data_export_request
    ?destination_s3_prefix:(destination_s3_prefix_ : destination_s3_prefix option)
    ?customer_defined_values:(customer_defined_values_ : customer_defined_values option)
    ~data_set_type:(data_set_type_ : support_data_set_type) ~from_date:(from_date_ : from_date)
    ~role_name_arn:(role_name_arn_ : role_name_arn)
    ~destination_s3_bucket_name:(destination_s3_bucket_name_ : destination_s3_bucket_name)
    ~sns_topic_arn:(sns_topic_arn_ : sns_topic_arn) () =
  ({
     data_set_type = data_set_type_;
     from_date = from_date_;
     role_name_arn = role_name_arn_;
     destination_s3_bucket_name = destination_s3_bucket_name_;
     destination_s3_prefix = destination_s3_prefix_;
     sns_topic_arn = sns_topic_arn_;
     customer_defined_values = customer_defined_values_;
   }
    : start_support_data_export_request)
