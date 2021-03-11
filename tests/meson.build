testrunner = find_program('ipcalc-testrunner.sh')

# Incompatible combinations test
test('Split-Info',
	testrunner,
	args : [
		'--test-failure',
		ipcalc.full_path() + ' -abmnp -S 26 10.100.1.0/24'
	]
)
test('Check-Info',
	testrunner,
	args : [
		'--test-failure',
		ipcalc.full_path() + ' -c -abmnp 10.100.1.1'
	]
)
test('Check-Split',
	testrunner,
	args : [
		'--test-failure',
		ipcalc.full_path() + ' -c -S 26 10.100.1.0/24'
	]
)
test('Check-Host',
	testrunner,
	args : [
		'--test-failure',
		ipcalc.full_path() + ' -c -h 127.0.0.1'
	]
)
test('Random-Info',
	testrunner,
	args : [
		'--test-failure',
		ipcalc.full_path() + ' -r 24 -i 127.0.0.1'
	]
)
test('Random',
	testrunner,
	args : [
		'--test-success',
		ipcalc.full_path() + ' -r 24' + '|grep Address'
	]
)
test('RandomAddress',
	testrunner,
	args : [
		'--test-success',
		ipcalc.full_path() + ' -r 24 -a' + '|grep ADDRESS'
	]
)
test('RandomIPv6Implicit',
	testrunner,
	args : [
		'--test-success',
		ipcalc.full_path() + ' -r 112' + '|grep Address'
	]
)
test('RandomIPv6Explicit',
	testrunner,
	args : [
		'--test-success',
		ipcalc.full_path() + ' -6 -r 24' + '|grep Address'
	]
)
test('HostnameIPv6Localhost',
	testrunner,
	args : [
		'--test-outfile',
		ipcalc.full_path() + ' -6 -o localhost',
		files('hostname-localhost-ipv6')
	]
)
test('HostnameIPv4Localhost',
	testrunner,
	args : [
		'--test-outfile',
		ipcalc.full_path() + ' -4 -o localhost',
		files('hostname-localhost-ipv4')
	]
)
test('HostnameIPv4LocalhostJson',
	testrunner,
	args : [
		'--test-outfile',
		ipcalc.full_path() + ' -j -4 -o localhost',
		files('hostname-localhost-ipv4-json')
	]
)
test('IPIPv6Localhost',
	testrunner,
	args : [
		'--test-outfile',
		ipcalc.full_path() + ' -h ::1',
		files('ip-localhost-ipv6')
	]
)
test('IPIPv4Localhost',
	testrunner,
	args : [
		'--test-outfile',
		ipcalc.full_path() + ' -h 127.0.0.1',
		files('ip-localhost-ipv4')
	]
)
test('IPIPv4LocalhostJson',
	testrunner,
	args : [
		'--test-outfile',
		ipcalc.full_path() + ' -j -h 127.0.0.1',
		files('ip-localhost-ipv4-json')
	]
)
# --class-prefix tests
test('AssignClassPrefix12',
	testrunner,
	args : [
		'--test-outfile',
		ipcalc.full_path() + ' -abmnp 12.15.1.5 --class-prefix',
		files('12.15.1.5')
	]
)
test('AssignClassPrefix129',
	testrunner,
	args : [
		'--test-outfile',
		ipcalc.full_path() + ' -abmnp 129.15.31.5 --class-prefix',
		files('129.15.31.5')
	]
)
test('AssignClassPrefix193',
	testrunner,
	args : [
		'--test-outfile',
		ipcalc.full_path() + ' -abmnp 193.92.31.0 --class-prefix',
		files('193.92.31.0')
	]
)

# prefix tests
test('TestPrefix31',
	testrunner,
	args : [
		'--test-outfile',
		ipcalc.full_path() + ' -abmnp 192.168.1.5/31',
		files('192.168.1.5-31')
	]
)
test('TestPrefix24',
	testrunner,
	args : [
		'--test-outfile',
		ipcalc.full_path() + ' -abmnp 10.10.10.5/24',
		files('192.168.1.5-24')
	]
)
test('TestPrefix30',
	testrunner,
	args : [
		'--test-outfile',
		ipcalc.full_path() + ' -abmnp 10.100.4.1/30',
		files('192.168.1.5-30')
	]
)
test('TestPrefix16',
	testrunner,
	args : [
		'--test-outfile',
		ipcalc.full_path() + ' -abmnp 10.100.4.1/16',
		files('192.168.1.5-16')
	]
)
test('TestPrefix8',
	testrunner,
	args : [
		'--test-outfile',
		ipcalc.full_path() + ' -abmnp 10.10.10.10/8',
		files('192.168.1.5-8')
	]
)

