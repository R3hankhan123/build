variable "IMAGE" {
}

variable "NAMESPACE" {
}

variable "UBI" {
}

variable "DOCKERFILE" {
}

group "default" {
	targets = ["all"]
}

target "all" {
	args = {
		BASE = "quay.io/r3hankhan/shipwright-io/base-base:${UBI}-latest"
	}
	dockerfile = DOCKERFILE
	tags = ["${IMAGE}:${UBI}-latest"]
	platforms = ["linux/amd64", "linux/arm64", "linux/ppc64le", "linux/s390x"]
}


