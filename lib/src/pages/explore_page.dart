
import 'package:flutter/material.dart';
import 'package:food/src/admin/pages/add_food_item.dart';
import 'package:food/src/scoped_model/food_model.dart';
//import 'package:fooddelivery/src/models/food_model.dart';
import 'package:food/src/widgets/food_item_card.dart';
import 'package:food/src/widgets/show.dailog.dart';
import 'package:provider/provider.dart';

class FavoritePage extends StatefulWidget {


  @override
  _FavoritePageState createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {

  GlobalKey<ScaffoldState> _explorePageScaffoldKey = GlobalKey();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // widget.model.fetchFoods();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _explorePageScaffoldKey,
      backgroundColor: Colors.white,
      body: Consumer<FoodModel>(
        builder: (context, item, child) {
          // model.fetchFoods();
          //List<Food> foods = model.foods;
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 15.0),
            child: RefreshIndicator(
              onRefresh: item.fetchFoods,
              child: ListView.builder(
                itemCount: item.foodLength,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    // update food items
                    onTap: () async {
                      final bool response =
                      await Navigator.of(context).push(MaterialPageRoute(
                          builder: (BuildContext context) => AddFoodItem(
                            food: item.foods[index],
                          )));

                      if (response) {
                        SnackBar snackBar = SnackBar(
                          duration: Duration(seconds: 2),
                          backgroundColor: Theme.of(context).primaryColor,
                          content: Text(
                            "Food item successfully updated.",
                            style:
                            TextStyle(color: Colors.white, fontSize: 16.0),
                          ),
                        );
                        _explorePageScaffoldKey.currentState.showSnackBar(snackBar);
                      }
                    },
                    // delete food item
                    onDoubleTap: (){
                      showLoadingIndicator(context, "deleting food item...");
                      item.deleteFood(item.foods[index].id).then((bool response){
                        Navigator.of(context).pop();
                      });
                    },
                    child: FoodItemCard(
                      item.foods[index].name,
                      item.foods[index].description,
                      item.foods[index].price.toString(),
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}


//Container(
//padding: EdgeInsets.symmetric(horizontal: 10.0),
//child: ScopedModelDescendant<MainModel>(
//builder: (BuildContext context, Widget child, MainModel model) {
//model.fetchFoods();
//List<Food> foods = model.foods;
//
//return Column(
//crossAxisAlignment: CrossAxisAlignment.start,
//children: foods.map((Food food) {
//return FoodItemCard(
//food.name,
//food.description,
//food.price.toString(),
//);
//}).toList(),
//);
//},
//),
//),