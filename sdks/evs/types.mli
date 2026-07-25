type nonrec allocation_id = string [@@ocaml.doc ""]

type nonrec tag_policy_exception = {
  message : Smaws_Lib.Smithy_api.Types.string_; [@ocaml.doc "Describes the error encountered\n"]
}
[@@ocaml.doc
  "  [TagPolicyException] is deprecated. See \
   {{:https://docs.aws.amazon.com/evs/latest/APIReference/API_ValidationException.html} \
   [ValidationException] } instead.\n\
  \ \n\
  \   The request doesn't comply with IAM tag policy. Correct your request and then retry it.\n\
  \   "]

type nonrec resource_not_found_exception = {
  message : Smaws_Lib.Smithy_api.Types.string_; [@ocaml.doc "Describes the error encountered.\n"]
  resource_id : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "The ID of the resource that could not be found.\n"]
  resource_type : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "The type of the resource that is associated with the error.\n"]
}
[@@ocaml.doc
  "A service resource associated with the request could not be found. The resource might not be \
   specified correctly, or it may have a [state] of [DELETED].\n"]

type nonrec untag_resource_response = unit [@@ocaml.doc ""]

type nonrec tag_key = string [@@ocaml.doc ""]

type nonrec tag_keys = tag_key list [@@ocaml.doc ""]

type nonrec arn = string [@@ocaml.doc ""]

type nonrec untag_resource_request = {
  resource_arn : arn;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the resource to delete tags from.\n"]
  tag_keys : tag_keys; [@ocaml.doc "The keys of the tags to delete.\n"]
}
[@@ocaml.doc ""]

type nonrec too_many_tags_exception = {
  message : Smaws_Lib.Smithy_api.Types.string_; [@ocaml.doc "Describes the error encountered.\n"]
}
[@@ocaml.doc
  "  [TooManyTagsException] is deprecated. See \
   {{:https://docs.aws.amazon.com/evs/latest/APIReference/API_ServiceQuotaExceededException.html} \
   [ServiceQuotaExceededException] } instead.\n\
  \ \n\
  \   A service resource associated with the request has more than 200 tags.\n\
  \   "]

type nonrec service_quota_exceeded_exception = {
  message : Smaws_Lib.Smithy_api.Types.string_; [@ocaml.doc "Describes the error encountered.\n"]
}
[@@ocaml.doc
  "The number of one or more Amazon EVS resources exceeds the maximum allowed. For a list of \
   Amazon EVS quotas, see \
   {{:https://docs.aws.amazon.com/evs/latest/userguide/service-quotas-evs.html}Amazon EVS \
   endpoints and quotas} in the {i Amazon EVS User Guide}. Delete some resources or request an \
   increase in your service quota. To request an increase, see \
   {{:https://docs.aws.amazon.com/general/latest/gr/aws_service_limits.html}Amazon Web Services \
   Service Quotas} in the {i Amazon Web Services General Reference Guide}. \n"]

type nonrec tag_resource_response = unit [@@ocaml.doc ""]

type nonrec tag_value = string [@@ocaml.doc ""]

type nonrec request_tag_map = (tag_key * tag_value) list [@@ocaml.doc ""]

type nonrec tag_resource_request = {
  resource_arn : arn;
      [@ocaml.doc "The Amazon Resource Name (ARN) of the resource to add tags to.\n"]
  tags : request_tag_map;
      [@ocaml.doc
        "Metadata that assists with categorization and organization. Each tag consists of a key \
         and an optional value. You define both. Tags don't propagate to any other environment or \
         Amazon Web Services resources.\n"]
}
[@@ocaml.doc ""]

type nonrec response_tag_map = (tag_key * tag_value) list [@@ocaml.doc ""]

type nonrec list_tags_for_resource_response = {
  tags : response_tag_map option; [@ocaml.doc "The tags for the resource.\n"]
}
[@@ocaml.doc ""]

type nonrec list_tags_for_resource_request = {
  resource_arn : arn;
      [@ocaml.doc "The Amazon Resource Name (ARN) that identifies the resource to list tags for.\n"]
}
[@@ocaml.doc ""]

type nonrec throttling_exception = {
  message : Smaws_Lib.Smithy_api.Types.string_; [@ocaml.doc "Describes the error encountered.\n"]
  retry_after_seconds : Smaws_Lib.Smithy_api.Types.integer option;
      [@ocaml.doc "The seconds to wait to retry.\n"]
}
[@@ocaml.doc
  "The operation could not be performed because the service is throttling requests. This exception \
   is thrown when the service endpoint receives too many concurrent requests.\n"]

type nonrec internal_server_exception = {
  message : Smaws_Lib.Smithy_api.Types.string_; [@ocaml.doc "Describes the error encountered.\n"]
}
[@@ocaml.doc "An internal server error occurred. Retry your request.\n"]

type nonrec esx_version_list = Smaws_Lib.Smithy_api.Types.string_ list [@@ocaml.doc ""]

type nonrec instance_type = I4I_METAL [@ocaml.doc ""] | I7I_METAL_24XL [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec instance_type_esx_versions_info = {
  instance_type : instance_type; [@ocaml.doc "The EC2 instance type.\n"]
  esx_versions : esx_version_list;
      [@ocaml.doc "The list of ESX versions offered for this instance type.\n"]
}
[@@ocaml.doc "Information about ESX versions offered for each EC2 instance type.\n"]

type nonrec instance_type_esx_versions_list = instance_type_esx_versions_info list [@@ocaml.doc ""]

type nonrec instance_type_list = instance_type list [@@ocaml.doc ""]

type nonrec vcf_version =
  | VCF_5_2_1 [@ocaml.doc ""]
  | VCF_5_2_2 [@ocaml.doc ""]
  | SELF_DEPLOYED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec vcf_version_info = {
  vcf_version : vcf_version; [@ocaml.doc "The VCF version number.\n"]
  status : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc
        "The status for this VCF version. Valid values are:\n\n\
        \ {ul\n\
        \       {-   [AVAILABLE] - This VCF version is available to you.\n\
        \           \n\
        \            }\n\
        \       {-   [RESTRICTED] - This VCF version has limited availability.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \     If the version you need shows RESTRICTED, and you require, check out \
         {{:https://docs.aws.amazon.com/evs/latest/userguide/versions-provided.html}VCF versions \
         and EC2 instance types provided by Amazon EVS} for more information. \n\
        \    \n\
        \     "]
  default_esx_version : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc
        "The default ESX version for this VCF version. It is based on Broadcom's Bill Of Materials \
         (BOM).\n"]
  instance_types : instance_type_list;
      [@ocaml.doc
        "EC2 instance types provided by Amazon EVS for this VCF version for creating environments.\n"]
}
[@@ocaml.doc
  "Information about a VCF versions provided by Amazon EVS, including its status, default ESX \
   version, and EC2 instance types.\n"]

type nonrec vcf_version_list = vcf_version_info list [@@ocaml.doc ""]

type nonrec get_versions_response = {
  vcf_versions : vcf_version_list;
      [@ocaml.doc
        "A list of VCF versions with their availability status, default ESX version, and instance \
         types.\n"]
  instance_type_esx_versions : instance_type_esx_versions_list;
      [@ocaml.doc "A list of EC2 instance types and their available ESX versions.\n"]
}
[@@ocaml.doc ""]

type nonrec get_versions_request = unit [@@ocaml.doc ""]

type nonrec appliance_fqdn = string [@@ocaml.doc ""]

type nonrec validation_exception_field = {
  name : Smaws_Lib.Smithy_api.Types.string_; [@ocaml.doc " The field name.\n"]
  message : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc " A message describing why the field failed validation.\n"]
}
[@@ocaml.doc
  "Stores information about a field passed inside a request that resulted in an exception.\n"]

type nonrec validation_exception_field_list = validation_exception_field list [@@ocaml.doc ""]

