import 'package:mora_technical_test/feature/home/domain/models/home_model.dart';
import 'package:mora_technical_test/feature/home/domain/repository/home_repository.dart';

abstract class HomeServiceAbstract {
  Future<HomeModel> home();
}

class HomeService implements HomeServiceAbstract {
  final HomeRepositoryAbstract homeRepository;

  HomeService({
    required this.homeRepository,
  });
  @override
  Future<HomeModel> home() async {
    return await homeRepository.home();
  }

  factory HomeService.create() {
    return HomeService(
      homeRepository: HomeRepository.create(),
    );
  }
}
