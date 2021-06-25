FROM alpine:latest

RUN apk update
RUN apk add curl jq tmux libc6-compat
RUN curl -s https://api.github.com/repos/yudai/gotty/releases/latest | jq -r '.assets[].browser_download_url' | grep "gotty_linux_amd64.tar.gz" | xargs curl -L -o gotty_linux_amd64.tar.gz 
RUN tar xvfz gotty_linux_amd64.tar.gz

ENV TERM=xterm-256color
COPY run.sh ./run.sh
RUN chmod +x ./run.sh
ENTRYPOINT ["/run.sh"]