# --split tests
test('SplitPrefix18',
	testrunner,
	args : [
		'--test-outfile',
		ipcalc.full_path() + ' -S 18 10.10.10.10/16',
		files('split-10.10.10.0-16-18')
	]
)
test('SplitPrefix24',
	testrunner,
	args : [
		'--test-outfile',
		ipcalc.full_path() + ' -S 24 10.10.10.0/16',
		files('split-10.10.10.0-16-24')
	]
)
test('SplitPrefix26',
	testrunner,
	args : [
		'--test-outfile',
		ipcalc.full_path() + ' -S 26 192.168.5.45/24',
		files('split-192.168.5.45-24-26')
	]
)
test('SplitPrefix29',
	testrunner,
	args : [
		'--test-outfile',
		ipcalc.full_path() + ' -S 29 192.168.5.0/24',
		files('split-192.168.5.0-24-29')
	]
)
test('SplitPrefix31',
	testrunner,
	args : [
		'--test-outfile',
		ipcalc.full_path() + ' -S 31 192.168.5.0/24',
		files('split-192.168.5.0-24-31')
	]
)
test('SplitPrefix32',
	testrunner,
	args : [
		'--test-outfile',
		ipcalc.full_path() + ' -S 32 192.168.5.0/24',
		files('split-192.168.5.0-24-32')
	]
)
test('SplitPrefix64',
	testrunner,
	args : [
		'--test-outfile',
		ipcalc.full_path() + ' -S 64 2a03:2880:20:4f06:face::/56',
		files('split-2a03:2880:20:4f06:face::-56-64')
	]
)
test('SplitPrefix128',
	testrunner,
	args : [
		'--test-outfile',
		ipcalc.full_path() + ' -S 128 fcfa:b4ca:f1d8:125b:dc00::/127',
		files('split-fcfa:b4ca:f1d8:125b:dc00::-127-128')
	]
)
test('SplitPrefix120',
	testrunner,
	args : [
		'--test-outfile',
		ipcalc.full_path() + ' -S 120 fcfa:b4ca:f1d8:125b:dc00::/112',
		files('split-fcfa:b4ca:f1d8:125b:dc00::-112-120')
	]
)

# --no-decorate tests
test('NoDecorateSplitPrefix18',
	testrunner,
	args : [
		'--test-outfile',
		ipcalc.full_path() + ' --no-decorate -S 18 10.10.10.10/16',
		files('nsplit-10.10.10.0-16-18')
	]
)
test('NoDecorateSplitPrefix24',
	testrunner,
	args : [
		'--test-outfile',
		ipcalc.full_path() + ' --no-decorate -S 24 10.10.10.0/16',
		files('nsplit-10.10.10.0-16-24')
	]
)
test('NoDecorateSplitPrefix26',
	testrunner,
	args : [
		'--test-outfile',
		ipcalc.full_path() + ' --no-decorate -S 26 192.168.5.45/24',
		files('nsplit-192.168.5.45-24-26')
	]
)
test('NoDecorateSplitPrefix29',
	testrunner,
	args : [
		'--test-outfile',
		ipcalc.full_path() + ' --no-decorate -S 29 192.168.5.0/24',
		files('nsplit-192.168.5.0-24-29')
	]
)
test('NoDecorateSplitPrefix31',
	testrunner,
	args : [
		'--test-outfile',
		ipcalc.full_path() + ' --no-decorate -S 31 192.168.5.0/24',
		files('nsplit-192.168.5.0-24-31')
	]
)
test('NoDecorateSplitPrefix32',
	testrunner,
	args : [
		'--test-outfile',
		ipcalc.full_path() + ' --no-decorate -S 32 192.168.5.0/24',
		files('nsplit-192.168.5.0-24-32')
	]
)
test('NoDecorateSplitPrefix64',
	testrunner,
	args : [
		'--test-outfile',
		ipcalc.full_path() + ' --no-decorate -S 64 2a03:2880:20:4f06:face::/56',
		files('nsplit-2a03:2880:20:4f06:face::-56-64')
	]
)
test('NoDecorateSplitPrefix128',
	testrunner,
	args : [
		'--test-outfile',
		ipcalc.full_path() + ' --no-decorate -S 128 fcfa:b4ca:f1d8:125b:dc00::/127',
		files('nsplit-fcfa:b4ca:f1d8:125b:dc00::-127-128')
	]
)
test('NoDecorateSplitPrefix120',
	testrunner,
	args : [
		'--test-outfile',
		ipcalc.full_path() + ' --no-decorate -S 120 fcfa:b4ca:f1d8:125b:dc00::/112',
		files('nsplit-fcfa:b4ca:f1d8:125b:dc00::-112-120')
	]
)

