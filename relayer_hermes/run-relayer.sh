#!/bin/sh

hermes keys add --chain secretdev-1 --mnemonic-file "secret.json" --hd-path "m/44'/529'/0'/0/0"
hermes keys add --chain localosmosis --mnemonic-file "osmosis.json"

hermes create channel --a-chain secretdev --b-chain localosmosis --a-port transfer --b-port transfer --new-client-connection
hermes create channel --a-chain localosmosis --b-chain secretdev-1 --a-port transfer --b-port transfer --new-client-connection
hermes start