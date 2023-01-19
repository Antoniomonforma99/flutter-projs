import 'package:bottom_nav_bar/Widgets/recipe_card.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import '../BottomNavBar/bottom_nav.dart';
import '../models/recipe.dart';
import 'package:http/http.dart' as http;

class Screen1 extends StatefulWidget {
  const Screen1({super.key});

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  late List<Recipe> _recipes;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    getRecipes();
  }

  Future<List<Recipe>> getRecipe() async {
    var uri =
        Uri.parse('https://yummly2.p.rapidapi.com/feeds/list?limit=24&start=0');

    final response = await http.get(uri, headers: {
      "X-RapidAPI-Key": "cebc971838mshc2a7400554befd6p1d6154jsn30f8e30c5fcb",
      "X-RapidAPI-Host": "yummly2.p.rapidapi.com",
      "useQueryString": "true"
    });

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);

      List _temp = [];

      print(jsonData["feed"]);

      for (var item in jsonData['feed']) {
        _temp.add(item);
      }
      return Recipe.recipesFromSnapshot(_temp);
    } else {
      throw Exception("Error");
    }
  }

  Future<void> getRecipes() async {
    _recipes = await getRecipe();
    setState(() {
      _isLoading = false;
    });
    print(_recipes);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //bottomNavigationBar: ,
      body: RecipeCard(
          title: "My recipe",
          cookTime: '30min',
          rating: '4.5',
          thumbnailUrl: ''),
    );
  }
}
