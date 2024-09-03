import 'package:arena_management/features/home/data/models/device_model.dart';
import 'package:arena_management/features/home/domain/repos/device_repo.dart';

class EditDeviceUseCase {
  final DeviceRepo deviceRepo;

  EditDeviceUseCase(this.deviceRepo);

  Future<void> call(DeviceModel updatedDevice) async {
    await deviceRepo.editDevice(updatedDevice);
  }
}
