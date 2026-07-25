type nonrec awskms_key_ar_n = string [@@ocaml.doc ""]

type nonrec awskms_key_arn_for_ss_e = string [@@ocaml.doc ""]

type nonrec amazon_open_search_serverless_buffering_size_in_m_bs = int [@@ocaml.doc ""]

type nonrec amazon_open_search_serverless_buffering_interval_in_seconds = int [@@ocaml.doc ""]

type nonrec amazon_open_search_serverless_buffering_hints = {
  interval_in_seconds : amazon_open_search_serverless_buffering_interval_in_seconds option;
      [@ocaml.doc
        "Buffer incoming data for the specified period of time, in seconds, before delivering it \
         to the destination. The default value is 300 (5 minutes).\n"]
  size_in_m_bs : amazon_open_search_serverless_buffering_size_in_m_bs option;
      [@ocaml.doc
        "Buffer incoming data to the specified size, in MBs, before delivering it to the \
         destination. The default value is 5. \n\n\
        \ We recommend setting this parameter to a value greater than the amount of data you \
         typically ingest into the Firehose stream in 10 seconds. For example, if you typically \
         ingest data at 1 MB/sec, the value should be 10 MB or higher.\n\
        \ "]
}
[@@ocaml.doc
  "Describes the buffering to perform before delivering data to the Serverless offering for Amazon \
   OpenSearch Service destination.\n"]

type nonrec amazon_open_search_serverless_collection_endpoint = string [@@ocaml.doc ""]

type nonrec non_empty_string_without_whitespace = string [@@ocaml.doc ""]

type nonrec security_group_id_list = non_empty_string_without_whitespace list [@@ocaml.doc ""]

type nonrec role_ar_n = string [@@ocaml.doc ""]

type nonrec subnet_id_list = non_empty_string_without_whitespace list [@@ocaml.doc ""]

type nonrec vpc_configuration = {
  subnet_ids : subnet_id_list;
      [@ocaml.doc
        "The IDs of the subnets that you want Firehose to use to create ENIs in the VPC of the \
         Amazon OpenSearch Service destination. Make sure that the routing tables and inbound and \
         outbound rules allow traffic to flow from the subnets whose IDs are specified here to the \
         subnets that have the destination Amazon OpenSearch Service endpoints. Firehose creates \
         at least one ENI in each of the subnets that are specified here. Do not delete or modify \
         these ENIs.\n\n\
        \ The number of ENIs that Firehose creates in the subnets specified here scales up and \
         down automatically based on throughput. To enable Firehose to scale up the number of ENIs \
         to match throughput, ensure that you have sufficient quota. To help you calculate the \
         quota you need, assume that Firehose can create up to three ENIs for this Firehose stream \
         for each of the subnets specified here. For more information about ENI quota, see \
         {{:https://docs.aws.amazon.com/vpc/latest/userguide/amazon-vpc-limits.html#vpc-limits-enis}Network \
         Interfaces } in the Amazon VPC Quotas topic.\n\
        \ "]
  role_ar_n : role_ar_n;
      [@ocaml.doc
        "The ARN of the IAM role that you want the Firehose stream to use to create endpoints in \
         the destination VPC. You can use your existing Firehose delivery role or you can specify \
         a new role. In either case, make sure that the role trusts the Firehose service principal \
         and that it grants the following permissions:\n\n\
        \ {ul\n\
        \       {-   [ec2:DescribeVpcs] \n\
        \           \n\
        \            }\n\
        \       {-   [ec2:DescribeVpcAttribute] \n\
        \           \n\
        \            }\n\
        \       {-   [ec2:DescribeSubnets] \n\
        \           \n\
        \            }\n\
        \       {-   [ec2:DescribeSecurityGroups] \n\
        \           \n\
        \            }\n\
        \       {-   [ec2:DescribeNetworkInterfaces] \n\
        \           \n\
        \            }\n\
        \       {-   [ec2:CreateNetworkInterface] \n\
        \           \n\
        \            }\n\
        \       {-   [ec2:CreateNetworkInterfacePermission] \n\
        \           \n\
        \            }\n\
        \       {-   [ec2:DeleteNetworkInterface] \n\
        \           \n\
        \            }\n\
        \       }\n\
        \    When you specify subnets for delivering data to the destination in a private VPC, \
         make sure you have enough number of free IP addresses in chosen subnets. If there is no \
         available free IP address in a specified subnet, Firehose cannot create or add ENIs for \
         the data delivery in the private VPC, and the delivery will be degraded or fail.\n\
        \    \n\
        \     "]
  security_group_ids : security_group_id_list;
      [@ocaml.doc
        "The IDs of the security groups that you want Firehose to use when it creates ENIs in the \
         VPC of the Amazon OpenSearch Service destination. You can use the same security group \
         that the Amazon OpenSearch Service domain uses or different ones. If you specify \
         different security groups here, ensure that they allow outbound HTTPS traffic to the \
         Amazon OpenSearch Service domain's security group. Also ensure that the Amazon OpenSearch \
         Service domain's security group allows HTTPS traffic from the security groups specified \
         here. If you use the same security group for both your delivery stream and the Amazon \
         OpenSearch Service domain, make sure the security group inbound rule allows HTTPS \
         traffic. For more information about security group rules, see \
         {{:https://docs.aws.amazon.com/vpc/latest/userguide/VPC_SecurityGroups.html#SecurityGroupRules}Security \
         group rules} in the Amazon VPC documentation.\n"]
}
[@@ocaml.doc
  "The details of the VPC of the Amazon OpenSearch or Amazon OpenSearch Serverless destination.\n"]

type nonrec log_stream_name = string [@@ocaml.doc ""]

type nonrec log_group_name = string [@@ocaml.doc ""]

type nonrec boolean_object = bool [@@ocaml.doc ""]

type nonrec cloud_watch_logging_options = {
  enabled : boolean_object option; [@ocaml.doc "Enables or disables CloudWatch logging.\n"]
  log_group_name : log_group_name option;
      [@ocaml.doc
        "The CloudWatch group name for logging. This value is required if CloudWatch logging is \
         enabled.\n"]
  log_stream_name : log_stream_name option;
      [@ocaml.doc
        "The CloudWatch log stream name for logging. This value is required if CloudWatch logging \
         is enabled.\n"]
}
[@@ocaml.doc "Describes the Amazon CloudWatch logging options for your Firehose stream.\n"]

type nonrec processor_parameter_value = string [@@ocaml.doc ""]

