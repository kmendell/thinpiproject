using Gtk;

class TPWindow {
    public static void setupSettings() {

        try {
            var builder = new Builder ();
            builder.add_from_file(GLib.Path.build_filename(Constants.PKGDATADIR,"settings.ui"));
            
            //  builder.connect_signals (null);
            var window2 = builder.get_object ("settingsWindow") as Window;
            var darkModeSwitch = builder.get_object("darkModeSwitch") as Switch;
            var adminModeSwitch = builder.get_object("adminSwitch") as Switch;
            var closeThinpi = builder.get_object("settingsOtherCloseButton") as Button;
            var aptButton = builder.get_object("settingsSystemAptButton") as Button;
            var dnsButton = builder.get_object("settingsSystemDNSButton") as Button;
            var infoButton = builder.get_object("settingsSystemInfoButon") as Button;
            var hostnameButton = builder.get_object("settingsSystemHostnameButton") as Button;
            var notebookMenu = builder.get_object("settingMenuBar") as Notebook;
            window2.destroy.connect (window2.close);

            closeThinpi.clicked.connect (() => {
                Gtk.main_quit();
            });

            var darkMode = SettingUtils.checkSetting("darkmode", darkModeSwitch);
            var adminMode = SettingUtils.checkSetting("adminmode", adminModeSwitch);
            //  SettingUtils.checkDarkMode(darkMode);

            aptButton.clicked.connect (() => {});

            dnsButton.clicked.connect (() => {
                SettingUtils.purgeDNS();
            });

            infoButton.clicked.connect (() => {
            });
            hostnameButton.clicked.connect (() => {});

            adminModeSwitch.state_set.connect (() =>{
                SettingUtils.checkAdminMode(adminModeSwitch.active);
                return true;
            });

            darkModeSwitch.state_set.connect (() =>{
                SettingUtils.setSetting("darkmode", darkModeSwitch.active);
                SettingUtils.checkDarkMode(darkModeSwitch.active);
                return true;
            });

            window2.show();
        } catch (Error e) {
            
        }
        

    }

    public static void setupConnectManager(string[] args) {

        try {
            var builder = new Builder ();
            builder.add_from_file(GLib.Path.build_filename(Constants.PKGDATADIR,"connect-manager-debug.ui"));;
            var serverList = builder.get_object("serverSelect") as ComboBoxText;
            var usernameText = builder.get_object("uname") as Entry;
            var passwordText = builder.get_object("pword") as Entry;
            var wrongLabel = builder.get_object("wrongLabel") as Label;
            var settingsButton = builder.get_object("settingsButton") as Button;
            var configButton = builder.get_object("openConfigButton") as Button;
            var connectButton = builder.get_object("connect") as Button;
            var infoLabel = builder.get_object("copyrightLabel") as Label;
            
            builder.connect_signals (null);
            var window = builder.get_object ("thinpiMain") as Window;
            window.destroy.connect (Gtk.main_quit);
            
            infoLabel.set_label("THINPI 0.3.0.lv1 (UNSTABLE-DEV-ALPHA) | Update 1 | Vala 0.48.19");
    
            connectButton.clicked.connect (() => {
                int id = serverList.active;
                    string formatted = "/usr/local/share/thinpi/tprdp %s -p %s -u %s -z -x b -g 1920x1080 -f -v".printf (ThinPiPublic.publicServerArray.get(id).serverIP, passwordText.get_text(), usernameText.get_text());
                    int rv = ThinPiPublic.runCommand(formatted);
                    if (rv != 0) {
                        usernameText.set_text("");
                        passwordText.set_text("");
                    }
            });
    
            settingsButton.clicked.connect (() => {
                //  showSettings();
                ThinPiPublic.openWindow("settings");
            });
    
            configButton.clicked.connect (() => {
                //  showConfig(args);
                ThinPiPublic.openWindow("config");
            });
            //  SettingUtils.checkDarkMode(darkMode);
            
            window.show_all ();
            window.fullscreen();
            
            wrongLabel.hide();
            ThinPiPublic.seeServers();
            foreach (TPServer? i in ThinPiPublic.publicServerArray) {
                serverList.append_text(i.serverName);
            }
    
            connectButton.set_label("Connect");
            
            serverList.set_active(0);
        } catch (Error e) {

        }


    }

    public static void setupConfigManager() {

        try {
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
        } catch (Error e) {

        }


    }
}