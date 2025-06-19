public class ForecastCalculator {

    // Recursive method to calculate future value
    public static double predictFutureValue(double initialAmount, double growthRate, int years) {
        // Base case: no more years left
        if (years == 0) {
            return initialAmount;
        }

        // Recursive case: calculate next year's value
        double nextAmount = initialAmount * (1 + growthRate);
        return predictFutureValue(nextAmount, growthRate, years - 1);
    }

    public static void main(String[] args) {
        double startingValue = 10000.0; // initial amount
        double annualGrowth = 0.08;     // 8% growth rate
        int durationYears = 5;          // forecast for 5 years

        double projectedValue = predictFutureValue(startingValue, annualGrowth, durationYears);

        System.out.printf("Projected value after %d years: ₹%.2f\n", durationYears, projectedValue);
    }
}
