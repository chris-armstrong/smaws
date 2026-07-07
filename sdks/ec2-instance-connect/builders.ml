open Types

let make_send_serial_console_ssh_public_key_response ?success:(success_ : success option)
    ?request_id:(request_id_ : request_id option) () =
  ({ success = success_; request_id = request_id_ } : send_serial_console_ssh_public_key_response)

let make_send_serial_console_ssh_public_key_request ?serial_port:(serial_port_ : serial_port option)
    ~ssh_public_key:(ssh_public_key_ : ssh_public_key) ~instance_id:(instance_id_ : instance_id) ()
    =
  ({ ssh_public_key = ssh_public_key_; serial_port = serial_port_; instance_id = instance_id_ }
    : send_serial_console_ssh_public_key_request)

let make_send_ssh_public_key_response ?success:(success_ : success option)
    ?request_id:(request_id_ : request_id option) () =
  ({ success = success_; request_id = request_id_ } : send_ssh_public_key_response)

let make_send_ssh_public_key_request
    ?availability_zone:(availability_zone_ : availability_zone option)
    ~ssh_public_key:(ssh_public_key_ : ssh_public_key)
    ~instance_os_user:(instance_os_user_ : instance_os_user)
    ~instance_id:(instance_id_ : instance_id) () =
  ({
     availability_zone = availability_zone_;
     ssh_public_key = ssh_public_key_;
     instance_os_user = instance_os_user_;
     instance_id = instance_id_;
   }
    : send_ssh_public_key_request)
