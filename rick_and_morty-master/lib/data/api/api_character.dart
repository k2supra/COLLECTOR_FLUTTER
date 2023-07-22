import 'package:rick_and_morty/domain/character.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  Future<List<Character>> fetchAllCharacter() async {
    final response =
        await http.get(Uri.parse('https://rickandmortyapi.com/api/character'));
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final results = jsonData['results'];
      final List<Character> characters = results.map<Character>((result) {
        return Character(
          name: result['name'],
          status: result['status'],
          gender: result['gender'],
          location: result['location']['name'],
          image: result['image'],
        );
      }).toList();
      return characters;
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}