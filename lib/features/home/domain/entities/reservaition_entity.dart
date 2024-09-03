class ReservaitionEntity {
  final String id;
  final String deviceId;
  final DateTime startTime;
  final DateTime endTime;

  ReservaitionEntity(
      {required this.id,
      required this.deviceId,
      required this.startTime,
      required this.endTime});

  double calculateCost(double pricePerHour) {
    final duration = endTime.difference(startTime).inMinutes / 60;
    return duration * pricePerHour;
  }
}