type nonrec validation_exception_reason =
  | UNKNOWN_OPERATION [@ocaml.doc ""]
  | CANNOT_PARSE [@ocaml.doc ""]
  | FIELD_VALIDATION_FAILED [@ocaml.doc ""]
  | OTHER [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec validation_exception = {
  message : Smaws_Lib.Smithy_api.Types.string_; [@ocaml.doc "Describes the error encountered.\n"]
  reason : validation_exception_reason; [@ocaml.doc "The reason for the exception.\n"]
  field_list : validation_exception_field_list option;
      [@ocaml.doc "A list of fields that didn't validate.\n"]
}
[@@ocaml.doc
  "The input fails to satisfy the specified constraints. You will see this exception if invalid \
   inputs are provided for any of the Amazon EVS environment operations, or if a list operation is \
   performed on an environment resource that is still initializing.\n"]

type nonrec network_acl_id = string [@@ocaml.doc ""]

type nonrec ip_address = string [@@ocaml.doc ""]

type nonrec association_id = string [@@ocaml.doc ""]

type nonrec eip_association = {
  association_id : association_id option;
      [@ocaml.doc "A unique ID for the elastic IP address association with the VLAN subnet.\n"]
  allocation_id : allocation_id option; [@ocaml.doc "The Elastic IP address allocation ID.\n"]
  ip_address : ip_address option; [@ocaml.doc "The Elastic IP address.\n"]
}
[@@ocaml.doc
  "An Elastic IP address association with the elastic network interface in the VLAN subnet.\n"]

type nonrec eip_association_list = eip_association list [@@ocaml.doc ""]

type nonrec state_details = string [@@ocaml.doc ""]

type nonrec vlan_state =
  | CREATING [@ocaml.doc ""]
  | CREATED [@ocaml.doc ""]
  | DELETING [@ocaml.doc ""]
  | DELETED [@ocaml.doc ""]
  | CREATE_FAILED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec subnet_id = string [@@ocaml.doc ""]

type nonrec cidr = string [@@ocaml.doc ""]

type nonrec vlan_id = int [@@ocaml.doc ""]

type nonrec vlan = {
  vlan_id : vlan_id option; [@ocaml.doc "The unique ID of the VLAN.\n"]
  cidr : cidr option;
      [@ocaml.doc
        "The CIDR block of the VLAN. Amazon EVS VLAN subnets have a minimum CIDR block size of /28 \
         and a maximum size of /24.\n"]
  availability_zone : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The availability zone of the VLAN.\n"]
  function_name : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "The VMware VCF traffic type that is carried over the VLAN. For example, a VLAN with a \
         [functionName] of [hcx] is being used to carry VMware HCX traffic.\n"]
  subnet_id : subnet_id option; [@ocaml.doc " The unique ID of the VLAN subnet.\n"]
  created_at : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc "The date and time that the VLAN was created.\n"]
  modified_at : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc " The date and time that the VLAN was modified.\n"]
  vlan_state : vlan_state option; [@ocaml.doc " The state of the VLAN.\n"]
  state_details : state_details option; [@ocaml.doc "The state details of the VLAN.\n"]
  eip_associations : eip_association_list option;
      [@ocaml.doc "An array of Elastic IP address associations.\n"]
  is_public : Smaws_Lib.Smithy_api.Types.boolean_ option;
      [@ocaml.doc "Determines if the VLAN that Amazon EVS provisions is public or private.\n"]
  network_acl_id : network_acl_id option;
      [@ocaml.doc "A unique ID for a network access control list.\n"]
}
[@@ocaml.doc "The VLANs that Amazon EVS creates during environment creation.\n"]

type nonrec associate_eip_to_vlan_response = { vlan : vlan option [@ocaml.doc ""] } [@@ocaml.doc ""]

type nonrec environment_id = string [@@ocaml.doc ""]

type nonrec client_token = string [@@ocaml.doc ""]

type nonrec associate_eip_to_vlan_request = {
  client_token : client_token option;
      [@ocaml.doc
        " This parameter is not used in Amazon EVS currently. If you supply input for this \
         parameter, it will have no effect.\n\
        \ \n\
        \   A unique, case-sensitive identifier that you provide to ensure the idempotency of the \
         environment creation request. If you do not specify a client token, a randomly generated \
         token is used for the request to ensure idempotency.\n\
        \   "]
  environment_id : environment_id;
      [@ocaml.doc
        "A unique ID for the environment containing the VLAN that the Elastic IP address \
         associates with.\n"]
  vlan_name : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "The name of the VLAN. [hcx] is the only accepted VLAN name at this time.\n"]
  allocation_id : allocation_id; [@ocaml.doc "The Elastic IP address allocation ID.\n"]
}
[@@ocaml.doc ""]

type nonrec check_result =
  | PASSED [@ocaml.doc ""]
  | FAILED [@ocaml.doc ""]
  | UNKNOWN [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec check_type =
  | KEY_REUSE [@ocaml.doc ""]
  | KEY_COVERAGE [@ocaml.doc ""]
  | REACHABILITY [@ocaml.doc ""]
  | HOST_COUNT [@ocaml.doc ""]
  | VCENTER_REACHABILITY [@ocaml.doc ""]
  | VCENTER_VM_SYNC [@ocaml.doc ""]
  | VCENTER_VM_EVENT [@ocaml.doc ""]
  | OPERATIONS_MANAGER_REACHABILITY [@ocaml.doc ""]
  | SDDC_MANAGER_REACHABILITY [@ocaml.doc ""]
  | SDDC_MANAGER_HOST_COUNT [@ocaml.doc ""]
  | SDDC_MANAGER_KEY_COVERAGE [@ocaml.doc ""]
  | SDDC_MANAGER_KEY_REUSE [@ocaml.doc ""]
  | CONNECTOR_HEALTH [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec check = {
  type_ : check_type option;
      [@ocaml.doc
        "The check type. Amazon EVS performs the following checks:\n\n\
        \ {ul\n\
        \       {-   [KEY_REUSE]: Verifies that the VCF license key is not used by another Amazon \
         EVS environment.\n\
        \           \n\
        \            }\n\
        \       {-   [KEY_COVERAGE]: Verifies that the VCF license key allocates sufficient vCPU \
         cores for all deployed hosts.\n\
        \           \n\
        \            }\n\
        \       {-   [REACHABILITY]: Verifies that the Amazon EVS control plane has a persistent \
         connection to SDDC Manager.\n\
        \           \n\
        \            }\n\
        \       {-   [HOST_COUNT]: Verifies that the environment meets the minimum host count.\n\
        \           \n\
        \            }\n\
        \       {-   [VCENTER_REACHABILITY]: Verifies vCenter Server reachability through the \
         vCenter connector.\n\
        \           \n\
        \            }\n\
        \       {-   [VCENTER_VM_SYNC]: Verifies that the vCenter connector can synchronize VM \
         inventory from vCenter Server.\n\
        \           \n\
        \            }\n\
        \       {-   [VCENTER_VM_EVENT]: Verifies that the vCenter connector can receive VM \
         lifecycle events from vCenter Server.\n\
        \           \n\
        \            }\n\
        \       {-   [OPERATIONS_MANAGER_REACHABILITY]: Verifies Operations Manager reachability \
         through the Operations Manager connector.\n\
        \           \n\
        \            }\n\
        \       {-   [SDDC_MANAGER_REACHABILITY]: Verifies SDDC Manager reachability through the \
         SDDC Manager connector.\n\
        \           \n\
        \            }\n\
        \       {-   [SDDC_MANAGER_HOST_COUNT]: Verifies that the host count reported by SDDC \
         Manager meets Amazon EVS minimum requirements.\n\
        \           \n\
        \            }\n\
        \       {-   [SDDC_MANAGER_KEY_COVERAGE]: Verifies that the VCF license key configured in \
         SDDC Manager covers all deployed hosts.\n\
        \           \n\
        \            }\n\
        \       {-   [SDDC_MANAGER_KEY_REUSE]: Verifies that the VCF license key configured in \
         SDDC Manager is not used by another Amazon EVS environment.\n\
        \           \n\
        \            }\n\
        \       {-   [CONNECTOR_HEALTH]: Aggregate health across all connectors in the environment.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  id : Smaws_Lib.Smithy_api.Types.string_ option; [@ocaml.doc "A unique ID for the check.\n"]
  result_ : check_result option; [@ocaml.doc " The check result.\n"]
  impaired_since : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc "The time when environment health began to be impaired.\n"]
}
[@@ocaml.doc
  "A check on the environment to identify environment health and validate VMware VCF licensing \
   compliance.\n"]

type nonrec checks_list = check list [@@ocaml.doc ""]

type nonrec route_server_peering = string [@@ocaml.doc ""]

type nonrec route_server_peering_list = route_server_peering list [@@ocaml.doc ""]

type nonrec connectivity_info = {
  private_route_server_peerings : route_server_peering_list;
      [@ocaml.doc "The unique IDs for private route server peers.\n"]
}
[@@ocaml.doc
  "The connectivity configuration for the environment. Amazon EVS requires that you specify two \
   route server peer IDs. During environment creation, the route server endpoints peer with the \
   NSX uplink VLAN for connectivity to the NSX overlay network.\n\n\
  \  Not supported when [vcfVersion] is [SELF_DEPLOYED].\n\
  \  \n\
  \   "]

type nonrec connector_check = {
  type_ : check_type option; [@ocaml.doc "The check type.\n"]
  result_ : check_result option; [@ocaml.doc "The check result.\n"]
  last_check_attempt : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc "The date and time of the last check attempt.\n"]
  impaired_since : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc "The time when connector health began to be impaired.\n"]
}
[@@ocaml.doc "A check on a connector to identify connectivity health.\n"]

