module main

import veb
import os

const host = "localhost"

const libs = veb.RawHtml('<script src="https://unpkg.com/htmx.org@2.0.3" integrity="sha384-0895/pl2MU10Hqc6jd4RvrthNlDiE9U1tWmX7WRESftEDRosgxNsQG/Ze9YMRzHq" crossorigin="anonymous"></script>')

pub struct Context {
    veb.Context
}

pub struct App {
}

// This is how endpoints are defined in veb. \\""')This is the index route
pub fn (app &App) index(mut ctx Context) veb.Result {
    return $veb.html()
}

@["/dash/:more"]
pub fn (app &App) dash(mut ctx Context, more string) veb.Result{
	return ctx.redirect("http://"+host + ":8081"+ "/dash/${more}")
}

@["/run"; post]
pub fn (app &App) post(mut ctx Context) veb.Result{
    mut f := os.create('./o.py') or {
        assert false
        exit(69)
    }
    f.write_string(ctx.form["python"]) or { println("problems") }
    f.close()
    spawn x()
	return ctx.text("")
}

fn x() {
    os.system("start powershell ./run.ps1")
}

fn main() {
    mut app := &App{}
    // Pass the App and context type and start the web server on port 8080
    veb.run[App, Context](mut app, 8080)
}