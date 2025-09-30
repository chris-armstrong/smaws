include Http_types

module type Client_intf = Http_client_intf.S
module type Client = Http_client_intf.SM
(* module type Eio_client_intf = Http_eio_client.S *)

module Http_Client_Eio = Http_eio_client (* .Make (Http_eio_connection.M) *)
module Http_Client_Miou = Http_miou_client
