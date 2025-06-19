import java.util.Arrays;
import java.util.Comparator;

public class SearchEngine {

    // Linear Search by productId
    public static Product linearSearch(Product[] products, int targetId) {
        for (Product p : products) {
            if (p.productId == targetId) {
                return p;
            }
        }
        return null;
    }

    // Binary Search by productId (assumes sorted array)
    public static Product binarySearch(Product[] products, int targetId) {
        int left = 0, right = products.length - 1;

        while (left <= right) {
            int mid = (left + right) / 2;
            if (products[mid].productId == targetId) {
                return products[mid];
            } else if (products[mid].productId < targetId) {
                left = mid + 1;
            } else {
                right = mid - 1;
            }
        }

        return null;
    }

    // Sort products by productId (for binary search)
    public static void sortProducts(Product[] products) {
        Arrays.sort(products, Comparator.comparingInt(p -> p.productId));
    }
}
