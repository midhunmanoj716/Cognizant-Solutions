public class SearchTest {
    public static void main(String[] args) {
        Product[] catalog = {
            new Product(104, "Wireless Mouse", "Electronics"),
            new Product(102, "Yoga Mat", "Fitness"),
            new Product(101, "Notebook", "Stationery"),
            new Product(105, "USB Cable", "Accessories"),
            new Product(103, "Water Bottle", "Fitness")
        };

        // Linear Search Test
        System.out.println("=== Linear Search ===");
        Product result1 = SearchEngine.linearSearch(catalog, 103);
        System.out.println(result1 != null ? "Found: " + result1 : "Product not found");

        // Binary Search Test
        System.out.println("\n=== Binary Search ===");
        SearchEngine.sortProducts(catalog);  // Must sort before binary search
        Product result2 = SearchEngine.binarySearch(catalog, 103);
        System.out.println(result2 != null ? "Found: " + result2 : "Product not found");
    }
}
