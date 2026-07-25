open Types

let make_send_ssh_public_key_response ?request_id:(request_id_ : request_id option)
    ?success:(success_ : success option) () =
  ({ request_id = request_id_; success = success_ } : send_ssh_public_key_response)

let make_send_ssh_public_key_request
    ?availability_zone:(availability_zone_ : availability_zone option)
    ~instance_id:(instance_id_ : instance_id)
    ~instance_os_user:(instance_os_user_ : instance_os_user)
    ~ssh_public_key:(ssh_public_key_ : ssh_public_key) () =
  ({
     instance_id = instance_id_;
     instance_os_user = instance_os_user_;
     ssh_public_key = ssh_public_key_;
     availability_zone = availability_zone_;
   }
    : send_ssh_public_key_request)

let make_send_serial_console_ssh_public_key_response ?request_id:(request_id_ : request_id option)
    ?success:(success_ : success option) () =
  ({ request_id = request_id_; success = success_ } : send_serial_console_ssh_public_key_response)

let make_send_serial_console_ssh_public_key_request ?serial_port:(serial_port_ : serial_port option)
    ~instance_id:(instance_id_ : instance_id) ~ssh_public_key:(ssh_public_key_ : ssh_public_key) ()
    =
  ({ instance_id = instance_id_; serial_port = serial_port_; ssh_public_key = ssh_public_key_ }
    : send_serial_console_ssh_public_key_request)
