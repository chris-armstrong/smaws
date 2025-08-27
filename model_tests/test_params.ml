let test_record_access () =
  let test_case : Parselib.Ast.Trait.httpRequestTest =
    {
      id = "test";
      protocol = "aws.protocols#awsJson1_0";
      method_ = "POST";
      uri = "/";
      host = None;
      resolvedHost = None;
      authScheme = None;
      queryParams = None;
      forbidQueryParams = None;
      headers = None;
      forbidHeaders = None;
      body = None;
      bodyMediaType = None;
      params = None;
      vendorParams = None;
      vendorParamsShape = None;
      documentation = None;
      tags = None;
      appliesTo = None;
    }
  in
  test_case.params

let () =
  match test_record_access () with
  | Some _ -> Stdio.printf "Has params\n"
  | None -> Stdio.printf "No params\n"
