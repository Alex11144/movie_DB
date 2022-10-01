import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Model extends ChangeNotifier {
  var one = 0;
  var two = 0;

  void increment1() {
    one++;
    notifyListeners();
  }

  void increment2() {
    two++;
    notifyListeners();
  }
}

// class ProviderExample extends StatelessWidget {
//   const ProviderExample({super.key});

//   @override
//   Widget build(BuildContext context) =>
//       ChangeNotifierProvider(create: (context) => Model(), child: const View());
// }

class OneWidget extends StatelessWidget {
  const OneWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final value = context.watch<Model>().one;
    return Text('$value');
  }
}

class TwoWidget extends StatelessWidget {
  const TwoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final value = context.watch<Model>().two;

    return Text('$value');
  }
}

class View extends StatelessWidget {
  const View({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.read<Model>();
    return Scaffold(
      body: Column(
        children: [
          ElevatedButton(
              onPressed: model.increment1, child: const Text('increment1')),
          ElevatedButton(
              onPressed: model.increment2, child: const Text('increment2')),
          const OneWidget(),
          const TwoWidget()
        ],
      ),
    );
  }
}
