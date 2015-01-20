Sanji buildpack: Python
=======================
This is a Sanji buildpack for Python bundles, powered by pip.

Prerequisite
------------
- [Docker](https://docs.docker.com/installation/debian/)
- [QEMU](https://wiki.debian.org/QemuUserEmulation)
  - default ARCH=**armhf**

Usage
-----

**Init**
```
    $ make init
```  
**Install**
  - Install whole new bundles to target device.
```
    $ make install TARGET=192.168.31.88
```
    
**Deploy**
  - Deploy lastest update to target device.
```
    $ make deploy TARGET=192.168.31.88
```
**Build**
```
    $ make build
```

    
