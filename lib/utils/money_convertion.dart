String intToRupiah(String value) {
  if (value.length > 2) {
    var strRp = value;
    strRp = strRp.replaceAll(RegExp(r'\D'), '');
    strRp = strRp.replaceAll(RegExp(r'\B(?=(\d{3})+(?!\d))'), '.');
    strRp = "Rp$strRp";
    return strRp;
  }
  return value;
}
