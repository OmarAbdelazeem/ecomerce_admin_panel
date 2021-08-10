import 'package:intl/intl.dart';

String formatDateTime(DateTime dateTime) {
  var formattedDate = DateFormat('yyyy-MM-dd – kk:mm').format(dateTime);
  return formattedDate;
}

String formatCurrentDateTime() {
  var now = DateTime.now();
  var formattedDate = DateFormat('yyyy-MM-dd – kk:mm').format(now);
  return formattedDate;
}

String formatMonthStatistics(DateTime date, bool isEnglishLanguage) {
  return "${getMonthName(date.month, isEnglishLanguage)}  ${isEnglishLanguage ? date.year.toString() : translateDigit(date.year.toString())}";
}

String formatDateStatistics(DateTime date, bool isEnglishLanguage) {
  if (isEnglishLanguage)
    return "${getMonthName(date.month, isEnglishLanguage)} ${date.day} , ${date.year}";
  else
    return "${translateDigit(date.day.toString()) + ' ' + getMonthName(date.month, isEnglishLanguage)}  ${translateDigit(date.year.toString())}";
}

// String getTimeFromTimeStamp(String timestamp) {
//   try {
//     var dateTime =
//         DateTime.fromMillisecondsSinceEpoch(int.parse(timestamp) * 1000);
//
//     var day = dateTime.day;
//     var month = getMonthName(dateTime.month);
//     var year = dateTime.year;
//
//     return "$day $month $year";
//   } catch (E) {
//     return "";
//   }
// }

DateTime unifyDateFormat(DateTime date) {
  return DateTime(date.year, date.month, date.day);
}

getOrderedTime(String dateTime) {
  String getTime(DateTime dateTime) {
    return "${dateTime.hour > 12 ? dateTime.hour - 12 : dateTime.hour}:${dateTime.minute} ${dateTime.hour > 12 ? "PM" : "AM"}";
  }

  DateTime dateT = DateTime.parse(dateTime);
  return "${getMonthName(dateT.month, true)} ${dateT.day} , ${dateT.year} at ${getTime(dateT)}";
}

getCustomerJoiningDate(String dateTime, bool isEnglishLanguage) {
  DateTime dateT = DateTime.parse(dateTime);
  if (isEnglishLanguage)
    return "${getMonthName(dateT.month, isEnglishLanguage)} ${dateT.day} , ${dateT.year}";
  else
    return "${translateDigit(dateT.day.toString()) + ' ' + getMonthName(dateT.month, isEnglishLanguage)}  ${translateDigit(dateT.year.toString())}";
}

String getMonthName(int month, bool isEnglishLanguage) {
  const List englishMonths = [
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "November",
    "December"
  ];
  const List arabicMonths = [
    "يناير",
    "فبراير",
    "مارس",
    "ابريل",
    "مايو",
    "يونيو",
    "يوليو",
    "اغسطس",
    "سبتمبر",
    "نوفمبر",
    "ديسمبر"
  ];

  final List temp = isEnglishLanguage ? englishMonths : arabicMonths;

  switch (month) {
    case 1:
      return temp[0];

    case 2:
      return temp[1];

    case 3:
      return temp[2];

    case 4:
      return temp[3];

    case 5:
      return temp[4];

    case 6:
      return temp[5];

    case 7:
      return temp[6];

    case 8:
      return temp[7];

    case 9:
      return temp[8];

    case 10:
      return temp[9];

    case 11:
      return temp[10];

    case 12:
      return temp[11];

    default:
      return temp[0];
  }
}

String translateDigit(String number) {
  const List english = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
  const List arabic = ['٠', '١', '۲', '۳', '٤', '٥', '٦', '٧', '٨', '٩'];

  String translated = '';
  int arabicIndex;

  for (int i = 0; i < number.length; i++) {
    if (double.tryParse(number[i]) != null) {
      arabicIndex = english.indexOf(number[i]);
      translated += '${arabic[arabicIndex]}';
    } else
      translated += number[i];
  }
  return translated;
}

String getTimeDifference() {
  var birthday = DateTime(1967, 10, 12);
  var date2 = DateTime.now();
  var difference = date2.difference(birthday).inHours;
  return difference.toString();
}
