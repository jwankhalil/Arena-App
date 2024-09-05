import 'package:arena_management/features/home/data/models/reservation_model.dart';
import 'package:arena_management/features/home/domain/repos/reservation_reop.dart';
import 'package:arena_management/features/home/domain/use_cases/reservaiation_usecase/add_reservation_use_case.dart';
import 'package:arena_management/features/home/domain/use_cases/reservaiation_usecase/delete_reservation_use_case.dart';
import 'package:arena_management/features/home/domain/use_cases/reservaiation_usecase/get_reservations_use_case.dart';
import 'package:arena_management/features/home/domain/use_cases/reservaiation_usecase/update_resevation_use_case.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'reservation_state.dart';

class ReservationCubit extends Cubit<ReservationState> {
  final GetReservationsUseCase getReservationsUseCase;
  final AddReservationUseCase addReservationUseCase;
  final ReservationRepo repository;

  ReservationCubit(
    this.getReservationsUseCase,
    this.addReservationUseCase,
    this.repository,
  ) : super(ReservationLoading());

  void loadReservations() async {
    try {
      emit(ReservationLoading());
      final reservations = await getReservationsUseCase.call();
      emit(ReservationLoaded(reservations));
    } catch (e) {
      emit(ReservationError('Failed to load reservations: $e'));
    }
  }

  Future<void> startReservation(String deviceId, String customerId) async {
    try {
      emit(ReservationLoading());

      final reservation = ReservationModel(
        id: UniqueKey().toString(),
        deviceId: deviceId,
        startTime: DateTime.now(),
        endTime: DateTime.now(),
      );

      await addReservationUseCase.call(reservation);
      emit(ReservationSuccess('Session started successfully'));
      loadReservations();
    } catch (e) {
      emit(ReservationError('Failed to start session: $e'));
    }
  }

  Future<void> endReservation(String deviceId, double pricePerHour) async {
    try {
      emit(ReservationLoading());

      final reservation = await repository.getReservationById(deviceId);
      if (reservation != null) {
        final updatedReservation = ReservationModel(
          id: reservation.id,
          deviceId: reservation.deviceId,
          startTime: reservation.startTime,
          endTime: DateTime.now(),
        );

        final calculatedCost = updatedReservation.calculateCost(pricePerHour);

        await repository.updateReservation(updatedReservation);

        emit(ReservationEnded(deviceId, calculatedCost));
        loadReservations();
      } else {
        emit(ReservationError('No active session found.'));
      }
    } catch (e) {
      emit(ReservationError('Failed to end session: $e'));
    }
  }
}

  // Future<void> updateReservation(ReservationModel reservation) async {
  //   try {
  //     emit(ReservationLoading());
  //     await updateReservationUseCase.call(reservation);
  //     emit(ReservationSuccess('Reservation updated successfully'));
  //     loadReservations();
  //   } catch (e) {
  //     emit(ReservationError('Failed to update reservation: $e'));
  //   }
  // }

  // Future<void> deleteReservation(String reservationId) async {
  //   try {
  //     emit(ReservationLoading());
  //     await deleteReservationUseCase.call(reservationId);
  //     emit(ReservationSuccess('Reservation deleted successfully'));
  //     loadReservations();
  //   } catch (e) {
  //     emit(ReservationError('Failed to delete reservation: $e'));
  //   }
  // }

