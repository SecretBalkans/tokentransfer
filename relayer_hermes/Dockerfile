# This Dockerfile will: 
# set up a Rust environment(using Rust Docker Image)
# and install the Hermes Relayer

# Use Rust Docker Image
FROM rust:1.61.0

# Set working dir
WORKDIR /home/hermes

RUN rustup default nightly && rustup update

# Install Hermes
RUN cargo install ibc-relayer-cli@1.4.0 --bin hermes --locked

# Copy config file
COPY ./config.toml /root/.hermes/config.toml

# Validate the config file during image building
RUN hermes config validate

# Copy mnemonic files
COPY ./secret.json /home/hermes/secret.json
COPY ./osmosis.json /home/hermes/osmosis.json

# Copy entrypoint script
COPY ./run-relayer.sh /home/hermes/

# Set permission
RUN chmod +x ./run-relayer.sh

# Run entrypoint script
# ENTRYPOINT ["/bin/bash", "-c", "/home/hermes/run-relayer.sh"]

# build with
# docker build -f Dockerfile . -t relayer_hermes