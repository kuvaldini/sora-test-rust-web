# The task
Full task test is in pdf [Test-task-for-DevOps.pdf](Test-task-for-DevOps.pdf)

## Build and run
```shell
cargo build
cargo run
```
Result executable `sora-test-rust-web` accepts PORT from environment variable.

Rust and Cargo could be installed with `brew install rust` or use Dockerimage rust:latest `docker run -it rust:latest`, see Dockerfile.


## Terraform to Heroku
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
