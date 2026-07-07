open Types
open Service_metadata

module AcceptQualificationRequest = struct
  let error_to_string = function
    | `RequestError _ -> "com.amazonaws.mturk#RequestError"
    | `ServiceFault _ -> "com.amazonaws.mturk#ServiceFault"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "RequestError" -> `RequestError (Json_deserializers.request_error_of_yojson tree path)
      | _, "ServiceFault" -> `ServiceFault (Json_deserializers.service_fault_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : accept_qualification_request_request) =
    let input = Json_serializers.accept_qualification_request_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"MTurkRequesterServiceV20170117.AcceptQualificationRequest" ~service ~context
      ~input ~output_deserializer:Json_deserializers.accept_qualification_request_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : accept_qualification_request_request) =
    let input = Json_serializers.accept_qualification_request_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"MTurkRequesterServiceV20170117.AcceptQualificationRequest" ~service ~context
      ~input ~output_deserializer:Json_deserializers.accept_qualification_request_response_of_yojson
      ~error_deserializer
end

module ApproveAssignment = struct
  let error_to_string = function
    | `RequestError _ -> "com.amazonaws.mturk#RequestError"
    | `ServiceFault _ -> "com.amazonaws.mturk#ServiceFault"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "RequestError" -> `RequestError (Json_deserializers.request_error_of_yojson tree path)
      | _, "ServiceFault" -> `ServiceFault (Json_deserializers.service_fault_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : approve_assignment_request) =
    let input = Json_serializers.approve_assignment_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"MTurkRequesterServiceV20170117.ApproveAssignment" ~service ~context ~input
      ~output_deserializer:Json_deserializers.approve_assignment_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : approve_assignment_request) =
    let input = Json_serializers.approve_assignment_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"MTurkRequesterServiceV20170117.ApproveAssignment" ~service ~context ~input
      ~output_deserializer:Json_deserializers.approve_assignment_response_of_yojson
      ~error_deserializer
end

module AssociateQualificationWithWorker = struct
  let error_to_string = function
    | `RequestError _ -> "com.amazonaws.mturk#RequestError"
    | `ServiceFault _ -> "com.amazonaws.mturk#ServiceFault"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "RequestError" -> `RequestError (Json_deserializers.request_error_of_yojson tree path)
      | _, "ServiceFault" -> `ServiceFault (Json_deserializers.service_fault_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : associate_qualification_with_worker_request) =
    let input = Json_serializers.associate_qualification_with_worker_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"MTurkRequesterServiceV20170117.AssociateQualificationWithWorker" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.associate_qualification_with_worker_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : associate_qualification_with_worker_request) =
    let input = Json_serializers.associate_qualification_with_worker_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"MTurkRequesterServiceV20170117.AssociateQualificationWithWorker" ~service
      ~context ~input
      ~output_deserializer:Json_deserializers.associate_qualification_with_worker_response_of_yojson
      ~error_deserializer
end

module CreateAdditionalAssignmentsForHIT = struct
  let error_to_string = function
    | `RequestError _ -> "com.amazonaws.mturk#RequestError"
    | `ServiceFault _ -> "com.amazonaws.mturk#ServiceFault"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "RequestError" -> `RequestError (Json_deserializers.request_error_of_yojson tree path)
      | _, "ServiceFault" -> `ServiceFault (Json_deserializers.service_fault_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_additional_assignments_for_hit_request) =
    let input = Json_serializers.create_additional_assignments_for_hit_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"MTurkRequesterServiceV20170117.CreateAdditionalAssignmentsForHIT" ~service
      ~context ~input
      ~output_deserializer:
        Json_deserializers.create_additional_assignments_for_hit_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_additional_assignments_for_hit_request) =
    let input = Json_serializers.create_additional_assignments_for_hit_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"MTurkRequesterServiceV20170117.CreateAdditionalAssignmentsForHIT" ~service
      ~context ~input
      ~output_deserializer:
        Json_deserializers.create_additional_assignments_for_hit_response_of_yojson
      ~error_deserializer
end

