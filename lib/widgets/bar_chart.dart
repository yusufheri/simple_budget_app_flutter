import 'package:flutter/material.dart';

class BarChart extends StatelessWidget {
  final List<double> expenses;

  BarChart(this.expenses);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    double mostExpensive = 0.0;
    expenses.forEach((double price) {
      if (price > mostExpensive) {
        mostExpensive = price;
      }
    });
    return Column(      
      children: <Widget>[
        Padding(padding: EdgeInsets.all(10.0)),
        Text(
          "Weekly Spending",
            style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2
          )
        ),
        SizedBox(height: 5.0,),
        Row( 
          mainAxisAlignment: MainAxisAlignment.spaceAround,         
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.arrow_back),
              iconSize: 30.0,
              onPressed: () {},
              splashColor: Colors.green,
            ),
            Text(
              "Dec 10, 2019 - Janvier 16, 2020",
              style: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.w600,
                letterSpacing: 1.2
              ),
            ),
            IconButton(
              icon: Icon(Icons.arrow_forward),
              iconSize: 30.0,
              onPressed: () {},
              splashColor: Colors.green,
            ),
          ],
        ),
        SizedBox(height: 30.0,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Bar(label:"Su", amountSpent: expenses[0], mostExpensive: mostExpensive),
            Bar(label:"Mo", amountSpent: expenses[1], mostExpensive: mostExpensive),
            Bar(label:"Tu", amountSpent: expenses[2], mostExpensive: mostExpensive),
            Bar(label:"We", amountSpent: expenses[3], mostExpensive: mostExpensive),
            Bar(label:"Th", amountSpent: expenses[4], mostExpensive: mostExpensive),
            Bar(label:"Fr", amountSpent: expenses[5], mostExpensive: mostExpensive),
            Bar(label:"Sa", amountSpent: expenses[6], mostExpensive: mostExpensive),
          ],
        ),
        SizedBox(height: 15.0,)
      ],
    );
  }
  
   
}


class Bar extends StatelessWidget {
  final String label;
  final double amountSpent;
  final double mostExpensive;

  final double _maxBarHeight = 150.0;


  Bar({this.label, this.amountSpent, this.mostExpensive});

  @override
  Widget build(BuildContext context) {
    //  Orientation orientation = MediaQuery.of(context).orientation;
    final barWeight = (amountSpent / mostExpensive) * _maxBarHeight;
    final taille = MediaQuery.of(context).size.width /16;
    final difference = barWeight/_maxBarHeight;

    return Column(      
      children: <Widget>[
        Text(
          '\$${amountSpent.toStringAsFixed(2)}',
          style: TextStyle(
            fontWeight: FontWeight.w600
            ),
          ),
        Container(
          height: barWeight,
          width: taille,
          decoration: BoxDecoration(
            //  color: (difference > 0.75)? Colors.pinkAccent : Theme.of(context).primaryColor,
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(6.0)
          ),
        ),
        Text(label, style: TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.w600
        ),)
      ],
    );
  }
}