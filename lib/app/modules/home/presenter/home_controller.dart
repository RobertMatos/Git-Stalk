import 'package:git_stalk/app/modules/home/domain/entities/result_item_entity.dart';
import 'package:git_stalk/core/user_case/user_case.dart';
import 'package:mobx/mobx.dart';

import 'states/search_state.dart';

part 'home_controller.g.dart';

class HomeController = HomeControllerBase with _$HomeController;

abstract class HomeControllerBase with Store {
  UseCase<List<ResultItemEntity>, String> _useCase;

  @observable
  SearchState state = SearchInitialState();

  @observable
  int counter = 0;

  HomeControllerBase({required UseCase<List<ResultItemEntity>, String> useCase})
      : _useCase = useCase;

  Future<void> increment() async {
    counter = counter + 1;
  }

  Future searchDev(String value) async {
    state = SearchLoadingState();
    if (value.length < 3) {
      state = SearchInitialState();
    } else {
      var response = await _useCase.call(value);
      state = response.fold(
        (l) => SearchFailureState(message: 'Não foi possível realizar busca'),
        (r) => SearchSuccessState(resultItem: r),
      );
    }
  }
}
