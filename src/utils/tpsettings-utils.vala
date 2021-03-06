using Gtk;

class SettingUtils {

    public static void setSetting(string key, bool val) {
        var settings = new GLib.Settings ("us.kmprojects.thinpi");
        if (val) {
            settings.set_boolean (key, true);
        } else {
            settings.set_boolean (key, false);
        }
    }

    public static void checkDarkMode(bool val) {
        if (val) {
            SettingUtils.setTheme("dark");
        } else {
            SettingUtils.setTheme("light");
        }
    }

    public static void checkAdminMode(bool val) {
        if (val) {
            SettingUtils.setSetting("adminmode", true);
        } else {
            SettingUtils.setSetting("adminmode", false);
        }
    }

    public static void checkCompression(bool val) {
        if (val) {
            SettingUtils.setSetting("compression", true);
            TPConnection.sCompression = true;
        } else {
            SettingUtils.setSetting("compression", false);
            TPConnection.sCompression = false;
        }
    }

    public static void setTheme(string type) {
        if (type == "light") {
            ThinPiPublic.screenSettings.set("gtk-theme-name", "Orchis-red-light");
        } else {
            ThinPiPublic.screenSettings.set("gtk-theme-name", "Orchis-red-dark");
        }
    }

    public static void purgeDNS() {

    }

    public static bool checkSetting(string key, Switch? wid) {
        var settings = new GLib.Settings ("us.kmprojects.thinpi");
        if (settings.get_boolean (key) == true) {
            if (wid != null) {
                wid.active = true;
            }
            return true;
        } else if (settings.get_boolean (key) == false) {
            if (wid != null) {
                wid.active = false;
            }
            return false;
        } else {
            return false;
        }
    }
}