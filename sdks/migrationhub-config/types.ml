type nonrec token = string [@@ocaml.doc ""]

type nonrec error_message = string [@@ocaml.doc ""]

type nonrec retry_after_seconds = int [@@ocaml.doc ""]

type nonrec throttling_exception = {
  retry_after_seconds : retry_after_seconds option;
      [@ocaml.doc "The number of seconds the caller should wait before retrying.\n"]
  message : error_message; [@ocaml.doc ""]
}
[@@ocaml.doc "The request was denied due to request throttling.\n"]

type nonrec target_type = ACCOUNT [@ocaml.doc ""] [@@ocaml.doc ""]

type nonrec target_id = string [@@ocaml.doc ""]

type nonrec target = {
  id : target_id option;
      [@ocaml.doc
        "The [TargetID] is a 12-character identifier of the [ACCOUNT] for which the control was \
         created. (This must be the current account.) \n"]
  type_ : target_type; [@ocaml.doc "The target type is always an [ACCOUNT].\n"]
}
[@@ocaml.doc
  "The target parameter specifies the identifier to which the home region is applied, which is \
   always an [ACCOUNT]. It applies the home region to the current [ACCOUNT].\n"]

type nonrec service_unavailable_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc
  "Exception raised when a request fails due to temporary unavailability of the service.\n"]

type nonrec requested_time = Smaws_Lib.CoreTypes.Timestamp.t [@@ocaml.doc ""]

type nonrec invalid_input_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc
  "Exception raised when the provided input violates a policy constraint or is entered in the \
   wrong format or data type.\n"]

type nonrec internal_server_error = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc
  "Exception raised when an internal, configuration, or dependency error is encountered.\n"]

type nonrec control_id = string [@@ocaml.doc ""]

type nonrec home_region = string [@@ocaml.doc ""]

type nonrec home_region_control = {
  requested_time : requested_time option;
      [@ocaml.doc
        "A timestamp representing the time when the customer called [CreateHomeregionControl] and \
         set the home region for the account.\n"]
  target : target option;
      [@ocaml.doc
        "The target parameter specifies the identifier to which the home region is applied, which \
         is always an [ACCOUNT]. It applies the home region to the current [ACCOUNT].\n"]
  home_region : home_region option;
      [@ocaml.doc
        "The AWS Region that's been set as home region. For example, \"us-west-2\" or \
         \"eu-central-1\" are valid home regions.\n"]
  control_id : control_id option;
      [@ocaml.doc
        "A unique identifier that's generated for each home region control. It's always a string \
         that begins with \"hrc-\" followed by 12 lowercase letters and numbers.\n"]
}
[@@ocaml.doc
  "A home region control is an object that specifies the home region for an account, with some \
   additional information. It contains a target (always of type [ACCOUNT]), an ID, and a time at \
   which the home region was set.\n"]

type nonrec home_region_controls = home_region_control list [@@ocaml.doc ""]

type nonrec get_home_region_result = {
  home_region : home_region option;
      [@ocaml.doc "The name of the home region of the calling account.\n"]
}
[@@ocaml.doc ""]

type nonrec get_home_region_request = unit [@@ocaml.doc ""]

type nonrec access_denied_exception = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc "You do not have sufficient access to perform this action.\n"]

type nonrec dry_run_operation = { message : error_message option [@ocaml.doc ""] }
[@@ocaml.doc
  "Exception raised to indicate that authorization of an action was successful, when the [DryRun] \
   flag is set to true.\n"]

type nonrec dry_run = bool [@@ocaml.doc ""]

type nonrec describe_home_region_controls_result = {
  next_token : token option;
      [@ocaml.doc
        "If a [NextToken] was returned by a previous call, more results are available. To retrieve \
         the next page of results, make the call again using the returned token in [NextToken].\n"]
  home_region_controls : home_region_controls option;
      [@ocaml.doc "An array that contains your [HomeRegionControl] objects.\n"]
}
[@@ocaml.doc ""]

type nonrec describe_home_region_controls_max_results = int [@@ocaml.doc ""]

type nonrec describe_home_region_controls_request = {
  next_token : token option;
      [@ocaml.doc
        "If a [NextToken] was returned by a previous call, more results are available. To retrieve \
         the next page of results, make the call again using the returned token in [NextToken].\n"]
  max_results : describe_home_region_controls_max_results option;
      [@ocaml.doc "The maximum number of filtering results to display per page. \n"]
  target : target option;
      [@ocaml.doc
        "The target parameter specifies the identifier to which the home region is applied, which \
         is always of type [ACCOUNT]. It applies the home region to the current [ACCOUNT].\n"]
  home_region : home_region option; [@ocaml.doc "The name of the home region you'd like to view.\n"]
  control_id : control_id option;
      [@ocaml.doc
        "The [ControlID] is a unique identifier string of your [HomeRegionControl] object.\n"]
}
[@@ocaml.doc ""]

type nonrec delete_home_region_control_result = unit [@@ocaml.doc ""]

type nonrec delete_home_region_control_request = {
  control_id : control_id;
      [@ocaml.doc
        "A unique identifier that's generated for each home region control. It's always a string \
         that begins with \"hrc-\" followed by 12 lowercase letters and numbers.\n"]
}
[@@ocaml.doc ""]

type nonrec create_home_region_control_result = {
  home_region_control : home_region_control option;
      [@ocaml.doc
        "This object is the [HomeRegionControl] object that's returned by a successful call to \
         [CreateHomeRegionControl].\n"]
}
[@@ocaml.doc ""]

type nonrec create_home_region_control_request = {
  dry_run : dry_run option;
      [@ocaml.doc
        "Optional Boolean flag to indicate whether any effect should take place. It tests whether \
         the caller has permission to make the call.\n"]
  target : target;
      [@ocaml.doc
        "The account for which this command sets up a home region control. The [Target] is always \
         of type [ACCOUNT].\n"]
  home_region : home_region; [@ocaml.doc "The name of the home region of the calling account.\n"]
}
[@@ocaml.doc ""]