# --addrspace tests
test('AllocateAddressSpacePrefix24',
	testrunner,
	args : [
		'--test-outfile',
		ipcalc.full_path() + ' --addrspace -abmnp 193.92.150.3/24',
		files('193.92.150.3-24')
	]
)
test('AllocateAddressSpacePrefix64',
	testrunner,
	args : [
		'--test-outfile',
		ipcalc.full_path() + ' --addrspace -abmnp fd95:6be5:0ae0:84a5::/64',
		files('fd95:6be5:0ae0:84a5::-64')
	]
)
test('AllocateAddressSpacePrefix48',
	testrunner,
	args : [
		'--test-outfile',
		ipcalc.full_path() + ' --addrspace -abmnp fd0b:a336:4e7d::/48',
		files('fd0b:a336:4e7d::-48')
	]
)

# --info tests
test('TestHumanReadableGenericInfoNoPrefix',
	testrunner,
	args : [
		'--test-outfile',
		ipcalc.full_path() + ' -i 2a03:2880:20:4f06:face:b00c:0:1',
		files('i-2a03:2880:20:4f06:face:b00c:0:1')
	]
)
test('TestHumanReadableGenericInfoInternetIPv4',
	testrunner,
	args : [
		'--test-outfile',
		ipcalc.full_path() + ' -i 3.130.45.15',
		files('i-3.130.45.15')
	]
)
test('TestHumanReadableHostOnThisNetwork',
	testrunner,
	args : [
		'--test-outfile',
		ipcalc.full_path() + ' -i 0.0.0.1',
		files('i-0.0.0.1')
	]
)
test('TestHumanReadablePrivateUse1',
	testrunner,
	args : [
		'--test-outfile',
		ipcalc.full_path() + ' -i 10.0.0.1',
		files('i-10.0.0.1')
	]
)
test('TestHumanReadablePrivateUse2',
	testrunner,
	args : [
		'--test-outfile',
		ipcalc.full_path() + ' -i 172.16.0.1',
		files('i-172.16.0.1')
	]
)
test('TestHumanReadablePrivateUse3',
	testrunner,
	args : [
		'--test-outfile',
		ipcalc.full_path() + ' -i 172.31.255.254',
		files('i-172.31.255.254')
	]
)
test('TestHumanReadablePrivateUse4',
	testrunner,
	args : [
		'--test-outfile',
		ipcalc.full_path() + ' -i 192.168.0.1',
		files('i-192.168.0.1')
	]
)
test('TestHumanReadableSharedAddressSpace',
	testrunner,
	args : [
		'--test-outfile',
		ipcalc.full_path() + ' -i 100.64.0.1',
		files('i-100.64.0.1')
	]
)
test('TestHumanReadableLoopback',
	testrunner,
	args : [
		'--test-outfile',
		ipcalc.full_path() + ' -i 127.0.0.1',
		files('i-127.0.0.1')
	]
)
test('TestHumanReadableLoopback2',
	testrunner,
	args : [
		'--test-outfile',
		ipcalc.full_path() + ' -i 127.0.1.1',
		files('i-127.0.1.1')
	]
)
test('TestHumanReadableLinkLocal',
	testrunner,
	args : [
		'--test-outfile',
		ipcalc.full_path() + ' -i 169.254.0.1',
		files('i-169.254.0.1')
	]
)
test('TestHumanReadableIETFProtocolAssignmentsIPv4',
	testrunner,
	args : [
		'--test-outfile',
		ipcalc.full_path() + ' -i 192.0.0.254',
		files('i-192.0.0.254')
	]
)
test('TestHumanReadableServiceContinuityPrefixIPv4',
	testrunner,
	args : [
		'--test-outfile',
		ipcalc.full_path() + ' -i 192.0.0.6',
		files('i-192.0.0.6')
	]
)
test('TestHumanReadableDummyAddressIPv4',
	testrunner,
	args : [
		'--test-outfile',
		ipcalc.full_path() + ' -i 192.0.0.8',
		files('i-192.0.0.8')
	]
)
test('TestHumanReadablePortControlProtocolAnycastIPv4',
	testrunner,
	args : [
		'--test-outfile',
		ipcalc.full_path() + ' -i 192.0.0.9',
		files('i-192.0.0.9')
	]
)
test('TestHumanReadableTraversalUsingRelaysAroundNATAnycast',
	testrunner,
	args : [
		'--test-outfile',
		ipcalc.full_path() + ' -i 192.0.0.10',
		files('i-192.0.0.10')
	]
)
test('TestHumanReadableNAT64DNS64Discovery1',
	testrunner,
	args : [
		'--test-outfile',
		ipcalc.full_path() + ' -i 192.0.0.170',
		files('i-192.0.0.170')
	]
)
test('TestHumanReadableNAT64DNS64Discovery2',
	testrunner,
	args : [
		'--test-outfile',
		ipcalc.full_path() + ' -i 192.0.0.171',
		files('i-192.0.0.171')
	]
)
test('TestHumanReadableAS112v4',
	testrunner,
	args : [
		'--test-outfile',
		ipcalc.full_path() + ' -i 192.31.196.1',
		files('i-192.31.196.1')
	]
)
test('TestHumanReadableDeprecated6to4RelayAnycast',
	testrunner,
	args : [
		'--test-outfile',
		ipcalc.full_path() + ' -i 192.88.99.1',
		files('i-192.88.99.1')
	]
)
test('TestHumanReadableAMTIPv4',
	testrunner,
	args : [
		'--test-outfile',
		ipcalc.full_path() + ' -i 192.52.193.5',
		files('i-192.52.193.5')
	]
)
test('TestHumanReadableDirectDelegationAS112ServiceIPv4',
	testrunner,
	args : [
		'--test-outfile',
		ipcalc.full_path() + ' -i 192.175.48.12',
		files('i-192.175.48.12')
	]
)
test('TestHumanReadableTestNet1',
	testrunner,
	args : [
		'--test-outfile',
		ipcalc.full_path() + ' -i 192.0.2.1',
		files('i-192.0.2.1')
	]
)
test('TestHumanReadableTestNet2',
	testrunner,
	args : [
		'--test-outfile',
		ipcalc.full_path() + ' -i 198.51.100.1',
		files('i-198.51.100.1')
	]
)
test('TestHumanReadableTestNet3',
	testrunner,
	args : [
		'--test-outfile',
		ipcalc.full_path() + ' -i 203.0.113.1',
		files('i-203.0.113.1')
	]
)
test('TestHumanReadableBenchmarking1',
	testrunner,
	args : [
		'--test-outfile',
		ipcalc.full_path() + ' -i 198.18.0.1',
		files('i-198.18.0.1')
	]
)
test('TestHumanReadableBenchmarking2',
	testrunner,
	args : [
		'--test-outfile',
		ipcalc.full_path() + ' -i 198.19.201.71',
		files('i-198.19.201.71')
	]
)
test('TestHumanReadableBenchmarking3',
	testrunner,
	args : [
		'--test-outfile',
		ipcalc.full_path() + ' -i 198.19.255.254',
		files('i-198.19.255.254')
	]
)
test('TestHumanReadableMulticast',
	testrunner,
	args : [
		'--test-outfile',
		ipcalc.full_path() + ' -i 224.0.0.1',
		files('i-224.0.0.1')
	]
)
test('TestHumanReadableReserved1',
	testrunner,
	args : [
		'--test-outfile',
		ipcalc.full_path() + ' -i 240.0.0.1',
		files('i-240.0.0.1')
	]
)
test('TestHumanReadableReserved2',
	testrunner,
	args : [
		'--test-outfile',
		ipcalc.full_path() + ' -i 250.7.93.1',
		files('i-250.7.93.1')
	]
)
test('TestHumanReadableReserved3',
	testrunner,
	args : [
		'--test-outfile',
		ipcalc.full_path() + ' -i 255.255.255.254',
		files('i-255.255.255.254')
	]
)
test('TestHumanReadableLimitedBroadcast',
	testrunner,
	args : [
		'--test-outfile',
		ipcalc.full_path() + ' -i 255.255.255.255',
		files('i-255.255.255.255')
	]
)
test('TestHumanReadableTranslat96',
	testrunner,
	args : [
		'--test-outfile',
		ipcalc.full_path() + ' -i 64:ff9b::2100:951a',
		files('i-64:ff9b::2100:951a')
	]
)
test('TestHumanReadableTranslat48',
	testrunner,
	args : [
		'--test-outfile',
		ipcalc.full_path() + ' -i 64:ff9b:1:ea21:4316:55::1',
		files('i-64:ff9b:1:ea21:4316:55::1')
	]
)
test('TestHumanReadableTEREDO',
	testrunner,
	args : [
		'--test-outfile',
		ipcalc.full_path() + ' -i 2001:0000:50::d78a:0:c',
		files('i-2001:0:50::d78a:0:c')
	]
)
test('TestHumanReadablePortControlProtocolAnycast',
	testrunner,
	args : [
		'--test-outfile',
		ipcalc.full_path() + ' -i 2001:1::1',
		files('i-2001:1::1')
	]
)
test('TestHumanReadableTraversalUsingRelays',
	testrunner,
	args : [
		'--test-outfile',
		ipcalc.full_path() + ' -i 2001:1::2',
		files('i-2001:1::2')
	]
)
test('TestHumanReadableBenchmarking',
	testrunner,
	args : [
		'--test-outfile',
		ipcalc.full_path() + ' -i 2001:2:0:a::5:b7f',
		files('i-2001:2:0:a::5:b7f')
	]
)
test('TestHumanReadableAMT',
	testrunner,
	args : [
		'--test-outfile',
		ipcalc.full_path() + ' -i 2001:3:89:71::ab:1',
		files('i-2001:3:89:71::ab:1')
	]
)
test('TestHumanReadableAS112v6',
	testrunner,
	args : [
		'--test-outfile',
		ipcalc.full_path() + ' -i 2001:4:112::6483:bd12:9010',
		files('i-2001:4:112::6483:bd12:9010')
	]
)
test('TestHumanReadableORCHID',
	testrunner,
	args : [
		'--test-outfile',
		ipcalc.full_path() + ' -i 2001:1e:ab:7::',
		files('i-2001:1e:ab:7::')
	]
)
test('TestHumanReadableORCHIDv2',
	testrunner,
	args : [
		'--test-outfile',
		ipcalc.full_path() + ' -i 2001:2c:ab:7::',
		files('i-2001:2c:ab:7::')
	]
)
test('TestHumanReadableDocumentation',
	testrunner,
	args : [
		'--test-outfile',
		ipcalc.full_path() + ' -i 2001:db8:329::4a',
		files('i-2001:db8:329::4a')
	]
)
test('TestHumanReadableIETFProtocolAssignments',
	testrunner,
	args : [
		'--test-outfile',
		ipcalc.full_path() + ' -i 2001:190:70::e86a:0:b',
		files('i-2001:190:70::e86a:0:b')
	]
)
test('TestHumanReadable6to4',
	testrunner,
	args : [
		'--test-outfile',
		ipcalc.full_path() + ' -i 2002::34',
		files('i-2002::34')
	]
)
test('TestHumanReadableDirectDelegationAS112Service',
	testrunner,
	args : [
		'--test-outfile',
		ipcalc.full_path() + ' -i 2620:4f:8000::7372:ad1',
		files('i-2620:4f:8000::7372:ad1')
	]
)
test('TestHumanReadableUniqueLocalUnicast',
	testrunner,
	args : [
		'--test-outfile',
		ipcalc.full_path() + ' -i fc00:0:a001::bcdf:4',
		files('i-fc00:0:a001::bcdf:4')
	]
)
test('TestHumanReadableLinkScopedUnicast',
	testrunner,
	args : [
		'--test-outfile',
		ipcalc.full_path() + ' -i fe80::b:0:7acd:0:5',
		files('i-fe80::b:0:7acd:0:5')
	]
)
test('TestHumanReadableGenericInfoPrefix48',
	testrunner,
	args : [
		'--test-outfile',
		ipcalc.full_path() + ' -i fd0b:a336:4e7d::/48',
		files('i-fd0b:a336:4e7d::-48')
	]
)

