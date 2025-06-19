public class LogTester {
    public static void main(String[] args) {
        Logger loggerOne = Logger.fetchInstance();
        Logger loggerTwo = Logger.fetchInstance();

        loggerOne.log("Singleton pattern working properly.");
        loggerTwo.log("Same logger used here.");

        if (loggerOne == loggerTwo) {
            System.out.println("Confirmed: Only one instance of LoggerTool exists.");
        } else {
            System.out.println("Error: Multiple instances found!");
        }
    }
}
