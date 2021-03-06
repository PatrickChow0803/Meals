import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/screens/meal_detail_screen.dart';

class MealItem extends StatefulWidget {
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;

  MealItem({
    @required this.id,
    @required this.title,
    @required this.imageUrl,
    @required this.duration,
    @required this.complexity,
    @required this.affordability,
//    @required this.removeItem,
  });

  @override
  _MealItemState createState() => _MealItemState();
}

class _MealItemState extends State<MealItem> {
  bool favorited = false;

  void selectMeal(BuildContext context) {
    Navigator.pushNamed(
      context,
      MealDetailScreen.routeName,
      arguments: widget.id,
    ).then((result) {
      List<String> listOfResults = result as List<String>;
      // != means that you know that you have an ID of an item that you want to remove
//      print(listOfResults[0]);
      if (listOfResults[0] != null) {
//        removeItem(listOfResults[0]);
      }
    });
  }

  String get complexityText {
    switch (widget.complexity) {
      case Complexity.Simple:
        return 'Simple';
        break;
      case Complexity.Challenging:
        return 'Challenging';
        break;
      case Complexity.Hard:
        return 'Hard';
        break;
      default:
        return 'Unknown';
    }
  }

  String get affordablityText {
    switch (widget.affordability) {
      case Affordability.Affordable:
        return 'Affordable';
        break;
      case Affordability.Pricey:
        return 'Pricey';
        break;
      case Affordability.Luxurious:
        return 'Luxurious';
        break;
      default:
        return 'Unknown';
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectMeal(context),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 4,
        margin: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            // Use a stack for when you want to place widgets on top of each other.
            // In this example, A Text Widget is being placed on top of a Image
            // The first item in a stack if the bottom layer. The next item is the layer above that and so fourth.
            Stack(
              children: <Widget>[
                // Use ClipRRect for when you want to force a widget's dimensions.
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15.0),
                    topRight: Radius.circular(15.0),
                  ),
                  child: Image.network(
                    widget.imageUrl,
                    // Height should be 40% of the device screen
                    height: MediaQuery.of(context).size.height * .4,
                    // Width takes as much screen width possible
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                // Positioned Widget is only used within a stack for when you want to position a widget better
                Positioned(
                  // The child widget should be 20 pixels from the bottom and 10 rights from the right
                  bottom: 20,
                  right: 10,
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.7,
                    color: Colors.black54,
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: Text(
                      widget.title,
                      style: TextStyle(
                        fontSize: 26,
                        color: Colors.white,
                      ),
                      // Text Widget must be inside of another widget with dimensions for these properties to work
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                ),
                Container(
                  width: 50.0,
                  margin: EdgeInsets.all(10.0),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50.0),
                      color: Colors.white),
                  child: IconButton(
                    icon: Icon(Icons.favorite,
                        color: favorited ? Colors.pink : Colors.black54),
                    onPressed: () {
                      setState(() {
                        favorited = !favorited;
                      });
                    },
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Icon(Icons.schedule),
                      SizedBox(width: 6),
                      Text('${widget.duration} mins')
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Icon(Icons.work),
                      SizedBox(width: 6),
                      Text(complexityText)
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Icon(Icons.attach_money),
                      SizedBox(width: 6),
                      Text(affordablityText)
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
