FROM debian:stable-slim

ARG MEGA_USERNAME
ARG MEGA_PASSWORD
ARG QUEUE_PATH=/queue
ARG REMOTE_PATH=/

ENV MEGA_USERNAME=${MEGA_USERNAME}
ENV MEGA_PASSWORD=${MEGA_PASSWORD}
ENV QUEUE_PATH=${QUEUE_PATH}
ENV REMOTE_PATH=${REMOTE_PATH}

RUN mkdir -p ${QUEUE_PATH}

VOLUME ${QUEUE_PATH}

# Oh My Posh by MFedatto
RUN apt update
RUN apt install -y \
    curl \
    unzip \
    wget
RUN curl -s https://gist.githubusercontent.com/mfedatto/475a009c0713428503fed83b62a3a2e4/raw/6275e85e643244be535f288b2b8c62e6562adb1f/mfedatto-omp-bash.sh | bash
RUN curl -s https://gist.githubusercontent.com/mfedatto/475a009c0713428503fed83b62a3a2e4/raw/6275e85e643244be535f288b2b8c62e6562adb1f/mfedatto-context.sh | bash -s -- \
    docker \
    \\#e5f2fc \
    \\#00084d
RUN rm -rf ~/themes

# MEGACMD
RUN wget https://mega.nz/linux/repo/Debian_12/amd64/megacmd-Debian_12_amd64.deb
RUN apt install -y \
    "$PWD/megacmd-Debian_12_amd64.deb"

# Clean-up
RUN apt install -y deborphan
RUN deborphan | xargs apt -y remove --purge
RUN apt autoremove -y
RUN apt clean
RUN rm -rf /var/tmp/* /var/log/*.log

COPY entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
