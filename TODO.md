## HTTP

[ ] Make Http module a functor that returns a new HTTP module with its own connection pool
  on the same switch
[ ] Return connection to connection pool only once the body is drained / read
[ ] Run multiple requests in parallel for HTTP/2 connections but not HTTP/1.1 connections