module CreateHIT = struct
  let error_to_string = function
    | `RequestError _ -> "com.amazonaws.mturk#RequestError"
    | `ServiceFault _ -> "com.amazonaws.mturk#ServiceFault"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "RequestError" -> `RequestError (Json_deserializers.request_error_of_yojson tree path)
      | _, "ServiceFault" -> `ServiceFault (Json_deserializers.service_fault_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_hit_request) =
    let input = Json_serializers.create_hit_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"MTurkRequesterServiceV20170117.CreateHIT"
      ~service ~context ~input ~output_deserializer:Json_deserializers.create_hit_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_hit_request) =
    let input = Json_serializers.create_hit_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"MTurkRequesterServiceV20170117.CreateHIT" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_hit_response_of_yojson ~error_deserializer
end

module CreateHITType = struct
  let error_to_string = function
    | `RequestError _ -> "com.amazonaws.mturk#RequestError"
    | `ServiceFault _ -> "com.amazonaws.mturk#ServiceFault"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "RequestError" -> `RequestError (Json_deserializers.request_error_of_yojson tree path)
      | _, "ServiceFault" -> `ServiceFault (Json_deserializers.service_fault_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_hit_type_request) =
    let input = Json_serializers.create_hit_type_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"MTurkRequesterServiceV20170117.CreateHITType"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_hit_type_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : create_hit_type_request) =
    let input = Json_serializers.create_hit_type_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"MTurkRequesterServiceV20170117.CreateHITType" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_hit_type_response_of_yojson ~error_deserializer
end

module CreateHITWithHITType = struct
  let error_to_string = function
    | `RequestError _ -> "com.amazonaws.mturk#RequestError"
    | `ServiceFault _ -> "com.amazonaws.mturk#ServiceFault"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "RequestError" -> `RequestError (Json_deserializers.request_error_of_yojson tree path)
      | _, "ServiceFault" -> `ServiceFault (Json_deserializers.service_fault_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_hit_with_hit_type_request) =
    let input = Json_serializers.create_hit_with_hit_type_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"MTurkRequesterServiceV20170117.CreateHITWithHITType" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_hit_with_hit_type_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_hit_with_hit_type_request) =
    let input = Json_serializers.create_hit_with_hit_type_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"MTurkRequesterServiceV20170117.CreateHITWithHITType" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_hit_with_hit_type_response_of_yojson
      ~error_deserializer
end

module CreateQualificationType = struct
  let error_to_string = function
    | `RequestError _ -> "com.amazonaws.mturk#RequestError"
    | `ServiceFault _ -> "com.amazonaws.mturk#ServiceFault"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "RequestError" -> `RequestError (Json_deserializers.request_error_of_yojson tree path)
      | _, "ServiceFault" -> `ServiceFault (Json_deserializers.service_fault_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_qualification_type_request) =
    let input = Json_serializers.create_qualification_type_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"MTurkRequesterServiceV20170117.CreateQualificationType" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_qualification_type_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_qualification_type_request) =
    let input = Json_serializers.create_qualification_type_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"MTurkRequesterServiceV20170117.CreateQualificationType" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_qualification_type_response_of_yojson
      ~error_deserializer
end

module CreateWorkerBlock = struct
  let error_to_string = function
    | `RequestError _ -> "com.amazonaws.mturk#RequestError"
    | `ServiceFault _ -> "com.amazonaws.mturk#ServiceFault"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "RequestError" -> `RequestError (Json_deserializers.request_error_of_yojson tree path)
      | _, "ServiceFault" -> `ServiceFault (Json_deserializers.service_fault_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : create_worker_block_request) =
    let input = Json_serializers.create_worker_block_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"MTurkRequesterServiceV20170117.CreateWorkerBlock" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_worker_block_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : create_worker_block_request) =
    let input = Json_serializers.create_worker_block_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"MTurkRequesterServiceV20170117.CreateWorkerBlock" ~service ~context ~input
      ~output_deserializer:Json_deserializers.create_worker_block_response_of_yojson
      ~error_deserializer
end

module DeleteHIT = struct
  let error_to_string = function
    | `RequestError _ -> "com.amazonaws.mturk#RequestError"
    | `ServiceFault _ -> "com.amazonaws.mturk#ServiceFault"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "RequestError" -> `RequestError (Json_deserializers.request_error_of_yojson tree path)
      | _, "ServiceFault" -> `ServiceFault (Json_deserializers.service_fault_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_hit_request) =
    let input = Json_serializers.delete_hit_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"MTurkRequesterServiceV20170117.DeleteHIT"
      ~service ~context ~input ~output_deserializer:Json_deserializers.delete_hit_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_hit_request) =
    let input = Json_serializers.delete_hit_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"MTurkRequesterServiceV20170117.DeleteHIT" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_hit_response_of_yojson ~error_deserializer
