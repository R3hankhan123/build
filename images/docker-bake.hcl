variable "IMAGE" {
}

variable "NAMESPACE" {
}

group "default" {
	targets = ["all"]
}

target "all" {
	args = {
		BASE = "quay.io/r3hankhan/shipwright-io/base-base:"
	}
	tags = ["${IMAGE}:latest"]
	platforms = ["linux/amd64", "linux/arm64", "linux/ppc64le", "linux/s390x"]
}


