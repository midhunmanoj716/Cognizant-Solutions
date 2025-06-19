public class Logger {
    private static Logger uniqueLogger;

    // Private constructor
    private Logger() {
        System.out.println("Logger initialized.");
    }

    public static Logger fetchInstance() {
        if (uniqueLogger == null) {
            uniqueLogger = new Logger();
        }
        return uniqueLogger;
    }

    public void log(String message) {
        System.out.println("[LOG] " + message);
    }
}