type nonrec connectors_checks_list = connector_check list [@@ocaml.doc ""]

type nonrec connector_state =
  | CREATING [@ocaml.doc ""]
  | CREATE_FAILED [@ocaml.doc ""]
  | ACTIVE [@ocaml.doc ""]
  | UPDATING [@ocaml.doc ""]
  | UPDATE_FAILED [@ocaml.doc ""]
  | DELETING [@ocaml.doc ""]
  | DELETED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec secret_identifier = string [@@ocaml.doc ""]

type nonrec connector_type =
  | OPERATIONS_MANAGER [@ocaml.doc ""]
  | SDDC_MANAGER [@ocaml.doc ""]
  | VCENTER [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec connector_id = string [@@ocaml.doc ""]

type nonrec connector = {
  environment_id : environment_id option;
      [@ocaml.doc "The unique ID of the environment that the connector belongs to.\n"]
  connector_id : connector_id option; [@ocaml.doc "The unique ID of the connector.\n"]
  type_ : connector_type option; [@ocaml.doc "The type of the connector.\n"]
  appliance_fqdn : appliance_fqdn option;
      [@ocaml.doc
        "The fully qualified domain name (FQDN) of the VCF appliance that the connector connects to.\n"]
  secret_arn : secret_identifier option;
      [@ocaml.doc
        "The Amazon Resource Name (ARN) of the Amazon Web Services Secrets Manager secret that \
         stores the credentials for the VCF appliance.\n"]
  state : connector_state option; [@ocaml.doc "The state of the connector.\n"]
  state_details : state_details option;
      [@ocaml.doc "A detailed description of the connector state.\n"]
  status : check_result option; [@ocaml.doc "The status of the connector.\n"]
  checks : connectors_checks_list option;
      [@ocaml.doc "A list of checks that are run on the connector.\n"]
  created_at : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc "The date and time that the connector was created.\n"]
  modified_at : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc "The date and time that the connector was modified.\n"]
}
[@@ocaml.doc
  "An object that represents a connector for an Amazon EVS environment. A connector establishes a \
   connection to the given appliance type using the credentials stored in Amazon Web Services \
   Secrets Manager.\n"]

type nonrec connector_list = connector list [@@ocaml.doc ""]

type nonrec error_detail = {
  error_code : Smaws_Lib.Smithy_api.Types.string_; [@ocaml.doc "The error code.\n"]
  error_message : Smaws_Lib.Smithy_api.Types.string_; [@ocaml.doc "The error message.\n"]
}
[@@ocaml.doc "An object that contains error details for an entitlement.\n"]

type nonrec entitlement_status =
  | CREATING [@ocaml.doc ""]
  | CREATED [@ocaml.doc ""]
  | DELETED [@ocaml.doc ""]
  | AT_RISK [@ocaml.doc ""]
  | ENTITLEMENT_REMOVED [@ocaml.doc ""]
  | CREATE_FAILED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec entitlement_type = WINDOWS_SERVER [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec vm_name = string [@@ocaml.doc ""]

type nonrec vm_id = string [@@ocaml.doc ""]

type nonrec vm_entitlement = {
  vm_id : vm_id option; [@ocaml.doc "The unique ID of the virtual machine.\n"]
  environment_id : environment_id option; [@ocaml.doc "The unique ID of the environment.\n"]
  connector_id : connector_id option;
      [@ocaml.doc "The unique ID of the connector associated with the entitlement.\n"]
  vm_name : vm_name option; [@ocaml.doc "The name of the virtual machine.\n"]
  type_ : entitlement_type option; [@ocaml.doc "The type of entitlement.\n"]
  status : entitlement_status option; [@ocaml.doc "The status of the entitlement.\n"]
  last_synced_at : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc "The date and time that the entitlement was last synced.\n"]
  started_at : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc "The date and time that the entitlement started.\n"]
  stopped_at : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc "The date and time that the entitlement stopped.\n"]
  error_detail : error_detail option;
      [@ocaml.doc "The error details associated with the entitlement, if applicable.\n"]
}
[@@ocaml.doc
  "An object that represents a Windows Server License entitlement for a virtual machine in an \
   Amazon EVS environment.\n"]

type nonrec vm_entitlement_list = vm_entitlement list [@@ocaml.doc ""]

type nonrec create_entitlement_response = {
  entitlements : vm_entitlement_list option; [@ocaml.doc "A list of the created entitlements.\n"]
}
[@@ocaml.doc ""]

type nonrec vm_id_list = vm_id list [@@ocaml.doc ""]

type nonrec create_entitlement_request = {
  client_token : client_token option;
      [@ocaml.doc
        " This parameter is not used in Amazon EVS currently. If you supply input for this \
         parameter, it will have no effect.\n\
        \ \n\
        \   A unique, case-sensitive identifier that you provide to ensure the idempotency of the \
         entitlement creation request. If you do not specify a client token, a randomly generated \
         token is used for the request to ensure idempotency.\n\
        \   "]
  environment_id : environment_id;
      [@ocaml.doc "A unique ID for the environment to create the entitlement in.\n"]
  connector_id : connector_id;
      [@ocaml.doc "A unique ID for the connector associated with the entitlement.\n"]
  entitlement_type : entitlement_type; [@ocaml.doc "The type of entitlement to create.\n"]
  vm_ids : vm_id_list;
      [@ocaml.doc
        "The list of VMware vSphere virtual machine managed object IDs to create entitlements for.\n"]
}
[@@ocaml.doc ""]

type nonrec secret = {
  secret_arn : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc " The Amazon Resource Name (ARN) of the secret.\n"]
}
[@@ocaml.doc
  "A managed secret that contains the credentials for installing vCenter Server, NSX, and SDDC \
   Manager. During environment creation, the Amazon EVS control plane uses Amazon Web Services \
   Secrets Manager to create, encrypt, validate, and store secrets. If you choose to delete your \
   environment, Amazon EVS also deletes the secrets that are associated with your environment. \
   Amazon EVS does not provide managed rotation of secrets. We recommend that you rotate secrets \
   regularly to ensure that secrets are not long-lived.\n"]

type nonrec secret_list = secret list [@@ocaml.doc ""]

type nonrec security_group_id = string [@@ocaml.doc ""]

type nonrec security_groups = security_group_id list [@@ocaml.doc ""]

type nonrec service_access_security_groups = {
  security_groups : security_groups option;
      [@ocaml.doc "The security groups that allow service access.\n"]
}
[@@ocaml.doc
  "The security groups that allow traffic between the Amazon EVS control plane and your VPC for \
   Amazon EVS service access. If a security group is not specified, Amazon EVS uses the default \
   security group in your account for service access.\n"]

type nonrec host_name = string [@@ocaml.doc ""]