# --split advanced tests
test('SplitLinesByNetworkIPv4',
	testrunner,
	args : [
		'--test-equal',
		ipcalc.full_path() + ' -S 29 192.168.5.0/24 | grep ^Network | wc -l',
		ipcalc.full_path() + ' -S 29 192.168.5.0/24 | grep ^Total | cut -d: -f 2 | tr -d [:space:]'
	]
)
test('SplitLinesByNetworkIPv6',
	testrunner,
	args : [
		'--test-equal',
		ipcalc.full_path() + ' -S 120 fcfa:b4ca:f1d8:125b:dc00::/112 | grep ^Network | wc -l',
		ipcalc.full_path() + ' -S 120 fcfa:b4ca:f1d8:125b:dc00::/112 | grep ^Total|cut -d: -f 2 | tr -d [:space:]'
	]
)

# --help test
test('TestHelpCommand',
	testrunner,
	args : [
		'--test-success',
		ipcalc.full_path() + ' --help'
	]
)

# --check loopback tests
test('ValidateLoopbackIPv4',
	testrunner,
	args : [
		'--test-success',
		ipcalc.full_path() + ' -c 127.0.0.1'
	]
)
test('ValidateLoopbackExplicitIPv6',
	testrunner,
	args : [
		'--test-success',
		ipcalc.full_path() + ' -c -6 ::1'
	]
)
test('ValidateLoopbackIPv6',
	testrunner,
	args : [
		'--test-success',
		ipcalc.full_path() + ' -c ::1'
	]
)

