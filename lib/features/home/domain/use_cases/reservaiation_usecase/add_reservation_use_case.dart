import 'package:arena_management/features/home/data/models/reservation_model.dart';
import 'package:arena_management/features/home/domain/repos/reservation_reop.dart';

class AddReservationUseCase {
  final ReservationRepo repository;

  AddReservationUseCase(this.repository);

  Future<void> call(ReservationModel reservation) async {
    await repository.addReservation(reservation);
  }
}
