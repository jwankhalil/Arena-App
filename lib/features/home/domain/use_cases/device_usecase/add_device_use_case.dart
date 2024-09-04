import 'package:arena_management/features/home/data/models/device_model.dart';
import 'package:arena_management/features/home/domain/repos/device_repo.dart';

class AddDeviceUseCase {
  final DeviceRepo deviceRepo;

  AddDeviceUseCase(this.deviceRepo);

  Future<void> call(DeviceModel device) async {
    await deviceRepo.addDevice(device);
  }
}
