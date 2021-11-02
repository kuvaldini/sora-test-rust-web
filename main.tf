terraform {
  required_providers {
    heroku = {
      source  = "heroku/heroku"
      version = "~> 4.0"
    }
  }
}

resource "heroku_app" "foobar" {
  name   = "sora-test-task"
  region = "eu"

  config_vars = {
    FOOBAR = "baz"
  }

  buildpacks = [
    #"heroku/go"
    "emk/rust",
    "https://github.com/emk/heroku-buildpack-rust"
  ]
}

resource "heroku_build" "foobar" {
  app        = heroku_app.foobar.id
  buildpacks = ["https://github.com/emk/heroku-buildpack-rust"]

  source {
    # This app uses a community buildpack, set it in `buildpacks` above.
    path     = "./webserver"
    version = "v1.0.0"
  }
}

resource "heroku_formation" "foobar" {
  app        = heroku_app.foobar.id
  type       = "web"
  quantity   = 1
  size       = "Standard-1x"
  depends_on = [ heroku_build.foobar ]
}
