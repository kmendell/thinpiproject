using Gtk;

int showSettings () {
    //  Gtk.init (ref args);

    var darkMode = SettingUtils.checkSetting("darkmode", null);

    if (darkMode) {
        ThinPiPublic.setDefaultTheme("dark");
    }
    TPWindow.setupSettings();

    return 0;
}
