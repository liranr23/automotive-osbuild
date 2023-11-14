IMAGE_NAME_OSBUILD := automotive-osbuild

.PHONY: image/build
image/build:
	buildah bud -f Containerfile -t localhost/${IMAGE_NAME_OSBUILD}:latest .
