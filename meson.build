project('thinpi',
  ['c','vala'])

add_global_arguments('-DGETTEXT_PACKAGE="thinpi"',language: 'c')

find_program ('glib-compile-schemas')
atk_dep = dependency('atk')
cairo_gobject_dep = dependency('cairo-gobject')
gdk_3_0_dep = dependency('gdk-3.0')
gdk_pixbuf_2_0_dep = dependency('gdk-pixbuf-2.0')
gee_0_8_dep = dependency('gee-0.8')
gio_2_0_dep = dependency('gio-2.0')
glib_2_0_dep = dependency('glib-2.0')
gobject_2_0_dep = dependency('gobject-2.0')
gtk_3_0_dep = dependency('gtk+-3.0')
libxml_2_0_dep = dependency('libxml-2.0')
pango_dep = dependency('pango')
x11_dep = dependency('x11')

meson.add_install_script(join_paths(meson.current_source_dir(),'meson_scripts','install_data.sh'),join_paths(get_option('prefix'),get_option('datadir'),'thinpi'),join_paths(meson.current_source_dir(),'data/local','','*'))

meson.add_install_script(join_paths(meson.current_source_dir(),'meson_scripts','install_data.sh'),join_paths(get_option('prefix'),get_option('datadir'),'doc','thinpi'),join_paths(meson.current_source_dir(),'doc','','*'))

install_data('data/ThinPi.desktop',install_dir:join_paths(get_option('prefix'),get_option('datadir'),'applications'))
install_data('data/us.kmprojects.thinpi.gschema.xml', install_dir: join_paths(get_option('prefix'),get_option('datadir'), 'glib-2.0', 'schemas'))
meson.add_install_script('meson_scripts/install_schemas.sh')
	install_data('data/interface/configmanager.ui', install_dir: join_paths(get_option('prefix'),get_option('datadir'),'thinpi'))
	install_data('data/interface/connect-manager-debug.ui', install_dir: join_paths(get_option('prefix'),get_option('datadir'),'thinpi'))
	install_data('data/interface/thinpi-aio.ui', install_dir: join_paths(get_option('prefix'),get_option('datadir'),'thinpi'))
	install_data('data/interface/settings.ui', install_dir: join_paths(get_option('prefix'),get_option('datadir'),'thinpi'))
install_data('data/pixmaps/thinpi-logo.png',install_dir: join_paths(get_option('prefix'),get_option('datadir'),'thinpi'))
subdir('src')
