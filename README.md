# Automotive OSBuild Image

Container image to be used as environment to host osbuild tools for composing Automotive images.

## Instructions

This image can be used as a rootful privileged container to compose Automotive images.

You can build this container using:

```sh
sudo make
```

### podman

Run container by running:

```sh
sudo podman run -v $HOME:$HOME -it --rm --privileged automotive-osbuild /bin/bash
```

## License

[MIT](./LICENSE)
