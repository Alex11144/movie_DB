
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:the_movie_db/feature/domain/services/user_services.dart';





class ViewModelState {
  final String ageTitle;

  ViewModelState({required this.ageTitle});
}

class ViewModel extends ChangeNotifier {
  final userService = UserService();
  var _state = ViewModelState(ageTitle: '');
  ViewModelState get state => _state;
  void loadValue() async {
    await userService.initialize();
    _updateState();
  }

  ViewModel() {
    loadValue();
  }
  void _updateState() {
    final user = userService.user;
    _state = ViewModelState(
      ageTitle: user.age.toString(),
    );
    notifyListeners();
  }

  Future<void> onDecrementButton() async {
    userService.decrement();
    _updateState();
  }

  Future<void> increment() async {
    userService.increment();
    _updateState();
  }
}

class CounterWidget extends StatelessWidget {
  const CounterWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: Colors.red,
        height: 840,
        width: 390,
        child: Scaffold(
            body: Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: const [
              _AgeDecremntWidget(),
              Padding(
                padding: EdgeInsets.fromLTRB(5, 10, 5, 10),
                child: _AgeTitle(),
              ),
              _AgeIncremtWidget()
            ],
          ),
        )),
      ),
    );
  }
}

class _AgeTitle extends StatelessWidget {
  const _AgeTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final title = context.select((ViewModel vm) => vm.state.ageTitle);
    return Container(
        height: 20,
        width: 20,
        color: Colors.grey,
        child: Center(child: Text(title)));
  }
}

class _AgeDecremntWidget extends StatelessWidget {
  const _AgeDecremntWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<ViewModel>();

    return ElevatedButton(
        onPressed: viewModel.onDecrementButton,
        child: const Icon(Icons.remove));
  }
}

class _AgeIncremtWidget extends StatelessWidget {
  const _AgeIncremtWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<ViewModel>();

    return ElevatedButton(
        onPressed: viewModel.increment, child: const Icon(Icons.add));
  }
}
