String removeAllHtmlTags(String htmlText) {
  RegExp exp = RegExp(r"<a[^>]*>", multiLine: true, caseSensitive: true);
  RegExp exp2 = RegExp("<[^>]a*>", multiLine: true, caseSensitive: true);
  return htmlText.replaceAll(exp, '').replaceAll(exp2, '');
}
