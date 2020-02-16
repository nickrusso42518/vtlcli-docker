# Velocity Template Language (VTL) CLI in Docker
Simple Docker wrapper for the [vtl-cli](https://github.com/plavjanik/vtl-cli)
project built by [Petr Plavjanik](https://github.com/plavjanik). It uses
existing [OpenJDK](https://openjdk.java.net/) containers on
[Dockerhub](https://hub.docker.com/_/openjdk) to create a runtime environment
for the Java app, increasing portability.

> Contact information:\
> Email:    njrusmc@gmail.com\
> Twitter:  @nickrusso42518

## Purpose
I create this wrapper mostly for network engineers who interact with
[Cisco's Digital Network Architecture Center (DNAC)](
https://www.cisco.com/c/en/us/products/cloud-systems-management/dna-center/index.html)
as it uses [VTL](https://velocity.apache.org/) for its templating system.
Not everyone has immediate write access to DNAC, and this tool is meant to
eliminate that barrier. However, the tool can be used for any other purpose.

## Getting Started
Run the following commands below to get started. Be sure
you have `docker` installed.
```
# Download the image using your desired version tag
docker pull nickrusso42518/vtlcli-docker:latest

# Create the bind mount directory
mkdir vtlmount/

# Optionally populate vtlmount/ with variable and template files
# See "Using Your Own Files" for more information

# Run a new container, again using your desired version tag
docker container run -it \
  --mount type=bind,source="$(pwd)"/vtlmount,target=/vtlmount \
  nickrusso42518/vtlcli-docker:latest

# You should be in the container shell now

cat sample/README.md
```

## Sample
I've included a simple NTP configuration sample, which you can explore
here on GitHub. It generates a Cisco IOS NTP configuration based on some
simple variables, using simple VTL constructs like `if/else`, `for`, and
basic variable substitution.

```
/ # ./vtl -y sample/vars.yml sample/ntp.vtl
ntp authenticate
no ntp logging
ntp authentication-key 1 md5 secretKey111
ntp authentication-key 2 md5 secretKey222
ntp server 192.0.2.1 key 1
ntp server 192.0.2.2 key 2
```

## Using Your Own Files
Put your template file (`.vtl`) and variable file (`.yml`) in your current
working directory inside the `vtlmount` folder you created. When you enter
the docker container you can reference them using the following syntax:
`./vtl -y vtlmount/my_vars.yml vtlmount/my_template.vtl`

