FROM tezos/tezos:13.0

# Install AWS CLI

USER root
RUN \
	apk -Uuv add groff less curl jq && \
	apk -Uuv add python3 py3-pip && \
	pip install six awscli

COPY ./start-updater.sh /home/tezos/start-updater.sh
RUN chmod 755 /home/tezos/start-updater.sh

USER tezos
EXPOSE 8732 9732
ENTRYPOINT ["/home/tezos/start-updater.sh"]