end

module DeleteQualificationType = struct
  let error_to_string = function
    | `RequestError _ -> "com.amazonaws.mturk#RequestError"
    | `ServiceFault _ -> "com.amazonaws.mturk#ServiceFault"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "RequestError" -> `RequestError (Json_deserializers.request_error_of_yojson tree path)
      | _, "ServiceFault" -> `ServiceFault (Json_deserializers.service_fault_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_qualification_type_request) =
    let input = Json_serializers.delete_qualification_type_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"MTurkRequesterServiceV20170117.DeleteQualificationType" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_qualification_type_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_qualification_type_request) =
    let input = Json_serializers.delete_qualification_type_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"MTurkRequesterServiceV20170117.DeleteQualificationType" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_qualification_type_response_of_yojson
      ~error_deserializer
end

module DeleteWorkerBlock = struct
  let error_to_string = function
    | `RequestError _ -> "com.amazonaws.mturk#RequestError"
    | `ServiceFault _ -> "com.amazonaws.mturk#ServiceFault"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "RequestError" -> `RequestError (Json_deserializers.request_error_of_yojson tree path)
      | _, "ServiceFault" -> `ServiceFault (Json_deserializers.service_fault_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : delete_worker_block_request) =
    let input = Json_serializers.delete_worker_block_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"MTurkRequesterServiceV20170117.DeleteWorkerBlock" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_worker_block_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : delete_worker_block_request) =
    let input = Json_serializers.delete_worker_block_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"MTurkRequesterServiceV20170117.DeleteWorkerBlock" ~service ~context ~input
      ~output_deserializer:Json_deserializers.delete_worker_block_response_of_yojson
      ~error_deserializer
end

module DisassociateQualificationFromWorker = struct
  let error_to_string = function
    | `RequestError _ -> "com.amazonaws.mturk#RequestError"
    | `ServiceFault _ -> "com.amazonaws.mturk#ServiceFault"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "RequestError" -> `RequestError (Json_deserializers.request_error_of_yojson tree path)
      | _, "ServiceFault" -> `ServiceFault (Json_deserializers.service_fault_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : disassociate_qualification_from_worker_request) =
    let input = Json_serializers.disassociate_qualification_from_worker_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"MTurkRequesterServiceV20170117.DisassociateQualificationFromWorker" ~service
      ~context ~input
      ~output_deserializer:
        Json_deserializers.disassociate_qualification_from_worker_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : disassociate_qualification_from_worker_request) =
    let input = Json_serializers.disassociate_qualification_from_worker_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"MTurkRequesterServiceV20170117.DisassociateQualificationFromWorker" ~service
      ~context ~input
      ~output_deserializer:
        Json_deserializers.disassociate_qualification_from_worker_response_of_yojson
      ~error_deserializer
end

module GetAccountBalance = struct
  let error_to_string = function
    | `RequestError _ -> "com.amazonaws.mturk#RequestError"
    | `ServiceFault _ -> "com.amazonaws.mturk#ServiceFault"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "RequestError" -> `RequestError (Json_deserializers.request_error_of_yojson tree path)
      | _, "ServiceFault" -> `ServiceFault (Json_deserializers.service_fault_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_account_balance_request) =
    let input = Json_serializers.get_account_balance_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"MTurkRequesterServiceV20170117.GetAccountBalance" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_account_balance_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_account_balance_request) =
    let input = Json_serializers.get_account_balance_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"MTurkRequesterServiceV20170117.GetAccountBalance" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_account_balance_response_of_yojson
      ~error_deserializer
end

module GetAssignment = struct
  let error_to_string = function
    | `RequestError _ -> "com.amazonaws.mturk#RequestError"
    | `ServiceFault _ -> "com.amazonaws.mturk#ServiceFault"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "RequestError" -> `RequestError (Json_deserializers.request_error_of_yojson tree path)
      | _, "ServiceFault" -> `ServiceFault (Json_deserializers.service_fault_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_assignment_request) =
    let input = Json_serializers.get_assignment_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"MTurkRequesterServiceV20170117.GetAssignment"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_assignment_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : get_assignment_request) =
    let input = Json_serializers.get_assignment_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"MTurkRequesterServiceV20170117.GetAssignment" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_assignment_response_of_yojson ~error_deserializer
end

