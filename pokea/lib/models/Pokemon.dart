class Result {
  final int count;
  final String next;
  final dynamic previous;
  final List<Pokemon> pokemons;

  Result(
      {required this.count,
      required this.next,
      this.previous,
      required this.pokemons});
}

class Pokemon {
  Pokemon(name, url) {
    this.name = name;
    this.url = url;
  }

  late final String name;
  late final String url;
}
