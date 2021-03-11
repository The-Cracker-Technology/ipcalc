# ipcalc(1) - Perform simple operations on IP addresses and networks

## SYNOPSIS
**ipcalc** [OPTION]... <IP address>[/prefix] [netmask]


## Description

**ipcalc** provides a simple way to calculate IP information for a host
or network. Depending on the options specified, it may be used to provide
IP network information in human readable format, in a format suitable for
parsing in scripts, generate random private addresses, resolve an IP address,
or check the validity of an address.

By default or when the **--info** or **--all-info** parameters
are specified the information provided is free form and human readable.
Otherwise the output is JSON formatted when **-j** is specified,
or when specific options are given (e.g., **--prefix**) the output is
in the **VAR=VALUE** format.

The various options specify what information **ipcalc** should display
on standard output. Multiple options may be specified.  It is required
to specify an IP address; several operations require
a netmask or a CIDR prefix as well.


## Options

* **-c**, **--check**
  Validate the IP address under the specified family.

* **-i**, **--info**
  Display generic information on the provided network in human readable format.
  This is the default option if no other options are provided.

* **--all-info**
  Display verbose information on the provided network and addresses in human
  readable format. That includes GeoIP information.

* **-S**, **--split**
  Split the provided network using the specified prefix or netmask. That is,
  split up the network into smaller chunks of a specified prefix. When
  combined with no-decorate mode (**--no-decorate**), the split networks
  will be printed in raw form. Example "ipcalc -S 26 192.168.1.0/24".

* **-d**, **--deaggregate**
  Deaggregates the provided address range. That is, print the networks that
  cover the range. The range is given using the '-' separator, e.g.,
  "192.168.1.3-192.168.1.23". When combined with no-decorate mode
  (**--no-decorate**), the networks are printed in raw form.

* **-r**, **--random-private**
  Generate a random private address using the supplied prefix or mask. By default
  it displays output in human readable format, but may be combined with
  other options (e.g., **--network**) to display specific information in
  **VAR=VALUE** format.

* **-h**, **--hostname**
  Display the hostname for the given IP address.
  The variable exposed is HOSTNAME.

* **-o**, **--lookup-host**
  Display the IP address for the given hostname.
  The variable exposed is ADDRESS.

* **-4**, **--ipv4**
  Explicitly specify the IPv4 address family.

* **-6**, **--ipv6**
  Explicitly specify the IPv6 address family.

* **-b**, **--broadcast**
  Display the broadcast address for the given IP address and netmask.
  The variable exposed is BROADCAST (if available).

* **-a**, **--address**
  Display the IP address for the given input.
  The variable exposed is ADDRESS (if available).

* **-g**, **--geoinfo**
  Display geographic information for the given IP address. This option
  requires libGeoIP/libmaxminddb to be available. The variables exposed are
  COUNTRYCODE, COUNTRY, CITY and COORDINATES (when available).

* **-m**, **--netmask**
  Calculate the netmask for the given IP address. If no mask or prefix
  is provided, in IPv6 a 128-bit mask is assumed, while in IPv4 it assumes
  that the IP address is in a complete class A, B, or C network. Note,
  however, that many networks no longer use the default netmasks in IPv4.
  The variable exposed is NETMASK.

* **-p**, **--prefix**
  Show the prefix for the given mask/IP address.
  The variable exposed is PREFIX.

* **--class-prefix**
  Assign the netmask of the provided IPv4 address based on the address
  class. This was the default in previous versions of this software.

* **-n**, **--network**
  Display the network address for the given IP address and netmask.
  The variable exposed is NETWORK.

* **--reverse-dns**
  Display the reverse DNS for the given IP address and netmask.
  The variable exposed is REVERSEDNS.

* **--minaddr**
  Display the minimum host address in the provided network.
  The variable exposed is MINADDR.

* **--maxaddr**
  Display the maximum host address in the provided network.
  The variable exposed is MAXADDR.

* **--addresses**
  Display the number of host addresses in the provided network.
  The variable exposed is ADDRESSES.

* **--addrspace**
  Display address space allocation information for the provided network.
  The variable exposed is ADDRSPACE.

