# Centos 6 In Docker
Docker Image for Centos6 and PHP7.4

# Platform
- currently being used on M1 Macs with the platform switch

# Build
To build locally run colima and use the following command(s)

```
    docker build -t ${username}/centos6php
```

# Run locally

```
    docker run -it --platform=linux/amd64 ${username}/centos6php bin/bash
```

# Validate

```
    php -v
```
Output

```
PHP 5.3.3 (cli) (built: Nov  1 2019 12:28:08) 
Copyright (c) 1997-2010 The PHP Group
Zend Engine v2.3.0, Copyright (c) 1998-2010 Zend Technologies
```
