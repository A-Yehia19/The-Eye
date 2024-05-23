String currentDayFormatted(){
  DateTime now = DateTime.now();
  final day = now.weekday;
  switch (day){
    case DateTime.sunday:
      return "sun";
    case DateTime.monday:
      return "mon";
    case DateTime.tuesday:
      return "tue";
    case DateTime.wednesday:
      return "wed";
    case DateTime.thursday:
      return "thu";
    case DateTime.friday:
      return "fri";
    case DateTime.saturday:
      return "sat";
    default:
      return "sun";
  }
}
