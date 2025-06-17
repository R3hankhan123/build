variable "IMAGE" {
}

variable "NAMESPACE" {
}
variable "TAG" {
	default = "latest"
}
variable "DOCKERFILE" {
	default = "Dockerfile"
}
variable "BUILD_IMAGE" {
	default = "registry.access.redhat.com/ubi10:10.0-1747220028"
}
group "default" {
	targets = ["all"]
}

target "all" {
	args = {
		BUILD_IMAGE= "${BUILD_IMAGE}"
		BASE = "quay.io/r3hankhan/shipwright-io/base-base:${TAG}"
	}
	dockerfile = "${DOCKERFILE}"
	tags = ["${IMAGE}:${TAG}"]
	platforms = ["linux/amd64", "linux/arm64", "linux/ppc64le", "linux/s390x"]
}


