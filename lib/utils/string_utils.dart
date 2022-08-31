class StringUtils {
  static String formatK(int? num) {
    if (num == null) return "0";
    String result = "";
    if (num >= 1000) {
      result = (num / 1000).toString() + "k";
    } else {
      result = num.toString();
    }
    return result;
  }
}
