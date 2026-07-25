open Types

val make_send_ssh_public_key_response :
  ?request_id:request_id -> ?success:success -> unit -> send_ssh_public_key_response

val make_send_ssh_public_key_request :
  ?availability_zone:availability_zone ->
  instance_id:instance_id ->
  instance_os_user:instance_os_user ->
  ssh_public_key:ssh_public_key ->
  unit ->
  send_ssh_public_key_request

val make_send_serial_console_ssh_public_key_response :
  ?request_id:request_id -> ?success:success -> unit -> send_serial_console_ssh_public_key_response

val make_send_serial_console_ssh_public_key_request :
  ?serial_port:serial_port ->
  instance_id:instance_id ->
  ssh_public_key:ssh_public_key ->
  unit ->
  send_serial_console_ssh_public_key_request
