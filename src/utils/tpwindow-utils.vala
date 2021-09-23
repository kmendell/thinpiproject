using Gtk;

class TPWindow {
    public static void setupSettings() {
        var builder = new Builder ();
        builder.add_from_file(GLib.Path.build_filename(Constants.PKGDATADIR,"settings.ui"));
        //  builder.connect_signals (null);
        var window2 = builder.get_object ("settingsWindow") as Window;
        var notebookMenu = builder.get_object("settingMenuBar") as Notebook;
        window2.destroy.connect (window2.close);
        

        window2.show();
    }
}