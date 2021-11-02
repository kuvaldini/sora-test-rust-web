extern crate tiny_http;

use chrono::prelude::*;
use tiny_http::{Server, Response};
use std::env;

fn main(){
    let mut port : String = "8000".to_string();
    match env::var("PORT") {
        Ok(val) =>  port = val, //println!("Binding to port {:?}", val),
        Err(e) => println!("couldn't interpret PORT: {}, using default {}", e, port),
    }
    let server = Server::http("0.0.0.0:".to_owned()+&port).unwrap();

    for request in server.incoming_requests() {
        println!("received request! method: {:?}, url: {:?}, headers: {:?}",
            request.method(),
            request.url(),
            request.headers()
        );

        let dt = Local::now();
        let dt_str = dt.with_timezone(&FixedOffset::east(3*3600)).to_string();
        let response = Response::from_string("Hello world! Time is: ".to_string() + &dt_str);
        request.respond(response);
    }
}
