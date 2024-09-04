import 'package:arena_management/features/home/data/models/reservation_model.dart';
import 'package:arena_management/features/home/domain/repos/reservation_reop.dart';

class GetReservationsUseCase {
  final ReservationRepo repository;

  GetReservationsUseCase(this.repository);

  Future<List<ReservationModel>> call() async {
    return await repository.getAllReservations();
  }
}
