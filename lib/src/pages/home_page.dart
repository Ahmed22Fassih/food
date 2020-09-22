import 'package:flutter/material.dart';
import 'package:food/src/pages/food_details_page.dart';
import 'package:food/src/scoped_model/food_model.dart';
import 'package:provider/provider.dart';
import '../widgets/food_category.dart';
import '../widgets/home_top_info.dart';
import '../widgets/search_field.dart';
import '../widgets/bought_foods.dart';

//import '../data/food_data.dart';
import '../models/food_model.dart';

class HomePage extends StatefulWidget {
//  final FoodModel foodModel ;
//  HomePage(this.foodModel);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
//  List<Food> _foods = foods;

  @override
  void initState() {
//    widget.foodModel.fetchFoods();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        padding: EdgeInsets.only(left: 20.0, right: 20.0),
        children: <Widget>[
          HomeTopInfo(),
          FoodCategory(),
          SizedBox(height: 20.0),
          SearchField(),
          SizedBox(
            height: 20.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "Frequetly Bought Foods",
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              GestureDetector(
                onTap: () {},
                child: Text(
                  "View All",
                  style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.orangeAccent),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20.0,
          ),
          // ?????????????????????????????????????????????????????????????????????????
          // ?????????????????????????????????????????????????????????????????????????
         Consumer<FoodModel>(
            builder: (context , item , child){
             return Column(
               children: item.foods.map(_buildFoodItems).toList(),
             );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildFoodItems(Food food) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (BuildContext context) => FoodDetailsPage(
            food: food,
          ),
        ));
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 20.0),
        child: BoughtFoods(
          id: food.id,
          name: food.name,
          imagePath: "assets/images/pizza.png",
          category: food.category,
          discount: food.discount,
          price: food.price,
          rating: food.ratings,
        ),
      ),
    );
  }
}
