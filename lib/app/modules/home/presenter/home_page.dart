import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'home_controller.dart';
import 'states/search_state.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key? key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: searchController,
          onChanged: (value) async {
            await store.searchDev(value);
          },
          decoration: InputDecoration(
            hintText: 'Digite ao menos dois caracteres',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            filled: true,
            fillColor: Colors.white,
            suffixIcon: const Icon(Icons.search),
            contentPadding: const EdgeInsets.symmetric(
              vertical: 8,
              horizontal: 12,
            ),
          ),
        ),
      ),
      body: Observer(
        builder: (_) {
          print(store.state);
          if (store.state is SearchInitialState) {
            return const Center(
              child: Icon(
                Icons.account_circle,
                size: 68,
                color: Colors.grey,
              ),
            );
          }
          if (store.state is SearchLoadingState) {
            return const Center(child: CircularProgressIndicator());
          }
          return Padding(
            padding: const EdgeInsets.all(10),
            child: Text('-'),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          store.increment();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
