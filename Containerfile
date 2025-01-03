ARG CONTAINER_IMAGE=quay.io/centos/centos
ARG CONTAINER_TAG=stream9

FROM ${CONTAINER_IMAGE}:${CONTAINER_TAG} AS builder

LABEL com.redhat.component="$NAME" \
      name="$NAME" \
      version="$VERSION" \
      usage="This image can be used with rootful privileged containers" \
      summary="Base image for composing Red Hat In-Vehicle Operating System or CentOS Automotive Stream Distribution images" \
      maintainer="Leonardo Rossetti <lrossett@redhat.com> / Eric Curtin <ecurtin@redhat.com>"

RUN dnf update -y && \
    dnf install -y 'dnf-command(config-manager)' 'dnf-command(copr)'

RUN dnf copr enable -y @osbuild/osbuild-stable && \
    dnf copr enable -y @centos-automotive-sig/osbuild-auto

ARG STREAM9_URL_BASE=https://buildlogs.centos.org/9-stream

# enable crb and autosd repositories
RUN dnf config-manager --set-enabled crb && \
    dnf config-manager --add-repo ${STREAM9_URL_BASE}/automotive/$(arch)/packages-main/ && \
    dnf config-manager --add-repo ${STREAM9_URL_BASE}/autosd/$(arch)/packages-main/

ENV OSBUILD_COMMIT_SHA="86f3459eeff7c219793c9f01ac904e2dd6431a5a"

# install osbuild packages
RUN dnf install -y osbuild osbuild-ostree osbuild-tools make sudo git jq && \
    dnf install -y --nogpgcheck android-tools osbuild-auto && \
    dnf clean all

COPY /test /
