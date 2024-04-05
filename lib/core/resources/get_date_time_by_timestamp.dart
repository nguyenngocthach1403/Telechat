import 'package:cloud_firestore/cloud_firestore.dart';

DateTime getDatetimeByTimestamp(Timestamp stamp) {
  return DateTime.fromMillisecondsSinceEpoch(stamp.millisecondsSinceEpoch);
}

String dateTimeToString(DateTime dateTime) {
  return '${dateTime.hour}:${numberToMinute(dateTime.minute)} ${dateTime.day} ${numberToMonth(dateTime.month)}';
}

String numberToMinute(int nums) {
  if (nums < 10) {
    return '0$nums';
  }
  return nums.toString();
}

String numberToMonth(int nums) {
  switch (nums) {
    case 1:
      return 'Jan';
    case 2:
      return 'Feb';
    case 3:
      return 'Mar';
    case 4:
      return 'Apr';
    case 5:
      return 'May';
    case 6:
      return 'Jun';
    case 7:
      return 'July';
    case 8:
      return 'Aug';
    case 9:
      return 'Sep';
    case 10:
      return 'Oct';
    case 11:
      return 'Nov';
    case 12:
      return 'Dec';
    default:
      return 'Not';
  }
}