module GetFileUploadURL = struct
  let error_to_string = function
    | `RequestError _ -> "com.amazonaws.mturk#RequestError"
    | `ServiceFault _ -> "com.amazonaws.mturk#ServiceFault"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "RequestError" -> `RequestError (Json_deserializers.request_error_of_yojson tree path)
      | _, "ServiceFault" -> `ServiceFault (Json_deserializers.service_fault_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_file_upload_url_request) =
    let input = Json_serializers.get_file_upload_url_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"MTurkRequesterServiceV20170117.GetFileUploadURL" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_file_upload_url_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_file_upload_url_request) =
    let input = Json_serializers.get_file_upload_url_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"MTurkRequesterServiceV20170117.GetFileUploadURL" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_file_upload_url_response_of_yojson
      ~error_deserializer
end

module GetHIT = struct
  let error_to_string = function
    | `RequestError _ -> "com.amazonaws.mturk#RequestError"
    | `ServiceFault _ -> "com.amazonaws.mturk#ServiceFault"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "RequestError" -> `RequestError (Json_deserializers.request_error_of_yojson tree path)
      | _, "ServiceFault" -> `ServiceFault (Json_deserializers.service_fault_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_hit_request) =
    let input = Json_serializers.get_hit_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"MTurkRequesterServiceV20170117.GetHIT" ~service
      ~context ~input ~output_deserializer:Json_deserializers.get_hit_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_hit_request) =
    let input = Json_serializers.get_hit_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"MTurkRequesterServiceV20170117.GetHIT" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_hit_response_of_yojson ~error_deserializer
end

module GetQualificationScore = struct
  let error_to_string = function
    | `RequestError _ -> "com.amazonaws.mturk#RequestError"
    | `ServiceFault _ -> "com.amazonaws.mturk#ServiceFault"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "RequestError" -> `RequestError (Json_deserializers.request_error_of_yojson tree path)
      | _, "ServiceFault" -> `ServiceFault (Json_deserializers.service_fault_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_qualification_score_request) =
    let input = Json_serializers.get_qualification_score_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"MTurkRequesterServiceV20170117.GetQualificationScore" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_qualification_score_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_qualification_score_request) =
    let input = Json_serializers.get_qualification_score_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"MTurkRequesterServiceV20170117.GetQualificationScore" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_qualification_score_response_of_yojson
      ~error_deserializer
end

module GetQualificationType = struct
  let error_to_string = function
    | `RequestError _ -> "com.amazonaws.mturk#RequestError"
    | `ServiceFault _ -> "com.amazonaws.mturk#ServiceFault"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "RequestError" -> `RequestError (Json_deserializers.request_error_of_yojson tree path)
      | _, "ServiceFault" -> `ServiceFault (Json_deserializers.service_fault_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : get_qualification_type_request) =
    let input = Json_serializers.get_qualification_type_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"MTurkRequesterServiceV20170117.GetQualificationType" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_qualification_type_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : get_qualification_type_request) =
    let input = Json_serializers.get_qualification_type_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"MTurkRequesterServiceV20170117.GetQualificationType" ~service ~context ~input
      ~output_deserializer:Json_deserializers.get_qualification_type_response_of_yojson
      ~error_deserializer
end

module ListAssignmentsForHIT = struct
  let error_to_string = function
    | `RequestError _ -> "com.amazonaws.mturk#RequestError"
    | `ServiceFault _ -> "com.amazonaws.mturk#ServiceFault"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "RequestError" -> `RequestError (Json_deserializers.request_error_of_yojson tree path)
      | _, "ServiceFault" -> `ServiceFault (Json_deserializers.service_fault_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_assignments_for_hit_request) =
    let input = Json_serializers.list_assignments_for_hit_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"MTurkRequesterServiceV20170117.ListAssignmentsForHIT" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_assignments_for_hit_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_assignments_for_hit_request) =
    let input = Json_serializers.list_assignments_for_hit_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"MTurkRequesterServiceV20170117.ListAssignmentsForHIT" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_assignments_for_hit_response_of_yojson
      ~error_deserializer
end

module ListBonusPayments = struct
  let error_to_string = function
    | `RequestError _ -> "com.amazonaws.mturk#RequestError"
    | `ServiceFault _ -> "com.amazonaws.mturk#ServiceFault"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "RequestError" -> `RequestError (Json_deserializers.request_error_of_yojson tree path)
      | _, "ServiceFault" -> `ServiceFault (Json_deserializers.service_fault_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_bonus_payments_request) =
    let input = Json_serializers.list_bonus_payments_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"MTurkRequesterServiceV20170117.ListBonusPayments" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_bonus_payments_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_bonus_payments_request) =
    let input = Json_serializers.list_bonus_payments_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"MTurkRequesterServiceV20170117.ListBonusPayments" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_bonus_payments_response_of_yojson
      ~error_deserializer
