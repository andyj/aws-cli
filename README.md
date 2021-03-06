# AWS CLI in Docker which is Digital Ocean compliant

Containerized AWS CLI on alpine to avoid requiring the aws cli to be installed on CI machines. Forked from [mesosphere/aws-cli](https://github.com/mesosphere/aws-cli)

## Build

```
docker build -t andyjarrett/aws-cli .
```

Automated build on Docker Hub

[![DockerHub Badge](http://dockeri.co/image/andyjarrett/aws-cli)](https://hub.docker.com/r/andyjarrett/aws-cli/)

## Usage

Configure:

```
export AWS_ACCESS_KEY_ID="<id>"
export AWS_SECRET_ACCESS_KEY="<key>"
export AWS_DEFAULT_REGION="<region>"
export ENDPOINT="<ENDPOINT>"
```





## Open up the container and run from bash

```
docker run --rm -it --env AWS_ACCESS_KEY_ID=${AWS_ACCESS_KEY_ID} \
  --env AWS_SECRET_ACCESS_KEY=${AWS_SECRET_ACCESS_KEY} \
  --env AWS_DEFAULT_REGION=${AWS_DEFAULT_REGION} \
  --env ENDPOINT=${ENDPOINT} \
  --env cmd=interactive \
  -v $(pwd):/project \
  andyjarrett/aws-cli
```


If you've downloaded the Dockerfile locally

```
docker build -t awscli . && docker run -it \
  --env AWS_ACCESS_KEY_ID=${AWS_ACCESS_KEY_ID} \
  --env AWS_SECRET_ACCESS_KEY=${AWS_SECRET_ACCESS_KEY} \
  --env AWS_DEFAULT_REGION=${AWS_DEFAULT_REGION} \
  --env ENDPOINT=${ENDPOINT} \
  --env cmd=interactive \
  -v $(pwd):/project \
  awscli
```



## Install

To use `aws.sh` as a drop-in replacement for calls to the aws-cli, use one of the following methods:


Add an alias to your shell:

```
alias aws='docker run --rm -t $(tty &>/dev/null && echo "-i") \
  -e "AWS_ACCESS_KEY_ID=${AWS_ACCESS_KEY_ID}" \
  -e "AWS_SECRET_ACCESS_KEY=${AWS_SECRET_ACCESS_KEY}" \
  -e "AWS_DEFAULT_REGION=${AWS_DEFAULT_REGION}" \
  -e "ENDPOINT=${ENDPOINT}" \
  -v "$(pwd):/project" \
  andyjarrett/aws-cli'
```

Or drop it into your path named `aws`:

```
curl -o /usr/local/bin/aws https://raw.githubusercontent.com/andyj/aws-cli/master/aws.sh && chmod a+x /usr/local/bin/aws
```

Upload file to S3:

```
./aws.sh s3 ls s3://[YOUR BUCKET] --recursive --human-readable --summarize
```

Caveat: Because `aws.sh` mounts the current directory as `/project`, paths to local files must be relative to the current directory.



## References

AWS CLI Docs: https://aws.amazon.com/documentation/cli/


# License

Copyright 2016-2017

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this repository except in compliance with the License.

The contents of this repository are solely licensed under the terms described in the [LICENSE file](./LICENSE) included in this repository.

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
