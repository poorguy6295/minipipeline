# Mini pipeline

### Setup

```sh
# Start basic infra
./scripts/start_1.sh

# Setup Yugabyte CDC stream
./scripts/yb_setup.sh

# Start Debezium connector
./scripts/start_debezium.sh

# Seed DB
./scripts/seed_db.sh

# Nuke everything
./scripts/nuke.sh
```

### Caveat

- Yugabyte DB and Table must be created before CDC stream

  - CDC stream only cover whatever table exists at the time of CDC creation

- Debezium server will fail if CDC stream id have no table subcription
