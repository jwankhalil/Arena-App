import 'package:arena_management/features/home/data/models/reservation_model.dart';

abstract class ReservationRepo {
  Future<void> addReservation(ReservationModel reservation);
  Future<void> updateReservation(ReservationModel reservation);
  Future<void> deleteReservation(String reservationId);
  Future<List<ReservationModel>> getAllReservations();
  Future<ReservationModel?> getReservationById(String reservationId);
}
