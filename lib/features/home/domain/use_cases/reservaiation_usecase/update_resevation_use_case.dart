import 'package:arena_management/features/home/data/models/reservation_model.dart';
import 'package:arena_management/features/home/data/repos/reservaation_repo_impl.dart';

class UpdateReservationUseCase {
  final ReservationRepositoryImpl repository;

  UpdateReservationUseCase(this.repository);

  Future<void> call(ReservationModel reservation) async {
    await repository.updateReservation(reservation);
  }
}
