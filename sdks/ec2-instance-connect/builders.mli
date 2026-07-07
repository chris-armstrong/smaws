open Types

val make_send_serial_console_ssh_public_key_response :
  ?success:success -> ?request_id:request_id -> unit -> send_serial_console_ssh_public_key_response

val make_send_serial_console_ssh_public_key_request :
  ?serial_port:serial_port ->
  ssh_public_key:ssh_public_key ->
  instance_id:instance_id ->
  unit ->
  send_serial_console_ssh_public_key_request

val make_send_ssh_public_key_response :
  ?success:success -> ?request_id:request_id -> unit -> send_ssh_public_key_response

val make_send_ssh_public_key_request :
  ?availability_zone:availability_zone ->
  ssh_public_key:ssh_public_key ->
  instance_os_user:instance_os_user ->
  instance_id:instance_id ->
  unit ->
  send_ssh_public_key_request
