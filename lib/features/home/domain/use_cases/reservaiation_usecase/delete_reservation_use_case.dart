import 'package:arena_management/features/home/domain/repos/reservation_reop.dart';

class DeleteReservationUseCase {
  final ReservationRepo repository;

  DeleteReservationUseCase(this.repository);

  Future<void> call(String reservationId) async {
    await repository.deleteReservation(reservationId);
  }
}
