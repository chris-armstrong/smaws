module Option = struct
  include Option

  let get_or_exn ~exn o = match o with Some v -> v | None -> raise exn
end

module Document = Yojson.Basic
module Timestamp = Ptime

module Resource = struct
  type t = unit
end
