#!/bin/sh
java -jar burp.jar --collaborator-server --collaborator-config=burp.config | tee logs.txt
