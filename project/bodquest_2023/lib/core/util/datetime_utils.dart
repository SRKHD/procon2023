DateTime getPrevMonth(DateTime baseDate) {
  final prevMonthLastDay = DateTime(baseDate.year, baseDate.month, 0);
  final prevDiff =
      baseDate.day < prevMonthLastDay.day ? prevMonthLastDay.day : baseDate.day;
  // 基準日と1ヶ月前の日付の間隔。
  // 基本的に1ヶ月前は基準日から前月の月の日数分引けば求められる。
  // 基準日の1ヶ月前の月の日数より基準日の日付が大きい場合は前月の月末にするために基準日の日付を引く。
  return baseDate.subtract(Duration(days: prevDiff)); // 1ヶ月前
}

DateTime getPreWeek(DateTime baseDate) {
  return baseDate.subtract(const Duration(days: 7));
}

DateTime getDayOnly(DateTime baseDate) {
  return DateTime(baseDate.year, baseDate.month, baseDate.day);
}

DateTime toDate(String value) {
  var s = value.split('年');
  final year = int.parse(s[0]);
  s = s[1].split('月');
  final month = int.parse(s[0]);
  s = s[1].split('日');
  final day = int.parse(s[0]);

  return DateTime(year, month, day);
}

String toJPNDateString(DateTime value) {
  return '${value.year}年${value.month}月${value.day}日';
}
