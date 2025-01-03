abstract class Utility {

  static String getAgeRange(int birthYear) {
    // Tìm khoảng 10 năm gần nhất với năm sinh
    int start = (birthYear ~/ 10) * 10; // Bắt đầu của khoảng
    return "$start";
  }

  static String getPriceRangeIndex(int price) {
    if (price <= 500000) {
      return "0";
    }
    if (price <= 1000000) {
      return "1";
    }
    if (price <= 5000000) {
      return "2";
    }
    if (price <= 10000000) {
      return "3";
    }
    return "4";
  }

  static String formatSoldCount(int sold) {
    return "$sold";
  }

  static String formatCurrency(int? amount) {
    if (amount == null){
      return "00,000";
    }

    return amount.toStringAsFixed(2).replaceAllMapped(
        RegExp(r'\B(?=(\d{3})+(?!\d))'), (match) => ',');
  }

  static String formatRatingValue(double? value) {
    return value?.toStringAsFixed(1) ?? "4.5";
  }
}

abstract class TestData {
  static const DEMO_IMAGE_PATH = "https://product.hstatic.net/1000153276/product/fdff6b5d7e82473a866035f7964c3ff6_0ee0b6782499424ebff09bf020125ddd_grande.png";
}