# --check tests
test('ValidatePrivateIPv4',
	testrunner,
	args : [
		'--test-success',
		ipcalc.full_path() + ' -c 192.168.1.1'
	]
)
test('ValidateAbbreviatedGlobalIPv6',
	testrunner,
	args : [
		'--test-success',
		ipcalc.full_path() + ' -c -6 2a01:198:200:300::2'
	]
)
test('ValidateExpandedGlobalIPv6',
	testrunner,
	args : [
		'--test-success',
		ipcalc.full_path() + ' -c -6 2a01:198:200:300:0000:0000:0000:2'
	]
)
test('ValidateCompleteGlobalIPv6',
	testrunner,
	args : [
		'--test-success',
		ipcalc.full_path() + ' -c -6 2a01:0198:0200:0300:0000:0000:0000:0002'
	]
)
test('ValidateLoopbackIPv6WithPrefix',
	testrunner,
	args : [
		'--test-success',
		ipcalc.full_path() + ' -c -6 ::1/128'
	]
)
test('ValidateReservedIPv6WithPrefix',
	testrunner,
	args : [
		'--test-success',
		ipcalc.full_path() + ' -c -6 fec0::1:0:0:c0a8:8002/64'
	]
)

# --check invalid input tests
test('NoValidateInvalidHexIPv6',
	testrunner,
	args : [
		'--test-failure',
		ipcalc.full_path() + ' -c -6 gggg::'
	]
)
# FIXME: This test case unexpectedly works, so it is disabled for now.
#test('NoValidateInvalidBroadcastIPv6',
#	testrunner,
#	args : [
#		'--test-failure',
#		ipcalc.full_path() + ' -b -6 ::1/128'
#	]
#)
test('NoAllowIPv4AndIPv6',
	testrunner,
	args : [
		'--test-failure',
		ipcalc.full_path() + ' -4 -6 2a01:198:200:300:0000:0000:0000:2'
	]
)
test('NoValidateIPv6InIPv4Mode',
	testrunner,
	args : [
		'--test-failure',
		ipcalc.full_path() + ' -c -4 2a01:198:200:300:0000:0000:0000:2'
	]
)
test('NoValidateIPv4AndIPv6WithIPv4Address',
	testrunner,
	args : [
		'--test-failure',
		ipcalc.full_path() + ' -c -4 -6 127.0.0.1'
	]
)
test('NoValidateInvalidPrefixIPv6',
	testrunner,
	args : [
		'--test-failure',
		ipcalc.full_path() + ' -c ::1/999'
	]
)