type nonrec processor_parameter_name =
  | LAMBDA_ARN [@ocaml.doc ""]
  | LAMBDA_NUMBER_OF_RETRIES [@ocaml.doc ""]
  | METADATA_EXTRACTION_QUERY [@ocaml.doc ""]
  | JSON_PARSING_ENGINE [@ocaml.doc ""]
  | ROLE_ARN [@ocaml.doc ""]
  | BUFFER_SIZE_IN_MB [@ocaml.doc ""]
  | BUFFER_INTERVAL_IN_SECONDS [@ocaml.doc ""]
  | SUB_RECORD_TYPE [@ocaml.doc ""]
  | Delimiter [@ocaml.doc ""]
  | COMPRESSION_FORMAT [@ocaml.doc ""]
  | DATA_MESSAGE_EXTRACTION [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec processor_parameter = {
  parameter_name : processor_parameter_name;
      [@ocaml.doc
        "The name of the parameter. Currently the following default values are supported: 3 for \
         [NumberOfRetries] and 60 for the [BufferIntervalInSeconds]. The [BufferSizeInMBs] ranges \
         between 0.2 MB and up to 3MB. The default buffering hint is 1MB for all destinations, \
         except Splunk. For Splunk, the default buffering hint is 256 KB. \n"]
  parameter_value : processor_parameter_value; [@ocaml.doc "The parameter value.\n"]
}
[@@ocaml.doc "Describes the processor parameter. \n"]

type nonrec processor_parameter_list = processor_parameter list [@@ocaml.doc ""]

type nonrec processor_type =
  | RecordDeAggregation [@ocaml.doc ""]
  | Decompression [@ocaml.doc ""]
  | CloudWatchLogProcessing [@ocaml.doc ""]
  | Lambda [@ocaml.doc ""]
  | MetadataExtraction [@ocaml.doc ""]
  | AppendDelimiterToRecord [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec processor = {
  type_ : processor_type; [@ocaml.doc "The type of processor.\n"]
  parameters : processor_parameter_list option; [@ocaml.doc "The processor parameters.\n"]
}
[@@ocaml.doc
  "Describes a data processor.\n\n\
  \  If you want to add a new line delimiter between records in objects that are delivered to \
   Amazon S3, choose [AppendDelimiterToRecord] as a processor type. You don\226\128\153t have to \
   put a processor parameter when you select [AppendDelimiterToRecord]. \n\
  \  \n\
  \   "]

type nonrec processor_list = processor list [@@ocaml.doc ""]

type nonrec processing_configuration = {
  enabled : boolean_object option; [@ocaml.doc "Enables or disables data processing.\n"]
  processors : processor_list option; [@ocaml.doc "The data processors.\n"]
}
[@@ocaml.doc "Describes a data processing configuration.\n"]

type nonrec kms_encryption_config = {
  awskms_key_ar_n : awskms_key_ar_n;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the encryption key. Must belong to the same Amazon Web \
         Services Region as the destination Amazon S3 bucket. For more information, see \
         {{:https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html}Amazon \
         Resource Names (ARNs) and Amazon Web Services Service Namespaces}.\n"]
}
[@@ocaml.doc "Describes an encryption key for a destination in Amazon S3.\n"]

type nonrec no_encryption_config = NoEncryption [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec encryption_configuration = {
  no_encryption_config : no_encryption_config option;
      [@ocaml.doc
        "Specifically override existing encryption information to ensure that no encryption is used.\n"]
  kms_encryption_config : kms_encryption_config option; [@ocaml.doc "The encryption key.\n"]
}
[@@ocaml.doc "Describes the encryption for a destination in Amazon S3.\n"]

type nonrec compression_format =
  | UNCOMPRESSED [@ocaml.doc ""]
  | GZIP [@ocaml.doc ""]
  | ZIP [@ocaml.doc ""]
  | SNAPPY [@ocaml.doc ""]
  | HADOOP_SNAPPY [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec interval_in_seconds = int [@@ocaml.doc ""]

type nonrec size_in_m_bs = int [@@ocaml.doc ""]

type nonrec buffering_hints = {
  size_in_m_bs : size_in_m_bs option;
      [@ocaml.doc
        "Buffer incoming data to the specified size, in MiBs, before delivering it to the \
         destination. The default value is 5. This parameter is optional but if you specify a \
         value for it, you must also specify a value for [IntervalInSeconds], and vice versa.\n\n\
        \ We recommend setting this parameter to a value greater than the amount of data you \
         typically ingest into the Firehose stream in 10 seconds. For example, if you typically \
         ingest data at 1 MiB/sec, the value should be 10 MiB or higher.\n\
        \ "]
  interval_in_seconds : interval_in_seconds option;
      [@ocaml.doc
        "Buffer incoming data for the specified period of time, in seconds, before delivering it \
         to the destination. The default value is 300. This parameter is optional but if you \
         specify a value for it, you must also specify a value for [SizeInMBs], and vice versa.\n"]
}
[@@ocaml.doc
  "Describes hints for the buffering to perform before delivering data to the destination. These \
   options are treated as hints, and therefore Firehose might choose to use different values when \
   it is optimal. The [SizeInMBs] and [IntervalInSeconds] parameters are optional. However, if \
   specify a value for one of them, you must also provide a value for the other.\n"]

type nonrec error_output_prefix = string [@@ocaml.doc ""]

type nonrec prefix = string [@@ocaml.doc ""]

type nonrec bucket_ar_n = string [@@ocaml.doc ""]

type nonrec s3_destination_configuration = {
  role_ar_n : role_ar_n;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the Amazon Web Services credentials. For more \
         information, see \
         {{:https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html}Amazon \
         Resource Names (ARNs) and Amazon Web Services Service Namespaces}.\n"]
  bucket_ar_n : bucket_ar_n;
      [@ocaml.doc
        "The ARN of the S3 bucket. For more information, see \
         {{:https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html}Amazon \
         Resource Names (ARNs) and Amazon Web Services Service Namespaces}.\n"]
  prefix : prefix option;
      [@ocaml.doc
        "The \"YYYY/MM/DD/HH\" time format prefix is automatically used for delivered Amazon S3 \
         files. You can also specify a custom prefix, as described in \
         {{:https://docs.aws.amazon.com/firehose/latest/dev/s3-prefixes.html}Custom Prefixes for \
         Amazon S3 Objects}.\n"]
  error_output_prefix : error_output_prefix option;
      [@ocaml.doc
        "A prefix that Firehose evaluates and adds to failed records before writing them to S3. \
         This prefix appears immediately following the bucket name. For information about how to \
         specify this prefix, see \
         {{:https://docs.aws.amazon.com/firehose/latest/dev/s3-prefixes.html}Custom Prefixes for \
         Amazon S3 Objects}.\n"]
  buffering_hints : buffering_hints option;
      [@ocaml.doc
        "The buffering option. If no value is specified, [BufferingHints] object default values \
         are used.\n"]
  compression_format : compression_format option;
      [@ocaml.doc
        "The compression format. If no value is specified, the default is [UNCOMPRESSED].\n\n\
        \ The compression formats [SNAPPY] or [ZIP] cannot be specified for Amazon Redshift \
         destinations because they are not supported by the Amazon Redshift [COPY] operation that \
         reads from the S3 bucket.\n\
        \ "]
  encryption_configuration : encryption_configuration option;
      [@ocaml.doc
        "The encryption configuration. If no value is specified, the default is no encryption.\n"]
  cloud_watch_logging_options : cloud_watch_logging_options option;
      [@ocaml.doc "The CloudWatch logging options for your Firehose stream.\n"]
}
[@@ocaml.doc "Describes the configuration of a destination in Amazon S3.\n"]

type nonrec amazon_open_search_serverless_s3_backup_mode =
  | FailedDocumentsOnly [@ocaml.doc ""]
  | AllDocuments [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec amazon_open_search_serverless_retry_duration_in_seconds = int [@@ocaml.doc ""]

type nonrec amazon_open_search_serverless_retry_options = {
  duration_in_seconds : amazon_open_search_serverless_retry_duration_in_seconds option;
      [@ocaml.doc
        "After an initial failure to deliver to the Serverless offering for Amazon OpenSearch \
         Service, the total amount of time during which Firehose retries delivery (including the \
         first attempt). After this time has elapsed, the failed documents are written to Amazon \
         S3. Default value is 300 seconds (5 minutes). A value of 0 (zero) results in no retries.\n"]
}
[@@ocaml.doc
  "Configures retry behavior in case Firehose is unable to deliver documents to the Serverless \
   offering for Amazon OpenSearch Service.\n"]

type nonrec amazon_open_search_serverless_index_name = string [@@ocaml.doc ""]

type nonrec amazon_open_search_serverless_destination_configuration = {
  role_ar_n : role_ar_n;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the IAM role to be assumed by Firehose for calling the \
         Serverless offering for Amazon OpenSearch Service Configuration API and for indexing \
         documents.\n"]
  collection_endpoint : amazon_open_search_serverless_collection_endpoint option;
      [@ocaml.doc
        "The endpoint to use when communicating with the collection in the Serverless offering for \
         Amazon OpenSearch Service.\n"]
  index_name : amazon_open_search_serverless_index_name;
      [@ocaml.doc "The Serverless offering for Amazon OpenSearch Service index name.\n"]
  buffering_hints : amazon_open_search_serverless_buffering_hints option;
      [@ocaml.doc
        "The buffering options. If no value is specified, the default values for \
         AmazonopensearchserviceBufferingHints are used.\n"]
  retry_options : amazon_open_search_serverless_retry_options option;
      [@ocaml.doc
        "The retry behavior in case Firehose is unable to deliver documents to the Serverless \
         offering for Amazon OpenSearch Service. The default value is 300 (5 minutes).\n"]
  s3_backup_mode : amazon_open_search_serverless_s3_backup_mode option;
      [@ocaml.doc
        "Defines how documents should be delivered to Amazon S3. When it is set to \
         FailedDocumentsOnly, Firehose writes any documents that could not be indexed to the \
         configured Amazon S3 destination, with AmazonOpenSearchService-failed/ appended to the \
         key prefix. When set to AllDocuments, Firehose delivers all incoming records to Amazon \
         S3, and also writes failed documents with AmazonOpenSearchService-failed/ appended to the \
         prefix.\n"]
  s3_configuration : s3_destination_configuration; [@ocaml.doc ""]
  processing_configuration : processing_configuration option; [@ocaml.doc ""]
  cloud_watch_logging_options : cloud_watch_logging_options option; [@ocaml.doc ""]
  vpc_configuration : vpc_configuration option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "Describes the configuration of a destination in the Serverless offering for Amazon OpenSearch \
   Service.\n"]

type nonrec vpc_configuration_description = {
  subnet_ids : subnet_id_list;
      [@ocaml.doc
        "The IDs of the subnets that Firehose uses to create ENIs in the VPC of the Amazon \
         OpenSearch Service destination. Make sure that the routing tables and inbound and \
         outbound rules allow traffic to flow from the subnets whose IDs are specified here to the \
         subnets that have the destination Amazon OpenSearch Service endpoints. Firehose creates \
         at least one ENI in each of the subnets that are specified here. Do not delete or modify \
         these ENIs.\n\n\
        \ The number of ENIs that Firehose creates in the subnets specified here scales up and \
         down automatically based on throughput. To enable Firehose to scale up the number of ENIs \
         to match throughput, ensure that you have sufficient quota. To help you calculate the \
         quota you need, assume that Firehose can create up to three ENIs for this Firehose stream \
         for each of the subnets specified here. For more information about ENI quota, see \
         {{:https://docs.aws.amazon.com/vpc/latest/userguide/amazon-vpc-limits.html#vpc-limits-enis}Network \
         Interfaces } in the Amazon VPC Quotas topic.\n\
        \ "]
  role_ar_n : role_ar_n;
      [@ocaml.doc
        "The ARN of the IAM role that the Firehose stream uses to create endpoints in the \
         destination VPC. You can use your existing Firehose delivery role or you can specify a \
         new role. In either case, make sure that the role trusts the Firehose service principal \
         and that it grants the following permissions:\n\n\
        \ {ul\n\
        \       {-   [ec2:DescribeVpcs] \n\
        \           \n\
        \            }\n\
        \       {-   [ec2:DescribeVpcAttribute] \n\
        \           \n\
        \            }\n\
        \       {-   [ec2:DescribeSubnets] \n\
        \           \n\
        \            }\n\
        \       {-   [ec2:DescribeSecurityGroups] \n\
        \           \n\
        \            }\n\
        \       {-   [ec2:DescribeNetworkInterfaces] \n\
        \           \n\
        \            }\n\
        \       {-   [ec2:CreateNetworkInterface] \n\
        \           \n\
        \            }\n\
        \       {-   [ec2:CreateNetworkInterfacePermission] \n\
        \           \n\
        \            }\n\
        \       {-   [ec2:DeleteNetworkInterface] \n\
        \           \n\
        \            }\n\
        \       }\n\
        \   If you revoke these permissions after you create the Firehose stream, Firehose can't \
         scale out by creating more ENIs when necessary. You might therefore see a degradation in \
         performance.\n\
        \   "]
  security_group_ids : security_group_id_list;
      [@ocaml.doc
        "The IDs of the security groups that Firehose uses when it creates ENIs in the VPC of the \
         Amazon OpenSearch Service destination. You can use the same security group that the \
         Amazon ES domain uses or different ones. If you specify different security groups, ensure \
         that they allow outbound HTTPS traffic to the Amazon OpenSearch Service domain's security \
         group. Also ensure that the Amazon OpenSearch Service domain's security group allows \
         HTTPS traffic from the security groups specified here. If you use the same security group \
         for both your Firehose stream and the Amazon OpenSearch Service domain, make sure the \
         security group inbound rule allows HTTPS traffic. For more information about security \
         group rules, see \
         {{:https://docs.aws.amazon.com/vpc/latest/userguide/VPC_SecurityGroups.html#SecurityGroupRules}Security \
         group rules} in the Amazon VPC documentation.\n"]
  vpc_id : non_empty_string_without_whitespace;
      [@ocaml.doc "The ID of the Amazon OpenSearch Service destination's VPC.\n"]
}
[@@ocaml.doc "The details of the VPC of the Amazon OpenSearch Service destination.\n"]

type nonrec s3_destination_description = {
  role_ar_n : role_ar_n;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the Amazon Web Services credentials. For more \
         information, see \
         {{:https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html}Amazon \
         Resource Names (ARNs) and Amazon Web Services Service Namespaces}.\n"]
  bucket_ar_n : bucket_ar_n;
      [@ocaml.doc
        "The ARN of the S3 bucket. For more information, see \
         {{:https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html}Amazon \
         Resource Names (ARNs) and Amazon Web Services Service Namespaces}.\n"]
  prefix : prefix option;
      [@ocaml.doc
        "The \"YYYY/MM/DD/HH\" time format prefix is automatically used for delivered Amazon S3 \
         files. You can also specify a custom prefix, as described in \
         {{:https://docs.aws.amazon.com/firehose/latest/dev/s3-prefixes.html}Custom Prefixes for \
         Amazon S3 Objects}.\n"]
  error_output_prefix : error_output_prefix option;
      [@ocaml.doc
        "A prefix that Firehose evaluates and adds to failed records before writing them to S3. \
         This prefix appears immediately following the bucket name. For information about how to \
         specify this prefix, see \
         {{:https://docs.aws.amazon.com/firehose/latest/dev/s3-prefixes.html}Custom Prefixes for \
         Amazon S3 Objects}.\n"]
  buffering_hints : buffering_hints;
      [@ocaml.doc
        "The buffering option. If no value is specified, [BufferingHints] object default values \
         are used.\n"]
  compression_format : compression_format;
      [@ocaml.doc
        "The compression format. If no value is specified, the default is [UNCOMPRESSED].\n"]
  encryption_configuration : encryption_configuration;
      [@ocaml.doc
        "The encryption configuration. If no value is specified, the default is no encryption.\n"]
  cloud_watch_logging_options : cloud_watch_logging_options option;
      [@ocaml.doc "The Amazon CloudWatch logging options for your Firehose stream.\n"]
}
[@@ocaml.doc "Describes a destination in Amazon S3.\n"]

type nonrec amazon_open_search_serverless_destination_description = {
  role_ar_n : role_ar_n option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the Amazon Web Services credentials.\n"]
  collection_endpoint : amazon_open_search_serverless_collection_endpoint option;
      [@ocaml.doc
        "The endpoint to use when communicating with the collection in the Serverless offering for \
         Amazon OpenSearch Service.\n"]
  index_name : amazon_open_search_serverless_index_name option;
      [@ocaml.doc "The Serverless offering for Amazon OpenSearch Service index name.\n"]
  buffering_hints : amazon_open_search_serverless_buffering_hints option;
      [@ocaml.doc "The buffering options.\n"]
  retry_options : amazon_open_search_serverless_retry_options option;
      [@ocaml.doc "The Serverless offering for Amazon OpenSearch Service retry options.\n"]
  s3_backup_mode : amazon_open_search_serverless_s3_backup_mode option;
      [@ocaml.doc "The Amazon S3 backup mode.\n"]
  s3_destination_description : s3_destination_description option; [@ocaml.doc ""]
  processing_configuration : processing_configuration option; [@ocaml.doc ""]
  cloud_watch_logging_options : cloud_watch_logging_options option; [@ocaml.doc ""]
  vpc_configuration_description : vpc_configuration_description option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "The destination description in the Serverless offering for Amazon OpenSearch Service.\n"]

type nonrec s3_destination_update = {
  role_ar_n : role_ar_n option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the Amazon Web Services credentials. For more \
         information, see \
         {{:https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html}Amazon \
         Resource Names (ARNs) and Amazon Web Services Service Namespaces}.\n"]
  bucket_ar_n : bucket_ar_n option;
      [@ocaml.doc
        "The ARN of the S3 bucket. For more information, see \
         {{:https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html}Amazon \
         Resource Names (ARNs) and Amazon Web Services Service Namespaces}.\n"]
  prefix : prefix option;
      [@ocaml.doc
        "The \"YYYY/MM/DD/HH\" time format prefix is automatically used for delivered Amazon S3 \
         files. You can also specify a custom prefix, as described in \
         {{:https://docs.aws.amazon.com/firehose/latest/dev/s3-prefixes.html}Custom Prefixes for \
         Amazon S3 Objects}.\n"]
  error_output_prefix : error_output_prefix option;
      [@ocaml.doc
        "A prefix that Firehose evaluates and adds to failed records before writing them to S3. \
         This prefix appears immediately following the bucket name. For information about how to \
         specify this prefix, see \
         {{:https://docs.aws.amazon.com/firehose/latest/dev/s3-prefixes.html}Custom Prefixes for \
         Amazon S3 Objects}.\n"]
  buffering_hints : buffering_hints option;
      [@ocaml.doc
        "The buffering option. If no value is specified, [BufferingHints] object default values \
         are used.\n"]
  compression_format : compression_format option;
      [@ocaml.doc
        "The compression format. If no value is specified, the default is [UNCOMPRESSED].\n\n\
        \ The compression formats [SNAPPY] or [ZIP] cannot be specified for Amazon Redshift \
         destinations because they are not supported by the Amazon Redshift [COPY] operation that \
         reads from the S3 bucket.\n\
        \ "]
  encryption_configuration : encryption_configuration option;
      [@ocaml.doc
        "The encryption configuration. If no value is specified, the default is no encryption.\n"]
  cloud_watch_logging_options : cloud_watch_logging_options option;
      [@ocaml.doc "The CloudWatch logging options for your Firehose stream.\n"]
}
[@@ocaml.doc "Describes an update for a destination in Amazon S3.\n"]

type nonrec amazon_open_search_serverless_destination_update = {
  role_ar_n : role_ar_n option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the IAM role to be assumed by Firehose for calling the \
         Serverless offering for Amazon OpenSearch Service Configuration API and for indexing \
         documents.\n"]
  collection_endpoint : amazon_open_search_serverless_collection_endpoint option;
      [@ocaml.doc
        "The endpoint to use when communicating with the collection in the Serverless offering for \
         Amazon OpenSearch Service.\n"]
  index_name : amazon_open_search_serverless_index_name option;
      [@ocaml.doc "The Serverless offering for Amazon OpenSearch Service index name.\n"]
  buffering_hints : amazon_open_search_serverless_buffering_hints option;
      [@ocaml.doc
        "The buffering options. If no value is specified, AmazonopensearchBufferingHints object \
         default values are used.\n"]
  retry_options : amazon_open_search_serverless_retry_options option;
      [@ocaml.doc
        "The retry behavior in case Firehose is unable to deliver documents to the Serverless \
         offering for Amazon OpenSearch Service. The default value is 300 (5 minutes).\n"]
  s3_update : s3_destination_update option; [@ocaml.doc ""]
  processing_configuration : processing_configuration option; [@ocaml.doc ""]
  cloud_watch_logging_options : cloud_watch_logging_options option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "Describes an update for a destination in the Serverless offering for Amazon OpenSearch Service.\n"]

type nonrec amazonopensearchservice_buffering_size_in_m_bs = int [@@ocaml.doc ""]

type nonrec amazonopensearchservice_buffering_interval_in_seconds = int [@@ocaml.doc ""]

type nonrec amazonopensearchservice_buffering_hints = {
  interval_in_seconds : amazonopensearchservice_buffering_interval_in_seconds option;
      [@ocaml.doc
        "Buffer incoming data for the specified period of time, in seconds, before delivering it \
         to the destination. The default value is 300 (5 minutes). \n"]
  size_in_m_bs : amazonopensearchservice_buffering_size_in_m_bs option;
      [@ocaml.doc
        "Buffer incoming data to the specified size, in MBs, before delivering it to the \
         destination. The default value is 5.\n\n\
        \ We recommend setting this parameter to a value greater than the amount of data you \
         typically ingest into the Firehose stream in 10 seconds. For example, if you typically \
         ingest data at 1 MB/sec, the value should be 10 MB or higher. \n\
        \ "]
}
[@@ocaml.doc
  "Describes the buffering to perform before delivering data to the Amazon OpenSearch Service \
   destination. \n"]

type nonrec amazonopensearchservice_cluster_endpoint = string [@@ocaml.doc ""]

type nonrec default_document_id_format =
  | FIREHOSE_DEFAULT [@ocaml.doc ""]
  | NO_DOCUMENT_ID [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec document_id_options = {
  default_document_id_format : default_document_id_format;
      [@ocaml.doc
        "When the [FIREHOSE_DEFAULT] option is chosen, Firehose generates a unique document ID for \
         each record based on a unique internal identifier. The generated document ID is stable \
         across multiple delivery attempts, which helps prevent the same record from being indexed \
         multiple times with different document IDs.\n\n\
        \ When the [NO_DOCUMENT_ID] option is chosen, Firehose does not include any document IDs \
         in the requests it sends to the Amazon OpenSearch Service. This causes the Amazon \
         OpenSearch Service domain to generate document IDs. In case of multiple delivery \
         attempts, this may cause the same record to be indexed more than once with different \
         document IDs. This option enables write-heavy operations, such as the ingestion of logs \
         and observability data, to consume less resources in the Amazon OpenSearch Service \
         domain, resulting in improved performance.\n\
        \ "]
}
[@@ocaml.doc
  "Indicates the method for setting up document ID. The supported methods are Firehose generated \
   document ID and OpenSearch Service generated document ID.\n\n\
  \ \n\
  \ "]

type nonrec amazonopensearchservice_s3_backup_mode =
  | FailedDocumentsOnly [@ocaml.doc ""]
  | AllDocuments [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec amazonopensearchservice_retry_duration_in_seconds = int [@@ocaml.doc ""]

type nonrec amazonopensearchservice_retry_options = {
  duration_in_seconds : amazonopensearchservice_retry_duration_in_seconds option;
      [@ocaml.doc
        "After an initial failure to deliver to Amazon OpenSearch Service, the total amount of \
         time during which Firehose retries delivery (including the first attempt). After this \
         time has elapsed, the failed documents are written to Amazon S3. Default value is 300 \
         seconds (5 minutes). A value of 0 (zero) results in no retries. \n"]
}
[@@ocaml.doc
  "Configures retry behavior in case Firehose is unable to deliver documents to Amazon OpenSearch \
   Service. \n"]

type nonrec amazonopensearchservice_index_rotation_period =
  | NoRotation [@ocaml.doc ""]
  | OneHour [@ocaml.doc ""]
  | OneDay [@ocaml.doc ""]
  | OneWeek [@ocaml.doc ""]
  | OneMonth [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec amazonopensearchservice_type_name = string [@@ocaml.doc ""]

type nonrec amazonopensearchservice_index_name = string [@@ocaml.doc ""]

type nonrec amazonopensearchservice_domain_ar_n = string [@@ocaml.doc ""]

type nonrec amazonopensearchservice_destination_configuration = {
  role_ar_n : role_ar_n;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the IAM role to be assumed by Firehose for calling the \
         Amazon OpenSearch Service Configuration API and for indexing documents.\n"]
  domain_ar_n : amazonopensearchservice_domain_ar_n option;
      [@ocaml.doc
        "The ARN of the Amazon OpenSearch Service domain. The IAM role must have permissions for \
         DescribeElasticsearchDomain, DescribeElasticsearchDomains, and \
         DescribeElasticsearchDomainConfig after assuming the role specified in RoleARN. \n"]
  cluster_endpoint : amazonopensearchservice_cluster_endpoint option;
      [@ocaml.doc
        "The endpoint to use when communicating with the cluster. Specify either this \
         ClusterEndpoint or the DomainARN field. \n"]
  index_name : amazonopensearchservice_index_name;
      [@ocaml.doc "The ElasticsearAmazon OpenSearch Service index name.\n"]
  type_name : amazonopensearchservice_type_name option;
      [@ocaml.doc
        "The Amazon OpenSearch Service type name. For Elasticsearch 6.x, there can be only one \
         type per index. If you try to specify a new type for an existing index that already has \
         another type, Firehose returns an error during run time. \n"]
  index_rotation_period : amazonopensearchservice_index_rotation_period option;
      [@ocaml.doc
        "The Amazon OpenSearch Service index rotation period. Index rotation appends a timestamp \
         to the IndexName to facilitate the expiration of old data.\n"]
  buffering_hints : amazonopensearchservice_buffering_hints option;
      [@ocaml.doc
        "The buffering options. If no value is specified, the default values for \
         AmazonopensearchserviceBufferingHints are used. \n"]
  retry_options : amazonopensearchservice_retry_options option;
      [@ocaml.doc
        "The retry behavior in case Firehose is unable to deliver documents to Amazon OpenSearch \
         Service. The default value is 300 (5 minutes). \n"]
  s3_backup_mode : amazonopensearchservice_s3_backup_mode option;
      [@ocaml.doc
        "Defines how documents should be delivered to Amazon S3. When it is set to \
         FailedDocumentsOnly, Firehose writes any documents that could not be indexed to the \
         configured Amazon S3 destination, with AmazonOpenSearchService-failed/ appended to the \
         key prefix. When set to AllDocuments, Firehose delivers all incoming records to Amazon \
         S3, and also writes failed documents with AmazonOpenSearchService-failed/ appended to the \
         prefix. \n"]
  s3_configuration : s3_destination_configuration; [@ocaml.doc ""]
  processing_configuration : processing_configuration option; [@ocaml.doc ""]
  cloud_watch_logging_options : cloud_watch_logging_options option; [@ocaml.doc ""]
  vpc_configuration : vpc_configuration option; [@ocaml.doc ""]
  document_id_options : document_id_options option;
      [@ocaml.doc
        "Indicates the method for setting up document ID. The supported methods are Firehose \
         generated document ID and OpenSearch Service generated document ID.\n"]
}
[@@ocaml.doc "Describes the configuration of a destination in Amazon OpenSearch Service\n"]

type nonrec amazonopensearchservice_destination_description = {
  role_ar_n : role_ar_n option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the Amazon Web Services credentials. \n"]
  domain_ar_n : amazonopensearchservice_domain_ar_n option;
      [@ocaml.doc "The ARN of the Amazon OpenSearch Service domain.\n"]
  cluster_endpoint : amazonopensearchservice_cluster_endpoint option;
      [@ocaml.doc
        "The endpoint to use when communicating with the cluster. Firehose uses either this \
         ClusterEndpoint or the DomainARN field to send data to Amazon OpenSearch Service. \n"]
  index_name : amazonopensearchservice_index_name option;
      [@ocaml.doc "The Amazon OpenSearch Service index name.\n"]
  type_name : amazonopensearchservice_type_name option;
      [@ocaml.doc
        "The Amazon OpenSearch Service type name. This applies to Elasticsearch 6.x and lower \
         versions. For Elasticsearch 7.x and OpenSearch Service 1.x, there's no value for \
         TypeName. \n"]
  index_rotation_period : amazonopensearchservice_index_rotation_period option;
      [@ocaml.doc "The Amazon OpenSearch Service index rotation period\n"]
  buffering_hints : amazonopensearchservice_buffering_hints option;
      [@ocaml.doc "The buffering options.\n"]
  retry_options : amazonopensearchservice_retry_options option;
      [@ocaml.doc "The Amazon OpenSearch Service retry options.\n"]
  s3_backup_mode : amazonopensearchservice_s3_backup_mode option;
      [@ocaml.doc "The Amazon S3 backup mode.\n"]
  s3_destination_description : s3_destination_description option; [@ocaml.doc ""]
  processing_configuration : processing_configuration option; [@ocaml.doc ""]
  cloud_watch_logging_options : cloud_watch_logging_options option; [@ocaml.doc ""]
  vpc_configuration_description : vpc_configuration_description option; [@ocaml.doc ""]
  document_id_options : document_id_options option;
      [@ocaml.doc
        "Indicates the method for setting up document ID. The supported methods are Firehose \
         generated document ID and OpenSearch Service generated document ID.\n"]
}
[@@ocaml.doc "The destination description in Amazon OpenSearch Service.\n"]

type nonrec amazonopensearchservice_destination_update = {
  role_ar_n : role_ar_n option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the IAM role to be assumed by Firehose for calling the \
         Amazon OpenSearch Service Configuration API and for indexing documents. \n"]
  domain_ar_n : amazonopensearchservice_domain_ar_n option;
      [@ocaml.doc
        "The ARN of the Amazon OpenSearch Service domain. The IAM role must have permissions for \
         DescribeDomain, DescribeDomains, and DescribeDomainConfig after assuming the IAM role \
         specified in RoleARN.\n"]
  cluster_endpoint : amazonopensearchservice_cluster_endpoint option;
      [@ocaml.doc
        "The endpoint to use when communicating with the cluster. Specify either this \
         ClusterEndpoint or the DomainARN field. \n"]
  index_name : amazonopensearchservice_index_name option;
      [@ocaml.doc "The Amazon OpenSearch Service index name.\n"]
  type_name : amazonopensearchservice_type_name option;
      [@ocaml.doc
        "The Amazon OpenSearch Service type name. For Elasticsearch 6.x, there can be only one \
         type per index. If you try to specify a new type for an existing index that already has \
         another type, Firehose returns an error during runtime. \n\n\
        \ If you upgrade Elasticsearch from 6.x to 7.x and don\226\128\153t update your Firehose \
         stream, Firehose still delivers data to Elasticsearch with the old index name and type \
         name. If you want to update your Firehose stream with a new index name, provide an empty \
         string for TypeName. \n\
        \ "]
  index_rotation_period : amazonopensearchservice_index_rotation_period option;
      [@ocaml.doc
        "The Amazon OpenSearch Service index rotation period. Index rotation appends a timestamp \
         to IndexName to facilitate the expiration of old data.\n"]
  buffering_hints : amazonopensearchservice_buffering_hints option;
      [@ocaml.doc
        "The buffering options. If no value is specified, AmazonopensearchBufferingHints object \
         default values are used. \n"]
  retry_options : amazonopensearchservice_retry_options option;
      [@ocaml.doc
        "The retry behavior in case Firehose is unable to deliver documents to Amazon OpenSearch \
         Service. The default value is 300 (5 minutes). \n"]
  s3_update : s3_destination_update option; [@ocaml.doc ""]
  processing_configuration : processing_configuration option; [@ocaml.doc ""]
  cloud_watch_logging_options : cloud_watch_logging_options option; [@ocaml.doc ""]
  document_id_options : document_id_options option;
      [@ocaml.doc
        "Indicates the method for setting up document ID. The supported methods are Firehose \
         generated document ID and OpenSearch Service generated document ID.\n"]
}
[@@ocaml.doc "Describes an update for a destination in Amazon OpenSearch Service.\n"]

type nonrec connectivity = PUBLIC [@ocaml.doc ""] | PRIVATE [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec authentication_configuration = {
  role_ar_n : role_ar_n; [@ocaml.doc "The ARN of the role used to access the Amazon MSK cluster.\n"]
  connectivity : connectivity;
      [@ocaml.doc "The type of connectivity used to access the Amazon MSK cluster.\n"]
}
[@@ocaml.doc "The authentication configuration of the Amazon MSK cluster.\n"]

type nonrec block_size_bytes = int [@@ocaml.doc ""]

type nonrec warehouse_location = string [@@ocaml.doc ""]

type nonrec glue_data_catalog_ar_n = string [@@ocaml.doc ""]

type nonrec catalog_configuration = {
  catalog_ar_n : glue_data_catalog_ar_n option;
      [@ocaml.doc
        " Specifies the Glue catalog ARN identifier of the destination Apache Iceberg Tables. You \
         must specify the ARN in the format [arn:aws:glue:region:account-id:catalog]. \n"]
  warehouse_location : warehouse_location option;
      [@ocaml.doc
        "The warehouse location for Apache Iceberg tables. You must configure this when schema \
         evolution and table creation is enabled.\n\n\
        \ Amazon Data Firehose is in preview release and is subject to change.\n\
        \ "]
}
[@@ocaml.doc
  " Describes the containers where the destination Apache Iceberg Tables are persisted. \n"]

type nonrec cluster_jdbcur_l = string [@@ocaml.doc ""]

type nonrec non_empty_string = string [@@ocaml.doc ""]

type nonrec column_to_json_key_mappings =
  (non_empty_string_without_whitespace * non_empty_string) list
[@@ocaml.doc ""]

type nonrec error_message = string [@@ocaml.doc ""]

type nonrec concurrent_modification_exception = {
  message : error_message option;
      [@ocaml.doc "A message that provides information about the error.\n"]
}
[@@ocaml.doc
  "Another modification has already happened. Fetch [VersionId] again and use it to update the \
   destination.\n"]

type nonrec content_encoding = NONE [@ocaml.doc ""] | GZIP [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec copy_options = string [@@ocaml.doc ""]

type nonrec data_table_columns = string [@@ocaml.doc ""]

type nonrec data_table_name = string [@@ocaml.doc ""]

type nonrec copy_command = {
  data_table_name : data_table_name;
      [@ocaml.doc "The name of the target table. The table must already exist in the database.\n"]
  data_table_columns : data_table_columns option;
      [@ocaml.doc "A comma-separated list of column names.\n"]
  copy_options : copy_options option;
      [@ocaml.doc
        "Optional parameters to use with the Amazon Redshift [COPY] command. For more information, \
         see the \"Optional Parameters\" section of \
         {{:https://docs.aws.amazon.com/redshift/latest/dg/r_COPY.html}Amazon Redshift COPY \
         command}. Some possible examples that would apply to Firehose are as follows:\n\n\
        \  [delimiter '\\t' lzop;] - fields are delimited with \"\\t\" (TAB character) and \
         compressed using lzop.\n\
        \ \n\
        \   [delimiter '|'] - fields are delimited with \"|\" (this is the default delimiter).\n\
        \  \n\
        \    [delimiter '|' escape] - the delimiter should be escaped.\n\
        \   \n\
        \     [fixedwidth 'venueid:3,venuename:25,venuecity:12,venuestate:2,venueseats:6'] - \
         fields are fixed width in the source, with each width specified after every column in the \
         table.\n\
        \    \n\
        \      [JSON 's3://mybucket/jsonpaths.txt'] - data is in JSON format, and the path \
         specified is the format of the data.\n\
        \     \n\
        \      For more examples, see \
         {{:https://docs.aws.amazon.com/redshift/latest/dg/r_COPY_command_examples.html}Amazon \
         Redshift COPY command examples}.\n\
        \      "]
}
[@@ocaml.doc "Describes a [COPY] command for Amazon Redshift.\n"]

type nonrec resource_in_use_exception = {
  message : error_message option;
      [@ocaml.doc "A message that provides information about the error.\n"]
}
[@@ocaml.doc "The resource is already in use and not available for this operation.\n"]

type nonrec limit_exceeded_exception = {
  message : error_message option;
      [@ocaml.doc "A message that provides information about the error.\n"]
}
[@@ocaml.doc "You have already reached the limit for a requested resource.\n"]

type nonrec error_code = string [@@ocaml.doc ""]

type nonrec invalid_kms_resource_exception = {
  code : error_code option; [@ocaml.doc ""]
  message : error_message option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "Firehose throws this exception when an attempt to put records or to start or stop Firehose \
   stream encryption fails. This happens when the KMS service throws one of the following \
   exception types: [AccessDeniedException], [InvalidStateException], [DisabledException], or \
   [NotFoundException].\n"]

type nonrec invalid_argument_exception = {
  message : error_message option;
      [@ocaml.doc "A message that provides information about the error.\n"]
}
[@@ocaml.doc "The specified input parameter has a value that is not valid.\n"]

type nonrec delivery_stream_ar_n = string [@@ocaml.doc ""]

type nonrec create_delivery_stream_output = {
  delivery_stream_ar_n : delivery_stream_ar_n option;
      [@ocaml.doc "The ARN of the Firehose stream.\n"]
}
[@@ocaml.doc ""]

type nonrec vpc_endpoint_service_name = string [@@ocaml.doc ""]

type nonrec database_source_vpc_configuration = {
  vpc_endpoint_service_name : vpc_endpoint_service_name;
      [@ocaml.doc
        " The VPC endpoint service name which Firehose uses to create a PrivateLink to the \
         database. The endpoint service must have the Firehose service principle \
         [firehose.amazonaws.com] as an allowed principal on the VPC endpoint service. The VPC \
         endpoint service name is a string that looks like \n\
         {[\n\
         com.amazonaws.vpce..\n\
         ]}\n\
         . \n\n\
        \ Amazon Data Firehose is in preview release and is subject to change.\n\
        \ "]
}
[@@ocaml.doc
  " The structure for details of the VPC Endpoint Service which Firehose uses to create a \
   PrivateLink to the database. \n\n\
  \ Amazon Data Firehose is in preview release and is subject to change.\n\
  \ "]

type nonrec secret_ar_n = string [@@ocaml.doc ""]

type nonrec secrets_manager_configuration = {
  secret_ar_n : secret_ar_n option;
      [@ocaml.doc
        "The ARN of the secret that stores your credentials. It must be in the same region as the \
         Firehose stream and the role. The secret ARN can reside in a different account than the \
         Firehose stream and role as Firehose supports cross-account secret access. This parameter \
         is required when {b Enabled} is set to [True].\n"]
  role_ar_n : role_ar_n option;
      [@ocaml.doc
        " Specifies the role that Firehose assumes when calling the Secrets Manager API operation. \
         When you provide the role, it overrides any destination specific role defined in the \
         destination configuration. If you do not provide the then we use the destination specific \
         role. This parameter is required for Splunk. \n"]
  enabled : boolean_object;
      [@ocaml.doc
        "Specifies whether you want to use the secrets manager feature. When set as [True] the \
         secrets manager configuration overwrites the existing secrets in the destination \
         configuration. When it's set to [False] Firehose falls back to the credentials in the \
         destination configuration.\n"]
}
[@@ocaml.doc "The structure that defines how Firehose accesses the secret.\n"]

type nonrec database_source_authentication_configuration = {
  secrets_manager_configuration : secrets_manager_configuration; [@ocaml.doc ""]
}
[@@ocaml.doc
  " The structure to configure the authentication methods for Firehose to connect to source \
   database endpoint. \n\n\
  \ Amazon Data Firehose is in preview release and is subject to change.\n\
  \ "]

type nonrec database_table_name = string [@@ocaml.doc ""]

type nonrec database_surrogate_key_list = non_empty_string_without_whitespace list [@@ocaml.doc ""]

type nonrec database_column_name = string [@@ocaml.doc ""]

type nonrec database_column_include_or_exclude_list = database_column_name list [@@ocaml.doc ""]

type nonrec database_column_list = {
  include_ : database_column_include_or_exclude_list option;
      [@ocaml.doc
        " The list of column patterns in source database to be included for Firehose to read from. \
         \n\n\
        \ Amazon Data Firehose is in preview release and is subject to change.\n\
        \ "]
  exclude : database_column_include_or_exclude_list option;
      [@ocaml.doc
        " The list of column patterns in source database to be excluded for Firehose to read from. \
         \n\n\
        \ Amazon Data Firehose is in preview release and is subject to change.\n\
        \ "]
}
[@@ocaml.doc
  "The structure used to configure the list of column patterns in source database endpoint for \
   Firehose to read from. \n\n\
  \ Amazon Data Firehose is in preview release and is subject to change.\n\
  \ "]

type nonrec database_table_include_or_exclude_list = database_table_name list [@@ocaml.doc ""]

type nonrec database_table_list = {
  include_ : database_table_include_or_exclude_list option;
      [@ocaml.doc
        "The list of table patterns in source database endpoint to be included for Firehose to \
         read from. \n\n\
        \ Amazon Data Firehose is in preview release and is subject to change.\n\
        \ "]
  exclude : database_table_include_or_exclude_list option;
      [@ocaml.doc
        "The list of table patterns in source database endpoint to be excluded for Firehose to \
         read from. \n\n\
        \ Amazon Data Firehose is in preview release and is subject to change.\n\
        \ "]
}
[@@ocaml.doc
  "The structure used to configure the list of table patterns in source database endpoint for \
   Firehose to read from. \n\n\
  \ Amazon Data Firehose is in preview release and is subject to change.\n\
  \ "]

type nonrec database_name = string [@@ocaml.doc ""]

type nonrec database_include_or_exclude_list = database_name list [@@ocaml.doc ""]

type nonrec database_list = {
  include_ : database_include_or_exclude_list option;
      [@ocaml.doc
        "The list of database patterns in source database endpoint to be included for Firehose to \
         read from. \n\n\
        \ Amazon Data Firehose is in preview release and is subject to change.\n\
        \ "]
  exclude : database_include_or_exclude_list option;
      [@ocaml.doc
        "The list of database patterns in source database endpoint to be excluded for Firehose to \
         read from. \n\n\
        \ Amazon Data Firehose is in preview release and is subject to change.\n\
        \ "]
}
[@@ocaml.doc
  "The structure used to configure the list of database patterns in source database endpoint for \
   Firehose to read from. \n\n\
  \ Amazon Data Firehose is in preview release and is subject to change.\n\
  \ "]

type nonrec ssl_mode = Disabled [@ocaml.doc ""] | Enabled [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec database_port = int [@@ocaml.doc ""]

type nonrec database_endpoint = string [@@ocaml.doc ""]

type nonrec database_type = MySQL [@ocaml.doc ""] | PostgreSQL [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec database_source_configuration = {
  type_ : database_type;
      [@ocaml.doc
        "The type of database engine. This can be one of the following values. \n\n\
        \ {ul\n\
        \       {-  MySQL\n\
        \           \n\
        \            }\n\
        \       {-  PostgreSQL\n\
        \           \n\
        \            }\n\
        \       }\n\
        \   Amazon Data Firehose is in preview release and is subject to change.\n\
        \   "]
  endpoint : database_endpoint;
      [@ocaml.doc
        " The endpoint of the database server. \n\n\
        \ Amazon Data Firehose is in preview release and is subject to change.\n\
        \ "]
  port : database_port;
      [@ocaml.doc
        "The port of the database. This can be one of the following values.\n\n\
        \ {ul\n\
        \       {-  3306 for MySQL database type\n\
        \           \n\
        \            }\n\
        \       {-  5432 for PostgreSQL database type\n\
        \           \n\
        \            }\n\
        \       }\n\
        \   Amazon Data Firehose is in preview release and is subject to change.\n\
        \   "]
  ssl_mode : ssl_mode option;
      [@ocaml.doc
        " The mode to enable or disable SSL when Firehose connects to the database endpoint. \n\n\
        \ Amazon Data Firehose is in preview release and is subject to change.\n\
        \ "]
  databases : database_list;
      [@ocaml.doc
        " The list of database patterns in source database endpoint for Firehose to read from. \n\n\
        \ Amazon Data Firehose is in preview release and is subject to change.\n\
        \ "]
  tables : database_table_list;
      [@ocaml.doc
        " The list of table patterns in source database endpoint for Firehose to read from. \n\n\
        \ Amazon Data Firehose is in preview release and is subject to change.\n\
        \ "]
  columns : database_column_list option;
      [@ocaml.doc
        " The list of column patterns in source database endpoint for Firehose to read from. \n\n\
        \ Amazon Data Firehose is in preview release and is subject to change.\n\
        \ "]
  surrogate_keys : database_surrogate_key_list option;
      [@ocaml.doc
        " The optional list of table and column names used as unique key columns when taking \
         snapshot if the tables don\226\128\153t have primary keys configured. \n\n\
        \ Amazon Data Firehose is in preview release and is subject to change.\n\
        \ "]
  snapshot_watermark_table : database_table_name;
      [@ocaml.doc
        " The fully qualified name of the table in source database endpoint that Firehose uses to \
         track snapshot progress. \n\n\
        \ Amazon Data Firehose is in preview release and is subject to change.\n\
        \ "]
  database_source_authentication_configuration : database_source_authentication_configuration;
      [@ocaml.doc
        " The structure to configure the authentication methods for Firehose to connect to source \
         database endpoint. \n\n\
        \ Amazon Data Firehose is in preview release and is subject to change.\n\
        \ "]
  database_source_vpc_configuration : database_source_vpc_configuration;
      [@ocaml.doc
        " The details of the VPC Endpoint Service which Firehose uses to create a PrivateLink to \
         the database. \n\n\
        \ Amazon Data Firehose is in preview release and is subject to change.\n\
        \ "]
}
[@@ocaml.doc
  " The top level object for configuring streams with database as a source. \n\n\
  \ Amazon Data Firehose is in preview release and is subject to change.\n\
  \ "]

type nonrec retry_duration_in_seconds = int [@@ocaml.doc ""]

type nonrec retry_options = {
  duration_in_seconds : retry_duration_in_seconds option;
      [@ocaml.doc
        "The period of time during which Firehose retries to deliver data to the specified \
         destination.\n"]
}
[@@ocaml.doc " The retry behavior in case Firehose is unable to deliver data to a destination.\n"]

type nonrec iceberg_s3_backup_mode = FailedDataOnly [@ocaml.doc ""] | AllData [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec table_creation_configuration = {
  enabled : boolean_object;
      [@ocaml.doc
        " Specify whether you want to enable automatic table creation. \n\n\
        \ Amazon Data Firehose is in preview release and is subject to change.\n\
        \ "]
}
[@@ocaml.doc
  "The configuration to enable automatic table creation.\n\n\
  \ Amazon Data Firehose is in preview release and is subject to change.\n\
  \ "]

type nonrec schema_evolution_configuration = {
  enabled : boolean_object;
      [@ocaml.doc
        " Specify whether you want to enable schema evolution. \n\n\
        \ Amazon Data Firehose is in preview release and is subject to change.\n\
        \ "]
}
[@@ocaml.doc
  "The configuration to enable schema evolution.\n\n\
  \ Amazon Data Firehose is in preview release and is subject to change.\n\
  \ "]

type nonrec partition_field = {
  source_name : non_empty_string_without_whitespace;
      [@ocaml.doc
        " The column name to be configured in partition spec. \n\n\
        \ Amazon Data Firehose is in preview release and is subject to change.\n\
        \ "]
}
[@@ocaml.doc
  "Represents a single field in a [PartitionSpec]. \n\n\
  \ Amazon Data Firehose is in preview release and is subject to change.\n\
  \ "]

type nonrec partition_fields = partition_field list [@@ocaml.doc ""]

type nonrec partition_spec = {
  identity : partition_fields option;
      [@ocaml.doc
        " List of identity {{:https://iceberg.apache.org/spec/#partition-transforms}transforms} \
         that performs an identity transformation. The transform takes the source value, and does \
         not modify it. Result type is the source type.\n\n\
        \ Amazon Data Firehose is in preview release and is subject to change.\n\
        \ "]
}
[@@ocaml.doc
  "Represents how to produce partition data for a table. Partition data is produced by \
   transforming columns in a table. Each column transform is represented by a named \
   [PartitionField]. \n\n\
  \ Here is an example of the schema in JSON. \n\
  \ \n\
  \   [\"partitionSpec\": { \"identity\": \\[ {\"sourceName\": \"column1\"}, {\"sourceName\":\n\
  \            \"column2\"}, {\"sourceName\": \"column3\"} \\] }] \n\
  \  \n\
  \   Amazon Data Firehose is in preview release and is subject to change.\n\
  \   "]

type nonrec list_of_non_empty_strings_without_whitespace = non_empty_string_without_whitespace list
[@@ocaml.doc ""]

type nonrec string_with_letters_digits_underscores_dots = string [@@ocaml.doc ""]

type nonrec destination_table_configuration = {
  destination_table_name : string_with_letters_digits_underscores_dots;
      [@ocaml.doc " Specifies the name of the Apache Iceberg Table. \n"]
  destination_database_name : string_with_letters_digits_underscores_dots;
      [@ocaml.doc " The name of the Apache Iceberg database. \n"]
  unique_keys : list_of_non_empty_strings_without_whitespace option;
      [@ocaml.doc
        " A list of unique keys for a given Apache Iceberg table. Firehose will use these for \
         running Create, Update, or Delete operations on the given Iceberg table. \n"]
  partition_spec : partition_spec option;
      [@ocaml.doc
        "The partition spec configuration for a table that is used by automatic table creation.\n\n\
        \ Amazon Data Firehose is in preview release and is subject to change.\n\
        \ "]
  s3_error_output_prefix : error_output_prefix option;
      [@ocaml.doc
        " The table specific S3 error output prefix. All the errors that occurred while delivering \
         to this table will be prefixed with this value in S3 destination. \n"]
}
[@@ocaml.doc " Describes the configuration of a destination in Apache Iceberg Tables. \n"]

type nonrec destination_table_configuration_list = destination_table_configuration list
[@@ocaml.doc ""]

type nonrec iceberg_destination_configuration = {
  destination_table_configuration_list : destination_table_configuration_list option;
      [@ocaml.doc
        " Provides a list of [DestinationTableConfigurations] which Firehose uses to deliver data \
         to Apache Iceberg Tables. Firehose will write data with insert if table specific \
         configuration is not provided here.\n"]
  schema_evolution_configuration : schema_evolution_configuration option;
      [@ocaml.doc
        "The configuration to enable automatic schema evolution.\n\n\
        \ Amazon Data Firehose is in preview release and is subject to change.\n\
        \ "]
  table_creation_configuration : table_creation_configuration option;
      [@ocaml.doc
        "The configuration to enable automatic table creation.\n\n\
        \ Amazon Data Firehose is in preview release and is subject to change.\n\
        \ "]
  buffering_hints : buffering_hints option; [@ocaml.doc ""]
  cloud_watch_logging_options : cloud_watch_logging_options option; [@ocaml.doc ""]
  processing_configuration : processing_configuration option; [@ocaml.doc ""]
  s3_backup_mode : iceberg_s3_backup_mode option;
      [@ocaml.doc
        " Describes how Firehose will backup records. Currently,S3 backup only supports \
         [FailedDataOnly]. \n"]
  retry_options : retry_options option; [@ocaml.doc ""]
  role_ar_n : role_ar_n;
      [@ocaml.doc
        " The Amazon Resource Name (ARN) of the IAM role to be assumed by Firehose for calling \
         Apache Iceberg Tables. \n"]
  append_only : boolean_object option;
      [@ocaml.doc
        " Describes whether all incoming data for this delivery stream will be append only \
         (inserts only and not for updates and deletes) for Iceberg delivery. This feature is only \
         applicable for Apache Iceberg Tables.\n\n\
        \ The default value is false. If you set this value to true, Firehose automatically \
         increases the throughput limit of a stream based on the throttling levels of the stream. \
         If you set this parameter to true for a stream with updates and deletes, you will see out \
         of order delivery. \n\
        \ "]
  catalog_configuration : catalog_configuration;
      [@ocaml.doc
        " Configuration describing where the destination Apache Iceberg Tables are persisted. \n"]
  s3_configuration : s3_destination_configuration; [@ocaml.doc ""]
}
[@@ocaml.doc " Specifies the destination configure settings for Apache Iceberg Table. \n"]

type nonrec snowflake_buffering_interval_in_seconds = int [@@ocaml.doc ""]

type nonrec snowflake_buffering_size_in_m_bs = int [@@ocaml.doc ""]

type nonrec snowflake_buffering_hints = {
  size_in_m_bs : snowflake_buffering_size_in_m_bs option;
      [@ocaml.doc
        "Buffer incoming data to the specified size, in MBs, before delivering it to the \
         destination. The default value is 128. \n"]
  interval_in_seconds : snowflake_buffering_interval_in_seconds option;
      [@ocaml.doc
        " Buffer incoming data for the specified period of time, in seconds, before delivering it \
         to the destination. The default value is 0. \n"]
}
[@@ocaml.doc
  " Describes the buffering to perform before delivering data to the Snowflake destination. If you \
   do not specify any value, Firehose uses the default values. \n"]

type nonrec snowflake_s3_backup_mode = FailedDataOnly [@ocaml.doc ""] | AllData [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec snowflake_retry_duration_in_seconds = int [@@ocaml.doc ""]

type nonrec snowflake_retry_options = {
  duration_in_seconds : snowflake_retry_duration_in_seconds option;
      [@ocaml.doc
        "the time period where Firehose will retry sending data to the chosen HTTP endpoint.\n"]
}
[@@ocaml.doc
  "Specify how long Firehose retries sending data to the New Relic HTTP endpoint. After sending \
   data, Firehose first waits for an acknowledgment from the HTTP endpoint. If an error occurs or \
   the acknowledgment doesn\226\128\153t arrive within the acknowledgment timeout period, Firehose \
   starts the retry duration counter. It keeps retrying until the retry duration expires. After \
   that, Firehose considers it a data delivery failure and backs up the data to your Amazon S3 \
   bucket. Every time that Firehose sends data to the HTTP endpoint (either the initial attempt or \
   a retry), it restarts the acknowledgement timeout counter and waits for an acknowledgement from \
   the HTTP endpoint. Even if the retry duration expires, Firehose still waits for the \
   acknowledgment until it receives it or the acknowledgement timeout period is reached. If the \
   acknowledgment times out, Firehose determines whether there's time left in the retry counter. \
   If there is time left, it retries again and repeats the logic until it receives an \
   acknowledgment or determines that the retry time has expired. If you don't want Firehose to \
   retry sending data, set this value to 0.\n"]

type nonrec snowflake_private_link_vpce_id = string [@@ocaml.doc ""]

type nonrec snowflake_vpc_configuration = {
  private_link_vpce_id : snowflake_private_link_vpce_id;
      [@ocaml.doc
        "The VPCE ID for Firehose to privately connect with Snowflake. The ID format is \
         com.amazonaws.vpce.\\[region\\].vpce-svc-<\\[id\\]>. For more information, see \
         {{:https://docs.snowflake.com/en/user-guide/admin-security-privatelink}Amazon PrivateLink \
         & Snowflake} \n"]
}
[@@ocaml.doc "Configure a Snowflake VPC\n"]

type nonrec snowflake_content_column_name = string [@@ocaml.doc ""]

type nonrec snowflake_meta_data_column_name = string [@@ocaml.doc ""]

type nonrec snowflake_data_loading_option =
  | JSON_MAPPING [@ocaml.doc ""]
  | VARIANT_CONTENT_MAPPING [@ocaml.doc ""]
  | VARIANT_CONTENT_AND_METADATA_MAPPING [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec snowflake_role = string [@@ocaml.doc ""]

type nonrec snowflake_role_configuration = {
  enabled : boolean_object option; [@ocaml.doc "Enable Snowflake role\n"]
  snowflake_role : snowflake_role option; [@ocaml.doc "The Snowflake role you wish to configure\n"]
}
[@@ocaml.doc
  "Optionally configure a Snowflake role. Otherwise the default user role will be used.\n"]

type nonrec snowflake_table = string [@@ocaml.doc ""]

type nonrec snowflake_schema = string [@@ocaml.doc ""]

type nonrec snowflake_database = string [@@ocaml.doc ""]

type nonrec snowflake_user = string [@@ocaml.doc ""]

type nonrec snowflake_key_passphrase = string [@@ocaml.doc ""]

type nonrec snowflake_private_key = string [@@ocaml.doc ""]

type nonrec snowflake_account_url = string [@@ocaml.doc ""]

type nonrec snowflake_destination_configuration = {
  account_url : snowflake_account_url;
      [@ocaml.doc
        "URL for accessing your Snowflake account. This URL must include your \
         {{:https://docs.snowflake.com/en/user-guide/admin-account-identifier}account identifier}. \
         Note that the protocol (https://) and port number are optional.\n"]
  private_key : snowflake_private_key option;
      [@ocaml.doc
        "The private key used to encrypt your Snowflake client. For information, see \
         {{:https://docs.snowflake.com/en/user-guide/data-load-snowpipe-streaming-configuration#using-key-pair-authentication-key-rotation}Using \
         Key Pair Authentication & Key Rotation}.\n"]
  key_passphrase : snowflake_key_passphrase option;
      [@ocaml.doc
        "Passphrase to decrypt the private key when the key is encrypted. For information, see \
         {{:https://docs.snowflake.com/en/user-guide/data-load-snowpipe-streaming-configuration#using-key-pair-authentication-key-rotation}Using \
         Key Pair Authentication & Key Rotation}.\n"]
  user : snowflake_user option; [@ocaml.doc "User login name for the Snowflake account.\n"]
  database : snowflake_database; [@ocaml.doc "All data in Snowflake is maintained in databases.\n"]
  schema : snowflake_schema;
      [@ocaml.doc
        "Each database consists of one or more schemas, which are logical groupings of database \
         objects, such as tables and views\n"]
  table : snowflake_table;
      [@ocaml.doc
        "All data in Snowflake is stored in database tables, logically structured as collections \
         of columns and rows.\n"]
  snowflake_role_configuration : snowflake_role_configuration option;
      [@ocaml.doc
        "Optionally configure a Snowflake role. Otherwise the default user role will be used.\n"]
  data_loading_option : snowflake_data_loading_option option;
      [@ocaml.doc
        "Choose to load JSON keys mapped to table column names or choose to split the JSON payload \
         where content is mapped to a record content column and source metadata is mapped to a \
         record metadata column.\n"]
  meta_data_column_name : snowflake_meta_data_column_name option;
      [@ocaml.doc
        "Specify a column name in the table, where the metadata information has to be loaded. When \
         you enable this field, you will see the following column in the snowflake table, which \
         differs based on the source type.\n\n\
        \ For Direct PUT as source \n\
        \ \n\
        \   [{ \"firehoseDeliveryStreamName\" : \"streamname\", \"IngestionTime\" : \"timestamp\"\n\
        \            }] \n\
        \  \n\
        \   For Kinesis Data Stream as source \n\
        \   \n\
        \     [ \"kinesisStreamName\" : \"streamname\", \"kinesisShardId\" : \"Id\",\n\
        \            \"kinesisPartitionKey\" : \"key\", \"kinesisSequenceNumber\" : \"1234\", \
         \"subsequenceNumber\" :\n\
        \            \"2334\", \"IngestionTime\" : \"timestamp\" }] \n\
        \    "]
  content_column_name : snowflake_content_column_name option;
      [@ocaml.doc "The name of the record content column.\n"]
  snowflake_vpc_configuration : snowflake_vpc_configuration option;
      [@ocaml.doc
        "The VPCE ID for Firehose to privately connect with Snowflake. The ID format is \
         com.amazonaws.vpce.\\[region\\].vpce-svc-<\\[id\\]>. For more information, see \
         {{:https://docs.snowflake.com/en/user-guide/admin-security-privatelink}Amazon PrivateLink \
         & Snowflake} \n"]
  cloud_watch_logging_options : cloud_watch_logging_options option; [@ocaml.doc ""]
  processing_configuration : processing_configuration option; [@ocaml.doc ""]
  role_ar_n : role_ar_n; [@ocaml.doc "The Amazon Resource Name (ARN) of the Snowflake role\n"]
  retry_options : snowflake_retry_options option;
      [@ocaml.doc
        "The time period where Firehose will retry sending data to the chosen HTTP endpoint.\n"]
  s3_backup_mode : snowflake_s3_backup_mode option; [@ocaml.doc "Choose an S3 backup mode\n"]
  s3_configuration : s3_destination_configuration; [@ocaml.doc ""]
  secrets_manager_configuration : secrets_manager_configuration option;
      [@ocaml.doc " The configuration that defines how you access secrets for Snowflake. \n"]
  buffering_hints : snowflake_buffering_hints option;
      [@ocaml.doc
        " Describes the buffering to perform before delivering data to the Snowflake destination. \
         If you do not specify any value, Firehose uses the default values. \n"]
}
[@@ocaml.doc "Configure Snowflake destination\n"]

type nonrec read_from_timestamp = Smaws_Lib.CoreTypes.Timestamp.t [@@ocaml.doc ""]

type nonrec topic_name = string [@@ocaml.doc ""]

type nonrec msk_cluster_ar_n = string [@@ocaml.doc ""]

type nonrec msk_source_configuration = {
  msk_cluster_ar_n : msk_cluster_ar_n; [@ocaml.doc "The ARN of the Amazon MSK cluster.\n"]
  topic_name : topic_name; [@ocaml.doc "The topic name within the Amazon MSK cluster. \n"]
  authentication_configuration : authentication_configuration;
      [@ocaml.doc "The authentication configuration of the Amazon MSK cluster.\n"]
  read_from_timestamp : read_from_timestamp option;
      [@ocaml.doc
        "The start date and time in UTC for the offset position within your MSK topic from where \
         Firehose begins to read. By default, this is set to timestamp when Firehose becomes \
         Active. \n\n\
        \ If you want to create a Firehose stream with Earliest start position from SDK or CLI, \
         you need to set the [ReadFromTimestamp] parameter to Epoch (1970-01-01T00:00:00Z). \n\
        \ "]
}
[@@ocaml.doc
  "The configuration for the Amazon MSK cluster to be used as the source for a delivery stream.\n"]

type nonrec tag_value = string [@@ocaml.doc ""]

type nonrec tag_key = string [@@ocaml.doc ""]

type nonrec tag = {
  key : tag_key;
      [@ocaml.doc
        "A unique identifier for the tag. Maximum length: 128 characters. Valid characters: \
         Unicode letters, digits, white space, _ . / = + - % \\@\n"]
  value : tag_value option;
      [@ocaml.doc
        "An optional string, which you can use to describe or define the tag. Maximum length: 256 \
         characters. Valid characters: Unicode letters, digits, white space, _ . / = + - % \\@\n"]
}
[@@ocaml.doc "Metadata that you can assign to a Firehose stream, consisting of a key-value pair.\n"]

type nonrec tag_delivery_stream_input_tag_list = tag list [@@ocaml.doc ""]

type nonrec http_endpoint_s3_backup_mode =
  | FailedDataOnly [@ocaml.doc ""]
  | AllData [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec http_endpoint_retry_duration_in_seconds = int [@@ocaml.doc ""]

type nonrec http_endpoint_retry_options = {
  duration_in_seconds : http_endpoint_retry_duration_in_seconds option;
      [@ocaml.doc
        "The total amount of time that Firehose spends on retries. This duration starts after the \
         initial attempt to send data to the custom destination via HTTPS endpoint fails. It \
         doesn't include the periods during which Firehose waits for acknowledgment from the \
         specified destination after each attempt. \n"]
}
[@@ocaml.doc
  "Describes the retry behavior in case Firehose is unable to deliver data to the specified HTTP \
   endpoint destination, or if it doesn't receive a valid acknowledgment of receipt from the \
   specified HTTP endpoint destination.\n"]

type nonrec http_endpoint_attribute_value = string [@@ocaml.doc ""]

type nonrec http_endpoint_attribute_name = string [@@ocaml.doc ""]

type nonrec http_endpoint_common_attribute = {
  attribute_name : http_endpoint_attribute_name;
      [@ocaml.doc "The name of the HTTP endpoint common attribute.\n"]
  attribute_value : http_endpoint_attribute_value;
      [@ocaml.doc "The value of the HTTP endpoint common attribute.\n"]
}
[@@ocaml.doc
  "Describes the metadata that's delivered to the specified HTTP endpoint destination.\n"]

type nonrec http_endpoint_common_attributes_list = http_endpoint_common_attribute list
[@@ocaml.doc ""]

type nonrec http_endpoint_request_configuration = {
  content_encoding : content_encoding option;
      [@ocaml.doc
        "Firehose uses the content encoding to compress the body of a request before sending the \
         request to the destination. For more information, see \
         {{:https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Content-Encoding}Content-Encoding} \
         in MDN Web Docs, the official Mozilla documentation.\n"]
  common_attributes : http_endpoint_common_attributes_list option;
      [@ocaml.doc "Describes the metadata sent to the HTTP endpoint destination.\n"]
}
[@@ocaml.doc "The configuration of the HTTP endpoint request.\n"]

type nonrec http_endpoint_buffering_interval_in_seconds = int [@@ocaml.doc ""]

type nonrec http_endpoint_buffering_size_in_m_bs = int [@@ocaml.doc ""]

type nonrec http_endpoint_buffering_hints = {
  size_in_m_bs : http_endpoint_buffering_size_in_m_bs option;
      [@ocaml.doc
        "Buffer incoming data to the specified size, in MBs, before delivering it to the \
         destination. The default value is 5. \n\n\
        \ We recommend setting this parameter to a value greater than the amount of data you \
         typically ingest into the Firehose stream in 10 seconds. For example, if you typically \
         ingest data at 1 MB/sec, the value should be 10 MB or higher. \n\
        \ "]
  interval_in_seconds : http_endpoint_buffering_interval_in_seconds option;
      [@ocaml.doc
        "Buffer incoming data for the specified period of time, in seconds, before delivering it \
         to the destination. The default value is 300 (5 minutes). \n"]
}
[@@ocaml.doc
  "Describes the buffering options that can be applied before data is delivered to the HTTP \
   endpoint destination. Firehose treats these options as hints, and it might choose to use more \
   optimal values. The [SizeInMBs] and [IntervalInSeconds] parameters are optional. However, if \
   specify a value for one of them, you must also provide a value for the other. \n"]

type nonrec http_endpoint_access_key = string [@@ocaml.doc ""]

type nonrec http_endpoint_name = string [@@ocaml.doc ""]

type nonrec http_endpoint_url = string [@@ocaml.doc ""]

type nonrec http_endpoint_configuration = {
  url : http_endpoint_url;
      [@ocaml.doc
        "The URL of the HTTP endpoint selected as the destination.\n\n\
        \  If you choose an HTTP endpoint as your destination, review and follow the instructions \
         in the \
         {{:https://docs.aws.amazon.com/firehose/latest/dev/httpdeliveryrequestresponse.html}Appendix \
         - HTTP Endpoint Delivery Request and Response Specifications}.\n\
        \  \n\
        \   "]
  name : http_endpoint_name option;
      [@ocaml.doc "The name of the HTTP endpoint selected as the destination.\n"]
  access_key : http_endpoint_access_key option;
      [@ocaml.doc
        "The access key required for Kinesis Firehose to authenticate with the HTTP endpoint \
         selected as the destination.\n"]
}
[@@ocaml.doc
  "Describes the configuration of the HTTP endpoint to which Kinesis Firehose delivers data.\n"]

type nonrec http_endpoint_destination_configuration = {
  endpoint_configuration : http_endpoint_configuration;
      [@ocaml.doc "The configuration of the HTTP endpoint selected as the destination.\n"]
  buffering_hints : http_endpoint_buffering_hints option;
      [@ocaml.doc
        "The buffering options that can be used before data is delivered to the specified \
         destination. Firehose treats these options as hints, and it might choose to use more \
         optimal values. The [SizeInMBs] and [IntervalInSeconds] parameters are optional. However, \
         if you specify a value for one of them, you must also provide a value for the other. \n"]
  cloud_watch_logging_options : cloud_watch_logging_options option; [@ocaml.doc ""]
  request_configuration : http_endpoint_request_configuration option;
      [@ocaml.doc
        "The configuration of the request sent to the HTTP endpoint that is specified as the \
         destination.\n"]
  processing_configuration : processing_configuration option; [@ocaml.doc ""]
  role_ar_n : role_ar_n option;
      [@ocaml.doc
        "Firehose uses this IAM role for all the permissions that the delivery stream needs.\n"]
  retry_options : http_endpoint_retry_options option;
      [@ocaml.doc
        "Describes the retry behavior in case Firehose is unable to deliver data to the specified \
         HTTP endpoint destination, or if it doesn't receive a valid acknowledgment of receipt \
         from the specified HTTP endpoint destination.\n"]
  s3_backup_mode : http_endpoint_s3_backup_mode option;
      [@ocaml.doc
        "Describes the S3 bucket backup options for the data that Firehose delivers to the HTTP \
         endpoint destination. You can back up all documents ([AllData]) or only the documents \
         that Firehose could not deliver to the specified HTTP endpoint destination \
         ([FailedDataOnly]).\n"]
  s3_configuration : s3_destination_configuration; [@ocaml.doc ""]
  secrets_manager_configuration : secrets_manager_configuration option;
      [@ocaml.doc
        " The configuration that defines how you access secrets for HTTP Endpoint destination. \n"]
}
[@@ocaml.doc "Describes the configuration of the HTTP endpoint destination.\n"]

type nonrec splunk_buffering_size_in_m_bs = int [@@ocaml.doc ""]

type nonrec splunk_buffering_interval_in_seconds = int [@@ocaml.doc ""]

type nonrec splunk_buffering_hints = {
  interval_in_seconds : splunk_buffering_interval_in_seconds option;
      [@ocaml.doc
        "Buffer incoming data for the specified period of time, in seconds, before delivering it \
         to the destination. The default value is 60 (1 minute).\n"]
  size_in_m_bs : splunk_buffering_size_in_m_bs option;
      [@ocaml.doc
        "Buffer incoming data to the specified size, in MBs, before delivering it to the \
         destination. The default value is 5. \n"]
}
[@@ocaml.doc
  "The buffering options. If no value is specified, the default values for Splunk are used.\n"]

type nonrec splunk_s3_backup_mode = FailedEventsOnly [@ocaml.doc ""] | AllEvents [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec splunk_retry_duration_in_seconds = int [@@ocaml.doc ""]

type nonrec splunk_retry_options = {
  duration_in_seconds : splunk_retry_duration_in_seconds option;
      [@ocaml.doc
        "The total amount of time that Firehose spends on retries. This duration starts after the \
         initial attempt to send data to Splunk fails. It doesn't include the periods during which \
         Firehose waits for acknowledgment from Splunk after each attempt.\n"]
}
[@@ocaml.doc
  "Configures retry behavior in case Firehose is unable to deliver documents to Splunk, or if it \
   doesn't receive an acknowledgment from Splunk.\n"]

type nonrec hec_acknowledgment_timeout_in_seconds = int [@@ocaml.doc ""]

type nonrec hec_token = string [@@ocaml.doc ""]

type nonrec hec_endpoint_type = Raw [@ocaml.doc ""] | Event [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec hec_endpoint = string [@@ocaml.doc ""]

type nonrec splunk_destination_configuration = {
  hec_endpoint : hec_endpoint;
      [@ocaml.doc "The HTTP Event Collector (HEC) endpoint to which Firehose sends your data.\n"]
  hec_endpoint_type : hec_endpoint_type;
      [@ocaml.doc "This type can be either \"Raw\" or \"Event.\"\n"]
  hec_token : hec_token option;
      [@ocaml.doc
        "This is a GUID that you obtain from your Splunk cluster when you create a new HEC endpoint.\n"]
  hec_acknowledgment_timeout_in_seconds : hec_acknowledgment_timeout_in_seconds option;
      [@ocaml.doc
        "The amount of time that Firehose waits to receive an acknowledgment from Splunk after it \
         sends it data. At the end of the timeout period, Firehose either tries to send the data \
         again or considers it an error, based on your retry settings.\n"]
  retry_options : splunk_retry_options option;
      [@ocaml.doc
        "The retry behavior in case Firehose is unable to deliver data to Splunk, or if it doesn't \
         receive an acknowledgment of receipt from Splunk.\n"]
  s3_backup_mode : splunk_s3_backup_mode option;
      [@ocaml.doc
        "Defines how documents should be delivered to Amazon S3. When set to [FailedEventsOnly], \
         Firehose writes any data that could not be indexed to the configured Amazon S3 \
         destination. When set to [AllEvents], Firehose delivers all incoming records to Amazon \
         S3, and also writes failed documents to Amazon S3. The default value is \
         [FailedEventsOnly].\n\n\
        \ You can update this backup mode from [FailedEventsOnly] to [AllEvents]. You can't update \
         it from [AllEvents] to [FailedEventsOnly].\n\
        \ "]
  s3_configuration : s3_destination_configuration;
      [@ocaml.doc "The configuration for the backup Amazon S3 location.\n"]
  processing_configuration : processing_configuration option;
      [@ocaml.doc "The data processing configuration.\n"]
  cloud_watch_logging_options : cloud_watch_logging_options option;
      [@ocaml.doc "The Amazon CloudWatch logging options for your Firehose stream.\n"]
  buffering_hints : splunk_buffering_hints option;
      [@ocaml.doc
        "The buffering options. If no value is specified, the default values for Splunk are used.\n"]
  secrets_manager_configuration : secrets_manager_configuration option;
      [@ocaml.doc " The configuration that defines how you access secrets for Splunk. \n"]
}
[@@ocaml.doc "Describes the configuration of a destination in Splunk.\n"]

type nonrec elasticsearch_s3_backup_mode =
  | FailedDocumentsOnly [@ocaml.doc ""]
  | AllDocuments [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec elasticsearch_retry_duration_in_seconds = int [@@ocaml.doc ""]

type nonrec elasticsearch_retry_options = {
  duration_in_seconds : elasticsearch_retry_duration_in_seconds option;
      [@ocaml.doc
        "After an initial failure to deliver to Amazon OpenSearch Service, the total amount of \
         time during which Firehose retries delivery (including the first attempt). After this \
         time has elapsed, the failed documents are written to Amazon S3. Default value is 300 \
         seconds (5 minutes). A value of 0 (zero) results in no retries.\n"]
}
[@@ocaml.doc
  "Configures retry behavior in case Firehose is unable to deliver documents to Amazon OpenSearch \
   Service.\n"]

type nonrec elasticsearch_buffering_size_in_m_bs = int [@@ocaml.doc ""]

type nonrec elasticsearch_buffering_interval_in_seconds = int [@@ocaml.doc ""]

type nonrec elasticsearch_buffering_hints = {
  interval_in_seconds : elasticsearch_buffering_interval_in_seconds option;
      [@ocaml.doc
        "Buffer incoming data for the specified period of time, in seconds, before delivering it \
         to the destination. The default value is 300 (5 minutes).\n"]
  size_in_m_bs : elasticsearch_buffering_size_in_m_bs option;
      [@ocaml.doc
        "Buffer incoming data to the specified size, in MBs, before delivering it to the \
         destination. The default value is 5.\n\n\
        \ We recommend setting this parameter to a value greater than the amount of data you \
         typically ingest into the Firehose stream in 10 seconds. For example, if you typically \
         ingest data at 1 MB/sec, the value should be 10 MB or higher.\n\
        \ "]
}
[@@ocaml.doc
  "Describes the buffering to perform before delivering data to the Amazon OpenSearch Service \
   destination.\n"]

type nonrec elasticsearch_index_rotation_period =
  | NoRotation [@ocaml.doc ""]
  | OneHour [@ocaml.doc ""]
  | OneDay [@ocaml.doc ""]
  | OneWeek [@ocaml.doc ""]
  | OneMonth [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec elasticsearch_type_name = string [@@ocaml.doc ""]

type nonrec elasticsearch_index_name = string [@@ocaml.doc ""]

type nonrec elasticsearch_cluster_endpoint = string [@@ocaml.doc ""]

type nonrec elasticsearch_domain_ar_n = string [@@ocaml.doc ""]

type nonrec elasticsearch_destination_configuration = {
  role_ar_n : role_ar_n;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the IAM role to be assumed by Firehose for calling the \
         Amazon OpenSearch Service Configuration API and for indexing documents. For more \
         information, see \
         {{:https://docs.aws.amazon.com/firehose/latest/dev/controlling-access.html#using-iam-s3}Grant \
         Firehose Access to an Amazon S3 Destination} and \
         {{:https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html}Amazon \
         Resource Names (ARNs) and Amazon Web Services Service Namespaces}.\n"]
  domain_ar_n : elasticsearch_domain_ar_n option;
      [@ocaml.doc
        "The ARN of the Amazon OpenSearch Service domain. The IAM role must have permissions \
         for\194\160[DescribeDomain], [DescribeDomains], and [DescribeDomainConfig]\194\160after \
         assuming the role specified in {b RoleARN}. For more information, see \
         {{:https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html}Amazon \
         Resource Names (ARNs) and Amazon Web Services Service Namespaces}.\n\n\
        \ Specify either [ClusterEndpoint] or [DomainARN].\n\
        \ "]
  cluster_endpoint : elasticsearch_cluster_endpoint option;
      [@ocaml.doc
        "The endpoint to use when communicating with the cluster. Specify either this \
         [ClusterEndpoint] or the [DomainARN] field.\n"]
  index_name : elasticsearch_index_name; [@ocaml.doc "The Elasticsearch index name.\n"]
  type_name : elasticsearch_type_name option;
      [@ocaml.doc
        "The Elasticsearch type name. For Elasticsearch 6.x, there can be only one type per index. \
         If you try to specify a new type for an existing index that already has another type, \
         Firehose returns an error during run time.\n\n\
        \ For Elasticsearch 7.x, don't specify a [TypeName].\n\
        \ "]
  index_rotation_period : elasticsearch_index_rotation_period option;
      [@ocaml.doc
        "The Elasticsearch index rotation period. Index rotation appends a timestamp to the \
         [IndexName] to facilitate the expiration of old data. For more information, see \
         {{:https://docs.aws.amazon.com/firehose/latest/dev/basic-deliver.html#es-index-rotation}Index \
         Rotation for the Amazon OpenSearch Service Destination}. The default value \
         is\194\160[OneDay].\n"]
  buffering_hints : elasticsearch_buffering_hints option;
      [@ocaml.doc
        "The buffering options. If no value is specified, the default values for \
         [ElasticsearchBufferingHints] are used.\n"]
  retry_options : elasticsearch_retry_options option;
      [@ocaml.doc
        "The retry behavior in case Firehose is unable to deliver documents to Amazon OpenSearch \
         Service. The default value is 300 (5 minutes).\n"]
  s3_backup_mode : elasticsearch_s3_backup_mode option;
      [@ocaml.doc
        "Defines how documents should be delivered to Amazon S3. When it is set to \
         [FailedDocumentsOnly], Firehose writes any documents that could not be indexed to the \
         configured Amazon S3 destination, with [AmazonOpenSearchService-failed/] appended to the \
         key prefix. When set to [AllDocuments], Firehose delivers all incoming records to Amazon \
         S3, and also writes failed documents with [AmazonOpenSearchService-failed/] appended to \
         the prefix. For more information, see \
         {{:https://docs.aws.amazon.com/firehose/latest/dev/basic-deliver.html#es-s3-backup}Amazon \
         S3 Backup for the Amazon OpenSearch Service Destination}. Default value is \
         [FailedDocumentsOnly].\n\n\
        \ You can't change this backup mode after you create the Firehose stream. \n\
        \ "]
  s3_configuration : s3_destination_configuration;
      [@ocaml.doc "The configuration for the backup Amazon S3 location.\n"]
  processing_configuration : processing_configuration option;
      [@ocaml.doc "The data processing configuration.\n"]
  cloud_watch_logging_options : cloud_watch_logging_options option;
      [@ocaml.doc "The Amazon CloudWatch logging options for your Firehose stream.\n"]
  vpc_configuration : vpc_configuration option;
      [@ocaml.doc "The details of the VPC of the Amazon destination.\n"]
  document_id_options : document_id_options option;
      [@ocaml.doc
        "Indicates the method for setting up document ID. The supported methods are Firehose \
         generated document ID and OpenSearch Service generated document ID.\n"]
}
[@@ocaml.doc "Describes the configuration of a destination in Amazon OpenSearch Service.\n"]

type nonrec redshift_s3_backup_mode = Disabled [@ocaml.doc ""] | Enabled [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec redshift_retry_duration_in_seconds = int [@@ocaml.doc ""]

type nonrec redshift_retry_options = {
  duration_in_seconds : redshift_retry_duration_in_seconds option;
      [@ocaml.doc
        "The length of time during which Firehose retries delivery after a failure, starting from \
         the initial request and including the first attempt. The default value is 3600 seconds \
         (60 minutes). Firehose does not retry if the value of [DurationInSeconds] is 0 (zero) or \
         if the first delivery attempt takes longer than the current value.\n"]
}
[@@ocaml.doc
  "Configures retry behavior in case Firehose is unable to deliver documents to Amazon Redshift.\n"]

type nonrec password = string [@@ocaml.doc ""]

type nonrec username = string [@@ocaml.doc ""]

type nonrec redshift_destination_configuration = {
  role_ar_n : role_ar_n;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the Amazon Web Services credentials. For more \
         information, see \
         {{:https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html}Amazon \
         Resource Names (ARNs) and Amazon Web Services Service Namespaces}.\n"]
  cluster_jdbcur_l : cluster_jdbcur_l; [@ocaml.doc "The database connection string.\n"]
  copy_command : copy_command; [@ocaml.doc "The [COPY] command.\n"]
  username : username option; [@ocaml.doc "The name of the user.\n"]
  password : password option; [@ocaml.doc "The user password.\n"]
  retry_options : redshift_retry_options option;
      [@ocaml.doc
        "The retry behavior in case Firehose is unable to deliver documents to Amazon Redshift. \
         Default value is 3600 (60 minutes).\n"]
  s3_configuration : s3_destination_configuration;
      [@ocaml.doc
        "The configuration for the intermediate Amazon S3 location from which Amazon Redshift \
         obtains data. Restrictions are described in the topic for [CreateDeliveryStream].\n\n\
        \ The compression formats [SNAPPY] or [ZIP] cannot be specified in \
         [RedshiftDestinationConfiguration.S3Configuration] because the Amazon Redshift [COPY] \
         operation that reads from the S3 bucket doesn't support these compression formats.\n\
        \ "]
  processing_configuration : processing_configuration option;
      [@ocaml.doc "The data processing configuration.\n"]
  s3_backup_mode : redshift_s3_backup_mode option;
      [@ocaml.doc
        "The Amazon S3 backup mode. After you create a Firehose stream, you can update it to \
         enable Amazon S3 backup if it is disabled. If backup is enabled, you can't update the \
         Firehose stream to disable it. \n"]
  s3_backup_configuration : s3_destination_configuration option;
      [@ocaml.doc "The configuration for backup in Amazon S3.\n"]
  cloud_watch_logging_options : cloud_watch_logging_options option;
      [@ocaml.doc "The CloudWatch logging options for your Firehose stream.\n"]
  secrets_manager_configuration : secrets_manager_configuration option;
      [@ocaml.doc " The configuration that defines how you access secrets for Amazon Redshift. \n"]
}
[@@ocaml.doc "Describes the configuration of a destination in Amazon Redshift.\n"]

type nonrec custom_time_zone = string [@@ocaml.doc ""]

type nonrec file_extension = string [@@ocaml.doc ""]

type nonrec dynamic_partitioning_configuration = {
  retry_options : retry_options option;
      [@ocaml.doc
        "The retry behavior in case Firehose is unable to deliver data to an Amazon S3 prefix.\n"]
  enabled : boolean_object option;
      [@ocaml.doc "Specifies that the dynamic partitioning is enabled for this Firehose stream.\n"]
}
[@@ocaml.doc
  "The configuration of the dynamic partitioning mechanism that creates smaller data sets from the \
   streaming data by partitioning it based on partition keys. Currently, dynamic partitioning is \
   only supported for Amazon S3 destinations. \n"]

type nonrec orc_format_version = V0_11 [@ocaml.doc ""] | V0_12 [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec proportion = float [@@ocaml.doc ""]

type nonrec orc_compression = NONE [@ocaml.doc ""] | ZLIB [@ocaml.doc ""] | SNAPPY [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec orc_row_index_stride = int [@@ocaml.doc ""]

type nonrec orc_stripe_size_bytes = int [@@ocaml.doc ""]

type nonrec orc_ser_de = {
  stripe_size_bytes : orc_stripe_size_bytes option;
      [@ocaml.doc
        "The number of bytes in each stripe. The default is 64 MiB and the minimum is 8 MiB.\n"]
  block_size_bytes : block_size_bytes option;
      [@ocaml.doc
        "The Hadoop Distributed File System (HDFS) block size. This is useful if you intend to \
         copy the data from Amazon S3 to HDFS before querying. The default is 256 MiB and the \
         minimum is 64 MiB. Firehose uses this value for padding calculations.\n"]
  row_index_stride : orc_row_index_stride option;
      [@ocaml.doc
        "The number of rows between index entries. The default is 10,000 and the minimum is 1,000.\n"]
  enable_padding : boolean_object option;
      [@ocaml.doc
        "Set this to [true] to indicate that you want stripes to be padded to the HDFS block \
         boundaries. This is useful if you intend to copy the data from Amazon S3 to HDFS before \
         querying. The default is [false].\n"]
  padding_tolerance : proportion option;
      [@ocaml.doc
        "A number between 0 and 1 that defines the tolerance for block padding as a decimal \
         fraction of stripe size. The default value is 0.05, which means 5 percent of stripe \
         size.\n\n\
        \ For the default values of 64 MiB ORC stripes and 256 MiB HDFS blocks, the default block \
         padding tolerance of 5 percent reserves a maximum of 3.2 MiB for padding within the 256 \
         MiB block. In such a case, if the available size within the block is more than 3.2 MiB, a \
         new, smaller stripe is inserted to fit within that space. This ensures that no stripe \
         crosses block boundaries and causes remote reads within a node-local task.\n\
        \ \n\
        \  Firehose ignores this parameter when [OrcSerDe$EnablePadding] is [false].\n\
        \  "]
  compression : orc_compression option;
      [@ocaml.doc "The compression code to use over data blocks. The default is [SNAPPY].\n"]
  bloom_filter_columns : list_of_non_empty_strings_without_whitespace option;
      [@ocaml.doc
        "The column names for which you want Firehose to create bloom filters. The default is \
         [null].\n"]
  bloom_filter_false_positive_probability : proportion option;
      [@ocaml.doc
        "The Bloom filter false positive probability (FPP). The lower the FPP, the bigger the \
         Bloom filter. The default value is 0.05, the minimum is 0, and the maximum is 1.\n"]
  dictionary_key_threshold : proportion option;
      [@ocaml.doc
        "Represents the fraction of the total number of non-null rows. To turn off dictionary \
         encoding, set this fraction to a number that is less than the number of distinct keys in \
         a dictionary. To always use dictionary encoding, set this threshold to 1.\n"]
  format_version : orc_format_version option;
      [@ocaml.doc
        "The version of the file to write. The possible values are [V0_11] and [V0_12]. The \
         default is [V0_12].\n"]
}
[@@ocaml.doc
  "A serializer to use for converting data to the ORC format before storing it in Amazon S3. For \
   more information, see {{:https://orc.apache.org/docs/}Apache ORC}.\n"]

type nonrec parquet_writer_version = V1 [@ocaml.doc ""] | V2 [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec non_negative_integer_object = int [@@ocaml.doc ""]

type nonrec parquet_compression =
  | UNCOMPRESSED [@ocaml.doc ""]
  | GZIP [@ocaml.doc ""]
  | SNAPPY [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec parquet_page_size_bytes = int [@@ocaml.doc ""]

type nonrec parquet_ser_de = {
  block_size_bytes : block_size_bytes option;
      [@ocaml.doc
        "The Hadoop Distributed File System (HDFS) block size. This is useful if you intend to \
         copy the data from Amazon S3 to HDFS before querying. The default is 256 MiB and the \
         minimum is 64 MiB. Firehose uses this value for padding calculations.\n"]
  page_size_bytes : parquet_page_size_bytes option;
      [@ocaml.doc
        "The Parquet page size. Column chunks are divided into pages. A page is conceptually an \
         indivisible unit (in terms of compression and encoding). The minimum value is 64 KiB and \
         the default is 1 MiB.\n"]
  compression : parquet_compression option;
      [@ocaml.doc
        "The compression code to use over data blocks. The possible values are [UNCOMPRESSED], \
         [SNAPPY], and [GZIP], with the default being [SNAPPY]. Use [SNAPPY] for higher \
         decompression speed. Use [GZIP] if the compression ratio is more important than speed.\n"]
  enable_dictionary_compression : boolean_object option;
      [@ocaml.doc "Indicates whether to enable dictionary compression.\n"]
  max_padding_bytes : non_negative_integer_object option;
      [@ocaml.doc
        "The maximum amount of padding to apply. This is useful if you intend to copy the data \
         from Amazon S3 to HDFS before querying. The default is 0.\n"]
  writer_version : parquet_writer_version option;
      [@ocaml.doc
        "Indicates the version of row format to output. The possible values are [V1] and [V2]. The \
         default is [V1].\n"]
}
[@@ocaml.doc
  "A serializer to use for converting data to the Parquet format before storing it in Amazon S3. \
   For more information, see {{:https://parquet.apache.org/docs/}Apache Parquet}.\n"]

type nonrec serializer = {
  parquet_ser_de : parquet_ser_de option;
      [@ocaml.doc
        "A serializer to use for converting data to the Parquet format before storing it in Amazon \
         S3. For more information, see \
         {{:https://parquet.apache.org/docs/contribution-guidelines/}Apache Parquet}.\n"]
  orc_ser_de : orc_ser_de option;
      [@ocaml.doc
        "A serializer to use for converting data to the ORC format before storing it in Amazon S3. \
         For more information, see {{:https://orc.apache.org/docs/}Apache ORC}.\n"]
}
[@@ocaml.doc
  "The serializer that you want Firehose to use to convert data to the target format before \
   writing it to Amazon S3. Firehose supports two types of serializers: the ORC SerDe and the \
   Parquet SerDe.\n"]

type nonrec output_format_configuration = {
  serializer : serializer option;
      [@ocaml.doc
        "Specifies which serializer to use. You can choose either the ORC SerDe or the Parquet \
         SerDe. If both are non-null, the server rejects the request.\n"]
}
[@@ocaml.doc
  "Specifies the serializer that you want Firehose to use to convert the format of your data \
   before it writes it to Amazon S3. This parameter is required if [Enabled] is set to true.\n"]

type nonrec list_of_non_empty_strings = non_empty_string list [@@ocaml.doc ""]

type nonrec hive_json_ser_de = {
  timestamp_formats : list_of_non_empty_strings option;
      [@ocaml.doc
        "Indicates how you want Firehose to parse the date and timestamps that may be present in \
         your input data JSON. To specify these format strings, follow the pattern syntax of \
         JodaTime's DateTimeFormat format strings. For more information, see \
         {{:https://www.joda.org/joda-time/apidocs/org/joda/time/format/DateTimeFormat.html}Class \
         DateTimeFormat}. You can also use the special value [millis] to parse timestamps in epoch \
         milliseconds. If you don't specify a format, Firehose uses [java.sql.Timestamp::valueOf] \
         by default.\n"]
}
[@@ocaml.doc
  "The native Hive / HCatalog JsonSerDe. Used by Firehose for deserializing data, which means \
   converting it from the JSON format in preparation for serializing it to the Parquet or ORC \
   format. This is one of two deserializers you can choose, depending on which one offers the \
   functionality you need. The other option is the OpenX SerDe.\n"]

type nonrec open_x_json_ser_de = {
  convert_dots_in_json_keys_to_underscores : boolean_object option;
      [@ocaml.doc
        "When set to [true], specifies that the names of the keys include dots and that you want \
         Firehose to replace them with underscores. This is useful because Apache Hive does not \
         allow dots in column names. For example, if the JSON contains a key whose name is \
         \"a.b\", you can define the column name to be \"a_b\" when using this option.\n\n\
        \ The default is [false].\n\
        \ "]
  case_insensitive : boolean_object option;
      [@ocaml.doc
        "When set to [true], which is the default, Firehose converts JSON keys to lowercase before \
         deserializing them.\n"]
  column_to_json_key_mappings : column_to_json_key_mappings option;
      [@ocaml.doc
        "Maps column names to JSON keys that aren't identical to the column names. This is useful \
         when the JSON contains keys that are Hive keywords. For example, [timestamp] is a Hive \
         keyword. If you have a JSON key named [timestamp], set this parameter to [{\"ts\": \
         \"timestamp\"}] to map this key to a column named [ts].\n"]
}
[@@ocaml.doc
  "The OpenX SerDe. Used by Firehose for deserializing data, which means converting it from the \
   JSON format in preparation for serializing it to the Parquet or ORC format. This is one of two \
   deserializers you can choose, depending on which one offers the functionality you need. The \
   other option is the native Hive / HCatalog JsonSerDe.\n"]

type nonrec deserializer = {
  open_x_json_ser_de : open_x_json_ser_de option;
      [@ocaml.doc
        "The OpenX SerDe. Used by Firehose for deserializing data, which means converting it from \
         the JSON format in preparation for serializing it to the Parquet or ORC format. This is \
         one of two deserializers you can choose, depending on which one offers the functionality \
         you need. The other option is the native Hive / HCatalog JsonSerDe.\n"]
  hive_json_ser_de : hive_json_ser_de option;
      [@ocaml.doc
        "The native Hive / HCatalog JsonSerDe. Used by Firehose for deserializing data, which \
         means converting it from the JSON format in preparation for serializing it to the Parquet \
         or ORC format. This is one of two deserializers you can choose, depending on which one \
         offers the functionality you need. The other option is the OpenX SerDe.\n"]
}
[@@ocaml.doc
  "The deserializer you want Firehose to use for converting the input data from JSON. Firehose \
   then serializes the data to its final format using the [Serializer]. Firehose supports two \
   types of deserializers: the \
   {{:https://cwiki.apache.org/confluence/display/Hive/LanguageManual+DDL#LanguageManualDDL-JSON}Apache \
   Hive JSON SerDe} and the {{:https://github.com/rcongiu/Hive-JSON-Serde}OpenX JSON SerDe}.\n"]

type nonrec input_format_configuration = {
  deserializer : deserializer option;
      [@ocaml.doc
        "Specifies which deserializer to use. You can choose either the Apache Hive JSON SerDe or \
         the OpenX JSON SerDe. If both are non-null, the server rejects the request.\n"]
}
[@@ocaml.doc
  "Specifies the deserializer you want to use to convert the format of the input data. This \
   parameter is required if [Enabled] is set to true.\n"]

type nonrec schema_configuration = {
  role_ar_n : non_empty_string_without_whitespace option;
      [@ocaml.doc
        "The role that Firehose can use to access Amazon Web Services Glue. This role must be in \
         the same account you use for Firehose. Cross-account roles aren't allowed.\n\n\
        \  If the [SchemaConfiguration] request parameter is used as part of invoking the \
         [CreateDeliveryStream] API, then the [RoleARN] property is required and its value must be \
         specified.\n\
        \  \n\
        \   "]
  catalog_id : non_empty_string_without_whitespace option;
      [@ocaml.doc
        "The ID of the Amazon Web Services Glue Data Catalog. If you don't supply this, the Amazon \
         Web Services account ID is used by default.\n"]
  database_name : non_empty_string_without_whitespace option;
      [@ocaml.doc
        "Specifies the name of the Amazon Web Services Glue database that contains the schema for \
         the output data.\n\n\
        \  If the [SchemaConfiguration] request parameter is used as part of invoking the \
         [CreateDeliveryStream] API, then the [DatabaseName] property is required and its value \
         must be specified.\n\
        \  \n\
        \   "]
  table_name : non_empty_string_without_whitespace option;
      [@ocaml.doc
        "Specifies the Amazon Web Services Glue table that contains the column information that \
         constitutes your data schema.\n\n\
        \  If the [SchemaConfiguration] request parameter is used as part of invoking the \
         [CreateDeliveryStream] API, then the [TableName] property is required and its value must \
         be specified.\n\
        \  \n\
        \   "]
  region : non_empty_string_without_whitespace option;
      [@ocaml.doc
        "If you don't specify an Amazon Web Services Region, the default is the current Region.\n"]
  version_id : non_empty_string_without_whitespace option;
      [@ocaml.doc
        "Specifies the table version for the output data schema. If you don't specify this version \
         ID, or if you set it to [LATEST], Firehose uses the most recent version. This means that \
         any updates to the table are automatically picked up.\n"]
}
[@@ocaml.doc
  "Specifies the schema to which you want Firehose to configure your data before it writes it to \
   Amazon S3. This parameter is required if [Enabled] is set to true.\n"]

type nonrec data_format_conversion_configuration = {
  schema_configuration : schema_configuration option;
      [@ocaml.doc
        "Specifies the Amazon Web Services Glue Data Catalog table that contains the column \
         information. This parameter is required if [Enabled] is set to true.\n"]
  input_format_configuration : input_format_configuration option;
      [@ocaml.doc
        "Specifies the deserializer that you want Firehose to use to convert the format of your \
         data from JSON. This parameter is required if [Enabled] is set to true.\n"]
  output_format_configuration : output_format_configuration option;
      [@ocaml.doc
        "Specifies the serializer that you want Firehose to use to convert the format of your data \
         to the Parquet or ORC format. This parameter is required if [Enabled] is set to true.\n"]
  enabled : boolean_object option;
      [@ocaml.doc
        "Defaults to [true]. Set it to [false] if you want to disable format conversion while \
         preserving the configuration details.\n"]
}
[@@ocaml.doc
  "Specifies that you want Firehose to convert data from the JSON format to the Parquet or ORC \
   format before writing it to Amazon S3. Firehose uses the serializer and deserializer that you \
   specify, in addition to the column information from the Amazon Web Services Glue table, to \
   deserialize your input data from JSON and then serialize it to the Parquet or ORC format. For \
   more information, see \
   {{:https://docs.aws.amazon.com/firehose/latest/dev/record-format-conversion.html}Firehose \
   Record Format Conversion}.\n"]

type nonrec s3_backup_mode = Disabled [@ocaml.doc ""] | Enabled [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec extended_s3_destination_configuration = {
  role_ar_n : role_ar_n;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the Amazon Web Services credentials. For more \
         information, see \
         {{:https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html}Amazon \
         Resource Names (ARNs) and Amazon Web Services Service Namespaces}.\n"]
  bucket_ar_n : bucket_ar_n;
      [@ocaml.doc
        "The ARN of the S3 bucket. For more information, see \
         {{:https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html}Amazon \
         Resource Names (ARNs) and Amazon Web Services Service Namespaces}.\n"]
  prefix : prefix option;
      [@ocaml.doc
        "The \"YYYY/MM/DD/HH\" time format prefix is automatically used for delivered Amazon S3 \
         files. You can also specify a custom prefix, as described in \
         {{:https://docs.aws.amazon.com/firehose/latest/dev/s3-prefixes.html}Custom Prefixes for \
         Amazon S3 Objects}.\n"]
  error_output_prefix : error_output_prefix option;
      [@ocaml.doc
        "A prefix that Firehose evaluates and adds to failed records before writing them to S3. \
         This prefix appears immediately following the bucket name. For information about how to \
         specify this prefix, see \
         {{:https://docs.aws.amazon.com/firehose/latest/dev/s3-prefixes.html}Custom Prefixes for \
         Amazon S3 Objects}.\n"]
  buffering_hints : buffering_hints option; [@ocaml.doc "The buffering option.\n"]
  compression_format : compression_format option;
      [@ocaml.doc
        "The compression format. If no value is specified, the default is UNCOMPRESSED.\n"]
  encryption_configuration : encryption_configuration option;
      [@ocaml.doc
        "The encryption configuration. If no value is specified, the default is no encryption.\n"]
  cloud_watch_logging_options : cloud_watch_logging_options option;
      [@ocaml.doc "The Amazon CloudWatch logging options for your Firehose stream.\n"]
  processing_configuration : processing_configuration option;
      [@ocaml.doc "The data processing configuration.\n"]
  s3_backup_mode : s3_backup_mode option;
      [@ocaml.doc
        "The Amazon S3 backup mode. After you create a Firehose stream, you can update it to \
         enable Amazon S3 backup if it is disabled. If backup is enabled, you can't update the \
         Firehose stream to disable it. \n"]
  s3_backup_configuration : s3_destination_configuration option;
      [@ocaml.doc "The configuration for backup in Amazon S3.\n"]
  data_format_conversion_configuration : data_format_conversion_configuration option;
      [@ocaml.doc
        "The serializer, deserializer, and schema for converting data from the JSON format to the \
         Parquet or ORC format before writing it to Amazon S3.\n"]
  dynamic_partitioning_configuration : dynamic_partitioning_configuration option;
      [@ocaml.doc
        "The configuration of the dynamic partitioning mechanism that creates smaller data sets \
         from the streaming data by partitioning it based on partition keys. Currently, dynamic \
         partitioning is only supported for Amazon S3 destinations. \n"]
  file_extension : file_extension option;
      [@ocaml.doc "Specify a file extension. It will override the default file extension\n"]
  custom_time_zone : custom_time_zone option;
      [@ocaml.doc "The time zone you prefer. UTC is the default.\n"]
}
[@@ocaml.doc "Describes the configuration of a destination in Amazon S3.\n"]

type nonrec key_type = AWS_OWNED_CMK [@ocaml.doc ""] | CUSTOMER_MANAGED_CMK [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec delivery_stream_encryption_configuration_input = {
  key_ar_n : awskms_key_arn_for_ss_e option;
      [@ocaml.doc
        "If you set [KeyType] to [CUSTOMER_MANAGED_CMK], you must specify the Amazon Resource Name \
         (ARN) of the CMK. If you set [KeyType] to [Amazon Web Services_OWNED_CMK], Firehose uses \
         a service-account CMK.\n"]
  key_type : key_type;
      [@ocaml.doc
        "Indicates the type of customer master key (CMK) to use for encryption. The default \
         setting is [Amazon Web Services_OWNED_CMK]. For more information about CMKs, see \
         {{:https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#master_keys}Customer \
         Master Keys (CMKs)}. When you invoke [CreateDeliveryStream] or \
         [StartDeliveryStreamEncryption] with [KeyType] set to CUSTOMER_MANAGED_CMK, Firehose \
         invokes the Amazon KMS operation \
         {{:https://docs.aws.amazon.com/kms/latest/APIReference/API_CreateGrant.html}CreateGrant} \
         to create a grant that allows the Firehose service to use the customer managed CMK to \
         perform encryption and decryption. Firehose manages that grant. \n\n\
        \ When you invoke [StartDeliveryStreamEncryption] to change the CMK for a Firehose stream \
         that is encrypted with a customer managed CMK, Firehose schedules the grant it had on the \
         old CMK for retirement.\n\
        \ \n\
        \  You can use a CMK of type CUSTOMER_MANAGED_CMK to encrypt up to 500 Firehose streams. \
         If a [CreateDeliveryStream] or [StartDeliveryStreamEncryption] operation exceeds this \
         limit, Firehose throws a [LimitExceededException]. \n\
        \  \n\
        \    To encrypt your Firehose stream, use symmetric CMKs. Firehose doesn't support \
         asymmetric CMKs. For information about symmetric and asymmetric CMKs, see \
         {{:https://docs.aws.amazon.com/kms/latest/developerguide/symm-asymm-concepts.html}About \
         Symmetric and Asymmetric CMKs} in the Amazon Web Services Key Management Service \
         developer guide.\n\
        \    \n\
        \     "]
}
[@@ocaml.doc
  "Specifies the type and Amazon Resource Name (ARN) of the CMK to use for Server-Side Encryption \
   (SSE). \n"]

type nonrec kinesis_stream_ar_n = string [@@ocaml.doc ""]

type nonrec kinesis_stream_source_configuration = {
  kinesis_stream_ar_n : kinesis_stream_ar_n;
      [@ocaml.doc
        "The ARN of the source Kinesis data stream. For more information, see \
         {{:https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html#arn-syntax-kinesis-streams}Amazon \
         Kinesis Data Streams ARN Format}.\n"]
  role_ar_n : role_ar_n;
      [@ocaml.doc
        "The ARN of the role that provides access to the source Kinesis data stream. For more \
         information, see \
         {{:https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html#arn-syntax-iam}Amazon \
         Web Services Identity and Access Management (IAM) ARN Format}.\n"]
}
[@@ocaml.doc
  "The stream and role Amazon Resource Names (ARNs) for a Kinesis data stream used as the source \
   for a Firehose stream.\n"]

type nonrec throughput_hint_in_m_bs = int [@@ocaml.doc ""]

type nonrec direct_put_source_configuration = {
  throughput_hint_in_m_bs : throughput_hint_in_m_bs;
      [@ocaml.doc
        " The value that you configure for this parameter is for information purpose only and does \
         not affect Firehose delivery throughput limit. You can use the \
         {{:https://support.console.aws.amazon.com/support/home#/case/create%3FissueType=service-limit-increase%26limitType=kinesis-firehose-limits}Firehose \
         Limits form} to request a throughput limit increase. \n"]
}
[@@ocaml.doc
  "The structure that configures parameters such as [ThroughputHintInMBs] for a stream configured \
   with Direct PUT as a source. \n"]

type nonrec delivery_stream_type =
  | DirectPut [@ocaml.doc ""]
  | KinesisStreamAsSource [@ocaml.doc ""]
  | MSKAsSource [@ocaml.doc ""]
  | DatabaseAsSource [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec delivery_stream_name = string [@@ocaml.doc ""]

type nonrec create_delivery_stream_input = {
  delivery_stream_name : delivery_stream_name;
      [@ocaml.doc
        "The name of the Firehose stream. This name must be unique per Amazon Web Services account \
         in the same Amazon Web Services Region. If the Firehose streams are in different accounts \
         or different Regions, you can have multiple Firehose streams with the same name.\n"]
  delivery_stream_type : delivery_stream_type option;
      [@ocaml.doc
        "The Firehose stream type. This parameter can be one of the following values:\n\n\
        \ {ul\n\
        \       {-   [DirectPut]: Provider applications access the Firehose stream directly.\n\
        \           \n\
        \            }\n\
        \       {-   [KinesisStreamAsSource]: The Firehose stream uses a Kinesis data stream as a \
         source.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  direct_put_source_configuration : direct_put_source_configuration option;
      [@ocaml.doc
        "The structure that configures parameters such as [ThroughputHintInMBs] for a stream \
         configured with Direct PUT as a source. \n"]
  kinesis_stream_source_configuration : kinesis_stream_source_configuration option;
      [@ocaml.doc
        "When a Kinesis data stream is used as the source for the Firehose stream, a \
         [KinesisStreamSourceConfiguration] containing the Kinesis data stream Amazon Resource \
         Name (ARN) and the role ARN for the source stream.\n"]
  delivery_stream_encryption_configuration_input :
    delivery_stream_encryption_configuration_input option;
      [@ocaml.doc
        "Used to specify the type and Amazon Resource Name (ARN) of the KMS key needed for \
         Server-Side Encryption (SSE).\n"]
  s3_destination_configuration : s3_destination_configuration option;
      [@ocaml.doc
        "\\[Deprecated\\] The destination in Amazon S3. You can specify only one destination.\n"]
  extended_s3_destination_configuration : extended_s3_destination_configuration option;
      [@ocaml.doc "The destination in Amazon S3. You can specify only one destination.\n"]
  redshift_destination_configuration : redshift_destination_configuration option;
      [@ocaml.doc "The destination in Amazon Redshift. You can specify only one destination.\n"]
  elasticsearch_destination_configuration : elasticsearch_destination_configuration option;
      [@ocaml.doc
        "The destination in Amazon OpenSearch Service. You can specify only one destination.\n"]
  amazonopensearchservice_destination_configuration :
    amazonopensearchservice_destination_configuration option;
      [@ocaml.doc
        "The destination in Amazon OpenSearch Service. You can specify only one destination.\n"]
  splunk_destination_configuration : splunk_destination_configuration option;
      [@ocaml.doc "The destination in Splunk. You can specify only one destination.\n"]
  http_endpoint_destination_configuration : http_endpoint_destination_configuration option;
      [@ocaml.doc
        "Enables configuring Kinesis Firehose to deliver data to any HTTP endpoint destination. \
         You can specify only one destination.\n"]
  tags : tag_delivery_stream_input_tag_list option;
      [@ocaml.doc
        "A set of tags to assign to the Firehose stream. A tag is a key-value pair that you can \
         define and assign to Amazon Web Services resources. Tags are metadata. For example, you \
         can add friendly names and descriptions or other types of information that can help you \
         distinguish the Firehose stream. For more information about tags, see \
         {{:https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/cost-alloc-tags.html}Using \
         Cost Allocation Tags} in the Amazon Web Services Billing and Cost Management User Guide.\n\n\
        \ You can specify up to 50 tags when creating a Firehose stream.\n\
        \ \n\
        \  If you specify tags in the [CreateDeliveryStream] action, Amazon Data Firehose performs \
         an additional authorization on the [firehose:TagDeliveryStream] action to verify if users \
         have permissions to create tags. If you do not provide this permission, requests to \
         create new Firehose streams with IAM resource tags will fail with an \
         [AccessDeniedException] such as following.\n\
        \  \n\
        \    {b AccessDeniedException} \n\
        \   \n\
        \    User: arn:aws:sts::x:assumed-role/x/x is not authorized to perform: \
         firehose:TagDeliveryStream on resource: arn:aws:firehose:us-east-1:x:deliverystream/x \
         with an explicit deny in an identity-based policy.\n\
        \    \n\
        \     For an example IAM policy, see \
         {{:https://docs.aws.amazon.com/firehose/latest/APIReference/API_CreateDeliveryStream.html#API_CreateDeliveryStream_Examples}Tag \
         example.} \n\
        \     "]
  amazon_open_search_serverless_destination_configuration :
    amazon_open_search_serverless_destination_configuration option;
      [@ocaml.doc
        "The destination in the Serverless offering for Amazon OpenSearch Service. You can specify \
         only one destination.\n"]
  msk_source_configuration : msk_source_configuration option; [@ocaml.doc ""]
  snowflake_destination_configuration : snowflake_destination_configuration option;
      [@ocaml.doc "Configure Snowflake destination\n"]
  iceberg_destination_configuration : iceberg_destination_configuration option;
      [@ocaml.doc " Configure Apache Iceberg Tables destination. \n"]
  database_source_configuration : database_source_configuration option;
      [@ocaml.doc
        " The top level object for configuring streams with database as a source. \n\n\
        \ Amazon Data Firehose is in preview release and is subject to change.\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec data = bytes [@@ocaml.doc ""]

type nonrec delivery_stream_failure_type =
  | VPC_ENDPOINT_SERVICE_NAME_NOT_FOUND [@ocaml.doc ""]
  | VPC_INTERFACE_ENDPOINT_SERVICE_ACCESS_DENIED [@ocaml.doc ""]
  | RETIRE_KMS_GRANT_FAILED [@ocaml.doc ""]
  | CREATE_KMS_GRANT_FAILED [@ocaml.doc ""]
  | KMS_ACCESS_DENIED [@ocaml.doc ""]
  | DISABLED_KMS_KEY [@ocaml.doc ""]
  | INVALID_KMS_KEY [@ocaml.doc ""]
  | KMS_KEY_NOT_FOUND [@ocaml.doc ""]
  | KMS_OPT_IN_REQUIRED [@ocaml.doc ""]
  | CREATE_ENI_FAILED [@ocaml.doc ""]
  | DELETE_ENI_FAILED [@ocaml.doc ""]
  | SUBNET_NOT_FOUND [@ocaml.doc ""]
  | SECURITY_GROUP_NOT_FOUND [@ocaml.doc ""]
  | ENI_ACCESS_DENIED [@ocaml.doc ""]
  | SUBNET_ACCESS_DENIED [@ocaml.doc ""]
  | SECURITY_GROUP_ACCESS_DENIED [@ocaml.doc ""]
  | UNKNOWN_ERROR [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec failure_description = {
  type_ : delivery_stream_failure_type; [@ocaml.doc "The type of error that caused the failure.\n"]
  details : non_empty_string;
      [@ocaml.doc "A message providing details about the error that caused the failure.\n"]
}
[@@ocaml.doc
  "Provides details in case one of the following operations fails due to an error related to KMS: \
   [CreateDeliveryStream], [DeleteDeliveryStream], [StartDeliveryStreamEncryption], \
   [StopDeliveryStreamEncryption].\n"]

type nonrec snapshot_status =
  | IN_PROGRESS [@ocaml.doc ""]
  | COMPLETE [@ocaml.doc ""]
  | SUSPENDED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec snapshot_requested_by = USER [@ocaml.doc ""] | FIREHOSE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec timestamp = Smaws_Lib.CoreTypes.Timestamp.t [@@ocaml.doc ""]

type nonrec database_snapshot_info = {
  id : non_empty_string_without_whitespace;
      [@ocaml.doc
        " The identifier of the current snapshot of the table in source database endpoint. \n\n\
        \ Amazon Data Firehose is in preview release and is subject to change.\n\
        \ "]
  table : database_table_name;
      [@ocaml.doc
        " The fully qualified name of the table in source database endpoint that Firehose reads. \n\n\
        \ Amazon Data Firehose is in preview release and is subject to change.\n\
        \ "]
  request_timestamp : timestamp;
      [@ocaml.doc
        " The timestamp when the current snapshot is taken on the table. \n\n\
        \ Amazon Data Firehose is in preview release and is subject to change.\n\
        \ "]
  requested_by : snapshot_requested_by;
      [@ocaml.doc
        " The principal that sent the request to take the current snapshot on the table. \n\n\
        \ Amazon Data Firehose is in preview release and is subject to change.\n\
        \ "]
  status : snapshot_status;
      [@ocaml.doc
        " The status of the current snapshot of the table. \n\n\
        \ Amazon Data Firehose is in preview release and is subject to change.\n\
        \ "]
  failure_description : failure_description option; [@ocaml.doc ""]
}
[@@ocaml.doc
  " The structure that describes the snapshot information of a table in source database endpoint \
   that Firehose reads. \n\n\
  \ Amazon Data Firehose is in preview release and is subject to change.\n\
  \ "]

type nonrec database_snapshot_info_list = database_snapshot_info list [@@ocaml.doc ""]

type nonrec database_source_description = {
  type_ : database_type option;
      [@ocaml.doc
        "The type of database engine. This can be one of the following values. \n\n\
        \ {ul\n\
        \       {-  MySQL\n\
        \           \n\
        \            }\n\
        \       {-  PostgreSQL\n\
        \           \n\
        \            }\n\
        \       }\n\
        \   Amazon Data Firehose is in preview release and is subject to change.\n\
        \   "]
  endpoint : database_endpoint option;
      [@ocaml.doc
        " The endpoint of the database server. \n\n\
        \ Amazon Data Firehose is in preview release and is subject to change.\n\
        \ "]
  port : database_port option;
      [@ocaml.doc
        "The port of the database. This can be one of the following values.\n\n\
        \ {ul\n\
        \       {-  3306 for MySQL database type\n\
        \           \n\
        \            }\n\
        \       {-  5432 for PostgreSQL database type\n\
        \           \n\
        \            }\n\
        \       }\n\
        \   Amazon Data Firehose is in preview release and is subject to change.\n\
        \   "]
  ssl_mode : ssl_mode option;
      [@ocaml.doc
        " The mode to enable or disable SSL when Firehose connects to the database endpoint. \n\n\
        \ Amazon Data Firehose is in preview release and is subject to change.\n\
        \ "]
  databases : database_list option;
      [@ocaml.doc
        " The list of database patterns in source database endpoint for Firehose to read from. \n\n\
        \ Amazon Data Firehose is in preview release and is subject to change.\n\
        \ "]
  tables : database_table_list option;
      [@ocaml.doc
        " The list of table patterns in source database endpoint for Firehose to read from. \n\n\
        \ Amazon Data Firehose is in preview release and is subject to change.\n\
        \ "]
  columns : database_column_list option;
      [@ocaml.doc
        " The list of column patterns in source database endpoint for Firehose to read from. \n\n\
        \ Amazon Data Firehose is in preview release and is subject to change.\n\
        \ "]
  surrogate_keys : database_column_include_or_exclude_list option;
      [@ocaml.doc
        " The optional list of table and column names used as unique key columns when taking \
         snapshot if the tables don\226\128\153t have primary keys configured. \n\n\
        \ Amazon Data Firehose is in preview release and is subject to change.\n\
        \ "]
  snapshot_watermark_table : database_table_name option;
      [@ocaml.doc
        " The fully qualified name of the table in source database endpoint that Firehose uses to \
         track snapshot progress. \n\n\
        \ Amazon Data Firehose is in preview release and is subject to change.\n\
        \ "]
  snapshot_info : database_snapshot_info_list option;
      [@ocaml.doc
        " The structure that describes the snapshot information of a table in source database \
         endpoint that Firehose reads. \n\n\
        \ Amazon Data Firehose is in preview release and is subject to change.\n\
        \ "]
  database_source_authentication_configuration :
    database_source_authentication_configuration option;
      [@ocaml.doc
        " The structure to configure the authentication methods for Firehose to connect to source \
         database endpoint. \n\n\
        \ Amazon Data Firehose is in preview release and is subject to change.\n\
        \ "]
  database_source_vpc_configuration : database_source_vpc_configuration option;
      [@ocaml.doc
        " The details of the VPC Endpoint Service which Firehose uses to create a PrivateLink to \
         the database. \n\n\
        \ Amazon Data Firehose is in preview release and is subject to change.\n\
        \ "]
}
[@@ocaml.doc
  " The top level object for database source description. \n\n\
  \ Amazon Data Firehose is in preview release and is subject to change.\n\
  \ "]

type nonrec resource_not_found_exception = {
  message : error_message option;
      [@ocaml.doc "A message that provides information about the error.\n"]
}
[@@ocaml.doc "The specified resource could not be found.\n"]

type nonrec delete_delivery_stream_output = unit [@@ocaml.doc ""]

type nonrec delete_delivery_stream_input = {
  delivery_stream_name : delivery_stream_name; [@ocaml.doc "The name of the Firehose stream.\n"]
  allow_force_delete : boolean_object option;
      [@ocaml.doc
        "Set this to true if you want to delete the Firehose stream even if Firehose is unable to \
         retire the grant for the CMK. Firehose might be unable to retire the grant due to a \
         customer error, such as when the CMK or the grant are in an invalid state. If you force \
         deletion, you can then use the \
         {{:https://docs.aws.amazon.com/kms/latest/APIReference/API_RevokeGrant.html}RevokeGrant} \
         operation to revoke the grant you gave to Firehose. If a failure to retire the grant \
         happens due to an Amazon Web Services KMS issue, Firehose keeps retrying the delete \
         operation.\n\n\
        \ The default value is false.\n\
        \ "]
}
[@@ocaml.doc ""]

type nonrec delivery_start_timestamp = Smaws_Lib.CoreTypes.Timestamp.t [@@ocaml.doc ""]

type nonrec iceberg_destination_description = {
  destination_table_configuration_list : destination_table_configuration_list option;
      [@ocaml.doc
        " Provides a list of [DestinationTableConfigurations] which Firehose uses to deliver data \
         to Apache Iceberg Tables. Firehose will write data with insert if table specific \
         configuration is not provided here.\n"]
  schema_evolution_configuration : schema_evolution_configuration option;
      [@ocaml.doc
        "The description of automatic schema evolution configuration.\n\n\
        \ Amazon Data Firehose is in preview release and is subject to change.\n\
        \ "]
  table_creation_configuration : table_creation_configuration option;
      [@ocaml.doc
        " The description of table creation configuration. \n\n\
        \ Amazon Data Firehose is in preview release and is subject to change.\n\
        \ "]
  buffering_hints : buffering_hints option; [@ocaml.doc ""]
  cloud_watch_logging_options : cloud_watch_logging_options option; [@ocaml.doc ""]
  processing_configuration : processing_configuration option; [@ocaml.doc ""]
  s3_backup_mode : iceberg_s3_backup_mode option;
      [@ocaml.doc
        " Describes how Firehose will backup records. Currently,Firehose only supports \
         [FailedDataOnly]. \n"]
  retry_options : retry_options option; [@ocaml.doc ""]
  role_ar_n : role_ar_n option;
      [@ocaml.doc
        " The Amazon Resource Name (ARN) of the IAM role to be assumed by Firehose for calling \
         Apache Iceberg Tables. \n"]
  append_only : boolean_object option;
      [@ocaml.doc
        " Describes whether all incoming data for this delivery stream will be append only \
         (inserts only and not for updates and deletes) for Iceberg delivery. This feature is only \
         applicable for Apache Iceberg Tables.\n\n\
        \ The default value is false. If you set this value to true, Firehose automatically \
         increases the throughput limit of a stream based on the throttling levels of the stream. \
         If you set this parameter to true for a stream with updates and deletes, you will see out \
         of order delivery.\n\
        \ \n\
        \   \n\
        \  "]
  catalog_configuration : catalog_configuration option;
      [@ocaml.doc
        " Configuration describing where the destination Iceberg tables are persisted. \n"]
  s3_destination_description : s3_destination_description option; [@ocaml.doc ""]
}
[@@ocaml.doc " Describes a destination in Apache Iceberg Tables. \n"]

type nonrec snowflake_destination_description = {
  account_url : snowflake_account_url option;
      [@ocaml.doc
        "URL for accessing your Snowflake account. This URL must include your \
         {{:https://docs.snowflake.com/en/user-guide/admin-account-identifier}account identifier}. \
         Note that the protocol (https://) and port number are optional.\n"]
  user : snowflake_user option; [@ocaml.doc "User login name for the Snowflake account.\n"]
  database : snowflake_database option;
      [@ocaml.doc "All data in Snowflake is maintained in databases.\n"]
  schema : snowflake_schema option;
      [@ocaml.doc
        "Each database consists of one or more schemas, which are logical groupings of database \
         objects, such as tables and views\n"]
  table : snowflake_table option;
      [@ocaml.doc
        "All data in Snowflake is stored in database tables, logically structured as collections \
         of columns and rows.\n"]
  snowflake_role_configuration : snowflake_role_configuration option;
      [@ocaml.doc
        "Optionally configure a Snowflake role. Otherwise the default user role will be used.\n"]
  data_loading_option : snowflake_data_loading_option option;
      [@ocaml.doc
        "Choose to load JSON keys mapped to table column names or choose to split the JSON payload \
         where content is mapped to a record content column and source metadata is mapped to a \
         record metadata column.\n"]
  meta_data_column_name : snowflake_meta_data_column_name option;
      [@ocaml.doc "The name of the record metadata column\n"]
  content_column_name : snowflake_content_column_name option;
      [@ocaml.doc "The name of the record content column\n"]
  snowflake_vpc_configuration : snowflake_vpc_configuration option;
      [@ocaml.doc
        "The VPCE ID for Firehose to privately connect with Snowflake. The ID format is \
         com.amazonaws.vpce.\\[region\\].vpce-svc-<\\[id\\]>. For more information, see \
         {{:https://docs.snowflake.com/en/user-guide/admin-security-privatelink}Amazon PrivateLink \
         & Snowflake} \n"]
  cloud_watch_logging_options : cloud_watch_logging_options option; [@ocaml.doc ""]
  processing_configuration : processing_configuration option; [@ocaml.doc ""]
  role_ar_n : role_ar_n option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the Snowflake role\n"]
  retry_options : snowflake_retry_options option;
      [@ocaml.doc
        "The time period where Firehose will retry sending data to the chosen HTTP endpoint.\n"]
  s3_backup_mode : snowflake_s3_backup_mode option; [@ocaml.doc "Choose an S3 backup mode\n"]
  s3_destination_description : s3_destination_description option; [@ocaml.doc ""]
  secrets_manager_configuration : secrets_manager_configuration option;
      [@ocaml.doc " The configuration that defines how you access secrets for Snowflake. \n"]
  buffering_hints : snowflake_buffering_hints option;
      [@ocaml.doc
        " Describes the buffering to perform before delivering data to the Snowflake destination. \
         If you do not specify any value, Firehose uses the default values. \n"]
}
[@@ocaml.doc "Optional Snowflake destination description\n"]

type nonrec http_endpoint_description = {
  url : http_endpoint_url option;
      [@ocaml.doc "The URL of the HTTP endpoint selected as the destination.\n"]
  name : http_endpoint_name option;
      [@ocaml.doc "The name of the HTTP endpoint selected as the destination.\n"]
}
[@@ocaml.doc "Describes the HTTP endpoint selected as the destination. \n"]

type nonrec http_endpoint_destination_description = {
  endpoint_configuration : http_endpoint_description option;
      [@ocaml.doc "The configuration of the specified HTTP endpoint destination.\n"]
  buffering_hints : http_endpoint_buffering_hints option;
      [@ocaml.doc
        "Describes buffering options that can be applied to the data before it is delivered to the \
         HTTPS endpoint destination. Firehose teats these options as hints, and it might choose to \
         use more optimal values. The [SizeInMBs] and [IntervalInSeconds] parameters are optional. \
         However, if specify a value for one of them, you must also provide a value for the other. \n"]
  cloud_watch_logging_options : cloud_watch_logging_options option; [@ocaml.doc ""]
  request_configuration : http_endpoint_request_configuration option;
      [@ocaml.doc
        "The configuration of request sent to the HTTP endpoint specified as the destination.\n"]
  processing_configuration : processing_configuration option; [@ocaml.doc ""]
  role_ar_n : role_ar_n option;
      [@ocaml.doc
        "Firehose uses this IAM role for all the permissions that the delivery stream needs.\n"]
  retry_options : http_endpoint_retry_options option;
      [@ocaml.doc
        "Describes the retry behavior in case Firehose is unable to deliver data to the specified \
         HTTP endpoint destination, or if it doesn't receive a valid acknowledgment of receipt \
         from the specified HTTP endpoint destination.\n"]
  s3_backup_mode : http_endpoint_s3_backup_mode option;
      [@ocaml.doc
        "Describes the S3 bucket backup options for the data that Kinesis Firehose delivers to the \
         HTTP endpoint destination. You can back up all documents ([AllData]) or only the \
         documents that Firehose could not deliver to the specified HTTP endpoint destination \
         ([FailedDataOnly]).\n"]
  s3_destination_description : s3_destination_description option; [@ocaml.doc ""]
  secrets_manager_configuration : secrets_manager_configuration option;
      [@ocaml.doc
        " The configuration that defines how you access secrets for HTTP Endpoint destination. \n"]
}
[@@ocaml.doc "Describes the HTTP endpoint destination.\n"]

type nonrec splunk_destination_description = {
  hec_endpoint : hec_endpoint option;
      [@ocaml.doc "The HTTP Event Collector (HEC) endpoint to which Firehose sends your data.\n"]
  hec_endpoint_type : hec_endpoint_type option;
      [@ocaml.doc "This type can be either \"Raw\" or \"Event.\"\n"]
  hec_token : hec_token option;
      [@ocaml.doc
        "A GUID you obtain from your Splunk cluster when you create a new HEC endpoint.\n"]
  hec_acknowledgment_timeout_in_seconds : hec_acknowledgment_timeout_in_seconds option;
      [@ocaml.doc
        "The amount of time that Firehose waits to receive an acknowledgment from Splunk after it \
         sends it data. At the end of the timeout period, Firehose either tries to send the data \
         again or considers it an error, based on your retry settings.\n"]
  retry_options : splunk_retry_options option;
      [@ocaml.doc
        "The retry behavior in case Firehose is unable to deliver data to Splunk or if it doesn't \
         receive an acknowledgment of receipt from Splunk.\n"]
  s3_backup_mode : splunk_s3_backup_mode option;
      [@ocaml.doc
        "Defines how documents should be delivered to Amazon S3. When set to \
         [FailedDocumentsOnly], Firehose writes any data that could not be indexed to the \
         configured Amazon S3 destination. When set to [AllDocuments], Firehose delivers all \
         incoming records to Amazon S3, and also writes failed documents to Amazon S3. Default \
         value is [FailedDocumentsOnly]. \n"]
  s3_destination_description : s3_destination_description option;
      [@ocaml.doc "The Amazon S3 destination.>\n"]
  processing_configuration : processing_configuration option;
      [@ocaml.doc "The data processing configuration.\n"]
  cloud_watch_logging_options : cloud_watch_logging_options option;
      [@ocaml.doc "The Amazon CloudWatch logging options for your Firehose stream.\n"]
  buffering_hints : splunk_buffering_hints option;
      [@ocaml.doc
        "The buffering options. If no value is specified, the default values for Splunk are used.\n"]
  secrets_manager_configuration : secrets_manager_configuration option;
      [@ocaml.doc " The configuration that defines how you access secrets for Splunk. \n"]
}
[@@ocaml.doc "Describes a destination in Splunk.\n"]

type nonrec elasticsearch_destination_description = {
  role_ar_n : role_ar_n option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the Amazon Web Services credentials. For more \
         information, see \
         {{:https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html}Amazon \
         Resource Names (ARNs) and Amazon Web Services Service Namespaces}.\n"]
  domain_ar_n : elasticsearch_domain_ar_n option;
      [@ocaml.doc
        "The ARN of the Amazon OpenSearch Service domain. For more information, see \
         {{:https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html}Amazon \
         Resource Names (ARNs) and Amazon Web Services Service Namespaces}.\n\n\
        \ Firehose uses either [ClusterEndpoint] or [DomainARN] to send data to Amazon OpenSearch \
         Service.\n\
        \ "]
  cluster_endpoint : elasticsearch_cluster_endpoint option;
      [@ocaml.doc
        "The endpoint to use when communicating with the cluster. Firehose uses either this \
         [ClusterEndpoint] or the [DomainARN] field to send data to Amazon OpenSearch Service.\n"]
  index_name : elasticsearch_index_name option; [@ocaml.doc "The Elasticsearch index name.\n"]
  type_name : elasticsearch_type_name option;
      [@ocaml.doc
        "The Elasticsearch type name. This applies to Elasticsearch 6.x and lower versions. For \
         Elasticsearch 7.x and OpenSearch Service 1.x, there's no value for [TypeName].\n"]
  index_rotation_period : elasticsearch_index_rotation_period option;
      [@ocaml.doc "The Elasticsearch index rotation period\n"]
  buffering_hints : elasticsearch_buffering_hints option; [@ocaml.doc "The buffering options.\n"]
  retry_options : elasticsearch_retry_options option;
      [@ocaml.doc "The Amazon OpenSearch Service retry options.\n"]
  s3_backup_mode : elasticsearch_s3_backup_mode option; [@ocaml.doc "The Amazon S3 backup mode.\n"]
  s3_destination_description : s3_destination_description option;
      [@ocaml.doc "The Amazon S3 destination.\n"]
  processing_configuration : processing_configuration option;
      [@ocaml.doc "The data processing configuration.\n"]
  cloud_watch_logging_options : cloud_watch_logging_options option;
      [@ocaml.doc "The Amazon CloudWatch logging options.\n"]
  vpc_configuration_description : vpc_configuration_description option;
      [@ocaml.doc
        "The details of the VPC of the Amazon OpenSearch or the Amazon OpenSearch Serverless \
         destination.\n"]
  document_id_options : document_id_options option;
      [@ocaml.doc
        "Indicates the method for setting up document ID. The supported methods are Firehose \
         generated document ID and OpenSearch Service generated document ID.\n"]
}
[@@ocaml.doc "The destination description in Amazon OpenSearch Service.\n"]

type nonrec redshift_destination_description = {
  role_ar_n : role_ar_n;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the Amazon Web Services credentials. For more \
         information, see \
         {{:https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html}Amazon \
         Resource Names (ARNs) and Amazon Web Services Service Namespaces}.\n"]
  cluster_jdbcur_l : cluster_jdbcur_l; [@ocaml.doc "The database connection string.\n"]
  copy_command : copy_command; [@ocaml.doc "The [COPY] command.\n"]
  username : username option; [@ocaml.doc "The name of the user.\n"]
  retry_options : redshift_retry_options option;
      [@ocaml.doc
        "The retry behavior in case Firehose is unable to deliver documents to Amazon Redshift. \
         Default value is 3600 (60 minutes).\n"]
  s3_destination_description : s3_destination_description;
      [@ocaml.doc "The Amazon S3 destination.\n"]
  processing_configuration : processing_configuration option;
      [@ocaml.doc "The data processing configuration.\n"]
  s3_backup_mode : redshift_s3_backup_mode option; [@ocaml.doc "The Amazon S3 backup mode.\n"]
  s3_backup_description : s3_destination_description option;
      [@ocaml.doc "The configuration for backup in Amazon S3.\n"]
  cloud_watch_logging_options : cloud_watch_logging_options option;
      [@ocaml.doc "The Amazon CloudWatch logging options for your Firehose stream.\n"]
  secrets_manager_configuration : secrets_manager_configuration option;
      [@ocaml.doc " The configuration that defines how you access secrets for Amazon Redshift. \n"]
}
[@@ocaml.doc "Describes a destination in Amazon Redshift.\n"]

type nonrec extended_s3_destination_description = {
  role_ar_n : role_ar_n;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the Amazon Web Services credentials. For more \
         information, see \
         {{:https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html}Amazon \
         Resource Names (ARNs) and Amazon Web Services Service Namespaces}.\n"]
  bucket_ar_n : bucket_ar_n;
      [@ocaml.doc
        "The ARN of the S3 bucket. For more information, see \
         {{:https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html}Amazon \
         Resource Names (ARNs) and Amazon Web Services Service Namespaces}.\n"]
  prefix : prefix option;
      [@ocaml.doc
        "The \"YYYY/MM/DD/HH\" time format prefix is automatically used for delivered Amazon S3 \
         files. You can also specify a custom prefix, as described in \
         {{:https://docs.aws.amazon.com/firehose/latest/dev/s3-prefixes.html}Custom Prefixes for \
         Amazon S3 Objects}.\n"]
  error_output_prefix : error_output_prefix option;
      [@ocaml.doc
        "A prefix that Firehose evaluates and adds to failed records before writing them to S3. \
         This prefix appears immediately following the bucket name. For information about how to \
         specify this prefix, see \
         {{:https://docs.aws.amazon.com/firehose/latest/dev/s3-prefixes.html}Custom Prefixes for \
         Amazon S3 Objects}.\n"]
  buffering_hints : buffering_hints; [@ocaml.doc "The buffering option.\n"]
  compression_format : compression_format;
      [@ocaml.doc
        "The compression format. If no value is specified, the default is [UNCOMPRESSED].\n"]
  encryption_configuration : encryption_configuration;
      [@ocaml.doc
        "The encryption configuration. If no value is specified, the default is no encryption.\n"]
  cloud_watch_logging_options : cloud_watch_logging_options option;
      [@ocaml.doc "The Amazon CloudWatch logging options for your Firehose stream.\n"]
  processing_configuration : processing_configuration option;
      [@ocaml.doc "The data processing configuration.\n"]
  s3_backup_mode : s3_backup_mode option; [@ocaml.doc "The Amazon S3 backup mode.\n"]
  s3_backup_description : s3_destination_description option;
      [@ocaml.doc "The configuration for backup in Amazon S3.\n"]
  data_format_conversion_configuration : data_format_conversion_configuration option;
      [@ocaml.doc
        "The serializer, deserializer, and schema for converting data from the JSON format to the \
         Parquet or ORC format before writing it to Amazon S3.\n"]
  dynamic_partitioning_configuration : dynamic_partitioning_configuration option;
      [@ocaml.doc
        "The configuration of the dynamic partitioning mechanism that creates smaller data sets \
         from the streaming data by partitioning it based on partition keys. Currently, dynamic \
         partitioning is only supported for Amazon S3 destinations. \n"]
  file_extension : file_extension option;
      [@ocaml.doc "Specify a file extension. It will override the default file extension\n"]
  custom_time_zone : custom_time_zone option;
      [@ocaml.doc "The time zone you prefer. UTC is the default.\n"]
}
[@@ocaml.doc "Describes a destination in Amazon S3.\n"]

type nonrec destination_id = string [@@ocaml.doc ""]

type nonrec destination_description = {
  destination_id : destination_id; [@ocaml.doc "The ID of the destination.\n"]
  s3_destination_description : s3_destination_description option;
      [@ocaml.doc "\\[Deprecated\\] The destination in Amazon S3.\n"]
  extended_s3_destination_description : extended_s3_destination_description option;
      [@ocaml.doc "The destination in Amazon S3.\n"]
  redshift_destination_description : redshift_destination_description option;
      [@ocaml.doc "The destination in Amazon Redshift.\n"]
  elasticsearch_destination_description : elasticsearch_destination_description option;
      [@ocaml.doc "The destination in Amazon OpenSearch Service.\n"]
  amazonopensearchservice_destination_description :
    amazonopensearchservice_destination_description option;
      [@ocaml.doc "The destination in Amazon OpenSearch Service.\n"]
  splunk_destination_description : splunk_destination_description option;
      [@ocaml.doc "The destination in Splunk.\n"]
  http_endpoint_destination_description : http_endpoint_destination_description option;
      [@ocaml.doc "Describes the specified HTTP endpoint destination.\n"]
  snowflake_destination_description : snowflake_destination_description option;
      [@ocaml.doc "Optional description for the destination\n"]
  amazon_open_search_serverless_destination_description :
    amazon_open_search_serverless_destination_description option;
      [@ocaml.doc "The destination in the Serverless offering for Amazon OpenSearch Service.\n"]
  iceberg_destination_description : iceberg_destination_description option;
      [@ocaml.doc " Describes a destination in Apache Iceberg Tables. \n"]
}
[@@ocaml.doc "Describes the destination for a Firehose stream.\n"]

type nonrec destination_description_list = destination_description list [@@ocaml.doc ""]

type nonrec msk_source_description = {
  msk_cluster_ar_n : msk_cluster_ar_n option; [@ocaml.doc "The ARN of the Amazon MSK cluster.\n"]
  topic_name : topic_name option; [@ocaml.doc "The topic name within the Amazon MSK cluster.\n"]
  authentication_configuration : authentication_configuration option;
      [@ocaml.doc "The authentication configuration of the Amazon MSK cluster.\n"]
  delivery_start_timestamp : delivery_start_timestamp option;
      [@ocaml.doc
        "Firehose starts retrieving records from the topic within the Amazon MSK cluster starting \
         with this timestamp.\n"]
  read_from_timestamp : read_from_timestamp option;
      [@ocaml.doc
        "The start date and time in UTC for the offset position within your MSK topic from where \
         Firehose begins to read. By default, this is set to timestamp when Firehose becomes \
         Active. \n\n\
        \ If you want to create a Firehose stream with Earliest start position from SDK or CLI, \
         you need to set the [ReadFromTimestampUTC] parameter to Epoch (1970-01-01T00:00:00Z). \n\
        \ "]
}
[@@ocaml.doc "Details about the Amazon MSK cluster used as the source for a Firehose stream.\n"]

type nonrec kinesis_stream_source_description = {
  kinesis_stream_ar_n : kinesis_stream_ar_n option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the source Kinesis data stream. For more information, \
         see \
         {{:https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html#arn-syntax-kinesis-streams}Amazon \
         Kinesis Data Streams ARN Format}.\n"]
  role_ar_n : role_ar_n option;
      [@ocaml.doc
        "The ARN of the role used by the source Kinesis data stream. For more information, see \
         {{:https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html#arn-syntax-iam}Amazon \
         Web Services Identity and Access Management (IAM) ARN Format}.\n"]
  delivery_start_timestamp : delivery_start_timestamp option;
      [@ocaml.doc
        "Firehose starts retrieving records from the Kinesis data stream starting with this \
         timestamp.\n"]
}
[@@ocaml.doc "Details about a Kinesis data stream used as the source for a Firehose stream.\n"]

type nonrec direct_put_source_description = {
  throughput_hint_in_m_bs : throughput_hint_in_m_bs option;
      [@ocaml.doc
        " The value that you configure for this parameter is for information purpose only and does \
         not affect Firehose delivery throughput limit. You can use the \
         {{:https://support.console.aws.amazon.com/support/home#/case/create%3FissueType=service-limit-increase%26limitType=kinesis-firehose-limits}Firehose \
         Limits form} to request a throughput limit increase. \n"]
}
[@@ocaml.doc
  "The structure that configures parameters such as [ThroughputHintInMBs] for a stream configured \
   with Direct PUT as a source. \n"]

type nonrec source_description = {
  direct_put_source_description : direct_put_source_description option;
      [@ocaml.doc "Details about Direct PUT used as the source for a Firehose stream. \n"]
  kinesis_stream_source_description : kinesis_stream_source_description option;
      [@ocaml.doc
        "The [KinesisStreamSourceDescription] value for the source Kinesis data stream.\n"]
  msk_source_description : msk_source_description option;
      [@ocaml.doc
        "The configuration description for the Amazon MSK cluster to be used as the source for a \
         delivery stream.\n"]
  database_source_description : database_source_description option;
      [@ocaml.doc
        "Details about a database used as the source for a Firehose stream.\n\n\
        \ Amazon Data Firehose is in preview release and is subject to change.\n\
        \ "]
}
[@@ocaml.doc "Details about a Kinesis data stream used as the source for a Firehose stream.\n"]

type nonrec delivery_stream_version_id = string [@@ocaml.doc ""]

type nonrec delivery_stream_encryption_status =
  | ENABLED [@ocaml.doc ""]
  | ENABLING [@ocaml.doc ""]
  | ENABLING_FAILED [@ocaml.doc ""]
  | DISABLED [@ocaml.doc ""]
  | DISABLING [@ocaml.doc ""]
  | DISABLING_FAILED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec delivery_stream_encryption_configuration = {
  key_ar_n : awskms_key_arn_for_ss_e option;
      [@ocaml.doc
        "If [KeyType] is [CUSTOMER_MANAGED_CMK], this field contains the ARN of the customer \
         managed CMK. If [KeyType] is [Amazon Web Services_OWNED_CMK], \
         [DeliveryStreamEncryptionConfiguration] doesn't contain a value for [KeyARN].\n"]
  key_type : key_type option;
      [@ocaml.doc
        "Indicates the type of customer master key (CMK) that is used for encryption. The default \
         setting is [Amazon Web Services_OWNED_CMK]. For more information about CMKs, see \
         {{:https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html#master_keys}Customer \
         Master Keys (CMKs)}.\n"]
  status : delivery_stream_encryption_status option;
      [@ocaml.doc
        "This is the server-side encryption (SSE) status for the Firehose stream. For a full \
         description of the different values of this status, see [StartDeliveryStreamEncryption] \
         and [StopDeliveryStreamEncryption]. If this status is [ENABLING_FAILED] or \
         [DISABLING_FAILED], it is the status of the most recent attempt to enable or disable SSE, \
         respectively.\n"]
  failure_description : failure_description option;
      [@ocaml.doc
        "Provides details in case one of the following operations fails due to an error related to \
         KMS: [CreateDeliveryStream], [DeleteDeliveryStream], [StartDeliveryStreamEncryption], \
         [StopDeliveryStreamEncryption].\n"]
}
[@@ocaml.doc
  "Contains information about the server-side encryption (SSE) status for the delivery stream, the \
   type customer master key (CMK) in use, if any, and the ARN of the CMK. You can get \
   [DeliveryStreamEncryptionConfiguration] by invoking the [DescribeDeliveryStream] operation. \n"]

type nonrec delivery_stream_status =
  | CREATING [@ocaml.doc ""]
  | CREATING_FAILED [@ocaml.doc ""]
  | DELETING [@ocaml.doc ""]
  | DELETING_FAILED [@ocaml.doc ""]
  | ACTIVE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec delivery_stream_description = {
  delivery_stream_name : delivery_stream_name; [@ocaml.doc "The name of the Firehose stream.\n"]
  delivery_stream_ar_n : delivery_stream_ar_n;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the Firehose stream. For more information, see \
         {{:https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html}Amazon \
         Resource Names (ARNs) and Amazon Web Services Service Namespaces}.\n"]
  delivery_stream_status : delivery_stream_status;
      [@ocaml.doc
        "The status of the Firehose stream. If the status of a Firehose stream is \
         [CREATING_FAILED], this status doesn't change, and you can't invoke \
         [CreateDeliveryStream] again on it. However, you can invoke the [DeleteDeliveryStream] \
         operation to delete it.\n"]
  failure_description : failure_description option;
      [@ocaml.doc
        "Provides details in case one of the following operations fails due to an error related to \
         KMS: [CreateDeliveryStream], [DeleteDeliveryStream], [StartDeliveryStreamEncryption], \
         [StopDeliveryStreamEncryption].\n"]
  delivery_stream_encryption_configuration : delivery_stream_encryption_configuration option;
      [@ocaml.doc "Indicates the server-side encryption (SSE) status for the Firehose stream.\n"]
  delivery_stream_type : delivery_stream_type;
      [@ocaml.doc
        "The Firehose stream type. This can be one of the following values:\n\n\
        \ {ul\n\
        \       {-   [DirectPut]: Provider applications access the Firehose stream directly.\n\
        \           \n\
        \            }\n\
        \       {-   [KinesisStreamAsSource]: The Firehose stream uses a Kinesis data stream as a \
         source.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  version_id : delivery_stream_version_id;
      [@ocaml.doc
        "Each time the destination is updated for a Firehose stream, the version ID is changed, \
         and the current version ID is required when updating the destination. This is so that the \
         service knows it is applying the changes to the correct version of the delivery stream.\n"]
  create_timestamp : timestamp option;
      [@ocaml.doc "The date and time that the Firehose stream was created.\n"]
  last_update_timestamp : timestamp option;
      [@ocaml.doc "The date and time that the Firehose stream was last updated.\n"]
  source : source_description option;
      [@ocaml.doc
        "If the [DeliveryStreamType] parameter is [KinesisStreamAsSource], a [SourceDescription] \
         object describing the source Kinesis data stream.\n"]
  destinations : destination_description_list; [@ocaml.doc "The destinations.\n"]
  has_more_destinations : boolean_object;
      [@ocaml.doc "Indicates whether there are more destinations available to list.\n"]
}
[@@ocaml.doc "Contains information about a Firehose stream.\n"]

type nonrec delivery_stream_name_list = delivery_stream_name list [@@ocaml.doc ""]

type nonrec describe_delivery_stream_output = {
  delivery_stream_description : delivery_stream_description;
      [@ocaml.doc "Information about the Firehose stream.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_delivery_stream_input_limit = int [@@ocaml.doc ""]

type nonrec describe_delivery_stream_input = {
  delivery_stream_name : delivery_stream_name; [@ocaml.doc "The name of the Firehose stream.\n"]
  limit : describe_delivery_stream_input_limit option;
      [@ocaml.doc
        "The limit on the number of destinations to return. You can have one destination per \
         Firehose stream.\n"]
  exclusive_start_destination_id : destination_id option;
      [@ocaml.doc
        "The ID of the destination to start returning the destination information. Firehose \
         supports one destination per Firehose stream.\n"]
}
[@@ocaml.doc ""]

type nonrec elasticsearch_destination_update = {
  role_ar_n : role_ar_n option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the IAM role to be assumed by Firehose for calling the \
         Amazon OpenSearch Service Configuration API and for indexing documents. For more \
         information, see \
         {{:https://docs.aws.amazon.com/firehose/latest/dev/controlling-access.html#using-iam-s3}Grant \
         Firehose Access to an Amazon S3 Destination} and \
         {{:https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html}Amazon \
         Resource Names (ARNs) and Amazon Web Services Service Namespaces}.\n"]
  domain_ar_n : elasticsearch_domain_ar_n option;
      [@ocaml.doc
        "The ARN of the Amazon OpenSearch Service domain. The IAM role must have permissions \
         for\194\160[DescribeDomain], [DescribeDomains], and [DescribeDomainConfig]\194\160after \
         assuming the IAM role specified in [RoleARN]. For more information, see \
         {{:https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html}Amazon \
         Resource Names (ARNs) and Amazon Web Services Service Namespaces}.\n\n\
        \ Specify either [ClusterEndpoint] or [DomainARN].\n\
        \ "]
  cluster_endpoint : elasticsearch_cluster_endpoint option;
      [@ocaml.doc
        "The endpoint to use when communicating with the cluster. Specify either this \
         [ClusterEndpoint] or the [DomainARN] field.\n"]
  index_name : elasticsearch_index_name option; [@ocaml.doc "The Elasticsearch index name.\n"]
  type_name : elasticsearch_type_name option;
      [@ocaml.doc
        "The Elasticsearch type name. For Elasticsearch 6.x, there can be only one type per index. \
         If you try to specify a new type for an existing index that already has another type, \
         Firehose returns an error during runtime.\n\n\
        \ If you upgrade Elasticsearch from 6.x to 7.x and don\226\128\153t update your Firehose \
         stream, Firehose still delivers data to Elasticsearch with the old index name and type \
         name. If you want to update your Firehose stream with a new index name, provide an empty \
         string for [TypeName]. \n\
        \ "]
  index_rotation_period : elasticsearch_index_rotation_period option;
      [@ocaml.doc
        "The Elasticsearch index rotation period. Index rotation appends a timestamp to \
         [IndexName] to facilitate the expiration of old data. For more information, see \
         {{:https://docs.aws.amazon.com/firehose/latest/dev/basic-deliver.html#es-index-rotation}Index \
         Rotation for the Amazon OpenSearch Service Destination}. Default value is\194\160[OneDay].\n"]
  buffering_hints : elasticsearch_buffering_hints option;
      [@ocaml.doc
        "The buffering options. If no value is specified, [ElasticsearchBufferingHints] object \
         default values are used. \n"]
  retry_options : elasticsearch_retry_options option;
      [@ocaml.doc
        "The retry behavior in case Firehose is unable to deliver documents to Amazon OpenSearch \
         Service. The default value is 300 (5 minutes).\n"]
  s3_update : s3_destination_update option; [@ocaml.doc "The Amazon S3 destination.\n"]
  processing_configuration : processing_configuration option;
      [@ocaml.doc "The data processing configuration.\n"]
  cloud_watch_logging_options : cloud_watch_logging_options option;
      [@ocaml.doc "The CloudWatch logging options for your Firehose stream.\n"]
  document_id_options : document_id_options option;
      [@ocaml.doc
        "Indicates the method for setting up document ID. The supported methods are Firehose \
         generated document ID and OpenSearch Service generated document ID.\n"]
}
[@@ocaml.doc "Describes an update for a destination in Amazon OpenSearch Service.\n"]

type nonrec extended_s3_destination_update = {
  role_ar_n : role_ar_n option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the Amazon Web Services credentials. For more \
         information, see \
         {{:https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html}Amazon \
         Resource Names (ARNs) and Amazon Web Services Service Namespaces}.\n"]
  bucket_ar_n : bucket_ar_n option;
      [@ocaml.doc
        "The ARN of the S3 bucket. For more information, see \
         {{:https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html}Amazon \
         Resource Names (ARNs) and Amazon Web Services Service Namespaces}.\n"]
  prefix : prefix option;
      [@ocaml.doc
        "The \"YYYY/MM/DD/HH\" time format prefix is automatically used for delivered Amazon S3 \
         files. You can also specify a custom prefix, as described in \
         {{:https://docs.aws.amazon.com/firehose/latest/dev/s3-prefixes.html}Custom Prefixes for \
         Amazon S3 Objects}.\n"]
  error_output_prefix : error_output_prefix option;
      [@ocaml.doc
        "A prefix that Firehose evaluates and adds to failed records before writing them to S3. \
         This prefix appears immediately following the bucket name. For information about how to \
         specify this prefix, see \
         {{:https://docs.aws.amazon.com/firehose/latest/dev/s3-prefixes.html}Custom Prefixes for \
         Amazon S3 Objects}.\n"]
  buffering_hints : buffering_hints option; [@ocaml.doc "The buffering option.\n"]
  compression_format : compression_format option;
      [@ocaml.doc
        "The compression format. If no value is specified, the default is [UNCOMPRESSED]. \n"]
  encryption_configuration : encryption_configuration option;
      [@ocaml.doc
        "The encryption configuration. If no value is specified, the default is no encryption.\n"]
  cloud_watch_logging_options : cloud_watch_logging_options option;
      [@ocaml.doc "The Amazon CloudWatch logging options for your Firehose stream.\n"]
  processing_configuration : processing_configuration option;
      [@ocaml.doc "The data processing configuration.\n"]
  s3_backup_mode : s3_backup_mode option;
      [@ocaml.doc
        "You can update a Firehose stream to enable Amazon S3 backup if it is disabled. If backup \
         is enabled, you can't update the Firehose stream to disable it. \n"]
  s3_backup_update : s3_destination_update option;
      [@ocaml.doc "The Amazon S3 destination for backup.\n"]
  data_format_conversion_configuration : data_format_conversion_configuration option;
      [@ocaml.doc
        "The serializer, deserializer, and schema for converting data from the JSON format to the \
         Parquet or ORC format before writing it to Amazon S3.\n"]
  dynamic_partitioning_configuration : dynamic_partitioning_configuration option;
      [@ocaml.doc
        "The configuration of the dynamic partitioning mechanism that creates smaller data sets \
         from the streaming data by partitioning it based on partition keys. Currently, dynamic \
         partitioning is only supported for Amazon S3 destinations. \n"]
  file_extension : file_extension option;
      [@ocaml.doc "Specify a file extension. It will override the default file extension\n"]
  custom_time_zone : custom_time_zone option;
      [@ocaml.doc "The time zone you prefer. UTC is the default.\n"]
}
[@@ocaml.doc "Describes an update for a destination in Amazon S3.\n"]

type nonrec update_destination_output = unit [@@ocaml.doc ""]

type nonrec iceberg_destination_update = {
  destination_table_configuration_list : destination_table_configuration_list option;
      [@ocaml.doc
        " Provides a list of [DestinationTableConfigurations] which Firehose uses to deliver data \
         to Apache Iceberg Tables. Firehose will write data with insert if table specific \
         configuration is not provided here.\n"]
  schema_evolution_configuration : schema_evolution_configuration option;
      [@ocaml.doc
        " The configuration to enable automatic schema evolution. \n\n\
        \ Amazon Data Firehose is in preview release and is subject to change.\n\
        \ "]
  table_creation_configuration : table_creation_configuration option;
      [@ocaml.doc
        " The configuration to enable automatic table creation. \n\n\
        \ Amazon Data Firehose is in preview release and is subject to change.\n\
        \ "]
  buffering_hints : buffering_hints option; [@ocaml.doc ""]
  cloud_watch_logging_options : cloud_watch_logging_options option; [@ocaml.doc ""]
  processing_configuration : processing_configuration option; [@ocaml.doc ""]
  s3_backup_mode : iceberg_s3_backup_mode option;
      [@ocaml.doc
        " Describes how Firehose will backup records. Currently,Firehose only supports \
         [FailedDataOnly]. \n"]
  retry_options : retry_options option; [@ocaml.doc ""]
  role_ar_n : role_ar_n option;
      [@ocaml.doc
        " The Amazon Resource Name (ARN) of the IAM role to be assumed by Firehose for calling \
         Apache Iceberg Tables. \n"]
  append_only : boolean_object option;
      [@ocaml.doc
        " Describes whether all incoming data for this delivery stream will be append only \
         (inserts only and not for updates and deletes) for Iceberg delivery. This feature is only \
         applicable for Apache Iceberg Tables. \n\n\
        \ The default value is false. If you set this value to true, Firehose automatically \
         increases the throughput limit of a stream based on the throttling levels of the stream. \
         If you set this parameter to true for a stream with updates and deletes, you will see out \
         of order delivery. \n\
        \ "]
  catalog_configuration : catalog_configuration option;
      [@ocaml.doc
        " Configuration describing where the destination Iceberg tables are persisted. \n"]
  s3_configuration : s3_destination_configuration option; [@ocaml.doc ""]
}
[@@ocaml.doc " Describes an update for a destination in Apache Iceberg Tables. \n"]

type nonrec snowflake_destination_update = {
  account_url : snowflake_account_url option;
      [@ocaml.doc
        "URL for accessing your Snowflake account. This URL must include your \
         {{:https://docs.snowflake.com/en/user-guide/admin-account-identifier}account identifier}. \
         Note that the protocol (https://) and port number are optional.\n"]
  private_key : snowflake_private_key option;
      [@ocaml.doc
        "The private key used to encrypt your Snowflake client. For information, see \
         {{:https://docs.snowflake.com/en/user-guide/data-load-snowpipe-streaming-configuration#using-key-pair-authentication-key-rotation}Using \
         Key Pair Authentication & Key Rotation}.\n"]
  key_passphrase : snowflake_key_passphrase option;
      [@ocaml.doc
        "Passphrase to decrypt the private key when the key is encrypted. For information, see \
         {{:https://docs.snowflake.com/en/user-guide/data-load-snowpipe-streaming-configuration#using-key-pair-authentication-key-rotation}Using \
         Key Pair Authentication & Key Rotation}.\n"]
  user : snowflake_user option; [@ocaml.doc "User login name for the Snowflake account.\n"]
  database : snowflake_database option;
      [@ocaml.doc "All data in Snowflake is maintained in databases.\n"]
  schema : snowflake_schema option;
      [@ocaml.doc
        "Each database consists of one or more schemas, which are logical groupings of database \
         objects, such as tables and views\n"]
  table : snowflake_table option;
      [@ocaml.doc
        "All data in Snowflake is stored in database tables, logically structured as collections \
         of columns and rows.\n"]
  snowflake_role_configuration : snowflake_role_configuration option;
      [@ocaml.doc
        "Optionally configure a Snowflake role. Otherwise the default user role will be used.\n"]
  data_loading_option : snowflake_data_loading_option option;
      [@ocaml.doc
        " JSON keys mapped to table column names or choose to split the JSON payload where content \
         is mapped to a record content column and source metadata is mapped to a record metadata \
         column.\n"]
  meta_data_column_name : snowflake_meta_data_column_name option;
      [@ocaml.doc "The name of the record metadata column\n"]
  content_column_name : snowflake_content_column_name option;
      [@ocaml.doc "The name of the content metadata column\n"]
  cloud_watch_logging_options : cloud_watch_logging_options option; [@ocaml.doc ""]
  processing_configuration : processing_configuration option; [@ocaml.doc ""]
  role_ar_n : role_ar_n option;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the Snowflake role\n"]
  retry_options : snowflake_retry_options option;
      [@ocaml.doc
        "Specify how long Firehose retries sending data to the New Relic HTTP endpoint. After \
         sending data, Firehose first waits for an acknowledgment from the HTTP endpoint. If an \
         error occurs or the acknowledgment doesn\226\128\153t arrive within the acknowledgment \
         timeout period, Firehose starts the retry duration counter. It keeps retrying until the \
         retry duration expires. After that, Firehose considers it a data delivery failure and \
         backs up the data to your Amazon S3 bucket. Every time that Firehose sends data to the \
         HTTP endpoint (either the initial attempt or a retry), it restarts the acknowledgement \
         timeout counter and waits for an acknowledgement from the HTTP endpoint. Even if the \
         retry duration expires, Firehose still waits for the acknowledgment until it receives it \
         or the acknowledgement timeout period is reached. If the acknowledgment times out, \
         Firehose determines whether there's time left in the retry counter. If there is time \
         left, it retries again and repeats the logic until it receives an acknowledgment or \
         determines that the retry time has expired. If you don't want Firehose to retry sending \
         data, set this value to 0.\n"]
  s3_backup_mode : snowflake_s3_backup_mode option;
      [@ocaml.doc
        "Choose an S3 backup mode. Once you set the mode as [AllData], you can not change it to \
         [FailedDataOnly].\n"]
  s3_update : s3_destination_update option; [@ocaml.doc ""]
  secrets_manager_configuration : secrets_manager_configuration option;
      [@ocaml.doc " Describes the Secrets Manager configuration in Snowflake. \n"]
  buffering_hints : snowflake_buffering_hints option;
      [@ocaml.doc
        " Describes the buffering to perform before delivering data to the Snowflake destination. \n"]
}
[@@ocaml.doc "Update to configuration settings\n"]

type nonrec http_endpoint_destination_update = {
  endpoint_configuration : http_endpoint_configuration option;
      [@ocaml.doc "Describes the configuration of the HTTP endpoint destination.\n"]
  buffering_hints : http_endpoint_buffering_hints option;
      [@ocaml.doc
        "Describes buffering options that can be applied to the data before it is delivered to the \
         HTTPS endpoint destination. Firehose teats these options as hints, and it might choose to \
         use more optimal values. The [SizeInMBs] and [IntervalInSeconds] parameters are optional. \
         However, if specify a value for one of them, you must also provide a value for the other. \n"]
  cloud_watch_logging_options : cloud_watch_logging_options option; [@ocaml.doc ""]
  request_configuration : http_endpoint_request_configuration option;
      [@ocaml.doc
        "The configuration of the request sent to the HTTP endpoint specified as the destination.\n"]
  processing_configuration : processing_configuration option; [@ocaml.doc ""]
  role_ar_n : role_ar_n option;
      [@ocaml.doc
        "Firehose uses this IAM role for all the permissions that the delivery stream needs.\n"]
  retry_options : http_endpoint_retry_options option;
      [@ocaml.doc
        "Describes the retry behavior in case Firehose is unable to deliver data to the specified \
         HTTP endpoint destination, or if it doesn't receive a valid acknowledgment of receipt \
         from the specified HTTP endpoint destination.\n"]
  s3_backup_mode : http_endpoint_s3_backup_mode option;
      [@ocaml.doc
        "Describes the S3 bucket backup options for the data that Kinesis Firehose delivers to the \
         HTTP endpoint destination. You can back up all documents ([AllData]) or only the \
         documents that Firehose could not deliver to the specified HTTP endpoint destination \
         ([FailedDataOnly]).\n"]
  s3_update : s3_destination_update option; [@ocaml.doc ""]
  secrets_manager_configuration : secrets_manager_configuration option;
      [@ocaml.doc
        " The configuration that defines how you access secrets for HTTP Endpoint destination. \n"]
}
[@@ocaml.doc "Updates the specified HTTP endpoint destination.\n"]

type nonrec splunk_destination_update = {
  hec_endpoint : hec_endpoint option;
      [@ocaml.doc "The HTTP Event Collector (HEC) endpoint to which Firehose sends your data.\n"]
  hec_endpoint_type : hec_endpoint_type option;
      [@ocaml.doc "This type can be either \"Raw\" or \"Event.\"\n"]
  hec_token : hec_token option;
      [@ocaml.doc
        "A GUID that you obtain from your Splunk cluster when you create a new HEC endpoint.\n"]
  hec_acknowledgment_timeout_in_seconds : hec_acknowledgment_timeout_in_seconds option;
      [@ocaml.doc
        "The amount of time that Firehose waits to receive an acknowledgment from Splunk after it \
         sends data. At the end of the timeout period, Firehose either tries to send the data \
         again or considers it an error, based on your retry settings.\n"]
  retry_options : splunk_retry_options option;
      [@ocaml.doc
        "The retry behavior in case Firehose is unable to deliver data to Splunk or if it doesn't \
         receive an acknowledgment of receipt from Splunk.\n"]
  s3_backup_mode : splunk_s3_backup_mode option;
      [@ocaml.doc
        "Specifies how you want Firehose to back up documents to Amazon S3. When set to \
         [FailedDocumentsOnly], Firehose writes any data that could not be indexed to the \
         configured Amazon S3 destination. When set to [AllEvents], Firehose delivers all incoming \
         records to Amazon S3, and also writes failed documents to Amazon S3. The default value is \
         [FailedEventsOnly].\n\n\
        \ You can update this backup mode from [FailedEventsOnly] to [AllEvents]. You can't update \
         it from [AllEvents] to [FailedEventsOnly].\n\
        \ "]
  s3_update : s3_destination_update option;
      [@ocaml.doc "Your update to the configuration of the backup Amazon S3 location.\n"]
  processing_configuration : processing_configuration option;
      [@ocaml.doc "The data processing configuration.\n"]
  cloud_watch_logging_options : cloud_watch_logging_options option;
      [@ocaml.doc "The Amazon CloudWatch logging options for your Firehose stream.\n"]
  buffering_hints : splunk_buffering_hints option;
      [@ocaml.doc
        "The buffering options. If no value is specified, the default values for Splunk are used.\n"]
  secrets_manager_configuration : secrets_manager_configuration option;
      [@ocaml.doc " The configuration that defines how you access secrets for Splunk. \n"]
}
[@@ocaml.doc "Describes an update for a destination in Splunk.\n"]

type nonrec redshift_destination_update = {
  role_ar_n : role_ar_n option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the Amazon Web Services credentials. For more \
         information, see \
         {{:https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html}Amazon \
         Resource Names (ARNs) and Amazon Web Services Service Namespaces}.\n"]
  cluster_jdbcur_l : cluster_jdbcur_l option; [@ocaml.doc "The database connection string.\n"]
  copy_command : copy_command option; [@ocaml.doc "The [COPY] command.\n"]
  username : username option; [@ocaml.doc "The name of the user.\n"]
  password : password option; [@ocaml.doc "The user password.\n"]
  retry_options : redshift_retry_options option;
      [@ocaml.doc
        "The retry behavior in case Firehose is unable to deliver documents to Amazon Redshift. \
         Default value is 3600 (60 minutes).\n"]
  s3_update : s3_destination_update option;
      [@ocaml.doc
        "The Amazon S3 destination.\n\n\
        \ The compression formats [SNAPPY] or [ZIP] cannot be specified in \
         [RedshiftDestinationUpdate.S3Update] because the Amazon Redshift [COPY] operation that \
         reads from the S3 bucket doesn't support these compression formats.\n\
        \ "]
  processing_configuration : processing_configuration option;
      [@ocaml.doc "The data processing configuration.\n"]
  s3_backup_mode : redshift_s3_backup_mode option;
      [@ocaml.doc
        "You can update a Firehose stream to enable Amazon S3 backup if it is disabled. If backup \
         is enabled, you can't update the Firehose stream to disable it. \n"]
  s3_backup_update : s3_destination_update option;
      [@ocaml.doc "The Amazon S3 destination for backup.\n"]
  cloud_watch_logging_options : cloud_watch_logging_options option;
      [@ocaml.doc "The Amazon CloudWatch logging options for your Firehose stream.\n"]
  secrets_manager_configuration : secrets_manager_configuration option;
      [@ocaml.doc " The configuration that defines how you access secrets for Amazon Redshift. \n"]
}
[@@ocaml.doc "Describes an update for a destination in Amazon Redshift.\n"]

type nonrec update_destination_input = {
  delivery_stream_name : delivery_stream_name; [@ocaml.doc "The name of the Firehose stream.\n"]
  current_delivery_stream_version_id : delivery_stream_version_id;
      [@ocaml.doc
        "Obtain this value from the [VersionId] result of [DeliveryStreamDescription]. This value \
         is required, and helps the service perform conditional operations. For example, if there \
         is an interleaving update and this value is null, then the update destination fails. \
         After the update is successful, the [VersionId] value is updated. The service then \
         performs a merge of the old configuration with the new configuration.\n"]
  destination_id : destination_id; [@ocaml.doc "The ID of the destination.\n"]
  s3_destination_update : s3_destination_update option;
      [@ocaml.doc "\\[Deprecated\\] Describes an update for a destination in Amazon S3.\n"]
  extended_s3_destination_update : extended_s3_destination_update option;
      [@ocaml.doc "Describes an update for a destination in Amazon S3.\n"]
  redshift_destination_update : redshift_destination_update option;
      [@ocaml.doc "Describes an update for a destination in Amazon Redshift.\n"]
  elasticsearch_destination_update : elasticsearch_destination_update option;
      [@ocaml.doc "Describes an update for a destination in Amazon OpenSearch Service.\n"]
  amazonopensearchservice_destination_update : amazonopensearchservice_destination_update option;
      [@ocaml.doc "Describes an update for a destination in Amazon OpenSearch Service.\n"]
  splunk_destination_update : splunk_destination_update option;
      [@ocaml.doc "Describes an update for a destination in Splunk.\n"]
  http_endpoint_destination_update : http_endpoint_destination_update option;
      [@ocaml.doc "Describes an update to the specified HTTP endpoint destination.\n"]
  amazon_open_search_serverless_destination_update :
    amazon_open_search_serverless_destination_update option;
      [@ocaml.doc
        "Describes an update for a destination in the Serverless offering for Amazon OpenSearch \
         Service.\n"]
  snowflake_destination_update : snowflake_destination_update option;
      [@ocaml.doc "Update to the Snowflake destination configuration settings.\n"]
  iceberg_destination_update : iceberg_destination_update option;
      [@ocaml.doc " Describes an update for a destination in Apache Iceberg Tables. \n"]
}
[@@ocaml.doc ""]

type nonrec untag_delivery_stream_output = unit [@@ocaml.doc ""]

type nonrec tag_key_list = tag_key list [@@ocaml.doc ""]

type nonrec untag_delivery_stream_input = {
  delivery_stream_name : delivery_stream_name; [@ocaml.doc "The name of the Firehose stream.\n"]
  tag_keys : tag_key_list;
      [@ocaml.doc
        "A list of tag keys. Each corresponding tag is removed from the delivery stream.\n"]
}
[@@ocaml.doc ""]

type nonrec tag_delivery_stream_output = unit [@@ocaml.doc ""]

type nonrec tag_delivery_stream_input = {
  delivery_stream_name : delivery_stream_name;
      [@ocaml.doc "The name of the Firehose stream to which you want to add the tags.\n"]
  tags : tag_delivery_stream_input_tag_list;
      [@ocaml.doc "A set of key-value pairs to use to create the tags.\n"]
}
[@@ocaml.doc ""]

type nonrec stop_delivery_stream_encryption_output = unit [@@ocaml.doc ""]

type nonrec stop_delivery_stream_encryption_input = {
  delivery_stream_name : delivery_stream_name;
      [@ocaml.doc
        "The name of the Firehose stream for which you want to disable server-side encryption (SSE).\n"]
}
[@@ocaml.doc ""]

type nonrec start_delivery_stream_encryption_output = unit [@@ocaml.doc ""]

type nonrec start_delivery_stream_encryption_input = {
  delivery_stream_name : delivery_stream_name;
      [@ocaml.doc
        "The name of the Firehose stream for which you want to enable server-side encryption (SSE).\n"]
  delivery_stream_encryption_configuration_input :
    delivery_stream_encryption_configuration_input option;
      [@ocaml.doc
        "Used to specify the type and Amazon Resource Name (ARN) of the KMS key needed for \
         Server-Side Encryption (SSE).\n"]
}
[@@ocaml.doc ""]

type nonrec service_unavailable_exception = {
  message : error_message option;
      [@ocaml.doc "A message that provides information about the error.\n"]
}
[@@ocaml.doc
  "The service is unavailable. Back off and retry the operation. If you continue to see the \
   exception, throughput limits for the Firehose stream may have been exceeded. For more \
   information about limits and how to request an increase, see \
   {{:https://docs.aws.amazon.com/firehose/latest/dev/limits.html}Amazon Firehose Limits}.\n"]

type nonrec invalid_source_exception = {
  code : error_code option; [@ocaml.doc ""]
  message : error_message option; [@ocaml.doc ""]
}
[@@ocaml.doc
  "Only requests from CloudWatch Logs are supported when CloudWatch Logs decompression is enabled.\n"]

type nonrec put_response_record_id = string [@@ocaml.doc ""]

type nonrec put_record_batch_response_entry = {
  record_id : put_response_record_id option; [@ocaml.doc "The ID of the record.\n"]
  error_code : error_code option; [@ocaml.doc "The error code for an individual record result.\n"]
  error_message : error_message option;
      [@ocaml.doc "The error message for an individual record result.\n"]
}
[@@ocaml.doc
  "Contains the result for an individual record from a [PutRecordBatch] request. If the record is \
   successfully added to your Firehose stream, it receives a record ID. If the record fails to be \
   added to your Firehose stream, the result includes an error code and an error message.\n"]

type nonrec put_record_batch_response_entry_list = put_record_batch_response_entry list
[@@ocaml.doc ""]

type nonrec put_record_batch_output = {
  failed_put_count : non_negative_integer_object;
      [@ocaml.doc
        "The number of records that might have failed processing. This number might be greater \
         than 0 even if the [PutRecordBatch] call succeeds. Check [FailedPutCount] to determine \
         whether there are records that you need to resend.\n"]
  encrypted : boolean_object option;
      [@ocaml.doc
        "Indicates whether server-side encryption (SSE) was enabled during this operation.\n"]
  request_responses : put_record_batch_response_entry_list;
      [@ocaml.doc
        "The results array. For each record, the index of the response element is the same as the \
         index used in the request array.\n"]
}
[@@ocaml.doc ""]

type nonrec record = {
  data : data;
      [@ocaml.doc
        "The data blob, which is base64-encoded when the blob is serialized. The maximum size of \
         the data blob, before base64-encoding, is 1,000 KiB.\n"]
}
[@@ocaml.doc "The unit of data in a Firehose stream.\n"]

type nonrec put_record_batch_request_entry_list = record list [@@ocaml.doc ""]

type nonrec put_record_batch_input = {
  delivery_stream_name : delivery_stream_name; [@ocaml.doc "The name of the Firehose stream.\n"]
  records : put_record_batch_request_entry_list; [@ocaml.doc "One or more records.\n"]
}
[@@ocaml.doc ""]

type nonrec put_record_output = {
  record_id : put_response_record_id; [@ocaml.doc "The ID of the record.\n"]
  encrypted : boolean_object option;
      [@ocaml.doc
        "Indicates whether server-side encryption (SSE) was enabled during this operation.\n"]
}
[@@ocaml.doc ""]

type nonrec put_record_input = {
  delivery_stream_name : delivery_stream_name; [@ocaml.doc "The name of the Firehose stream.\n"]
  record : record; [@ocaml.doc "The record.\n"]
}
[@@ocaml.doc ""]

type nonrec list_tags_for_delivery_stream_output_tag_list = tag list [@@ocaml.doc ""]

type nonrec list_tags_for_delivery_stream_output = {
  tags : list_tags_for_delivery_stream_output_tag_list;
      [@ocaml.doc
        "A list of tags associated with [DeliveryStreamName], starting with the first tag after \
         [ExclusiveStartTagKey] and up to the specified [Limit].\n"]
  has_more_tags : boolean_object;
      [@ocaml.doc
        "If this is [true] in the response, more tags are available. To list the remaining tags, \
         set [ExclusiveStartTagKey] to the key of the last tag returned and call \
         [ListTagsForDeliveryStream] again.\n"]
}
[@@ocaml.doc ""]

type nonrec list_tags_for_delivery_stream_input_limit = int [@@ocaml.doc ""]

type nonrec list_tags_for_delivery_stream_input = {
  delivery_stream_name : delivery_stream_name;
      [@ocaml.doc "The name of the Firehose stream whose tags you want to list.\n"]
  exclusive_start_tag_key : tag_key option;
      [@ocaml.doc
        "The key to use as the starting point for the list of tags. If you set this parameter, \
         [ListTagsForDeliveryStream] gets all tags that occur after [ExclusiveStartTagKey].\n"]
  limit : list_tags_for_delivery_stream_input_limit option;
      [@ocaml.doc
        "The number of tags to return. If this number is less than the total number of tags \
         associated with the Firehose stream, [HasMoreTags] is set to [true] in the response. To \
         list additional tags, set [ExclusiveStartTagKey] to the last key in the response. \n"]
}
[@@ocaml.doc ""]

type nonrec list_delivery_streams_output = {
  delivery_stream_names : delivery_stream_name_list;
      [@ocaml.doc "The names of the Firehose streams.\n"]
  has_more_delivery_streams : boolean_object;
      [@ocaml.doc "Indicates whether there are more Firehose streams available to list.\n"]
}
[@@ocaml.doc ""]

type nonrec list_delivery_streams_input_limit = int [@@ocaml.doc ""]

type nonrec list_delivery_streams_input = {
  limit : list_delivery_streams_input_limit option;
      [@ocaml.doc "The maximum number of Firehose streams to list. The default value is 10.\n"]
  delivery_stream_type : delivery_stream_type option;
      [@ocaml.doc
        "The Firehose stream type. This can be one of the following values:\n\n\
        \ {ul\n\
        \       {-   [DirectPut]: Provider applications access the Firehose stream directly.\n\
        \           \n\
        \            }\n\
        \       {-   [KinesisStreamAsSource]: The Firehose stream uses a Kinesis data stream as a \
         source.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \   This parameter is optional. If this parameter is omitted, Firehose streams of all \
         types are returned.\n\
        \   "]
  exclusive_start_delivery_stream_name : delivery_stream_name option;
      [@ocaml.doc
        "The list of Firehose streams returned by this call to [ListDeliveryStreams] will start \
         with the Firehose stream whose name comes alphabetically immediately after the name you \
         specify in [ExclusiveStartDeliveryStreamName].\n"]
}
[@@ocaml.doc ""]
