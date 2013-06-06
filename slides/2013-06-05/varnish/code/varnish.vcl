backend sinatra {
  .host = "127.0.0.1";
  .port = "4567";
}

sub vcl_recv {
  unset req.http.cookie;
  if(req.url ~ "^/nocache$"){
    return(pass);
  }
  if(req.url ~ "^/error$"){
    return(error);
  }
}

sub vcl_fetch {
  if(req.url ~ "^/cache$"){
    set beresp.ttl = 10s;
  }
  if(req.url ~ "^/nocacheff$"){
    return(hit_for_pass);
  }
}
