# Squid Internet-proxy Contianer image

Create a container image for the squid internetproxy with verry basic default settings.

## Run

```
docker run -d -p 3128:3128 --name squid  squid:latest
```

## Use

Configure your favorite browser to use the use a proxy at http://\<yourdockerhos\>:3128

### Automatic proxy configuration and discovery

You might serve a proxy.pac file on a local http server for autmatic proxy configuration. See examples/proxy.pac <br>
If you serve the content of proxy.pac file on the root of a http server under the name wpad.dat and have a DNS record wpad.<searchdomain> in your dns you can eable automatic proxy discovery in your browser 

### Build

```
git clone this repo
```

modify source/squid.conf as you want other settings

```
./build.sh [<tag>]
```