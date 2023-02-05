extension DateTimeExtension on DateTime? {
  String formatDDMMYYYY() {
    DateTime dateTime = this ?? DateTime.now();
    return '${dateTime.day.toString().padLeft(2, '0')}.${dateTime.month.toString().padLeft(2, '0')}.${dateTime.year}';
  }
}
