import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rick_and_morty/data/api/api_character.dart';
import 'package:rick_and_morty/domain/character.dart';
import 'package:rick_and_morty/presentation/widgets/card_character.dart';

final userProvider = Provider<ApiService>((ref) => ApiService());

final characterListProvider = FutureProvider<List<Character>>((ref) async {
  return ref.watch(userProvider).fetchAllCharacter();
});

class ListCharacter extends ConsumerWidget {
  const ListCharacter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final charactersDataList = ref.watch(characterListProvider);
    return charactersDataList.when(
      loading: () => const CircularProgressIndicator(),
      error: (err, stack) => Text('Error: $err'),
      data: (charactersDataList) {
        List<Character> characters = charactersDataList.map((e) => e).toList();
        return GridView(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3,
          ),
          shrinkWrap: true,
          children: [
            for (final person in characters) CardCharacter(character: person),
          ],
        );
      },
    );
  }
}