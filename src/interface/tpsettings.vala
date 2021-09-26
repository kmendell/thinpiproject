using Gtk;

int showSettings (string[] args) {
    Gtk.init (ref args);

    Gtk.Settings.get_default().set("gtk-theme-name", "ThinPi-red-dark");
    TPWindow.setupSettings();

    return 0;
}
