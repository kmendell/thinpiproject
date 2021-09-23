cfg_thinpi = configuration_data()
cfg_thinpi.set('DATADIR', join_paths(get_option('prefix'),get_option('datadir')))
cfg_thinpi.set('PKGDATADIR', join_paths(get_option('prefix'),get_option('datadir'),'thinpi'))
cfg_thinpi.set('GETTEXT_PACKAGE', 'thinpi')
cfg_thinpi.set('RELEASE_NAME', 'thinpi')
cfg_thinpi.set('PREFIX', get_option('prefix'))
cfg_thinpi.set('VERSION', '0.3.0')
cfg_thinpi.set('TESTSRCDIR', meson.source_root())

cfgfile_1 = configure_file(
	input: 'Config.vala.base',
	output: 'Config.vala',
	configuration: cfg_thinpi)

thinpi_deps = [atk_dep]
thinpi_deps += [cairo_gobject_dep]
thinpi_deps += [gdk_3_0_dep]
thinpi_deps += [gdk_pixbuf_2_0_dep]
thinpi_deps += [gee_0_8_dep]
thinpi_deps += [gio_2_0_dep]
thinpi_deps += [glib_2_0_dep]
thinpi_deps += [gobject_2_0_dep]
thinpi_deps += [gtk_3_0_dep]
thinpi_deps += [libxml_2_0_dep]
thinpi_deps += [pango_dep]
thinpi_deps += [x11_dep]
thinpi_sources = [cfgfile_1]
thinpi_sources += ['classes/tppublic.vala']
thinpi_sources += ['classes/tpserverclass.vala']
thinpi_sources += ['interface/tpconfig.vala']
thinpi_sources += ['interface/tpconnect.vala']
thinpi_sources += ['interface/tpsettings.vala']
thinpi_sources += ['thinpi.vala']
thinpi_sources += ['utils/tpconfig-utils.vala']
thinpi_sources += ['utils/tpxml.vala']
thinpi_link_args = ['-rdynamic']

executable('thinpi',thinpi_sources,
    dependencies: thinpi_deps,
    link_args: thinpi_link_args,
    install: true)

