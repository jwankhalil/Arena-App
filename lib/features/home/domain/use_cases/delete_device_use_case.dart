import 'package:arena_management/features/home/domain/repos/device_repo.dart';

class DeleteDeviceUseCase {
  final DeviceRepo deviceRepo;

  DeleteDeviceUseCase(this.deviceRepo);

  Future<void> call(String id) async {
    await deviceRepo.deleteDevice(id);
  }
}
