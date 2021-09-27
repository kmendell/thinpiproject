class TPConnection {
    public static bool sCompression;
    public static bool sLatencyMode;

    public static string getExtrasCommand() {
        if (TPConnection.sCompression) {
            return "-z";
        } else {
            return "";
        }
    } 
}