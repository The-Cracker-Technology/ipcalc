project('ipcalc', 'c',
	license : 'GPLv2',
	version : '1.0.0'
)

src = [
	'ipcalc.h',
	'ipcalc.c',
	'ipcalc-reverse.c',
	'ipcalc-utils.c',
	'netsplit.c',
	'ipv6.h',
	'ipv6.c',
	'deaggregate.c'
]

args = [
	'-DVERSION="' + meson.project_version() + '"'
]

deps = []

use_maxminddb = get_option('use_maxminddb')
use_geoip = get_option('use_geoip')
use_runtime_linking = get_option('use_runtime_linking')

cc = meson.get_compiler('c')
dl = cc.find_library('dl', required : use_runtime_linking)

maxminddb = dependency('libmaxminddb',
	method : 'pkg-config',
	required : use_maxminddb
)
if maxminddb.found()
	src += ['ipcalc-maxmind.c']
	args += ['-DUSE_MAXMIND']
	if dl.found()
		message('linking maxminddb dynamically at runtime if it is available')
		args += [
			'-DUSE_RUNTIME_LINKING',
			'-DLIBPATH="' + maxminddb.get_pkgconfig_variable('libdir') + '"'
		]
		deps += [dl]
	else
		deps += [maxminddb]
	endif
else
	geoip = dependency('geoip',
		method : 'pkg-config',
		required : use_geoip
	)
	if geoip.found()
		src += ['ipcalc-geoip.c']
		args += ['-DUSE_GEOIP']
		if dl.found()
			message('linking geoip dynamically at runtime if it is available')
			args += [
				'-DUSE_RUNTIME_LINKING',
				'-DLIBPATH="' + geoip.get_pkgconfig_variable('libdir') + '"'
			]
			deps += [dl]
		else
			deps += [geoip]
		endif
	endif
endif

ipcalc = executable('ipcalc',
	sources : src,
	c_args  : args,
	dependencies : deps,
	install : true
)

ronn = find_program('ronn', required: false)
if ronn.found()
	ipcalc_1 = custom_target(
		'ipcalc.1',
		output : 'ipcalc.1',
		input : 'ipcalc.1.md',
		command : [ronn, '--pipe', '-r', '@INPUT@'],
		capture: true,
		install_dir: join_paths(get_option('mandir'), 'man1'),
		install: true
	)
endif

subdir('tests')
