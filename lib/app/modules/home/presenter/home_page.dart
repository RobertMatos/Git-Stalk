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
          if (store.state is SearchInitialState) {
            return const Center(
              child: Icon(
                Icons.person_search,
                size: 68,
                color: Colors.grey,
              ),
            );
          }
          if (store.state is SearchLoadingState) {
            return const Center(child: CircularProgressIndicator());
          }
          if (store.state is SearchFailureState) {
            var state = store.state as SearchFailureState;
            return Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.error,
                      size: 68,
                      color: Colors.red,
                    ),
                    Text(state.message)
                  ]),
            );
          }
          var state = store.state as SearchSuccessState;
          return Padding(
            padding: const EdgeInsets.all(10),
            child: ListView.separated(
              itemBuilder: (_, index) {
                var item = state.resultItem[index];
                return ListTile(
                  title: Text(item.login ?? '-'),
                  leading: item.avatarUrl != null
                      ? Image.network(item.avatarUrl!)
                      : Container(color: Colors.grey),
                );
              },
              separatorBuilder: (_, __) => const Divider(color: Colors.blue),
              itemCount: state.resultItem.length,
            ),
          );
        },
      ),
    );
  }
}
