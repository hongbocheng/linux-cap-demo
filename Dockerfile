FROM mcr.microsoft.com/azure-cli
RUN apk add libcap
RUN adduser -D -u 1000 -s /bin/bash contest
RUN sh -c 'echo "contest:secret_new" | chpasswd'
RUN apk add strace
RUN apk add sudo
COPY test.py /test.py
COPY sudoers /etc/sudoers
RUN chown root:wheel /etc/sudoers
RUN chmod 400 /etc/sudoers
RUN setcap 'CAP_FOWNER=eip' /test.py
ENTRYPOINT sleep 99999999
