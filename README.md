# burp-collaborator

Docker image for the Burp Collaborator Server With LetsEncrypt Certificate

## Building the image

To build the image add the Burp Suite JAR to ./config/burp.jar and your cert/keys to ./config/keys/
Then run the following command for the Makefile

```bash
make build DOMAIN=<YOUR_DOMAIN> NS=<YOUR_NAME_SERVER> IP=<YOUR_IP>
```

## Running the image

To run the image use the following command for the Makefile :

```bash
make run
```