# --netmask invalid input tests
test('NoValidateNegativePrefix',
	testrunner,
	args : [
		'--test-failure',
		ipcalc.full_path() + ' -m 192.168.1.1/-1'
	]
)
test('NoValidateIPv6PrefixInIPv4Mode',
	testrunner,
	args : [
		'--test-failure',
		ipcalc.full_path() + ' -m 192.168.1.1/64'
	]
)
test('NoValidateInvalidPrefixIPv4',
	testrunner,
	args : [
		'--test-failure',
		ipcalc.full_path() + ' -m 192.168.1.1/99999'
	]
)

# --broadcast output tests
test('CalculateBroadcastAddressFromPrefixIPv4',
	testrunner,
	args : [
		'--test-output',
		ipcalc.full_path() + ' -b 192.168.1.1/24',
		'BROADCAST=192.168.1.255'
	]
)
test('CalculateBroadcastAddressFromNetmaskIPv4',
	testrunner,
	args : [
		'--test-output',
		ipcalc.full_path() + ' -b 192.168.1.1 255.255.255.0',
		'BROADCAST=192.168.1.255'
	]
)

# --netmask output tests
test('CalculateNetmaskPrefix24',
	testrunner,
	args : [
		'--test-output',
		ipcalc.full_path() + ' -m 192.168.1.1/24',
		'NETMASK=255.255.255.0'
	]
)
test('CalculateNetmaskPrefix22',
	testrunner,
	args : [
		'--test-output',
		ipcalc.full_path() + ' -m 172.16.59.222/22',
		'NETMASK=255.255.252.0'
	]
)
test('CalculateNetmaskNoPrefix',
	testrunner,
	args : [
		'--test-output',
		ipcalc.full_path() + ' -m 192.168.1.1',
		'NETMASK=255.255.255.255'
	]
)

# --prefix output tests
test('CalculatePrefix24FromNetmask',
	testrunner,
	args : [
		'--test-output',
		ipcalc.full_path() + ' -p 192.168.1.1 255.255.255.0',
		'PREFIX=24'
	]
)
test('CalculatePrefix32FromNetmask',
	testrunner,
	args : [
		'--test-output',
		ipcalc.full_path() + ' -p 192.168.1.1 255.255.255.255',
		'PREFIX=32'
	]
)
test('CalculatePrefix0FromNetmask',
	testrunner,
	args : [
		'--test-output',
		ipcalc.full_path() + ' -p 192.168.1.1 0.0.0.0',
		'PREFIX=0'
	]
)
test('CalculatePrefix22FromNetmask',
	testrunner,
	args : [
		'--test-output',
		ipcalc.full_path() + ' -p 172.16.59.222 255.255.252.0',
		'PREFIX=22'
	]
)

# --class-prefix output tests
test('CalculateClassNetmask24',
	testrunner,
	args : [
		'--test-output',
		ipcalc.full_path() + ' --class-prefix -m 192.168.1.1',
		'NETMASK=255.255.255.0'
	]
)
test('CalculateClassNetmask8',
	testrunner,
	args : [
		'--test-output',
		ipcalc.full_path() + ' --class-prefix -m 10.1.2.3',
		'NETMASK=255.0.0.0'
	]
)
test('CalculateClassNetmask16',
	testrunner,
	args : [
		'--test-output',
		ipcalc.full_path() + ' --class-prefix -m 129.22.4.3',
		'NETMASK=255.255.0.0'
	]
)

