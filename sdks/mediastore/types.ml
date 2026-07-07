type nonrec untag_resource_output = unit [@@ocaml.doc ""]

type nonrec container_ar_n = string [@@ocaml.doc ""]

type nonrec tag_key = string [@@ocaml.doc ""]

type nonrec tag_key_list = tag_key list [@@ocaml.doc ""]

type nonrec untag_resource_input = {
  tag_keys : tag_key_list;
      [@ocaml.doc
        "A comma-separated list of keys for tags that you want to remove from the container. For \
         example, if your container has two tags (customer:CompanyA and priority:High) and you \
         want to remove one of the tags (priority:High), you specify the key for the tag that you \
         want to remove (priority).\n"]
  resource : container_ar_n; [@ocaml.doc "The Amazon Resource Name (ARN) for the container.\n"]
}
[@@ocaml.doc ""]

type nonrec error_message = string [@@ocaml.doc ""]

type nonrec internal_server_error = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc "The service is temporarily unavailable.\n"]

type nonrec container_not_found_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc "The container that you specified in the request does not exist.\n"]

type nonrec container_in_use_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc
  "The container that you specified in the request already exists or is being updated.\n"]

type nonrec time_stamp = Smaws_Lib.CoreTypes.Timestamp.t [@@ocaml.doc ""]

type nonrec tag_value = string [@@ocaml.doc ""]

type nonrec tag_resource_output = unit [@@ocaml.doc ""]

type nonrec tag = {
  value : tag_value option;
      [@ocaml.doc
        "Part of the key:value pair that defines a tag. You can use a tag value to describe a \
         specific value within a category, such as \"companyA\" or \"companyB.\" Tag values are \
         case-sensitive.\n"]
  key : tag_key;
      [@ocaml.doc
        "Part of the key:value pair that defines a tag. You can use a tag key to describe a \
         category of information, such as \"customer.\" Tag keys are case-sensitive.\n"]
}
[@@ocaml.doc
  "A collection of tags associated with a container. Each tag consists of a key:value pair, which \
   can be anything you define. Typically, the tag key represents a category (such as \
   \"environment\") and the tag value represents a specific value within that category (such as \
   \"test,\" \"development,\" or \"production\"). You can add up to 50 tags to each container. For \
   more information about tagging, including naming and usage conventions, see \
   {{:https://docs.aws.amazon.com/mediastore/latest/ug/tagging.html}Tagging Resources in \
   MediaStore}.\n"]

type nonrec tag_list = tag list [@@ocaml.doc ""]

type nonrec tag_resource_input = {
  tags : tag_list;
      [@ocaml.doc
        "An array of key:value pairs that you want to add to the container. You need to specify \
         only the tags that you want to add or update. For example, suppose a container already \
         has two tags (customer:CompanyA and priority:High). You want to change the priority tag \
         and also add a third tag (type:Contract). For TagResource, you specify the following \
         tags: priority:Medium, type:Contract. The result is that your container has three tags: \
         customer:CompanyA, priority:Medium, and type:Contract.\n"]
  resource : container_ar_n; [@ocaml.doc "The Amazon Resource Name (ARN) for the container. \n"]
}
[@@ocaml.doc ""]

type nonrec stop_access_logging_output = unit [@@ocaml.doc ""]

type nonrec container_name = string [@@ocaml.doc ""]

type nonrec stop_access_logging_input = {
  container_name : container_name;
      [@ocaml.doc "The name of the container that you want to stop access logging on.\n"]
}
[@@ocaml.doc ""]

type nonrec start_access_logging_output = unit [@@ocaml.doc ""]

type nonrec start_access_logging_input = {
  container_name : container_name;
      [@ocaml.doc "The name of the container that you want to start access logging on.\n"]
}
[@@ocaml.doc ""]

type nonrec put_metric_policy_output = unit [@@ocaml.doc ""]

