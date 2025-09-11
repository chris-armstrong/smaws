include Http_types

module type Client_intf = Http_client_intf.S

module type Client = sig
  include Client_intf

  val make : unit -> t
end

module type Eio_client_intf = Http_eio_client.S

module Http_Client_Eio = Http_eio_client.Make (Http_eio_connection.M)