end

module ListHITs = struct
  let error_to_string = function
    | `RequestError _ -> "com.amazonaws.mturk#RequestError"
    | `ServiceFault _ -> "com.amazonaws.mturk#ServiceFault"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "RequestError" -> `RequestError (Json_deserializers.request_error_of_yojson tree path)
      | _, "ServiceFault" -> `ServiceFault (Json_deserializers.service_fault_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_hi_ts_request) =
    let input = Json_serializers.list_hi_ts_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"MTurkRequesterServiceV20170117.ListHITs"
      ~service ~context ~input ~output_deserializer:Json_deserializers.list_hi_ts_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_hi_ts_request) =
    let input = Json_serializers.list_hi_ts_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"MTurkRequesterServiceV20170117.ListHITs" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_hi_ts_response_of_yojson ~error_deserializer
end

module ListHITsForQualificationType = struct
  let error_to_string = function
    | `RequestError _ -> "com.amazonaws.mturk#RequestError"
    | `ServiceFault _ -> "com.amazonaws.mturk#ServiceFault"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "RequestError" -> `RequestError (Json_deserializers.request_error_of_yojson tree path)
      | _, "ServiceFault" -> `ServiceFault (Json_deserializers.service_fault_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_hi_ts_for_qualification_type_request) =
    let input = Json_serializers.list_hi_ts_for_qualification_type_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"MTurkRequesterServiceV20170117.ListHITsForQualificationType" ~service ~context
      ~input
      ~output_deserializer:Json_deserializers.list_hi_ts_for_qualification_type_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_hi_ts_for_qualification_type_request) =
    let input = Json_serializers.list_hi_ts_for_qualification_type_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"MTurkRequesterServiceV20170117.ListHITsForQualificationType" ~service ~context
      ~input
      ~output_deserializer:Json_deserializers.list_hi_ts_for_qualification_type_response_of_yojson
      ~error_deserializer
end

module ListQualificationRequests = struct
  let error_to_string = function
    | `RequestError _ -> "com.amazonaws.mturk#RequestError"
    | `ServiceFault _ -> "com.amazonaws.mturk#ServiceFault"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "RequestError" -> `RequestError (Json_deserializers.request_error_of_yojson tree path)
      | _, "ServiceFault" -> `ServiceFault (Json_deserializers.service_fault_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_qualification_requests_request) =
    let input = Json_serializers.list_qualification_requests_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"MTurkRequesterServiceV20170117.ListQualificationRequests" ~service ~context
      ~input ~output_deserializer:Json_deserializers.list_qualification_requests_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_qualification_requests_request) =
    let input = Json_serializers.list_qualification_requests_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"MTurkRequesterServiceV20170117.ListQualificationRequests" ~service ~context
      ~input ~output_deserializer:Json_deserializers.list_qualification_requests_response_of_yojson
      ~error_deserializer
end

module ListQualificationTypes = struct
  let error_to_string = function
    | `RequestError _ -> "com.amazonaws.mturk#RequestError"
    | `ServiceFault _ -> "com.amazonaws.mturk#ServiceFault"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "RequestError" -> `RequestError (Json_deserializers.request_error_of_yojson tree path)
      | _, "ServiceFault" -> `ServiceFault (Json_deserializers.service_fault_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_qualification_types_request) =
    let input = Json_serializers.list_qualification_types_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"MTurkRequesterServiceV20170117.ListQualificationTypes" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_qualification_types_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_qualification_types_request) =
    let input = Json_serializers.list_qualification_types_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"MTurkRequesterServiceV20170117.ListQualificationTypes" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_qualification_types_response_of_yojson
      ~error_deserializer
end

