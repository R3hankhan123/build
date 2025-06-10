variable "IMAGE" {
}

variable "NAMESPACE" {
}

variable "UBI" {
}

group "default" {
	targets = ["all"]
}

target "all" {
	args = {
		BASE = "quay.io/r3hankhan/shipwright-io/base-base:${UBI}-latest"
	}
	dockerfile = (IMAGE == "base" || IMAGE == "image-processing") && UBI == "ubi10" ? "Dockerfile.ubi10" : "Dockerfile"
	tags = ["quay.io/r3hankhan/shipwright-io/base-${IMAGE}:${UBI}-latest"]
	platforms = ["linux/amd64", "linux/arm64", "linux/ppc64le", "linux/s390x"]
}


