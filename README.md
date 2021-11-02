# The task
Full task test is in pdf [Test-task-for-DevOps.pdf](Test-task-for-DevOps.pdf)

## Build and run local server
```shell
cargo build
cargo run
```
Result executable `sora-test-rust-web` accepts PORT from environment variable.

Than server is accessable on http://127.0.0.1:PORT/ , default is 8000.

Rust and Cargo could be installed with `brew install rust` or use Dockerimage rust:latest `docker run -it rust:latest`, see Dockerfile.

## Dockerfile, dockerimage
Build a docker image with executable server inside
```
docker build -tsora-devops-web .
```

Run it locally
```
docker run -p8000:8000 -ePORT=8000 sora-devops-web
```
Now server is accessable on http://127.0.0.1:8000/

I did not use docker image to push it and run on web - that is redundant. And it better works without additional layers.


## Publish to Heroku with Terraform
```shell
export HEROKU_API_KEY=<TOKEN> HEROKU_EMAIL=<EMAIL>
terraform init
terraform plan
terraform apply
```
Now https://sora-test-task.herokuapp.com/

## Application is reachable on my domain
https://sora-devops-test.kuvaldini.pro/

DNS configuration was made outside of terraform IaC.
