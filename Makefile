# Copyright 2016 The Kubernetes Authors.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Build the guestbook-go example

# Usage:
#   [VERSION=v3] [REGISTRY="staging-k8s.gcr.io"] make build
VERSION?=v3
REGISTRY?=guestbook-go

release: clean build push clean

# builds a docker image that builds the app and packages it into a minimal docker image
build:
	docker build -t ${REGISTRY}/guestbook:${VERSION} .

# push the image to an registry
push:
	docker push ${REGISTRY}/guestbook:${VERSION}

# remove previous images and containers
clean:
	docker rm -f ${REGISTRY}/guestbook:${VERSION} 2> /dev/null || true

.PHONY: release clean build push
