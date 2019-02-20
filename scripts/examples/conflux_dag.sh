#!/bin/bash

rm -rf iri-1.5.5.jar 
cd ../../ 
mvn clean ; mvn package
cp target/iri-1.5.5.jar scripts/examples/
cd scripts/examples/
rm -rf testnetdb*
rm -rf ixi
rm streamnet*
  
java -jar iri-1.5.5.jar --testnet \
                        --mwm 1 \
                        --walk-validator "NULL" \
                        --ledger-validator "NULL" \
                        -p 14700 \
                        --max-peers 40 \
                        --remote \
                        --enable-streaming-graph \
                        --entrypoint-selector-algorithm "KATZ" \
                        --tip-sel-algo "CONFLUX" \
                        --ipfs-txns false \
                        &>  streamnet.log &
