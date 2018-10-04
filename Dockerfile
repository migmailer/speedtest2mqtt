FROM hypriot/rpi-python:2.7.3

RUN apt-get update && apt-get install -y mosquitto-clients perl
ADD speedtest2mqtt.sh /opt/speedtest2mqtt.sh
ADD speedtest-cli /opt/speedtest-cli

RUN    chmod 777 /opt/speedtest2mqtt.sh
RUN    chmod 777 /opt/speedtest-cli
RUN    groupadd -r foo
RUN    useradd --no-log-init -r -g foo foo

USER foo

CMD ["/opt/speedtest2mqtt.sh"]

