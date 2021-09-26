using Gtk;

int showConfig (string[] args) {
    Gtk.init (ref args);

    Gtk.Settings.get_default().set("gtk-theme-name", "ThinPi-red-dark");
    TPWindow.setupConfigManager();

    return 0;
}