type nonrec container_level_metrics = DISABLED [@ocaml.doc ""] | ENABLED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec object_group = string [@@ocaml.doc ""]

type nonrec object_group_name = string [@@ocaml.doc ""]

type nonrec metric_policy_rule = {
  object_group_name : object_group_name;
      [@ocaml.doc "A name that allows you to refer to the object group.\n"]
  object_group : object_group;
      [@ocaml.doc
        "A path or file name that defines which objects to include in the group. Wildcards (*) are \
         acceptable.\n"]
}
[@@ocaml.doc
  "A setting that enables metrics at the object level. Each rule contains an object group and an \
   object group name. If the policy includes the MetricPolicyRules parameter, you must include at \
   least one rule. Each metric policy can include up to five rules by default. You can also \
   {{:https://console.aws.amazon.com/servicequotas/home?region=us-east-1#!/services/mediastore/quotas}request \
   a quota increase} to allow up to 300 rules per policy.\n"]

type nonrec metric_policy_rules = metric_policy_rule list [@@ocaml.doc ""]

type nonrec metric_policy = {
  metric_policy_rules : metric_policy_rules option;
      [@ocaml.doc
        "A parameter that holds an array of rules that enable metrics at the object level. This \
         parameter is optional, but if you choose to include it, you must also include at least \
         one rule. By default, you can include up to five rules. You can also \
         {{:https://console.aws.amazon.com/servicequotas/home?region=us-east-1#!/services/mediastore/quotas}request \
         a quota increase} to allow up to 300 rules per policy.\n"]
  container_level_metrics : container_level_metrics;
      [@ocaml.doc "A setting to enable or disable metrics at the container level.\n"]
}
[@@ocaml.doc
  "The metric policy that is associated with the container. A metric policy allows AWS Elemental \
   MediaStore to send metrics to Amazon CloudWatch. In the policy, you must indicate whether you \
   want MediaStore to send container-level metrics. You can also include rules to define groups of \
   objects that you want MediaStore to send object-level metrics for.\n\n\
  \ To view examples of how to construct a metric policy for your use case, see \
   {{:https://docs.aws.amazon.com/mediastore/latest/ug/policies-metric-examples.html}Example \
   Metric Policies}.\n\
  \ "]

