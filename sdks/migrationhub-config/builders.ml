open Types

let make_target ?id:(id_ : target_id option) ~type_:(type__ : target_type) () =
  ({ id = id_; type_ = type__ } : target)

let make_home_region_control ?requested_time:(requested_time_ : requested_time option)
    ?target:(target_ : target option) ?home_region:(home_region_ : home_region option)
    ?control_id:(control_id_ : control_id option) () =
  ({
     requested_time = requested_time_;
     target = target_;
     home_region = home_region_;
     control_id = control_id_;
   }
    : home_region_control)

let make_get_home_region_request () = (() : unit)

let make_describe_home_region_controls_request ?next_token:(next_token_ : token option)
    ?max_results:(max_results_ : describe_home_region_controls_max_results option)
    ?target:(target_ : target option) ?home_region:(home_region_ : home_region option)
    ?control_id:(control_id_ : control_id option) () =
  ({
     next_token = next_token_;
     max_results = max_results_;
     target = target_;
     home_region = home_region_;
     control_id = control_id_;
   }
    : describe_home_region_controls_request)

let make_delete_home_region_control_request ~control_id:(control_id_ : control_id) () =
  ({ control_id = control_id_ } : delete_home_region_control_request)

let make_create_home_region_control_request ?dry_run:(dry_run_ : dry_run option)
    ~target:(target_ : target) ~home_region:(home_region_ : home_region) () =
  ({ dry_run = dry_run_; target = target_; home_region = home_region_ }
    : create_home_region_control_request)