module ListReviewableHITs = struct
  let error_to_string = function
    | `RequestError _ -> "com.amazonaws.mturk#RequestError"
    | `ServiceFault _ -> "com.amazonaws.mturk#ServiceFault"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "RequestError" -> `RequestError (Json_deserializers.request_error_of_yojson tree path)
      | _, "ServiceFault" -> `ServiceFault (Json_deserializers.service_fault_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_reviewable_hi_ts_request) =
    let input = Json_serializers.list_reviewable_hi_ts_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"MTurkRequesterServiceV20170117.ListReviewableHITs" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_reviewable_hi_ts_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_reviewable_hi_ts_request) =
    let input = Json_serializers.list_reviewable_hi_ts_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"MTurkRequesterServiceV20170117.ListReviewableHITs" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_reviewable_hi_ts_response_of_yojson
      ~error_deserializer
end

module ListReviewPolicyResultsForHIT = struct
  let error_to_string = function
    | `RequestError _ -> "com.amazonaws.mturk#RequestError"
    | `ServiceFault _ -> "com.amazonaws.mturk#ServiceFault"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "RequestError" -> `RequestError (Json_deserializers.request_error_of_yojson tree path)
      | _, "ServiceFault" -> `ServiceFault (Json_deserializers.service_fault_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_review_policy_results_for_hit_request) =
    let input = Json_serializers.list_review_policy_results_for_hit_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"MTurkRequesterServiceV20170117.ListReviewPolicyResultsForHIT" ~service ~context
      ~input
      ~output_deserializer:Json_deserializers.list_review_policy_results_for_hit_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_review_policy_results_for_hit_request) =
    let input = Json_serializers.list_review_policy_results_for_hit_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"MTurkRequesterServiceV20170117.ListReviewPolicyResultsForHIT" ~service ~context
      ~input
      ~output_deserializer:Json_deserializers.list_review_policy_results_for_hit_response_of_yojson
      ~error_deserializer
end

module ListWorkerBlocks = struct
  let error_to_string = function
    | `RequestError _ -> "com.amazonaws.mturk#RequestError"
    | `ServiceFault _ -> "com.amazonaws.mturk#ServiceFault"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "RequestError" -> `RequestError (Json_deserializers.request_error_of_yojson tree path)
      | _, "ServiceFault" -> `ServiceFault (Json_deserializers.service_fault_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_worker_blocks_request) =
    let input = Json_serializers.list_worker_blocks_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"MTurkRequesterServiceV20170117.ListWorkerBlocks" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_worker_blocks_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_worker_blocks_request) =
    let input = Json_serializers.list_worker_blocks_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"MTurkRequesterServiceV20170117.ListWorkerBlocks" ~service ~context ~input
      ~output_deserializer:Json_deserializers.list_worker_blocks_response_of_yojson
      ~error_deserializer
end

module ListWorkersWithQualificationType = struct
  let error_to_string = function
    | `RequestError _ -> "com.amazonaws.mturk#RequestError"
    | `ServiceFault _ -> "com.amazonaws.mturk#ServiceFault"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "RequestError" -> `RequestError (Json_deserializers.request_error_of_yojson tree path)
      | _, "ServiceFault" -> `ServiceFault (Json_deserializers.service_fault_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : list_workers_with_qualification_type_request) =
    let input = Json_serializers.list_workers_with_qualification_type_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"MTurkRequesterServiceV20170117.ListWorkersWithQualificationType" ~service
      ~context ~input
      ~output_deserializer:
        Json_deserializers.list_workers_with_qualification_type_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : list_workers_with_qualification_type_request) =
    let input = Json_serializers.list_workers_with_qualification_type_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"MTurkRequesterServiceV20170117.ListWorkersWithQualificationType" ~service
      ~context ~input
      ~output_deserializer:
        Json_deserializers.list_workers_with_qualification_type_response_of_yojson
      ~error_deserializer
end

module NotifyWorkers = struct
  let error_to_string = function
    | `RequestError _ -> "com.amazonaws.mturk#RequestError"
    | `ServiceFault _ -> "com.amazonaws.mturk#ServiceFault"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "RequestError" -> `RequestError (Json_deserializers.request_error_of_yojson tree path)
      | _, "ServiceFault" -> `ServiceFault (Json_deserializers.service_fault_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : notify_workers_request) =
    let input = Json_serializers.notify_workers_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"MTurkRequesterServiceV20170117.NotifyWorkers"
      ~service ~context ~input
      ~output_deserializer:Json_deserializers.notify_workers_response_of_yojson ~error_deserializer

  let request_with_metadata context (request : notify_workers_request) =
    let input = Json_serializers.notify_workers_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"MTurkRequesterServiceV20170117.NotifyWorkers" ~service ~context ~input
      ~output_deserializer:Json_deserializers.notify_workers_response_of_yojson ~error_deserializer
