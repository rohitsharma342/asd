import '../models/reservation_model.dart';

class StaticData {
  static List<ReservationModel> reservations = [
    ReservationModel(
      id: 'res_001',
      userId: 'user1',
      date: DateTime.now().add(const Duration(days: 2)),
      time: '19:00',
      guests: 4,
      status: 'confirmed',
      specialRequests: 'Window seat preferred',
    ),
    ReservationModel(
      id: 'res_002',
      userId: 'user1',
      date: DateTime.now().add(const Duration(days: 5)),
      time: '20:00',
      guests: 2,
      status: 'confirmed',
    ),
  ];

  static List<String> timeSlots = [
    '11:00',
    '11:30',
    '12:00',
    '12:30',
    '13:00',
    '13:30',
    '14:00',
    '14:30',
    '17:00',
    '17:30',
    '18:00',
    '18:30',
    '19:00',
    '19:30',
    '20:00',
    '20:30',
    '21:00',
    '21:30',
    '22:00',
  ];
}