# --network output tests
test('CalculateNetworkFromPrefix32',
	testrunner,
	args : [
		'--test-output',
		ipcalc.full_path() + ' -n 192.168.1.1/32',
		'NETWORK=192.168.1.1'
	]
)
test('CalculateNetworkFromPrefix0',
	testrunner,
	args : [
		'--test-output',
		ipcalc.full_path() + ' -n 192.168.1.1/0',
		'NETWORK=0.0.0.0'
	]
)

# --reverse-dns output tests
test('LookupReverseDNSFromPrefix32IPv4',
	testrunner,
	args : [
		'--test-output',
		ipcalc.full_path() + ' --reverse-dns 193.92.150.3/32',
		'REVERSEDNS=3.150.92.193.in-addr.arpa.'
	]
)
test('LookupReverseDNSFromPrefix26IPv4',
	testrunner,
	args : [
		'--test-output',
		ipcalc.full_path() + ' --reverse-dns 193.92.150.3/26',
		'REVERSEDNS=0-63.150.92.193.in-addr.arpa.'
	]
)
test('LookupReverseDNSFromPrefix16IPv4',
	testrunner,
	args : [
		'--test-output',
		ipcalc.full_path() + ' --reverse-dns 193.92.150.3/16',
		'REVERSEDNS=92.193.in-addr.arpa.'
	]
)
test('LookupReverseDNSFromPrefix12IPv4',
	testrunner,
	args : [
		'--test-output',
		ipcalc.full_path() + ' --reverse-dns 193.92.150.3/12',
		'REVERSEDNS=80-95.193.in-addr.arpa.'
	]
)
test('LookupReverseDNS4321IPv6',
	testrunner,
	args : [
		'--test-output',
		ipcalc.full_path() + ' --reverse-dns 4321:0:1:2:3:4:567:89ab',
		'REVERSEDNS=b.a.9.8.7.6.5.0.4.0.0.0.3.0.0.0.2.0.0.0.1.0.0.0.0.0.0.0.1.2.3.4.ip6.arpa.'
	]
)
test('LookupReverseDNSFirstIPv6',
	testrunner,
	args : [
		'--test-output',
		ipcalc.full_path() + ' --reverse-dns 1::',
		'REVERSEDNS=0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.1.0.0.0.ip6.arpa.'
	]
)
test('LookupReverseDNSLoopbackIPv6',
	testrunner,
	args : [
		'--test-output',
		ipcalc.full_path() + ' --reverse-dns ::1',
		'REVERSEDNS=1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa.'
	]
)
test('LookupReverseDNSFromPrefix128IPv6',
	testrunner,
	args : [
		'--test-output',
		ipcalc.full_path() + ' --reverse-dns 1234::4321/128',
		'REVERSEDNS=1.2.3.4.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.4.3.2.1.ip6.arpa.'
	]
)
test('LookupReverseDNSFromPrefix124IPv6',
	testrunner,
	args : [
		'--test-output',
		ipcalc.full_path() + ' --reverse-dns 1234::4321/124',
		'REVERSEDNS=2.3.4.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.4.3.2.1.ip6.arpa.'
	]
)
test('LookupReverseDNSFromPrefix120IPv6',
	testrunner,
	args : [
		'--test-output',
		ipcalc.full_path() + ' --reverse-dns 1234::4321/120',
		'REVERSEDNS=3.4.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.4.3.2.1.ip6.arpa.'
	]
)

# specific info decorated & no-decorate test
test('SpecificInfoOutput',
	testrunner,
	args : [
		'--test-outfile',
		ipcalc.full_path() + ' -abmnp --minaddr --maxaddr --addresses 192.168.2.6/24',
		files('192.168.2.6')
	]
)
test('SpecificInfoOutputNoDecorate',
	testrunner,
	args : [
		'--test-outfile',
		ipcalc.full_path() + ' -abmnp --minaddr --maxaddr --addresses --no-decorate 192.168.2.7/24',
		files('192.168.2.7')
	]
)

