open Types

let make_get_home_region_request () = (() : unit)

let make_target ?id:(id_ : target_id option) ~type_:(type__ : target_type) () =
  ({ type_ = type__; id = id_ } : target)

let make_home_region_control ?control_id:(control_id_ : control_id option)
    ?home_region:(home_region_ : home_region option) ?target:(target_ : target option)
    ?requested_time:(requested_time_ : requested_time option) () =
  ({
     control_id = control_id_;
     home_region = home_region_;
     target = target_;
     requested_time = requested_time_;
   }
    : home_region_control)

let make_describe_home_region_controls_request ?control_id:(control_id_ : control_id option)
    ?home_region:(home_region_ : home_region option) ?target:(target_ : target option)
    ?max_results:(max_results_ : describe_home_region_controls_max_results option)
    ?next_token:(next_token_ : token option) () =
  ({
     control_id = control_id_;
     home_region = home_region_;
     target = target_;
     max_results = max_results_;
     next_token = next_token_;
   }
    : describe_home_region_controls_request)

let make_delete_home_region_control_request ~control_id:(control_id_ : control_id) () =
  ({ control_id = control_id_ } : delete_home_region_control_request)

let make_create_home_region_control_request ?dry_run:(dry_run_ : dry_run option)
    ~home_region:(home_region_ : home_region) ~target:(target_ : target) () =
  ({ home_region = home_region_; target = target_; dry_run = dry_run_ }
    : create_home_region_control_request)
