//using Xml;
//project version=0.3.0
//using Gtk;
using Gtk;

int main (string[] args) {
    Gtk.init (ref args);
    startconfig();

    //  Gtk.Settings.get_default().set("gtk-theme-name", "ThinPi-red-dark");
    var darkMode = SettingUtils.checkSetting("darkmode", null);

    if (darkMode) {
        ThinPiPublic.setDefaultTheme("dark");
    }
    TPWindow.setupConnectManager(args);
    Gtk.main ();

    return 0;
}
