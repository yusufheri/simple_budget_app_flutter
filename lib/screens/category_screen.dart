import 'package:flutter/material.dart';
import 'package:my_budget/helpers/color_helper.dart';
import 'package:my_budget/models/category_model.dart';
import 'package:my_budget/models/expenses_model.dart';
import 'package:my_budget/widgets/radial_painter.dart';

class CategoryScreen extends StatefulWidget {
  final Category category;

 CategoryScreen({this.category});


  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {

  _buildExpenses() {
    List<Widget> expenseList = [];
    widget.category.expenses.forEach((Expense expense) {
      expenseList.add(Container(
        alignment: Alignment.center,
        margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
        height: 80.0,
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
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,          
            children: <Widget>[
                Text(expense.name, style : TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0
                )),
                Text(
                  '-\$${expense.cost.toStringAsFixed(2)}', 
                  style : TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                    color: Colors.red
                ))
              ],
            ),
        )
      ));
    });

    return Column(
      children: expenseList,
    );
  }

  @override
  Widget build(BuildContext context) {

    double totalAmountSpent = 0.0;
    widget.category.expenses.forEach((Expense expense) {
      totalAmountSpent += expense.cost;
    });

    final double amountLeft = widget.category.maxAmount - totalAmountSpent;
    final double percent = totalAmountSpent / widget.category.maxAmount;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.category.name, 
          style: TextStyle(
            fontWeight: FontWeight.w600, 
            letterSpacing: 3.0
          )
        ),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            iconSize: 30.0,
            onPressed: () {},)
        ],
      ),
      bottomNavigationBar: Container(
        color: Theme.of(context).primaryColor,
        child: Text(
          "Copyright Yusuf Heri",
          textAlign: TextAlign.center,
          style: TextStyle(
            letterSpacing: 2.0,
            color: Colors.white,
            fontSize: 18.0,
            fontWeight: FontWeight.w600
          ),),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(20.0),
              padding: EdgeInsets.all(20.0),
              height: 250.0,
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
              child: CustomPaint(
                foregroundPainter: RadialPainter(
                  bgColor: Colors.grey[200],
                  lineColor: getColorRadial(context, percent),
                  percent: percent,
                  width: 15.0),
                child:  Center(
                  child: Text(
                    '\$${totalAmountSpent.toStringAsFixed(2)} / \$${widget.category.maxAmount}',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 20.0
                    ),
                  ),
                ),
              )
            ),
            _buildExpenses()
          ],
        )
      )
    );
  }
}