* **--no-decorate**
  Print only the requested information. That when combined with
  split networks option, will only print the networks without any
  additions for readability.

* **-j**, **--json**
  When used with -i or -S, print the info as a JSON object
  instead of the usual output format.

* **-s**, **--silent**
  Don't ever display error messages.


## Examples

### Display all information of an IPv4
```
$ ipcalc --all-info 193.92.150.2/24
Address:        193.92.150.2
Network:        193.92.150.0/24
Netmask:        255.255.255.0 = 24
Broadcast:      193.92.150.255
Reverse DNS:    150.92.193.in-addr.arpa.

Address space:  Internet
Address class:  Class C
HostMin:        193.92.150.1
HostMax:        193.92.150.254
Hosts/Net:      254

Country code:   GR
Country:        Greece
```

### Display information in key-value format
```
$ ipcalc -pnmb --minaddr --maxaddr --geoinfo --addrspace 193.92.150.2/255.255.255.224
NETMASK=255.255.255.224
PREFIX=27
BROADCAST=193.92.150.31
NETWORK=193.92.150.0
MINADDR=193.92.150.1
MAXADDR=193.92.150.30
ADDRSPACE="Internet"
COUNTRY="Greece"
```

### Display all information of an IPv6
```
$ ipcalc --all-info 2a03:2880:20:4f06:face:b00c:0:14/64
Full Address:   2a03:2880:0020:4f06:face:b00c:0000:0014
Address:        2a03:2880:20:4f06:face:b00c:0:14
Full Network:   2a03:2880:0020:4f06:0000:0000:0000:0000/64
Network:        2a03:2880:20:4f06::/64
Netmask:        ffff:ffff:ffff:ffff:: = 64
Reverse DNS:    6.0.f.4.0.2.0.0.0.8.8.2.3.0.a.2.ip6.arpa.

Address space:  Global Unicast
HostMin:        2a03:2880:20:4f06::
HostMax:        2a03:2880:20:4f06:ffff:ffff:ffff:ffff
Hosts/Net:      2^(64) = 18446744073709551616

Country code:   IE
Country:        Ireland
```

### Display JSON output

```
$ ipcalc --all-info -j 2a03:2880:20:4f06:face:b00c:0:14/64
{
  "FULLADDRESS":"2a03:2880:0020:4f06:face:b00c:0000:0014",
  "ADDRESS":"2a03:2880:20:4f06:face:b00c:0:14",
  "FULLNETWORK":"2a03:2880:0020:4f06:0000:0000:0000:0000",
  "NETWORK":"2a03:2880:20:4f06::",
  "NETMASK":"ffff:ffff:ffff:ffff::",
  "PREFIX":"64",
  "REVERSEDNS":"6.0.f.4.0.2.0.0.0.8.8.2.3.0.a.2.ip6.arpa.",
  "ADDRSPACE":"Global Unicast",
  "MINADDR":"2a03:2880:20:4f06::",
  "MAXADDR":"2a03:2880:20:4f06:ffff:ffff:ffff:ffff",
  "ADDRESSES":"18446744073709551616",
  "COUNTRYCODE":"IE",
  "COUNTRY":"Ireland",
  "COORDINATES":"53.000000,-8.000000"
}
```

### Lookup of a hostname
```
$ ipcalc --lookup-host localhost --no-decorate
::1
```

### IPv4 lookup of a hostname
```
$ ipcalc --lookup-host localhost --no-decorate -4
127.0.0.1
```

### Reverse lookup of a hostname
```
$ ipcalc -h 127.0.0.1 --no-decorate
localhost
```

## Authors
```
    Nikos Mavrogiannopoulos <nmav@redhat.com>
    Erik Troan <ewt@redhat.com>
    Preston Brown <pbrown@redhat.com>
    David Cantrell <dcantrell@redhat.com>
```

## Reporting Bugs

Report bugs at https://gitlab.com/ipcalc/ipcalc/issues

## Copyright

Copyright © 1997-2020 Red Hat, Inc.
This is free software; see the source for copying conditions.  There is NO
warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR
PURPOSE.
