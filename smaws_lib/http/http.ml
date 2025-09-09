include Http_types

module type Client_intf = Http_client_intf.S
module type Eio_client_intf = Http_eio_client.S

module Client = Http_eio_client.Make (Http_eio_connection.M)

module type Http_factory = sig
  type client_t
  
  val make :
    sw:Eio.Switch.t ->
    < mono_clock : [> `Clock of Mtime.t ] Eio.Resource.t
    ; net : [> `Network | `Platform of [> `Generic | `Unix ] ] Eio.Resource.t
    ; .. > ->
    client_t

  val client_module : unit -> (module Client_intf with type t = client_t)
end

module Default_http_factory : Http_factory with type client_t = Client.t = struct
  type client_t = Client.t
  
  let make = Client.make
  
  let client_module () = (module Client : Client_intf with type t = client_t)
end
