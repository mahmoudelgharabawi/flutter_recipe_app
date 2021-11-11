import 'package:flutter/material.dart';
import 'package:flutter_recipes/models/recipe.dart';

class RecipeDetail extends StatefulWidget {
  final Recipe recipe;
  const RecipeDetail(this.recipe, {Key? key}) : super(key: key);

  @override
  _RecipeDetailState createState() => _RecipeDetailState();
}

class _RecipeDetailState extends State<RecipeDetail> {
  int _sliderValue = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.recipe.label),
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 300,
              width: double.infinity,
              child: Image(
                image: AssetImage(widget.recipe.imageUrl),
              ),
            ),
            SizedBox(
              height: 4,
            ),
            Text(
              widget.recipe.label,
              style: TextStyle(fontSize: 18),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: widget.recipe.ingredients.length,
                  itemBuilder: (_, index) {
                    final ingredient = widget.recipe.ingredients[index];
                    return Text(
                        '${ingredient.quantity * _sliderValue} ${ingredient.measure} ${ingredient.name}');
                  }),
            ),
            Slider(
                label: '${_sliderValue * widget.recipe.servings} servings',
                min: 1,
                max: 10,
                divisions: 10,
                activeColor: Colors.green,
                inactiveColor: Colors.black,
                value: _sliderValue.toDouble(),
                onChanged: (value) {
                  setState(() {
                    _sliderValue = value.toInt();
                  });
                })
          ],
        ),
      ),
    );
  }
}
