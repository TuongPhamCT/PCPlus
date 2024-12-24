abstract class Utility {

  static String getAgeRange(int birthYear) {
    // Tìm khoảng 10 năm gần nhất với năm sinh
    int start = (birthYear ~/ 10) * 10; // Bắt đầu của khoảng
    int end = start + 9;               // Kết thúc của khoảng
    return "$start-$end";
  }

  static String getPriceRange(int price) {
    if (price <= 500000) {
      return "0-500K";
    }
    if (price <= 1000000) {
      return "500K-1M";
    }
    if (price <= 5000000) {
      return "1M-5M";
    }
    if (price <= 10000000) {
      return "5M-10M";
    }
    return "above-10M";
  }
}