# --json output tests
test('JsonSplitPrefix24',
	testrunner,
	args : [
		'--test-outfile',
		ipcalc.full_path() + ' -j -S 24 10.10.10.0/16',
		files('json-split-10.10.10.0-16-24')
	]
)
test('JsonSplitPrefix26',
	testrunner,
	args : [
		'--test-outfile',
		ipcalc.full_path() + ' -j -S 26 192.168.5.45/24',
		files('json-split-192.168.5.45-24-26')
	]
)
test('JsonNoDecorateSplitPrefix24',
	testrunner,
	args : [
		'--test-outfile',
		ipcalc.full_path() + ' -j --no-decorate -S 24 10.10.10.0/16',
		files('json-nsplit-10.10.10.0-16-24')
	]
)
test('JsonNoDecorateSplitPrefix26',
	testrunner,
	args : [
		'--test-outfile',
		ipcalc.full_path() + ' -j --no-decorate -S 26 192.168.5.45/24',
		files('json-nsplit-192.168.5.45-24-26')
	]
)
test('JsonSplitPrefix64',
	testrunner,
	args : [
		'--test-outfile',
		ipcalc.full_path() + ' -j -S 64 2a03:2880:20:4f06:face::/56',
		files('json-nsplit-2a03:2880:20:4f06:face::-56-64')
	]
)
test('JsonNoDecorateSplitPrefix64',
	testrunner,
	args : [
		'--test-outfile',
		ipcalc.full_path() + ' -j --no-decorate -S 64 2a03:2880:20:4f06:face::/56',
		files('json-nsplit-2a03:2880:20:4f06:face::-56-64')
	]
)
test('JsonTestHumanReadableGenericInfoPrefix56',
	testrunner,
	args : [
		'--test-outfile',
		ipcalc.full_path() + ' -j -i 2a03:2880:20:4f06:face:b00c:0:1/56',
		files('json-i-2a03:2880:20:4f06:face:b00c:0:1-56')
	]
)
test('JsonTestHumanReadableSpecificInfo',
	testrunner,
	args : [
		'--test-outfile',
		ipcalc.full_path() + ' -j -n 2a03:2880:20:4f06:face:b00c:0:1/56',
		files('json-i-2a03:2880:20:4f06:face:b00c:0:1-56')
	]
)
test('AllInfo',
	testrunner,
	args : [
		'--test-outfile',
		ipcalc.full_path() + ' --all-info 192.168.2.7/24',
		files('all-info-192.168.2.7')
	]
)
test('Info',
	testrunner,
	args : [
		'--test-outfile',
		ipcalc.full_path() + ' -i 192.168.2.7/24',
		files('info-192.168.2.7')
	]
)
test('InfoImplicit',
	testrunner,
	args : [
		'--test-outfile',
		ipcalc.full_path() + ' 192.168.2.7/24',
		files('info-192.168.2.7')
	]
)

# --deagrregate tests
test('DeaggregateNoDecorate',
	testrunner,
	args : [
		'--test-outfile',
		ipcalc.full_path() + ' --no-decorate -d 192.168.2.7-192.168.2.13',
		files('deaggregate-192.168.2.7-192.168.2.13')
	]
)
test('Deaggregate',
	testrunner,
	args : [
		'--test-outfile',
		ipcalc.full_path() + ' -d 192.168.2.0-192.168.3.255',
		files('deaggregate-192.168.2.0-192.168.3.255')
	]
)
test('DeaggregateSpaces',
	testrunner,
	args : [
		'--test-outfile',
		ipcalc.full_path() + ' -d "  192.168.2.0   - 192.168.3.255   "',
		files('deaggregate-192.168.2.0-192.168.3.255')
	]
)
test('DeaggregateJson',
	testrunner,
	args : [
		'--test-outfile',
		ipcalc.full_path() + ' -j -d 192.168.2.33-192.168.3.2',
		files('deaggregate-192.168.2.33-192.168.3.2')
	]
)
test('DeaggregateIPv6NoDecorate',
	testrunner,
	args : [
		'--test-outfile',
		ipcalc.full_path() + ' --no-decorate -d 2a03:2880:20:4f06:face::0-2a03:2880:20:4f06:face::fffe',
		files('deaggregate-2a03:2880:20:4f06:face::0-2a03:2880:20:4f06:face::fffe')
	]
)
test('DeaggregateIPv6',
	testrunner,
	args : [
		'--test-outfile',
		ipcalc.full_path() + ' -d fcd3:57d1:733:c18f:b498:25e1:788:0-fcd3:57d1:733:c18f:b498:25e1:788:ffff',
		files('deaggregate-fcd3:57d1:733:c18f:b498:25e1:788:0-fcd3:57d1:733:c18f:b498:25e1:788:ffff')
	]
)
test('DeaggregateIPv6Json',
	testrunner,
	args : [
		'--test-outfile',
		ipcalc.full_path() + ' -j -d fcd3:57d1:733:c18f:b498:25e1:788:f-fcd3:57d1:733:c18f:b498:25e1:789:ffa9',
		files('deaggregate-fcd3:57d1:733:c18f:b498:25e1:788:f-fcd3:57d1:733:c18f:b498:25e1:789:ffa9')
	]
)
# Test whether we can deaggregate a randomly generated network
test('DeaggregateIPv6Random',
	find_program('ipcalc-delegate-ipv6-random.sh'),
	env : ['IPCALC=' + ipcalc.full_path()]
)
test('DeaggregateSplitIPv6',
	find_program('ipcalc-delegate-split-ipv6.sh'),
	env : ['IPCALC=' + ipcalc.full_path()]
)
test('DeaggregateSplitIPv4',
	find_program('ipcalc-delegate-split-ipv4.sh'),
	env : ['IPCALC=' + ipcalc.full_path()]
)
