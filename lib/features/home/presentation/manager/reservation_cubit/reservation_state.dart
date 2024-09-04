part of 'reservation_cubit.dart';

@immutable
abstract class ReservationState {}

class ReservationInitial extends ReservationState {}

class ReservationLoading extends ReservationState {}

class ReservationLoaded extends ReservationState {
  final List<ReservationModel> reservations;

  ReservationLoaded(this.reservations);
}

class ReservationSuccess extends ReservationState {
  final String message;

  ReservationSuccess(this.message);
}

class ReservationEnded extends ReservationState {
  final String deviceId;
  final double calculatedCost;

  ReservationEnded(this.deviceId, this.calculatedCost);
}

class ReservationError extends ReservationState {
  final String errorMessage;

  ReservationError(this.errorMessage);
}
