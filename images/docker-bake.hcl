variable "IMAGE" {
}

variable "NAMESPACE" {
}

variable "TAG" {
  default = "latest"
}

group "default" {
	targets = ["all"]
}

target "all" {
	args = {
		BASE = "quay.io/r3hankhan/shipwright-io/base-base:latest"
	}
	tags = ["${IMAGE}:${TAG}"]
	platforms = ["linux/amd64", "linux/arm64", "linux/ppc64le", "linux/s390x"]
}