type nonrec vcf_hostnames = {
  v_center : host_name; [@ocaml.doc "The VMware vCenter hostname.\n"]
  nsx : host_name; [@ocaml.doc "The VMware NSX Virtual IP (VIP) hostname.\n"]
  nsx_manager1 : host_name;
      [@ocaml.doc "The hostname for the first VMware NSX Manager virtual machine (VM).\n"]
  nsx_manager2 : host_name;
      [@ocaml.doc "The hostname for the second VMware NSX Manager virtual machine (VM).\n"]
  nsx_manager3 : host_name;
      [@ocaml.doc "The hostname for the third VMware NSX Manager virtual machine (VM).\n"]
  nsx_edge1 : host_name; [@ocaml.doc "The hostname for the first NSX Edge node.\n"]
  nsx_edge2 : host_name; [@ocaml.doc "The hostname for the second NSX Edge node.\n"]
  sddc_manager : host_name; [@ocaml.doc "The hostname for SDDC Manager.\n"]
  cloud_builder : host_name; [@ocaml.doc "The hostname for VMware Cloud Builder.\n"]
}
[@@ocaml.doc
  "The DNS hostnames that Amazon EVS uses to install VMware vCenter Server, NSX, SDDC Manager, and \
   Cloud Builder. Each hostname must be unique, and resolve to a domain name that you've \
   registered in your DNS service of choice. Hostnames cannot be changed.\n\n\
  \ VMware VCF requires the deployment of two NSX Edge nodes, and three NSX Manager virtual \
   machines.\n\
  \ \n\
  \   Not supported when [vcfVersion] is [SELF_DEPLOYED].\n\
  \   \n\
  \    "]

type nonrec v_san_license_key = string [@@ocaml.doc ""]

type nonrec solution_key = string [@@ocaml.doc ""]

type nonrec license_info = {
  solution_key : solution_key;
      [@ocaml.doc
        " The VCF solution key. This license unlocks VMware VCF product features, including \
         vSphere, NSX, SDDC Manager, and vCenter Server. The VCF solution key must meet the \
         instance-type-specific minimum core requirements.\n"]
  vsan_key : v_san_license_key;
      [@ocaml.doc
        " The VSAN license key. This license unlocks vSAN features. The vSAN license key must meet \
         the instance-type-specific minimum capacity requirements.\n"]
}
[@@ocaml.doc
  " The license information that Amazon EVS requires to create an environment. Amazon EVS requires \
   two license keys: a VCF solution key and a vSAN license key.\n"]

type nonrec license_info_list = license_info list [@@ocaml.doc ""]

type nonrec vpc_id = string [@@ocaml.doc ""]

type nonrec environment_name = string [@@ocaml.doc ""]

type nonrec environment_state =
  | CREATING [@ocaml.doc ""]
  | CREATED [@ocaml.doc ""]
  | DELETING [@ocaml.doc ""]
  | DELETED [@ocaml.doc ""]
  | CREATE_FAILED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec environment = {
  environment_id : environment_id option; [@ocaml.doc "The unique ID for the environment.\n"]
  environment_state : environment_state option; [@ocaml.doc "The state of an environment.\n"]
  state_details : state_details option;
      [@ocaml.doc "A detailed description of the [environmentState] of an environment.\n"]
  created_at : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc "The date and time that the environment was created.\n"]
  modified_at : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc " The date and time that the environment was modified.\n"]
  environment_arn : arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) that is associated with the environment.\n"]
  environment_name : environment_name option; [@ocaml.doc "The name of the environment.\n"]
  vpc_id : vpc_id option; [@ocaml.doc "The VPC associated with the environment.\n"]
  service_access_subnet_id : subnet_id option;
      [@ocaml.doc
        " The subnet that is used to establish connectivity between the Amazon EVS control plane \
         and VPC. Amazon EVS uses this subnet to perform validations and create the environment.\n"]
  vcf_version : vcf_version option; [@ocaml.doc "The VCF version of the environment.\n"]
  terms_accepted : Smaws_Lib.Smithy_api.Types.boolean_ option;
      [@ocaml.doc
        "Customer confirmation that the customer has purchased and will continue to maintain the \
         required number of VCF software licenses to cover all physical processor cores in the \
         Amazon EVS environment. Information about your VCF software in Amazon EVS will be shared \
         with Broadcom to verify license compliance. Amazon EVS does not validate license keys. To \
         validate license keys, visit the Broadcom support portal. \n"]
  license_info : license_info_list option;
      [@ocaml.doc
        " The license information that Amazon EVS requires to create an environment. Amazon EVS \
         requires two license keys: a VCF solution key and a vSAN license key. The VCF solution \
         key must meet minimum core requirements, and the vSAN license key must meet minimum \
         capacity requirements for your selected instance type.\n\n\
        \ For information about minimum license requirements, see \
         {{:https://docs.aws.amazon.com/evs/latest/userguide/vcf-license-mgmt.html}the VCF \
         subscriptions section} in the {i Amazon EVS User Guide}.\n\
        \ "]
  site_id : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "The Broadcom Site ID that is associated with your Amazon EVS environment. Amazon EVS uses \
         the Broadcom Site ID that you provide to meet Broadcom VCF license usage reporting \
         requirements for Amazon EVS.\n"]
  environment_status : check_result option;
      [@ocaml.doc
        "Reports impaired functionality that stems from issues internal to the environment, such \
         as impaired reachability.\n"]
  checks : checks_list option;
      [@ocaml.doc "A check on the environment to identify connector health.\n"]
  connectivity_info : connectivity_info option;
      [@ocaml.doc
        "The connectivity configuration for the environment. Amazon EVS requires that you specify \
         two route server peer IDs. During environment creation, the route server endpoints peer \
         with the NSX uplink VLAN for connectivity to the NSX overlay network.\n"]
  vcf_hostnames : vcf_hostnames option;
      [@ocaml.doc
        "The DNS hostnames to be used by the VCF management appliances in your environment.\n\n\
        \ For environment creation to be successful, each hostname entry must resolve to a domain \
         name that you've registered in your DNS service of choice and configured in the DHCP \
         option set of your VPC. DNS hostnames cannot be changed after environment creation has \
         started.\n\
        \ "]
  kms_key_id : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "The Amazon Web Services KMS key ID that Amazon Web Services Secrets Manager uses to \
         encrypt secrets that are associated with the environment. These secrets contain the VCF \
         credentials that are needed to install vCenter Server, NSX, and SDDC Manager.\n\n\
        \ By default, Amazon EVS use the Amazon Web Services Secrets Manager managed key \
         [aws/secretsmanager]. You can also specify a customer managed key.\n\
        \ "]
  service_access_security_groups : service_access_security_groups option;
      [@ocaml.doc
        "The security groups that allow traffic between the Amazon EVS control plane and your VPC \
         for service access. If a security group is not specified, Amazon EVS uses the default \
         security group in your account for service access.\n"]
  credentials : secret_list option;
      [@ocaml.doc
        "The VCF credentials that are stored as Amazon EVS managed secrets in Amazon Web Services \
         Secrets Manager.\n\n\
        \ Amazon EVS stores credentials that are needed to install vCenter Server, NSX, and SDDC \
         Manager.\n\
        \ "]
}
[@@ocaml.doc "An object that represents an Amazon EVS environment.\n"]

type nonrec create_environment_response = {
  environment : environment option; [@ocaml.doc "A description of the created environment.\n"]
}
[@@ocaml.doc ""]

type nonrec dedicated_host_id = string [@@ocaml.doc ""]

type nonrec placement_group_id = string [@@ocaml.doc ""]

type nonrec key_name = string [@@ocaml.doc ""]

type nonrec host_info_for_create = {
  host_name : host_name;
      [@ocaml.doc
        "The DNS hostname of the host. DNS hostnames for hosts must be unique across Amazon EVS \
         environments and within VCF.\n"]
  key_name : key_name; [@ocaml.doc "The name of the SSH key that is used to access the host.\n"]
  instance_type : instance_type; [@ocaml.doc "The EC2 instance type that represents the host.\n"]
  placement_group_id : placement_group_id option;
      [@ocaml.doc "The unique ID of the placement group where the host is placed.\n"]
  dedicated_host_id : dedicated_host_id option;
      [@ocaml.doc "The unique ID of the Amazon EC2 Dedicated Host.\n"]
}
[@@ocaml.doc
  "An object that represents a host.\n\n\
  \  You cannot use [dedicatedHostId] and [placementGroupId] together in the same \
   [HostInfoForCreate]object. This results in a [ValidationException] response.\n\
  \  \n\
  \   "]

