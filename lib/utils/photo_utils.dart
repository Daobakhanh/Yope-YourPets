
class PhotoUtils {
  static double getHeightView(double widthDevice, int widthImg, int heightImg) {
    if (widthImg == 0) {
      widthImg = 1;
    }
    if (heightImg == 0) {
      heightImg = 1;
    }
    return (widthDevice * heightImg) / widthImg;
  }

  static String genImgIx(String? url, int w, int h,
      {bool focusFace = false, double drp = 1}) {
    if(url == null){
        return '';
    }

    if (url.startsWith('https://graph.facebook.com')) {
      return url;
    }

    if (h == 0) {
      return '$url?w=$w&dpr=$drp';
    }



    if (focusFace) {
      return '$url?w=$w&h=$h&fit=facearea&facepad=10&dpr=$drp';
    }
    return '$url?w=$w&h=$h&fit=crop&dpr=$drp';
  }

  static String genFbImg(String url, int w, int h) {
    return url.replaceAll(
        '&width=600&height=600', '&width=${h * 2}&height=${h * 2}');
  }
}