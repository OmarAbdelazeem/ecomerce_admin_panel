class TrimName {
  static String trimSearchName(String searchName) =>
      searchName.trim().replaceFirst(RegExp(r'[^\p{L}\s]+', unicode: true), '');

  static String trimName(String searchName){
   String trimmedName = searchName.trim().replaceFirst(RegExp(r'[^\p{L}\s]+', unicode: true), '');
   if(trimmedName.isNotEmpty)
     trimmedName = trimmedName.replaceFirst(trimmedName[0], trimmedName[0].toUpperCase());
   return  trimmedName;
  }
}