type nonrec host_info_for_create_list = host_info_for_create list [@@ocaml.doc ""]

type nonrec initial_vlan_info = {
  cidr : cidr;
      [@ocaml.doc
        " The CIDR block that you provide to create an Amazon EVS VLAN subnet. Amazon EVS VLAN \
         subnets have a minimum CIDR block size of /28 and a maximum size of /24. Amazon EVS VLAN \
         subnet CIDR blocks must not overlap with other subnets in the VPC.\n"]
}
[@@ocaml.doc
  "An object that represents an initial VLAN subnet for the Amazon EVS environment. Amazon EVS \
   creates initial VLAN subnets when you first create the environment. Amazon EVS creates the \
   following 10 VLAN subnets: host management VLAN, vMotion VLAN, vSAN VLAN, VTEP VLAN, Edge VTEP \
   VLAN, Management VM VLAN, HCX uplink VLAN, NSX uplink VLAN, expansion VLAN 1, expansion VLAN \
   2.\n\n\
  \  For each Amazon EVS VLAN subnet, you must specify a non-overlapping CIDR block. Amazon EVS \
   VLAN subnets have a minimum CIDR block size of /28 and a maximum size of /24.\n\
  \  \n\
  \   "]

type nonrec initial_vlans = {
  vmk_management : initial_vlan_info;
      [@ocaml.doc
        " The host VMkernel management VLAN subnet. This VLAN subnet carries traffic for managing \
         ESX hosts and communicating with VMware vCenter Server.\n"]
  vm_management : initial_vlan_info;
      [@ocaml.doc
        "The VM management VLAN subnet. This VLAN subnet carries traffic for vSphere virtual \
         machines.\n"]
  v_motion : initial_vlan_info;
      [@ocaml.doc
        " The vMotion VLAN subnet. This VLAN subnet carries traffic for vSphere vMotion.\n"]
  v_san : initial_vlan_info;
      [@ocaml.doc
        " The vSAN VLAN subnet. This VLAN subnet carries the communication between ESX hosts to \
         implement a vSAN shared storage pool.\n"]
  v_tep : initial_vlan_info;
      [@ocaml.doc
        " The VTEP VLAN subnet. This VLAN subnet handles internal network traffic between virtual \
         machines within a VCF instance.\n"]
  edge_v_tep : initial_vlan_info;
      [@ocaml.doc
        "The edge VTEP VLAN subnet. This VLAN subnet manages traffic flowing between the internal \
         network and external networks, including internet access and other site connections.\n"]
  nsx_uplink : initial_vlan_info;
      [@ocaml.doc
        " The NSX uplink VLAN subnet. This VLAN subnet allows connectivity to the NSX overlay \
         network.\n"]
  hcx : initial_vlan_info;
      [@ocaml.doc
        "The HCX VLAN subnet. This VLAN subnet allows the HCX Interconnnect (IX) and HCX Network \
         Extension (NE) to reach their peers and enable HCX Service Mesh creation.\n\n\
        \ If you plan to use a public HCX VLAN subnet, the following requirements must be met:\n\
        \ \n\
        \  {ul\n\
        \        {-  Must have a /28 netmask and be allocated from the IPAM public pool. Required \
         for HCX internet access configuration.\n\
        \            \n\
        \             }\n\
        \        {-  The HCX public VLAN CIDR block must be added to the VPC as a secondary CIDR \
         block.\n\
        \            \n\
        \             }\n\
        \        {-  Must have at least two Elastic IP addresses to be allocated from the public \
         IPAM pool for HCX components.\n\
        \            \n\
        \             }\n\
        \        }\n\
        \  "]
  expansion_vlan1 : initial_vlan_info;
      [@ocaml.doc
        "An additional VLAN subnet that can be used to extend VCF capabilities once configured. \
         For example, you can configure an expansion VLAN subnet to use NSX Federation for \
         centralized management and synchronization of multiple NSX deployments across different \
         locations.\n"]
  expansion_vlan2 : initial_vlan_info;
      [@ocaml.doc
        "An additional VLAN subnet that can be used to extend VCF capabilities once configured. \
         For example, you can configure an expansion VLAN subnet to use NSX Federation for \
         centralized management and synchronization of multiple NSX deployments across different \
         locations.\n"]
  is_hcx_public : Smaws_Lib.Smithy_api.Types.boolean_ option;
      [@ocaml.doc "Determines if the HCX VLAN that Amazon EVS provisions is public or private.\n"]
  hcx_network_acl_id : network_acl_id option;
      [@ocaml.doc
        "A unique ID for a network access control list that the HCX VLAN uses. Required when \
         [isHcxPublic] is set to [true].\n"]
}
[@@ocaml.doc
  "The initial VLAN subnets for the environment. Amazon EVS VLAN subnets have a minimum CIDR block \
   size of /28 and a maximum size of /24. Amazon EVS VLAN subnet CIDR blocks must not overlap with \
   other subnets in the VPC.\n"]

