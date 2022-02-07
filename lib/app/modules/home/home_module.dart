import 'package:flutter_modular/flutter_modular.dart';

import 'domain/user_cases/get_user_by_carry_user_case.dart';
import 'external/dataSources/search_data_sources_impl.dart';
import 'infra/repositories/search_repository_impl.dart';
import 'presenter/home_controller.dart';
import 'presenter/home_page.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [
    // Data Sources
    Bind((i) => SearchDataSourceImpl(httpClient: i())),
    // Repositories
    Bind((i) => SearchRepositoryImpl(searchDataSource: i())),
    // User Case
    Bind((i) => GetUserByQueryUseCase(searchRepository: i())),
    // Controllers
    Bind.lazySingleton((i) => HomeController(useCase: i())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => const HomePage()),
  ];
}
