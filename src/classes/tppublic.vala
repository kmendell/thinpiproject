using Gee;

public class ThinPiPublic {

    public static ThinPiPublic instance() {
        return new ThinPiPublic();
    }

    public static TPServer loadServer;

    public static ArrayList<TPServer?> publicServerArray = new ArrayList<TPServer?>();

    public static void addToArray(TPServer server) {
        var inst = ThinPiPublic.instance();
        if (!inst.publicServerArray.contains(server)) {
            inst.publicServerArray.add(server);
        } else {
            print("Error");
        }
    }

    public static void seeServers() {
        foreach (TPServer? i in ThinPiPublic.publicServerArray) {
            stdout.printf ("SEESERVERS: %s, %s , %s\n", i.id, i.serverName, i.serverIP);
        }
    }

    public static void runCommand(string cmd) {
        var ls_stdout = "";
	    var ls_stderr = "";
	    var ls_status = 0;
        Process.spawn_command_line_sync (cmd, out ls_stdout, out ls_stderr, out ls_status);
    }
    
}