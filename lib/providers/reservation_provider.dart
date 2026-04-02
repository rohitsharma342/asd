import 'package:flutter/material.dart';
import '../models/reservation_model.dart';
import '../data/static_data.dart';

class ReservationProvider with ChangeNotifier {
  List<ReservationModel> _reservations = [];
  bool _isLoading = false;
  String? _errorMessage;

  List<ReservationModel> get reservations => _reservations;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  List<String> get timeSlots => StaticData.timeSlots;

  ReservationProvider() {
    loadReservations();
  }

  Future<void> loadReservations() async {
    _isLoading = true;
    notifyListeners();

    await Future.delayed(const Duration(milliseconds: 500));
    _reservations = List.from(StaticData.reservations);
    
    _isLoading = false;
    notifyListeners();
  }

  Future<bool> createReservation({
    required DateTime date,
    required String time,
    required int guests,
    String? specialRequests,
  }) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    await Future.delayed(const Duration(seconds: 1));

    final now = DateTime.now();
    if (date.isBefore(DateTime(now.year, now.month, now.day))) {
      _errorMessage = 'Cannot book a reservation for a past date';
      _isLoading = false;
      notifyListeners();
      return false;
    }

    final reservation = ReservationModel(
      id: 'res_${DateTime.now().millisecondsSinceEpoch}',
      userId: 'user1',
      date: date,
      time: time,
      guests: guests,
      status: 'confirmed',
      specialRequests: specialRequests,
    );

    _reservations.add(reservation);
    StaticData.reservations.add(reservation);
    
    _isLoading = false;
    notifyListeners();
    return true;
  }

  void cancelReservation(String id) {
    final index = _reservations.indexWhere((r) => r.id == id);
    if (index != -1) {
      _reservations[index] = _reservations[index].copyWith(status: 'cancelled');
      notifyListeners();
    }
  }

  void clearError() {
    _errorMessage = null;
    notifyListeners();
  }
}