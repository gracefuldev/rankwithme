FROM ruby:3

ARG USERNAME=developer
ARG USER_UID=1000
ARG USER_GID=$USER_UID

# Install basic development tools
RUN apt update && apt install -y less man-db sudo ripgrep gh

# Set up unprivileged local user
RUN groupadd --gid $USER_GID $USERNAME \
    && groupadd bundler \
    && useradd --uid $USER_UID --gid $USER_GID -m $USERNAME --shell /bin/bash --groups bundler \
    && echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME \
    && chmod 0440 /etc/sudoers.d/$USERNAME

RUN curl -sSL https://s3.amazonaws.com/downloads.cloud66.com/cx_installation/cx_install.sh | bash

# Set unprivileged user as default user
USER $USERNAME

RUN mkdir -m 0744 /home/$USERNAME/.cloud66

# Set `DEVCONTAINER` environment variable to help with orientation
ENV DEVCONTAINER=true

VOLUME /home/$USERNAME/.cloud66