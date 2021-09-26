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

    public static void setTheme(string type) {
        if (type == "light") {
            Gtk.Settings.get_default().set("gtk-theme-name", "Orchis-red-light");
        } else {
            Gtk.Settings.get_default().set("gtk-theme-name", "Orchis-red-dark");
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
            print(key);
            return true;
        } else {
            if (wid != null) {
                wid.active = false;
            }
            print(key);
            return false;
        }
    }
}