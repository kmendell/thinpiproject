using Gtk;

int showConfig (string[] args) {
    Gtk.init (ref args);

    try {
        TPWindow.setupConfigManager();
    } catch (Error e) {
        stderr.printf ("Could not load ThinPi UI: %s\n", e.message);
        return 1;
    }

    return 0;
}
