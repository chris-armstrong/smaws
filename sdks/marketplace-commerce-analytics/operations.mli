open Types

module StartSupportDataExport : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `MarketplaceCommerceAnalyticsException of marketplace_commerce_analytics_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    start_support_data_export_request ->
    ( start_support_data_export_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `MarketplaceCommerceAnalyticsException of marketplace_commerce_analytics_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    start_support_data_export_request ->
    ( start_support_data_export_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `MarketplaceCommerceAnalyticsException of marketplace_commerce_analytics_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "{i This target has been deprecated.} Given a data set type and a from date, asynchronously \
   publishes the requested customer support data to the specified S3 bucket and notifies the \
   specified SNS topic once the data is available. Returns a unique request identifier that can be \
   used to correlate requests with notifications from the SNS topic. Data sets will be published \
   in comma-separated values (CSV) format with the file name \
   \\{data_set_type\\}_YYYY-MM-DD'T'HH-mm-ss'Z'.csv. If a file with the same name already exists \
   (e.g. if the same data set is requested twice), the original file will be overwritten by the \
   new file. Requires a Role with an attached permissions policy providing Allow permissions for \
   the following actions: s3:PutObject, s3:GetBucketLocation, sns:GetTopicAttributes, sns:Publish, \
   iam:GetRolePolicy."]

module GenerateDataSet : sig
  val error_to_string :
    [ Smaws_Lib.Protocols.AwsJson.error
    | `MarketplaceCommerceAnalyticsException of marketplace_commerce_analytics_exception ] ->
    string

  val request :
    'http_type Smaws_Lib.Context.t ->
    generate_data_set_request ->
    ( generate_data_set_result,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `MarketplaceCommerceAnalyticsException of marketplace_commerce_analytics_exception ] )
    result

  val request_with_metadata :
    'http_type Smaws_Lib.Context.t ->
    generate_data_set_request ->
    ( generate_data_set_result Smaws_Lib.Response.t,
      [> Smaws_Lib.Protocols.AwsJson.error
      | `MarketplaceCommerceAnalyticsException of marketplace_commerce_analytics_exception ]
      * Smaws_Lib.Response.metadata )
    result
end
[@@ocaml.doc
  "Given a data set type and data set publication date, asynchronously publishes the requested \
   data set to the specified S3 bucket and notifies the specified SNS topic once the data is \
   available. Returns a unique request identifier that can be used to correlate requests with \
   notifications from the SNS topic. Data sets will be published in comma-separated values (CSV) \
   format with the file name \\{data_set_type\\}_YYYY-MM-DD.csv. If a file with the same name \
   already exists (e.g. if the same data set is requested twice), the original file will be \
   overwritten by the new file. Requires a Role with an attached permissions policy providing \
   Allow permissions for the following actions: s3:PutObject, s3:GetBucketLocation, \
   sns:GetTopicAttributes, sns:Publish, iam:GetRolePolicy."]