end

module RejectAssignment = struct
  let error_to_string = function
    | `RequestError _ -> "com.amazonaws.mturk#RequestError"
    | `ServiceFault _ -> "com.amazonaws.mturk#ServiceFault"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "RequestError" -> `RequestError (Json_deserializers.request_error_of_yojson tree path)
      | _, "ServiceFault" -> `ServiceFault (Json_deserializers.service_fault_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : reject_assignment_request) =
    let input = Json_serializers.reject_assignment_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"MTurkRequesterServiceV20170117.RejectAssignment" ~service ~context ~input
      ~output_deserializer:Json_deserializers.reject_assignment_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : reject_assignment_request) =
    let input = Json_serializers.reject_assignment_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"MTurkRequesterServiceV20170117.RejectAssignment" ~service ~context ~input
      ~output_deserializer:Json_deserializers.reject_assignment_response_of_yojson
      ~error_deserializer
end

module RejectQualificationRequest = struct
  let error_to_string = function
    | `RequestError _ -> "com.amazonaws.mturk#RequestError"
    | `ServiceFault _ -> "com.amazonaws.mturk#ServiceFault"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "RequestError" -> `RequestError (Json_deserializers.request_error_of_yojson tree path)
      | _, "ServiceFault" -> `ServiceFault (Json_deserializers.service_fault_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : reject_qualification_request_request) =
    let input = Json_serializers.reject_qualification_request_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"MTurkRequesterServiceV20170117.RejectQualificationRequest" ~service ~context
      ~input ~output_deserializer:Json_deserializers.reject_qualification_request_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : reject_qualification_request_request) =
    let input = Json_serializers.reject_qualification_request_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"MTurkRequesterServiceV20170117.RejectQualificationRequest" ~service ~context
      ~input ~output_deserializer:Json_deserializers.reject_qualification_request_response_of_yojson
      ~error_deserializer
end

module SendBonus = struct
  let error_to_string = function
    | `RequestError _ -> "com.amazonaws.mturk#RequestError"
    | `ServiceFault _ -> "com.amazonaws.mturk#ServiceFault"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "RequestError" -> `RequestError (Json_deserializers.request_error_of_yojson tree path)
      | _, "ServiceFault" -> `ServiceFault (Json_deserializers.service_fault_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : send_bonus_request) =
    let input = Json_serializers.send_bonus_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request ~shape_name:"MTurkRequesterServiceV20170117.SendBonus"
      ~service ~context ~input ~output_deserializer:Json_deserializers.send_bonus_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : send_bonus_request) =
    let input = Json_serializers.send_bonus_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"MTurkRequesterServiceV20170117.SendBonus" ~service ~context ~input
      ~output_deserializer:Json_deserializers.send_bonus_response_of_yojson ~error_deserializer
end

module SendTestEventNotification = struct
  let error_to_string = function
    | `RequestError _ -> "com.amazonaws.mturk#RequestError"
    | `ServiceFault _ -> "com.amazonaws.mturk#ServiceFault"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "RequestError" -> `RequestError (Json_deserializers.request_error_of_yojson tree path)
      | _, "ServiceFault" -> `ServiceFault (Json_deserializers.service_fault_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : send_test_event_notification_request) =
    let input = Json_serializers.send_test_event_notification_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"MTurkRequesterServiceV20170117.SendTestEventNotification" ~service ~context
      ~input ~output_deserializer:Json_deserializers.send_test_event_notification_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : send_test_event_notification_request) =
    let input = Json_serializers.send_test_event_notification_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"MTurkRequesterServiceV20170117.SendTestEventNotification" ~service ~context
      ~input ~output_deserializer:Json_deserializers.send_test_event_notification_response_of_yojson
      ~error_deserializer
end

module UpdateExpirationForHIT = struct
  let error_to_string = function
    | `RequestError _ -> "com.amazonaws.mturk#RequestError"
    | `ServiceFault _ -> "com.amazonaws.mturk#ServiceFault"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "RequestError" -> `RequestError (Json_deserializers.request_error_of_yojson tree path)
      | _, "ServiceFault" -> `ServiceFault (Json_deserializers.service_fault_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_expiration_for_hit_request) =
    let input = Json_serializers.update_expiration_for_hit_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"MTurkRequesterServiceV20170117.UpdateExpirationForHIT" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_expiration_for_hit_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_expiration_for_hit_request) =
    let input = Json_serializers.update_expiration_for_hit_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"MTurkRequesterServiceV20170117.UpdateExpirationForHIT" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_expiration_for_hit_response_of_yojson
      ~error_deserializer
