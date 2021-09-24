using Gtk;

int showConfig (string[] args) {
    Gtk.init (ref args);

    try {
        Gtk.Settings.get_default().set("gtk-theme-name", "ThinPi-red-dark");
        TPWindow.setupConfigManager();
    } catch (Error e) {
        stderr.printf ("Could not load ThinPi UI: %s\n", e.message);
        return 1;
    }

    return 0;
}
