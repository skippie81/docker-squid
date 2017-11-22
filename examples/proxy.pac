function FindProxyForURL(url, host) {
	// our local URLs from the domains below don't need a proxy:
	if (shExpMatch(host, "*.local") ||
      shExpMatch(host, "*.some.other.domain"))
      return "DIRECT";

	if ( dnsDomainIs(host, "intranet.domain.com") )
      return "DIRECT";

	// URLs within this network don't need a proxy
	if (isInNet(host, "10.0.0.0", "255.0.0.0") ||
      isInNet(host, "192.168.0.0", "255.255.0.0"))
      return "DIRECT";

	// All other requests go through port 3128 of proxy.
	// should that fail to respond, go directly to the WWW:
	return "PROXY myporxyhost:3128; DIRECT";
}
