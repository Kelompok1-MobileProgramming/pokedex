import 'dart:convert';

import 'package:pokedex/core/network.dart';
import 'package:pokedex/data/source/github/models/pokemon.dart';

class GithubDataSource {
  static const String url =
      'https://raw.githubusercontent.com/Kelompok3-WebProgramming/pokedex/main/pokemon';

  GithubDataSource(this.networkManager);

  final NetworkManager networkManager;

  Future<List<GithubPokemonModel>> getPokemons() async {
    final response = await networkManager.request(RequestMethod.get, url);

    final data = (json.decode(response.data) as List)
        .map((item) => GithubPokemonModel.fromJson(item))
        .toList();

    return data;
  }
}
