using Gtk;

int showConfig () {
    //  Gtk.init (ref args);

    //  Gtk.Settings.get_default().set("gtk-theme-name", "ThinPi-red-dark");
    var darkMode = SettingUtils.checkSetting("darkmode", null);

    if (darkMode) {
        ThinPiPublic.setDefaultTheme("dark");
    }
    TPWindow.setupConfigManager();

    return 0;
}
