import 'package:service_locator/src/service_locator.dart';

class MeowService {
  void meow() => print('Meow!');
}

class MockMeowService implements MeowService {
  bool hasMeowed = false;

  @override
  void meow() => hasMeowed = true;
}

void useMeowService() {
  sl.get<MeowService>().meow();
}

ServiceLocator sl = ServiceLocator();

void main() {
  sl.registerInstance(MeowService());
  useMeowService(); // Prints "Meow!"

  sl = ServiceLocator();
  final testingService = MockMeowService();
  sl.registerInstance<MeowService>(testingService);

  // Test that our code uses the service correctly
  useMeowService();
  expect(testingService.hasMeowed, isTrue);
}

// For demonstration purposes.
void expect(a, b) {}
const isTrue = null;