type nonrec put_metric_policy_input = {
  metric_policy : metric_policy;
      [@ocaml.doc
        "The metric policy that you want to associate with the container. In the policy, you must \
         indicate whether you want MediaStore to send container-level metrics. You can also \
         include up to five rules to define groups of objects that you want MediaStore to send \
         object-level metrics for. If you include rules in the policy, construct each rule with \
         both of the following:\n\n\
        \ {ul\n\
        \       {-  An object group that defines which objects to include in the group. The \
         definition can be a path or a file name, but it can't have more than 900 characters. \
         Valid characters are: a-z, A-Z, 0-9, _ (underscore), = (equal), : (colon), . (period), - \
         (hyphen), ~ (tilde), / (forward slash), and * (asterisk). Wildcards (*) are acceptable.\n\
        \           \n\
        \            }\n\
        \       {-  An object group name that allows you to refer to the object group. The name \
         can't have more than 30 characters. Valid characters are: a-z, A-Z, 0-9, and _ \
         (underscore).\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  container_name : container_name;
      [@ocaml.doc "The name of the container that you want to add the metric policy to.\n"]
}
[@@ocaml.doc ""]

type nonrec put_lifecycle_policy_output = unit [@@ocaml.doc ""]

type nonrec lifecycle_policy = string [@@ocaml.doc ""]

type nonrec put_lifecycle_policy_input = {
  lifecycle_policy : lifecycle_policy;
      [@ocaml.doc "The object lifecycle policy to apply to the container.\n"]
  container_name : container_name;
      [@ocaml.doc
        "The name of the container that you want to assign the object lifecycle policy to.\n"]
}
[@@ocaml.doc ""]

type nonrec put_cors_policy_output = unit [@@ocaml.doc ""]

type nonrec origin = string [@@ocaml.doc ""]

type nonrec allowed_origins = origin list [@@ocaml.doc ""]

type nonrec method_name =
  | HEAD [@ocaml.doc ""]
  | DELETE [@ocaml.doc ""]
  | GET [@ocaml.doc ""]
  | PUT [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec allowed_methods = method_name list [@@ocaml.doc ""]

type nonrec header = string [@@ocaml.doc ""]

type nonrec allowed_headers = header list [@@ocaml.doc ""]

type nonrec max_age_seconds = int [@@ocaml.doc ""]

type nonrec expose_headers = header list [@@ocaml.doc ""]

type nonrec cors_rule = {
  expose_headers : expose_headers option;
      [@ocaml.doc
        "One or more headers in the response that you want users to be able to access from their \
         applications (for example, from a JavaScript [XMLHttpRequest] object).\n\n\
        \ This element is optional for each rule.\n\
        \ "]
  max_age_seconds : max_age_seconds option;
      [@ocaml.doc
        "The time in seconds that your browser caches the preflight response for the specified \
         resource.\n\n\
        \ A CORS rule can have only one [MaxAgeSeconds] element.\n\
        \ "]
  allowed_headers : allowed_headers;
      [@ocaml.doc
        "Specifies which headers are allowed in a preflight [OPTIONS] request through the \
         [Access-Control-Request-Headers] header. Each header name that is specified in \
         [Access-Control-Request-Headers] must have a corresponding entry in the rule. Only the \
         headers that were requested are sent back. \n\n\
        \ This element can contain only one wildcard character (*).\n\
        \ "]
  allowed_methods : allowed_methods option;
      [@ocaml.doc
        "Identifies an HTTP method that the origin that is specified in the rule is allowed to \
         execute.\n\n\
        \ Each CORS rule must contain at least one [AllowedMethods] and one [AllowedOrigins] \
         element.\n\
        \ "]
  allowed_origins : allowed_origins;
      [@ocaml.doc
        "One or more response headers that you want users to be able to access from their \
         applications (for example, from a JavaScript [XMLHttpRequest] object).\n\n\
        \ Each CORS rule must have at least one [AllowedOrigins] element. The string value can \
         include only one wildcard character (*), for example, http://*.example.com. Additionally, \
         you can specify only one wildcard character to allow cross-origin access for all origins.\n\
        \ "]
}
[@@ocaml.doc
  "A rule for a CORS policy. You can add up to 100 rules to a CORS policy. If more than one rule \
   applies, the service uses the first applicable rule listed.\n"]

type nonrec cors_policy = cors_rule list [@@ocaml.doc ""]

type nonrec put_cors_policy_input = {
  cors_policy : cors_policy; [@ocaml.doc "The CORS policy to apply to the container. \n"]
  container_name : container_name;
      [@ocaml.doc "The name of the container that you want to assign the CORS policy to.\n"]
}
[@@ocaml.doc ""]

type nonrec put_container_policy_output = unit [@@ocaml.doc ""]

type nonrec container_policy = string [@@ocaml.doc ""]

type nonrec put_container_policy_input = {
  policy : container_policy;
      [@ocaml.doc
        "The contents of the policy, which includes the following: \n\n\
        \ {ul\n\
        \       {-  One [Version] tag\n\
        \           \n\
        \            }\n\
        \       {-  One [Statement] tag that contains the standard tags for the policy.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  container_name : container_name; [@ocaml.doc "The name of the container.\n"]
}
[@@ocaml.doc ""]

type nonrec policy_not_found_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc "The policy that you specified in the request does not exist.\n"]

type nonrec pagination_token = string [@@ocaml.doc ""]

type nonrec list_tags_for_resource_output = {
  tags : tag_list option;
      [@ocaml.doc "An array of key:value pairs that are assigned to the container.\n"]
}
[@@ocaml.doc ""]

type nonrec list_tags_for_resource_input = {
  resource : container_ar_n; [@ocaml.doc "The Amazon Resource Name (ARN) for the container.\n"]
}
[@@ocaml.doc ""]

type nonrec endpoint = string [@@ocaml.doc ""]

type nonrec container_status =
  | DELETING [@ocaml.doc ""]
  | CREATING [@ocaml.doc ""]
  | ACTIVE [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec container_access_logging_enabled = bool [@@ocaml.doc ""]

type nonrec container = {
  access_logging_enabled : container_access_logging_enabled option;
      [@ocaml.doc
        "The state of access logging on the container. This value is [false] by default, \
         indicating that AWS Elemental MediaStore does not send access logs to Amazon CloudWatch \
         Logs. When you enable access logging on the container, MediaStore changes this value to \
         [true], indicating that the service delivers access logs for objects stored in that \
         container to CloudWatch Logs.\n"]
  status : container_status option;
      [@ocaml.doc
        "The status of container creation or deletion. The status is one of the following: \
         [CREATING], [ACTIVE], or [DELETING]. While the service is creating the container, the \
         status is [CREATING]. When the endpoint is available, the status changes to [ACTIVE].\n"]
  name : container_name option; [@ocaml.doc "The name of the container.\n"]
  ar_n : container_ar_n option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the container. The ARN has the following format:\n\n\
        \ arn:aws:::container/ \n\
        \ \n\
        \  For example: arn:aws:mediastore:us-west-2:111122223333:container/movies \n\
        \  "]
  creation_time : time_stamp option; [@ocaml.doc "Unix timestamp.\n"]
  endpoint : endpoint option;
      [@ocaml.doc
        "The DNS endpoint of the container. Use the endpoint to identify the specific container \
         when sending requests to the data plane. The service assigns this value when the \
         container is created. Once the value has been assigned, it does not change.\n"]
}
[@@ocaml.doc
  "This section describes operations that you can perform on an AWS Elemental MediaStore container.\n"]

type nonrec container_list = container list [@@ocaml.doc ""]

type nonrec list_containers_output = {
  next_token : pagination_token option;
      [@ocaml.doc
        " [NextToken] is the token to use in the next call to [ListContainers]. This token is \
         returned only if you included the [MaxResults] tag in the original command, and only if \
         there are still containers to return. \n"]
  containers : container_list; [@ocaml.doc "The names of the containers.\n"]
}
[@@ocaml.doc ""]

type nonrec container_list_limit = int [@@ocaml.doc ""]

type nonrec list_containers_input = {
  max_results : container_list_limit option;
      [@ocaml.doc
        "Enter the maximum number of containers in the response. Use from 1 to 255 characters. \n"]
  next_token : pagination_token option;
      [@ocaml.doc
        "Only if you used [MaxResults] in the first command, enter the token (which was included \
         in the previous response) to obtain the next set of containers. This token is included in \
         a response only if there actually are more containers to list.\n"]
}
[@@ocaml.doc ""]

type nonrec get_metric_policy_output = {
  metric_policy : metric_policy;
      [@ocaml.doc "The metric policy that is associated with the specific container.\n"]
}
[@@ocaml.doc ""]

type nonrec get_metric_policy_input = {
  container_name : container_name;
      [@ocaml.doc "The name of the container that is associated with the metric policy.\n"]
}
[@@ocaml.doc ""]

type nonrec get_lifecycle_policy_output = {
  lifecycle_policy : lifecycle_policy;
      [@ocaml.doc "The object lifecycle policy that is assigned to the container.\n"]
}
[@@ocaml.doc ""]

type nonrec get_lifecycle_policy_input = {
  container_name : container_name;
      [@ocaml.doc "The name of the container that the object lifecycle policy is assigned to.\n"]
}
[@@ocaml.doc ""]

type nonrec cors_policy_not_found_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc "The CORS policy that you specified in the request does not exist.\n"]

type nonrec get_cors_policy_output = {
  cors_policy : cors_policy; [@ocaml.doc "The CORS policy assigned to the container.\n"]
}
[@@ocaml.doc ""]

type nonrec get_cors_policy_input = {
  container_name : container_name;
      [@ocaml.doc "The name of the container that the policy is assigned to.\n"]
}
[@@ocaml.doc ""]

type nonrec get_container_policy_output = {
  policy : container_policy; [@ocaml.doc "The contents of the access policy.\n"]
}
[@@ocaml.doc ""]

type nonrec get_container_policy_input = {
  container_name : container_name; [@ocaml.doc "The name of the container. \n"]
}
[@@ocaml.doc ""]

type nonrec describe_container_output = {
  container : container option; [@ocaml.doc "The name of the queried container.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_container_input = {
  container_name : container_name option; [@ocaml.doc "The name of the container to query.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_metric_policy_output = unit [@@ocaml.doc ""]

type nonrec delete_metric_policy_input = {
  container_name : container_name;
      [@ocaml.doc
        "The name of the container that is associated with the metric policy that you want to \
         delete.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_lifecycle_policy_output = unit [@@ocaml.doc ""]

type nonrec delete_lifecycle_policy_input = {
  container_name : container_name;
      [@ocaml.doc "The name of the container that holds the object lifecycle policy.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_cors_policy_output = unit [@@ocaml.doc ""]

type nonrec delete_cors_policy_input = {
  container_name : container_name;
      [@ocaml.doc "The name of the container to remove the policy from.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_container_policy_output = unit [@@ocaml.doc ""]

type nonrec delete_container_policy_input = {
  container_name : container_name; [@ocaml.doc "The name of the container that holds the policy.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_container_output = unit [@@ocaml.doc ""]

type nonrec delete_container_input = {
  container_name : container_name; [@ocaml.doc "The name of the container to delete. \n"]
}
[@@ocaml.doc ""]

type nonrec limit_exceeded_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc "A service limit has been exceeded.\n"]

type nonrec create_container_output = {
  container : container;
      [@ocaml.doc
        "ContainerARN: The Amazon Resource Name (ARN) of the newly created container. The ARN has \
         the following format: arn:aws:::container/. For example: \
         arn:aws:mediastore:us-west-2:111122223333:container/movies \n\n\
        \ ContainerName: The container name as specified in the request.\n\
        \ \n\
        \  CreationTime: Unix time stamp.\n\
        \  \n\
        \   Status: The status of container creation or deletion. The status is one of the \
         following: [CREATING], [ACTIVE], or [DELETING]. While the service is creating the \
         container, the status is [CREATING]. When an endpoint is available, the status changes to \
         [ACTIVE].\n\
        \   \n\
        \    The return value does not include the container's endpoint. To make downstream \
         requests, you must obtain this value by using [DescribeContainer] or [ListContainers].\n\
        \    "]
}
[@@ocaml.doc ""]

type nonrec create_container_input = {
  tags : tag_list option;
      [@ocaml.doc
        "An array of key:value pairs that you define. These values can be anything that you want. \
         Typically, the tag key represents a category (such as \"environment\") and the tag value \
         represents a specific value within that category (such as \"test,\" \"development,\" or \
         \"production\"). You can add up to 50 tags to each container. For more information about \
         tagging, including naming and usage conventions, see \
         {{:https://docs.aws.amazon.com/mediastore/latest/ug/tagging.html}Tagging Resources in \
         MediaStore}.\n"]
  container_name : container_name;
      [@ocaml.doc
        "The name for the container. The name must be from 1 to 255 characters. Container names \
         must be unique to your AWS account within a specific region. As an example, you could \
         create a container named [movies] in every region, as long as you don\226\128\153t have \
         an existing container with that name.\n"]
}
[@@ocaml.doc ""]
