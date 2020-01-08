
import 'dart:math';

import 'package:my_budget/models/category_model.dart';
import 'package:my_budget/models/expenses_model.dart';

final rand = Random();

final List<double> weeklySpending = [
  rand.nextDouble()*100,
  rand.nextDouble()*100,
  rand.nextDouble()*100,
  rand.nextDouble()*100,
  rand.nextDouble()*100,
  rand.nextDouble()*100,
  rand.nextDouble()*100,
];

List<Category> categories = [
  Category(name: "Training", maxAmount: 550, expenses: _generateExpense()),
  Category(name: "Housing", maxAmount: 320, expenses: _generateExpense()),
  Category(name: "Food", maxAmount: 500, expenses: _generateExpense()),
  Category(name: "Utilities", maxAmount: 350, expenses: _generateExpense()),
  Category(name: "Health", maxAmount: 450, expenses: _generateExpense()),
  Category(name: "Family", maxAmount: 150, expenses: _generateExpense()),
];

List<Expense> _generateExpense() {
  List<Expense> expenses = [
    new Expense(name: "item 0", cost: rand.nextDouble() * 90),
    new Expense(name: "item 1", cost: rand.nextDouble() * 90),
    new Expense(name: "item 2", cost: rand.nextDouble() * 90),
    new Expense(name: "item 3", cost: rand.nextDouble() * 90),
    new Expense(name: "item 4", cost: rand.nextDouble() * 90),
    new Expense(name: "item 5", cost: rand.nextDouble() * 90)
  ];
  return expenses;
}

