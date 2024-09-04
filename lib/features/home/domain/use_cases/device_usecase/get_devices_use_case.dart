import 'package:arena_management/features/home/data/models/device_model.dart';
import 'package:arena_management/features/home/domain/repos/device_repo.dart';

class GetDevicesUseCase {
  final DeviceRepo deviceRepo;

  GetDevicesUseCase(this.deviceRepo);

  Future<List<DeviceModel>> call() {
    return deviceRepo.getDevices();
  }
}
