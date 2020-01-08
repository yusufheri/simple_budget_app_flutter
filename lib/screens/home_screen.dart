import 'package:flutter/material.dart';
import 'package:my_budget/data/data.dart';
import 'package:my_budget/models/category_model.dart';
import 'package:my_budget/models/expenses_model.dart';
import 'package:my_budget/widgets/bar_chart.dart';
import 'package:my_budget/helpers/color_helper.dart';
import 'package:my_budget/screens/category_screen.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  
  _buildCategory(Category category, double totalAmountSpent){
    return GestureDetector(
      onTap: () => Navigator.push(
        context, 
        MaterialPageRoute(
          builder:(_) => CategoryScreen(category: category)
        )
      ),
      child: Container(
      margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      padding: EdgeInsets.all(10.0),
      height: 100.0,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0, 2),
            blurRadius: 6.0
          )
        ]
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,            
            children: <Widget>[
              Text(category.name, style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20.0),),
              Text(
                '\$${(category.maxAmount - totalAmountSpent).toStringAsFixed(2)} /\$${category.maxAmount.toStringAsFixed(2)}',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18.0,
                ),
                )
            ],
          ),
          SizedBox(height: 10.0,),
          LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              final double maxBarWidth = constraints.maxWidth;
              final double percent = (category.maxAmount - totalAmountSpent) / category.maxAmount;
              double barwidth = percent * maxBarWidth;

              if (barwidth < 0) {
                barwidth = 0;
              }

              return Stack(
                children: <Widget>[
                  Container(
                    height: 20.0,
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(15.0)
                    ),
                  ),
                  Container(
                    height: 20.0,
                    width: barwidth,
                    decoration: BoxDecoration(
                        color: getColor(context, percent),
                        borderRadius: BorderRadius.circular(15.0)
                    ),
                  )
                ],
              );
            }
          ),
        ],
      ),
    ),
    );
  }

  @override
  Widget build(BuildContext context) {
   return Scaffold(
     body: CustomScrollView(
       slivers: <Widget>[
         SliverAppBar(
            forceElevated: true,
            floating: true,
            //  pinned: true,
            expandedHeight: 100.0,
            leading: IconButton(
              icon: Icon(Icons.settings),
              iconSize: 25.0,
              onPressed: () {},
              ),
            flexibleSpace: FlexibleSpaceBar(
              title: Text('Simple Budget',),
              centerTitle: true,
            ),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.add),
                iconSize: 25.0,
                onPressed: () {},
              )
            ],
         ),
         SliverList(delegate: SliverChildBuilderDelegate( 
           (BuildContext context, int index) {
             if (index == 0) {
               return Container(
                margin: EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 10.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      offset: Offset(0, 2),
                      blurRadius: 6.0
                    )
                  ],
                  borderRadius: BorderRadius.circular(10.0),                 
                ),
                child: BarChart(weeklySpending),
              );
             } else {
               Category category = categories[index - 1];
               double totalAmountSpent = 0.0;
               category.expenses.forEach((Expense expense) {
                 totalAmountSpent += expense.cost;
               });
               return _buildCategory(category, totalAmountSpent);
             }
             
            },childCount: 1 + categories.length
          )
         )
       ],
     ),
   );
  }
}