type nonrec create_environment_request = {
  client_token : client_token option;
      [@ocaml.doc
        " This parameter is not used in Amazon EVS currently. If you supply input for this \
         parameter, it will have no effect.\n\
        \ \n\
        \   A unique, case-sensitive identifier that you provide to ensure the idempotency of the \
         environment creation request. If you do not specify a client token, a randomly generated \
         token is used for the request to ensure idempotency.\n\
        \   "]
  environment_name : environment_name option;
      [@ocaml.doc
        "The name to give to your environment. The name can contain only alphanumeric characters \
         (case-sensitive), hyphens, and underscores. It must start with an alphanumeric character, \
         and can't be longer than 100 characters. The name must be unique within the Amazon Web \
         Services Region and Amazon Web Services account that you're creating the environment in.\n"]
  kms_key_id : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "A unique ID for the customer-managed KMS key that is used to encrypt the VCF credential \
         pairs for SDDC Manager, NSX Manager, and vCenter appliances. These credentials are stored \
         in Amazon Web Services Secrets Manager.\n"]
  tags : request_tag_map option;
      [@ocaml.doc
        "Metadata that assists with categorization and organization. Each tag consists of a key \
         and an optional value. You define both. Tags don't propagate to any other cluster or \
         Amazon Web Services resources.\n"]
  service_access_security_groups : service_access_security_groups option;
      [@ocaml.doc
        "The security group that controls communication between the Amazon EVS control plane and \
         VPC. The default security group is used if a custom security group isn't specified.\n\n\
        \ The security group should allow access to the following.\n\
        \ \n\
        \  {ul\n\
        \        {-  TCP/UDP access to the DNS servers\n\
        \            \n\
        \             }\n\
        \        {-  HTTPS/SSH access to the host management VLAN subnet\n\
        \            \n\
        \             }\n\
        \        {-  HTTPS/SSH access to the Management VM VLAN subnet\n\
        \            \n\
        \             }\n\
        \        }\n\
        \   You should avoid modifying the security group rules after deployment, as this can \
         break the persistent connection between the Amazon EVS control plane and VPC. This can \
         cause future environment actions like adding or removing hosts to fail.\n\
        \   "]
  vpc_id : vpc_id;
      [@ocaml.doc
        "A unique ID for the VPC that the environment is deployed inside.\n\n\
        \ Amazon EVS requires that all VPC subnets exist in a single Availability Zone in a Region \
         where the service is available.\n\
        \ \n\
        \  The VPC that you specify must have a valid DHCP option set with domain name, at least \
         two DNS servers, and an NTP server. These settings are used to configure your VCF \
         appliances and hosts. The VPC cannot be used with any other deployed Amazon EVS \
         environment. Amazon EVS does not provide multi-VPC support for environments at this time.\n\
        \  \n\
        \   Amazon EVS does not support the following Amazon Web Services networking options for \
         NSX overlay connectivity: cross-Region VPC peering, Amazon S3 gateway endpoints, or \
         Amazon Web Services Direct Connect virtual private gateway associations.\n\
        \   \n\
        \     Ensure that you specify a VPC that is adequately sized to accommodate the Amazon EVS \
         subnets.\n\
        \     \n\
        \      "]
  service_access_subnet_id : subnet_id;
      [@ocaml.doc
        "The subnet that is used to establish connectivity between the Amazon EVS control plane \
         and VPC. The Amazon EVS control plane uses this subnet to interface with your \
         environment. This includes validating DNS records and enabling Amazon EVS Connectors.\n"]
  vcf_version : vcf_version;
      [@ocaml.doc
        "The VCF version to use for the environment.\n\n\
        \ {ul\n\
        \       {-   [SELF_DEPLOYED]: You install VCF yourself. The [licenseInfo], [hosts], \
         [vcfHostnames], [siteId], and [connectivityInfo] parameters are not supported.\n\
        \           \n\
        \            }\n\
        \       {-  Any other valid value: Amazon EVS installs and configures VCF for you in the \
         version you specify.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  terms_accepted : Smaws_Lib.Smithy_api.Types.boolean_;
      [@ocaml.doc
        "Confirmation that the customer has purchased and will continue to maintain the required \
         number of VCF software licenses to cover all physical processor cores in the Amazon EVS \
         environment. Information about your VCF software in Amazon EVS will be shared with \
         Broadcom to verify license compliance. Amazon EVS does not validate license keys. To \
         validate license keys, visit the Broadcom support portal.\n"]
  initial_vlans : initial_vlans;
      [@ocaml.doc
        "The initial VLAN subnets for the Amazon EVS environment.\n\n\
        \  For each Amazon EVS VLAN subnet, you must specify a non-overlapping CIDR block. Amazon \
         EVS VLAN subnets have a minimum CIDR block size of /28 and a maximum size of /24.\n\
        \  \n\
        \   "]
  connectivity_info : connectivity_info option;
      [@ocaml.doc
        "The connectivity configuration for the environment. Amazon EVS requires that you specify \
         two route server peer IDs. During environment creation, the route server endpoints peer \
         with the NSX edges over the NSX uplink subnet, providing BGP-based dynamic routing for \
         overlay networks.\n\n\
        \  Not supported when [vcfVersion] is [SELF_DEPLOYED].\n\
        \  \n\
        \   "]
  license_info : license_info_list option;
      [@ocaml.doc
        "The license information that Amazon EVS requires to create an environment. Amazon EVS \
         requires two license keys: a VCF solution key and a vSAN license key. The VCF solution \
         key must meet minimum core requirements, and the vSAN license key must meet minimum \
         capacity requirements for your selected instance type.\n\n\
        \ For information about minimum license requirements, see \
         {{:https://docs.aws.amazon.com/evs/latest/userguide/vcf-license-mgmt.html}the VCF \
         subscriptions section} in the {i Amazon EVS User Guide}.\n\
        \ \n\
        \  VCF licenses can be used for only one Amazon EVS environment. Amazon EVS does not \
         support reuse of VCF licenses for multiple environments.\n\
        \  \n\
        \   VCF license information can be retrieved from the Broadcom portal.\n\
        \   \n\
        \     Not supported when [vcfVersion] is [SELF_DEPLOYED].\n\
        \     \n\
        \      "]
  hosts : host_info_for_create_list option;
      [@ocaml.doc
        "The ESX hosts to add to the environment. For each host, provide the desired hostname, EC2 \
         SSH keypair name, and EC2 instance type. Optionally, provide a partition or cluster \
         placement group, or use Amazon EC2 Dedicated Hosts.\n\n\
        \  Not supported when [vcfVersion] is [SELF_DEPLOYED]. In that case, you can add hosts \
         using [CreateEnvironmentHost] after the environment is created.\n\
        \  \n\
        \   "]
  vcf_hostnames : vcf_hostnames option;
      [@ocaml.doc
        "The DNS hostnames for the virtual machines that host the VCF management appliances. \
         Provide hostnames for vCenter, NSX Manager, SDDC Manager, and Cloud Builder.\n\n\
        \  Not supported when [vcfVersion] is [SELF_DEPLOYED].\n\
        \  \n\
        \   "]
  site_id : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc
        "The Broadcom Site ID that is allocated to you as part of your electronic software \
         delivery. This ID allows customer access to the Broadcom portal, and is provided to you \
         by Broadcom at the close of your software contract or contract renewal. Amazon EVS uses \
         the Broadcom Site ID that you provide to meet Broadcom VCF license usage reporting \
         requirements for Amazon EVS.\n\n\
        \  Not supported when [vcfVersion] is [SELF_DEPLOYED].\n\
        \  \n\
        \   "]
}
[@@ocaml.doc ""]

type nonrec create_environment_connector_response = {
  connector : connector option; [@ocaml.doc "A description of the created connector.\n"]
}
[@@ocaml.doc ""]

type nonrec create_environment_connector_request = {
  client_token : client_token option;
      [@ocaml.doc
        " This parameter is not used in Amazon EVS currently. If you supply input for this \
         parameter, it will have no effect.\n\
        \ \n\
        \   A unique, case-sensitive identifier that you provide to ensure the idempotency of the \
         connector creation request. If you do not specify a client token, a randomly generated \
         token is used for the request to ensure idempotency.\n\
        \   "]
  environment_id : environment_id;
      [@ocaml.doc "A unique ID for the environment to create the connector in.\n"]
  type_ : connector_type;
      [@ocaml.doc
        "The type of connector to create.\n\n\
        \ {ul\n\
        \       {-   [OPERATIONS_MANAGER]: Connector to an Operations Manager appliance. Required \
         for VCF 9x environments.\n\
        \           \n\
        \            }\n\
        \       {-   [SDDC_MANAGER]: Connector to an SDDC Manager appliance. Required for VCF 5.x \
         environments.\n\
        \           \n\
        \            }\n\
        \       {-   [VCENTER]: Connector to a vCenter Server appliance. Required for features \
         that depend on vCenter, such as Windows Server license-included.\n\
        \           \n\
        \            }\n\
        \       }\n\
        \  "]
  appliance_fqdn : appliance_fqdn;
      [@ocaml.doc
        "The fully qualified domain name (FQDN) of the VCF appliance that the connector targets.\n"]
  secret_identifier : secret_identifier;
      [@ocaml.doc
        "The ARN or name of the Amazon Web Services Secrets Manager secret that stores the \
         credentials for the VCF appliance. [SDDC_MANAGER] requires an [apiKey] field; \
         [OPERATIONS_MANAGER] and [VCENTER] require [username] and [password] fields.\n\n\
        \  Do not use credentials with Administrator privileges. We recommend using a service \
         account with read-only permissions.\n\
        \  \n\
        \   "]
}
[@@ocaml.doc ""]

type nonrec network_interface_id = string [@@ocaml.doc ""]

type nonrec network_interface = {
  network_interface_id : network_interface_id option;
      [@ocaml.doc "The unique ID of the elastic network interface.\n"]
}
[@@ocaml.doc
  "An elastic network interface (ENI) that connects hosts to the VLAN subnets. Amazon EVS \
   provisions two identically configured ENIs in the VMkernel management subnet during host \
   creation. One ENI is active, and the other is in standby mode for automatic switchover during a \
   failure scenario.\n"]

type nonrec network_interface_list = network_interface list [@@ocaml.doc ""]

type nonrec host_state =
  | CREATING [@ocaml.doc ""]
  | CREATED [@ocaml.doc ""]
  | UPDATING [@ocaml.doc ""]
  | DELETING [@ocaml.doc ""]
  | DELETED [@ocaml.doc ""]
  | CREATE_FAILED [@ocaml.doc ""]
  | UPDATE_FAILED [@ocaml.doc ""]
[@@ocaml.doc ""]

