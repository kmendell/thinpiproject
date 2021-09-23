using Gtk;

int showSettings (string[] args) {
    Gtk.init (ref args);

    try {
        TPWindow.setupSettings();
        
        SettingUtils.loadFrom("/usr/local/share/thinpi/config/settings.xml");
    } catch (Error e) {
        stderr.printf ("Could not load ThinPi UI: %s\n", e.message);
        return 1;
    }

    return 0;
}
