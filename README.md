# burp-collaborator-docker

![image](https://img.shields.io/travis/com/v1sion/burp-collaborator-docker/master.svg) ![image](https://img.shields.io/microbadger/layers/v1sion/burp-collaborator.svg) ![image](https://img.shields.io/microbadger/image-size/v1sion/burp-collaborator.svg)

Docker image for the Burp Collaborator Server With LetsEncrypt Certificate

## Building the image

To build the image add the Burp Suite JAR to ./config/burp.jar and your LetsEncrypt certificate/keys to ./config/keys/ (cert.pem, fullchain.pem, privkey.pem).
Run the following command for the Makefile:

```bash
make build DOMAIN=<YOUR_DOMAIN> NS=<YOUR_NAME_SERVER> IP=<YOUR_IP>
```

## Running the image

To run the image use the following command for the Makefile:

```bash
make run
```

## References

<https://github.com/integrity-sa/burpcollaborator-docker>

<https://blog.fabiopires.pt/running-your-instance-of-burp-collaborator-server/>

## License

You may copy, distribute and modify the software provided that modifications are described and licensed for free under LGPL-3. Derivatives works (including modifications or anything statically linked to the library) can only be redistributed under LGPL-3, but applications that use the library don't have to be.
