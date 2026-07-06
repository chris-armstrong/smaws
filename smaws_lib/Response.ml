type metadata = { request_id : string option }
type 'a t = { response : 'a; metadata : metadata }

let map ~f { response; metadata } = { response = f response; metadata }
