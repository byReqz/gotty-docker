FROM debian:sid

RUN apt-get update
RUN apt-get install -y curl jq tmux
RUN curl -s https://api.github.com/repos/sorenisanerd/gotty/releases/latest | jq -r '.assets[].browser_download_url' | grep "linux_amd64.tar.gz" | xargs curl -L -o gotty_linux_amd64.tar.gz
RUN tar xvfz gotty_linux_amd64.tar.gz

ENV TERM=xterm-256color
COPY run-deb.sh ./run.sh
RUN chmod +x ./run.sh
ENTRYPOINT ["/run.sh"]
