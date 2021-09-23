//using Xml;
//project version=0.3.0
//using Gtk;
using Gtk;

int main (string[] args) {
    Gtk.init (ref args);
    startconfig();

    try {
        TPWindow.setupConnectManager(args);
        Gtk.main ();
    } catch (Error e) {
        stderr.printf ("Could not load ThinPi UI: %s\n", e.message);
        return 1;
    }

    return 0;
}
