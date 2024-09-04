import 'package:arena_management/features/home/data/models/reservation_model.dart';
import 'package:arena_management/features/home/domain/repos/reservation_reop.dart';
import 'package:hive/hive.dart';

class ReservationRepositoryImpl extends ReservationRepo {
  final Box<ReservationModel> reservationBox;

  ReservationRepositoryImpl({required this.reservationBox});

  @override
  Future<void> addReservation(ReservationModel reservation) async {
    await reservationBox.put(reservation.id, reservation);
  }

  @override
  Future<void> updateReservation(ReservationModel reservation) async {
    await reservationBox.put(reservation.id, reservation);
  }

  @override
  Future<void> deleteReservation(String reservationId) async {
    await reservationBox.delete(reservationId);
  }

  @override
  Future<List<ReservationModel>> getAllReservations() async {
    return reservationBox.values.toList();
  }

  @override
  Future<ReservationModel?> getReservationById(String reservationId) async {
    return reservationBox.get(reservationId);
  }
}