type nonrec host = {
  host_name : host_name option;
      [@ocaml.doc
        "The DNS hostname of the host. DNS hostnames for hosts must be unique across Amazon EVS \
         environments and within VCF.\n"]
  ip_address : ip_address option; [@ocaml.doc "The IP address of the host.\n"]
  key_name : key_name option;
      [@ocaml.doc "The name of the SSH key that is used to access the host.\n"]
  instance_type : instance_type option;
      [@ocaml.doc
        "The EC2 instance type of the host.\n\n\
        \  EC2 instances created through Amazon EVS do not support associating an IAM instance \
         profile.\n\
        \  \n\
        \   "]
  placement_group_id : placement_group_id option;
      [@ocaml.doc "The unique ID of the placement group where the host is placed.\n"]
  dedicated_host_id : dedicated_host_id option;
      [@ocaml.doc "The unique ID of the Amazon EC2 Dedicated Host.\n"]
  created_at : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc " The date and time that the host was created.\n"]
  modified_at : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc " The date and time that the host was modified.\n"]
  host_state : host_state option; [@ocaml.doc " The state of the host.\n"]
  state_details : state_details option;
      [@ocaml.doc " A detailed description of the [hostState] of a host.\n"]
  ec2_instance_id : Smaws_Lib.Smithy_api.Types.string_ option;
      [@ocaml.doc "The unique ID of the EC2 instance that represents the host.\n"]
  network_interfaces : network_interface_list option;
      [@ocaml.doc "The elastic network interfaces that are attached to the host.\n"]
}
[@@ocaml.doc "An ESX host that runs on an Amazon EC2 bare metal instance.\n"]

type nonrec environment_summary = {
  environment_id : environment_id option; [@ocaml.doc "A unique ID for the environment.\n"]
  environment_name : environment_name option; [@ocaml.doc " The name of the environment.\n"]
  vcf_version : vcf_version option; [@ocaml.doc "The VCF version of the environment.\n"]
  environment_status : check_result option;
      [@ocaml.doc
        "Reports impaired functionality that stems from issues internal to the environment, such \
         as impaired reachability.\n"]
  environment_state : environment_state option; [@ocaml.doc "The state of an environment.\n"]
  created_at : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc " The date and time that the environment was created.\n"]
  modified_at : Smaws_Lib.Smithy_api.Types.timestamp option;
      [@ocaml.doc " The date and time that the environment was modified.\n"]
  environment_arn : arn option;
      [@ocaml.doc "The Amazon Resource Name (ARN) that is associated with the environment.\n"]
}
[@@ocaml.doc "A list of environments with summarized environment details.\n"]

type nonrec create_environment_host_response = {
  environment_summary : environment_summary option;
      [@ocaml.doc "A summary of the environment that the host is created in.\n"]
  host : host option; [@ocaml.doc "A description of the created host.\n"]
}
[@@ocaml.doc ""]

type nonrec esx_version = string [@@ocaml.doc ""]

