class ReservationModel {
  final String id;
  final String userId;
  final DateTime date;
  final String time;
  final int guests;
  final String status;
  final String? specialRequests;

  ReservationModel({
    required this.id,
    required this.userId,
    required this.date,
    required this.time,
    required this.guests,
    required this.status,
    this.specialRequests,
  });

  ReservationModel copyWith({
    String? id,
    String? userId,
    DateTime? date,
    String? time,
    int? guests,
    String? status,
    String? specialRequests,
  }) {
    return ReservationModel(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      date: date ?? this.date,
      time: time ?? this.time,
      guests: guests ?? this.guests,
      status: status ?? this.status,
      specialRequests: specialRequests ?? this.specialRequests,
    );
  }
}