end

module UpdateHITReviewStatus = struct
  let error_to_string = function
    | `RequestError _ -> "com.amazonaws.mturk#RequestError"
    | `ServiceFault _ -> "com.amazonaws.mturk#ServiceFault"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "RequestError" -> `RequestError (Json_deserializers.request_error_of_yojson tree path)
      | _, "ServiceFault" -> `ServiceFault (Json_deserializers.service_fault_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_hit_review_status_request) =
    let input = Json_serializers.update_hit_review_status_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"MTurkRequesterServiceV20170117.UpdateHITReviewStatus" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_hit_review_status_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_hit_review_status_request) =
    let input = Json_serializers.update_hit_review_status_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"MTurkRequesterServiceV20170117.UpdateHITReviewStatus" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_hit_review_status_response_of_yojson
      ~error_deserializer
end

module UpdateHITTypeOfHIT = struct
  let error_to_string = function
    | `RequestError _ -> "com.amazonaws.mturk#RequestError"
    | `ServiceFault _ -> "com.amazonaws.mturk#ServiceFault"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "RequestError" -> `RequestError (Json_deserializers.request_error_of_yojson tree path)
      | _, "ServiceFault" -> `ServiceFault (Json_deserializers.service_fault_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_hit_type_of_hit_request) =
    let input = Json_serializers.update_hit_type_of_hit_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"MTurkRequesterServiceV20170117.UpdateHITTypeOfHIT" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_hit_type_of_hit_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_hit_type_of_hit_request) =
    let input = Json_serializers.update_hit_type_of_hit_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"MTurkRequesterServiceV20170117.UpdateHITTypeOfHIT" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_hit_type_of_hit_response_of_yojson
      ~error_deserializer
end

module UpdateNotificationSettings = struct
  let error_to_string = function
    | `RequestError _ -> "com.amazonaws.mturk#RequestError"
    | `ServiceFault _ -> "com.amazonaws.mturk#ServiceFault"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "RequestError" -> `RequestError (Json_deserializers.request_error_of_yojson tree path)
      | _, "ServiceFault" -> `ServiceFault (Json_deserializers.service_fault_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_notification_settings_request) =
    let input = Json_serializers.update_notification_settings_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"MTurkRequesterServiceV20170117.UpdateNotificationSettings" ~service ~context
      ~input ~output_deserializer:Json_deserializers.update_notification_settings_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_notification_settings_request) =
    let input = Json_serializers.update_notification_settings_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"MTurkRequesterServiceV20170117.UpdateNotificationSettings" ~service ~context
      ~input ~output_deserializer:Json_deserializers.update_notification_settings_response_of_yojson
      ~error_deserializer
end

module UpdateQualificationType = struct
  let error_to_string = function
    | `RequestError _ -> "com.amazonaws.mturk#RequestError"
    | `ServiceFault _ -> "com.amazonaws.mturk#ServiceFault"
    | #Smaws_Lib.Protocols.AwsJson.error as e -> Smaws_Lib.Protocols.AwsJson.error_to_string e

  let error_deserializer tree path =
    let handler handler tree path = function
      | _, "RequestError" -> `RequestError (Json_deserializers.request_error_of_yojson tree path)
      | _, "ServiceFault" -> `ServiceFault (Json_deserializers.service_fault_of_yojson tree path)
      | _type -> handler tree path _type
    in
    Smaws_Lib.Protocols.AwsJson.(
      error_deserializer (handler Smaws_Lib.Protocols.AwsJson.Errors.default_handler) tree path)

  let request context (request : update_qualification_type_request) =
    let input = Json_serializers.update_qualification_type_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request
      ~shape_name:"MTurkRequesterServiceV20170117.UpdateQualificationType" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_qualification_type_response_of_yojson
      ~error_deserializer

  let request_with_metadata context (request : update_qualification_type_request) =
    let input = Json_serializers.update_qualification_type_request_to_yojson request in
    Smaws_Lib.Protocols.AwsJson.request_with_metadata
      ~shape_name:"MTurkRequesterServiceV20170117.UpdateQualificationType" ~service ~context ~input
      ~output_deserializer:Json_deserializers.update_qualification_type_response_of_yojson
      ~error_deserializer
end