type nonrec create_environment_host_request = {
  client_token : client_token option;
      [@ocaml.doc
        " This parameter is not used in Amazon EVS currently. If you supply input for this \
         parameter, it will have no effect.\n\
        \ \n\
        \   A unique, case-sensitive identifier that you provide to ensure the idempotency of the \
         host creation request. If you do not specify a client token, a randomly generated token \
         is used for the request to ensure idempotency.\n\
        \   "]
  environment_id : environment_id;
      [@ocaml.doc "A unique ID for the environment that the host is added to.\n"]
  host : host_info_for_create;
      [@ocaml.doc "The host that is created and added to the environment.\n"]
  esx_version : esx_version option; [@ocaml.doc "The ESX version to use for the host.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_entitlement_response = {
  entitlements : vm_entitlement_list option; [@ocaml.doc "A list of the deleted entitlements.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_entitlement_request = {
  client_token : client_token option;
      [@ocaml.doc
        " This parameter is not used in Amazon EVS currently. If you supply input for this \
         parameter, it will have no effect.\n\
        \ \n\
        \   A unique, case-sensitive identifier that you provide to ensure the idempotency of the \
         entitlement deletion request. If you do not specify a client token, a randomly generated \
         token is used for the request to ensure idempotency.\n\
        \   "]
  environment_id : environment_id;
      [@ocaml.doc "A unique ID for the environment that the entitlement belongs to.\n"]
  connector_id : connector_id;
      [@ocaml.doc "A unique ID for the connector associated with the entitlement.\n"]
  entitlement_type : entitlement_type; [@ocaml.doc "The type of entitlement to delete.\n"]
  vm_ids : vm_id_list;
      [@ocaml.doc
        "The list of VMware vSphere virtual machine managed object IDs to delete entitlements for.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_environment_response = {
  environment : environment option; [@ocaml.doc "A description of the deleted environment.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_environment_request = {
  client_token : client_token option;
      [@ocaml.doc
        " This parameter is not used in Amazon EVS currently. If you supply input for this \
         parameter, it will have no effect.\n\
        \ \n\
        \   A unique, case-sensitive identifier that you provide to ensure the idempotency of the \
         environment deletion request. If you do not specify a client token, a randomly generated \
         token is used for the request to ensure idempotency.\n\
        \   "]
  environment_id : environment_id;
      [@ocaml.doc "A unique ID associated with the environment to be deleted.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_environment_connector_response = {
  connector : connector option; [@ocaml.doc "A description of the deleted connector.\n"]
  environment_summary : environment_summary option;
      [@ocaml.doc "A summary of the environment that the connector was deleted from.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_environment_connector_request = {
  client_token : client_token option;
      [@ocaml.doc
        " This parameter is not used in Amazon EVS currently. If you supply input for this \
         parameter, it will have no effect.\n\
        \ \n\
        \   A unique, case-sensitive identifier that you provide to ensure the idempotency of the \
         connector deletion request. If you do not specify a client token, a randomly generated \
         token is used for the request to ensure idempotency.\n\
        \   "]
  environment_id : environment_id;
      [@ocaml.doc "A unique ID for the environment that the connector belongs to.\n"]
  connector_id : connector_id; [@ocaml.doc "A unique ID for the connector to be deleted.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_environment_host_response = {
  environment_summary : environment_summary option;
      [@ocaml.doc "A summary of the environment that the host was deleted from.\n"]
  host : host option; [@ocaml.doc "A description of the deleted host.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_environment_host_request = {
  client_token : client_token option;
      [@ocaml.doc
        " This parameter is not used in Amazon EVS currently. If you supply input for this \
         parameter, it will have no effect.\n\
        \ \n\
        \   A unique, case-sensitive identifier that you provide to ensure the idempotency of the \
         host deletion request. If you do not specify a client token, a randomly generated token \
         is used for the request to ensure idempotency.\n\
        \   "]
  environment_id : environment_id; [@ocaml.doc "A unique ID for the host's environment.\n"]
  host_name : host_name; [@ocaml.doc "The DNS hostname associated with the host to be deleted.\n"]
}
[@@ocaml.doc ""]

type nonrec disassociate_eip_from_vlan_response = { vlan : vlan option [@ocaml.doc ""] }
[@@ocaml.doc ""]

type nonrec disassociate_eip_from_vlan_request = {
  client_token : client_token option;
      [@ocaml.doc
        " This parameter is not used in Amazon EVS currently. If you supply input for this \
         parameter, it will have no effect.\n\
        \ \n\
        \   A unique, case-sensitive identifier that you provide to ensure the idempotency of the \
         environment creation request. If you do not specify a client token, a randomly generated \
         token is used for the request to ensure idempotency.\n\
        \   "]
  environment_id : environment_id;
      [@ocaml.doc
        "A unique ID for the environment containing the VLAN that the Elastic IP address \
         disassociates from.\n"]
  vlan_name : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc "The name of the VLAN. [hcx] is the only accepted VLAN name at this time.\n"]
  association_id : association_id;
      [@ocaml.doc " A unique ID for the Elastic IP address association.\n"]
}
[@@ocaml.doc ""]

type nonrec environment_resource = Smaws_Lib.CoreTypes.Resource.t [@@ocaml.doc ""]

type nonrec environment_state_list = environment_state list [@@ocaml.doc ""]

type nonrec environment_summary_list = environment_summary list [@@ocaml.doc ""]

type nonrec get_depot_url_response = {
  depot_url : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc
        "The URL for accessing the Amazon EVS Custom Addon depot. This URL includes the \
         authentication token as a path component.\n"]
  token : Smaws_Lib.Smithy_api.Types.string_;
      [@ocaml.doc
        "The authentication token for depot access. This token is included in the depot URL and is \
         used to authenticate requests.\n"]
}
[@@ocaml.doc ""]

type nonrec get_depot_url_request = {
  environment_id : environment_id;
      [@ocaml.doc "The unique ID of the Amazon EVS environment to get the depot URL for.\n"]
  rotate : Smaws_Lib.Smithy_api.Types.boolean_ option;
      [@ocaml.doc
        "Revokes the current authentication token and returns a new depot URL with a new token. \
         Previously issued depot URLs will stop working within 5 minutes of rotation.\n"]
}
[@@ocaml.doc ""]

type nonrec get_environment_response = {
  environment : environment option; [@ocaml.doc "A description of the requested environment.\n"]
}
[@@ocaml.doc ""]

type nonrec get_environment_request = {
  environment_id : environment_id; [@ocaml.doc "A unique ID for the environment.\n"]
}
[@@ocaml.doc ""]

type nonrec host_list = host list [@@ocaml.doc ""]

type nonrec pagination_token = string [@@ocaml.doc ""]

type nonrec list_environment_connectors_response = {
  next_token : pagination_token option;
      [@ocaml.doc
        "A unique pagination token for next page results. Make the call again using this token to \
         retrieve the next page.\n"]
  connectors : connector_list option; [@ocaml.doc "A list of connectors in the environment.\n"]
}
[@@ocaml.doc ""]

type nonrec max_results = int [@@ocaml.doc ""]

type nonrec list_environment_connectors_request = {
  next_token : pagination_token option;
      [@ocaml.doc
        "A unique pagination token for each page. If [nextToken] is returned, there are more \
         results available. Make the call again using the returned token with all other arguments \
         unchanged to retrieve the next page. Each pagination token expires after 24 hours. Using \
         an expired pagination token will return an {i HTTP 400 InvalidToken} error.\n"]
  max_results : max_results option;
      [@ocaml.doc
        "The maximum number of results to return. If you specify [MaxResults] in the request, the \
         response includes information up to the limit specified.\n"]
  environment_id : environment_id; [@ocaml.doc "A unique ID for the environment.\n"]
}
[@@ocaml.doc ""]

type nonrec list_environment_hosts_response = {
  next_token : pagination_token option;
      [@ocaml.doc
        "A unique pagination token for next page results. Make the call again using this token to \
         retrieve the next page.\n"]
  environment_hosts : host_list option; [@ocaml.doc "A list of hosts in the environment.\n"]
}
[@@ocaml.doc ""]

type nonrec list_environment_hosts_request = {
  next_token : pagination_token option;
      [@ocaml.doc
        "A unique pagination token for each page. If [nextToken] is returned, there are more \
         results available. Make the call again using the returned token with all other arguments \
         unchanged to retrieve the next page. Each pagination token expires after 24 hours. Using \
         an expired pagination token will return an {i HTTP 400 InvalidToken} error.\n"]
  max_results : max_results option;
      [@ocaml.doc
        "The maximum number of results to return. If you specify [MaxResults] in the request, the \
         response includes information up to the limit specified.\n"]
  environment_id : environment_id; [@ocaml.doc "A unique ID for the environment.\n"]
}
[@@ocaml.doc ""]

type nonrec vlan_list = vlan list [@@ocaml.doc ""]

type nonrec list_environment_vlans_response = {
  next_token : pagination_token option;
      [@ocaml.doc
        "A unique pagination token for next page results. Make the call again using this token to \
         retrieve the next page.\n"]
  environment_vlans : vlan_list option;
      [@ocaml.doc "A list of VLANs that are associated with the specified environment.\n"]
}
[@@ocaml.doc ""]

type nonrec list_environment_vlans_request = {
  next_token : pagination_token option;
      [@ocaml.doc
        "A unique pagination token for each page. If [nextToken] is returned, there are more \
         results available. Make the call again using the returned token with all other arguments \
         unchanged to retrieve the next page. Each pagination token expires after 24 hours. Using \
         an expired pagination token will return an {i HTTP 400 InvalidToken} error.\n"]
  max_results : max_results option;
      [@ocaml.doc
        "The maximum number of results to return. If you specify [MaxResults] in the request, the \
         response includes information up to the limit specified.\n"]
  environment_id : environment_id; [@ocaml.doc "A unique ID for the environment.\n"]
}
[@@ocaml.doc ""]

type nonrec list_environments_response = {
  next_token : pagination_token option;
      [@ocaml.doc
        "A unique pagination token for next page results. Make the call again using this token to \
         retrieve the next page.\n"]
  environment_summaries : environment_summary_list option;
      [@ocaml.doc "A list of environments with summarized environment details.\n"]
}
[@@ocaml.doc ""]

type nonrec list_environments_request = {
  next_token : pagination_token option;
      [@ocaml.doc
        "A unique pagination token for each page. If [nextToken] is returned, there are more \
         results available. Make the call again using the returned token with all other arguments \
         unchanged to retrieve the next page. Each pagination token expires after 24 hours. Using \
         an expired pagination token will return an {i HTTP 400 InvalidToken} error.\n"]
  max_results : max_results option;
      [@ocaml.doc
        "The maximum number of results to return. If you specify [MaxResults] in the request, the \
         response includes information up to the limit specified.\n"]
  state : environment_state_list option;
      [@ocaml.doc
        "The state of an environment. Used to filter response results to return only environments \
         with the specified [environmentState].\n"]
}
[@@ocaml.doc ""]

type nonrec list_vm_entitlements_response = {
  next_token : pagination_token option;
      [@ocaml.doc
        "A unique pagination token for next page results. Make the call again using this token to \
         retrieve the next page.\n"]
  entitlements : vm_entitlement_list option;
      [@ocaml.doc "A list of entitlements for virtual machines in the environment.\n"]
}
[@@ocaml.doc ""]

type nonrec list_vm_entitlements_request = {
  next_token : pagination_token option;
      [@ocaml.doc
        "A unique pagination token for each page. If [nextToken] is returned, there are more \
         results available. Make the call again using the returned token with all other arguments \
         unchanged to retrieve the next page. Each pagination token expires after 24 hours. Using \
         an expired pagination token will return an {i HTTP 400 InvalidToken} error.\n"]
  max_results : max_results option;
      [@ocaml.doc
        "The maximum number of results to return. If you specify [MaxResults] in the request, the \
         response includes information up to the limit specified.\n"]
  environment_id : environment_id; [@ocaml.doc "A unique ID for the environment.\n"]
  connector_id : connector_id; [@ocaml.doc "A unique ID for the connector.\n"]
  entitlement_type : entitlement_type; [@ocaml.doc "The type of entitlement to list.\n"]
}
[@@ocaml.doc ""]

type nonrec update_environment_connector_response = {
  connector : connector option; [@ocaml.doc "A description of the updated connector.\n"]
}
[@@ocaml.doc ""]

type nonrec update_environment_connector_request = {
  client_token : client_token option;
      [@ocaml.doc
        " This parameter is not used in Amazon EVS currently. If you supply input for this \
         parameter, it will have no effect.\n\
        \ \n\
        \   A unique, case-sensitive identifier that you provide to ensure the idempotency of the \
         connector update request. If you do not specify a client token, a randomly generated \
         token is used for the request to ensure idempotency.\n\
        \   "]
  environment_id : environment_id;
      [@ocaml.doc "A unique ID for the environment that the connector belongs to.\n"]
  connector_id : connector_id; [@ocaml.doc "A unique ID for the connector to update.\n"]
  appliance_fqdn : appliance_fqdn option;
      [@ocaml.doc
        "The new fully qualified domain name (FQDN) of the VCF appliance that the connector \
         connects to.\n"]
  secret_identifier : secret_identifier option;
      [@ocaml.doc
        "The new ARN or name of the Amazon Web Services Secrets Manager secret that stores the \
         credentials for the VCF appliance.\n"]
}
[@@ocaml.doc ""]
