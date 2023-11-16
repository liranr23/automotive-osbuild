# Automotive OSBuild Image

Container image to be used as environment to host osbuild tools for composing Automotive images.

## Instructions

This image can be used as a rootful privileged container to compose Automotive images.

You can build this container using:

```sh
sudo make
```

### podman

Note: containers in these repos must be kept upto date to ensure you can build images with these tools. If these tools do not work please attempt: 1. building/running a new container locally, 2. running `dnf upgrade` in the container and 3. pulling a new container from quay.io

Run a locally built container by running:

```sh
sudo podman run -v $HOME:$HOME -it --rm --privileged localhost/automotive-osbuild /bin/bash
```

Or run a container from quay.io by running:

```sh
sudo podman run -v $HOME:$HOME -it --rm --privileged quay.io/centos-sig-automotive/automotive-osbuild /bin/bash
```

## License

[MIT](./LICENSE)
