using Gtk;

class TPWindow {
    public static void setupSettings() {
        var builder = new Builder ();
        builder.add_from_file(GLib.Path.build_filename(Constants.PKGDATADIR,"settings.ui"));
        //  builder.connect_signals (null);
        var window2 = builder.get_object ("settingsWindow") as Window;
        var darkModeSwitch = builder.get_object("darkModeSwitch") as Switch;
        var notebookMenu = builder.get_object("settingMenuBar") as Notebook;
        window2.destroy.connect (window2.close);

        darkModeSwitch.state_set.connect (() =>{
            if (darkModeSwitch.active) {
                Gtk.Settings.get_default().set("gtk-theme-name", "ThinPi-red-dark");
            } else {
                Gtk.Settings.get_default().set("gtk-theme-name", "Orchis-red-light");
            }
            return true;
        });
        

        window2.show();
    }

    public static void setupConnectManager(string[] args) {
        var builder = new Builder ();
        builder.add_from_file(GLib.Path.build_filename(Constants.PKGDATADIR,"connect-manager-debug.ui"));;
        var serverList = builder.get_object("serverSelect") as ComboBoxText;
        var wrongLabel = builder.get_object("wrongLabel") as Label;
        var settingsButton = builder.get_object("settingsButton") as Button;
        var configButton = builder.get_object("openConfigButton") as Button;
        var connectButton = builder.get_object("connect") as Button;
        var infoLabel = builder.get_object("copyrightLabel") as Label;
        
        builder.connect_signals (null);
        var window = builder.get_object ("thinpiMain") as Window;
        window.destroy.connect (Gtk.main_quit);
        connectButton.set_label("Close (Temp)");
        infoLabel.set_label("THINPI 0.3.0 (UNSTABLE BUILD) Vala 0.48.19 - DEBUG = ON");
        

        var ls_stdout = "";
	    var ls_stderr = "";
	    var ls_status = 0;

        connectButton.clicked.connect (() => {
                //  Process.spawn_command_line_sync ("/thinpi/thinpi-config", out ls_stdout, out ls_stderr, out ls_status);
                Gtk.main_quit();
        });

        settingsButton.clicked.connect (() => {
            showSettings(args);
            
        });

        configButton.clicked.connect (() => {
            showConfig(args);
        });

        
        window.show_all ();
        window.fullscreen();
        
        wrongLabel.hide();
        ThinPiPublic.seeServers();
        foreach (TPServer? i in ThinPiPublic.publicServerArray) {
            serverList.append_text(i.serverName);
        }
        
        serverList.set_active(0);
    }

    public static void setupConfigManager() {
        var builder = new Builder ();
        builder.add_from_file(GLib.Path.build_filename(Constants.PKGDATADIR,"configmanager.ui"));;
        //  builder.connect_signals (null);
        var window3 = builder.get_object ("configWindow") as Window;
        window3.destroy.connect (window3.close);
        var mainLabel = builder.get_object("mainLabel") as Label;
        var configList = builder.get_object("configServerList") as ComboBoxText;
        var serverNameText = builder.get_object("serverNameTextbox") as Entry;
        var serverIPText = builder.get_object("ipaddressTextbox") as Entry;
        var serverDomainText = builder.get_object("domainNameTextbox") as Entry;
        var serverScreenText = builder.get_object("screenResTextbox") as Entry;
        var usbCheck = builder.get_object("usbCheckbox") as CheckButton;
        var printerCheck = builder.get_object("printerCheckbox") as CheckButton;
        var homeCheck = builder.get_object("homeCheckbox") as CheckButton;
        var editButton = builder.get_object("addButton") as Button;
        var removeButton = builder.get_object("removeButton") as Button;

        ConfigUtils.setupLoad(0, serverNameText, serverIPText, serverDomainText, serverScreenText, configList);

        configList.changed.connect (() => {
            int id = configList.active;
            if (configList.get_active_text() == "<Add New>") {
                ConfigUtils.clearFields(serverNameText, serverIPText, serverDomainText, serverScreenText);
            } else {
                ConfigUtils.loadServerFields(id, serverNameText, serverIPText, serverDomainText, serverScreenText);
            }
            
        });
        
        ConfigUtils.loadServers(configList);

        configList.set_active(0);
        window3.show();
    }
}