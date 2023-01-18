FROM debezium/server:1.9.7.Final

USER root

COPY libs/debezium-connector-yugabytedb-1.9.5.y.15.jar lib/debezium-connector-yugabytedb-1.9.5.y.15.jar

COPY libs/jdbc-yugabytedb-42.3.5-yb-1.jar lib/jdbc-yugabytedb-42.3.5-yb-1.jar

RUN chown -R jboss lib/

USER jboss
