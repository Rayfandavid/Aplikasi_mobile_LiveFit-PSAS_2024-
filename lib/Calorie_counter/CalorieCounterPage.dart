import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CalorieCounterPage extends StatefulWidget {
  @override
  _CalorieCounterPageState createState() => _CalorieCounterPageState();
}

class _CalorieCounterPageState extends State<CalorieCounterPage> {
  final List<Map<String, dynamic>> _foods = [];
  final TextEditingController _foodController = TextEditingController();
  final TextEditingController _calorieController = TextEditingController();
  final TextEditingController _proteinController = TextEditingController();
  final TextEditingController _fatController = TextEditingController();
  final TextEditingController _carbController = TextEditingController();

  double _totalCalories = 0.0;
  double _totalProtein = 0.0;
  double _totalFat = 0.0;
  double _totalCarbs = 0.0;
  String? _selectedGender;

  final Map<String, List<Map<String, dynamic>>> _categorizedFoods = {
    "Fruits": [
      {
        "food": "Apple",
        "calories": 95,
        "protein": 0.5,
        "fat": 0.3,
        "carbs": 25
      },
      {
        "food": "Banana",
        "calories": 105,
        "protein": 1.3,
        "fat": 0.3,
        "carbs": 27.8
      },
      {
        "food": "Orange",
        "calories": 62,
        "protein": 1.2,
        "fat": 0.2,
        "carbs": 15.4
      },
    ],
    "Proteins": [
      {
        "food": "Chicken Breast (100g)",
        "calories": 165,
        "protein": 31.0,
        "fat": 3.6,
        "carbs": 0
      },
      {"food": "Egg", "calories": 78, "protein": 6.3, "fat": 5.3, "carbs": 0.6},
      {
        "food": "Salmon (100g)",
        "calories": 208,
        "protein": 20.0,
        "fat": 13.0,
        "carbs": 0
      },
    ],
    "Vegetables": [
      {
        "food": "Broccoli (100g)",
        "calories": 55,
        "protein": 3.7,
        "fat": 0.6,
        "carbs": 11.2
      },
      {
        "food": "Carrot (100g)",
        "calories": 41,
        "protein": 0.9,
        "fat": 0.2,
        "carbs": 9.6
      },
      {
        "food": "Spinach (100g)",
        "calories": 23,
        "protein": 2.9,
        "fat": 0.4,
        "carbs": 3.6
      },
    ],
    "Grains": [
      {
        "food": "Rice (100g)",
        "calories": 130,
        "protein": 2.7,
        "fat": 0.3,
        "carbs": 28.2
      },
      {
        "food": "Oats (100g)",
        "calories": 389,
        "protein": 16.9,
        "fat": 6.9,
        "carbs": 66.3
      },
      {
        "food": "Quinoa (100g)",
        "calories": 120,
        "protein": 4.1,
        "fat": 1.9,
        "carbs": 21.3
      },
    ],
  };

  void _addFood(
      String food, int calories, double protein, double fat, double carbs) {
    setState(() {
      _foods.add({
        "food": food,
        "calories": calories,
        "protein": protein,
        "fat": fat,
        "carbs": carbs,
      });
      _calculateTotals();
    });
  }

  void _calculateTotals() {
    _totalCalories = _foods.fold(
        0.0, (sum, item) => sum + (item["calories"] as int).toDouble());
    _totalProtein =
        _foods.fold(0.0, (sum, item) => sum + (item["protein"] as double));
    _totalFat = _foods.fold(0.0, (sum, item) => sum + (item["fat"] as double));
    _totalCarbs =
        _foods.fold(0.0, (sum, item) => sum + (item["carbs"] as double));
  }

  String _getCalorieRange() {
    if (_selectedGender == "Male") {
      return "1500 - 2725 kcal/day";
    } else if (_selectedGender == "Female") {
      return "1400 - 2250 kcal/day";
    } else {
      return "Select gender";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 240, 240, 240),
      appBar: AppBar(
        elevation: 0,
        title: Text(
          "Calorie Counter",
          style: GoogleFonts.poppins(
              color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Gender selection
              Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 255, 255, 255),
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        blurRadius: 5,
                        spreadRadius: 2),
                  ],
                ),
                child: Row(
                  children: [
                    const Text(
                      "Select Gender: ",
                      style: TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0), fontSize: 18),
                    ),
                    const SizedBox(width: 10),
                    DropdownButton<String>(
                      value: _selectedGender,
                      dropdownColor: const Color.fromARGB(255, 255, 255, 255),
                      style:
                          const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                      items: ["Male", "Female"].map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (newValue) {
                        setState(() {
                          _selectedGender = newValue;
                        });
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              // Calorie and Nutrient Summary Section
              Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 255, 255, 255),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        blurRadius: 5,
                        spreadRadius: 2),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildSummaryItem("Calories", _totalCalories.toString(),
                        _getCalorieRange(), Colors.green),
                    const Divider(
                        color: Color.fromARGB(255, 67, 184, 0), thickness: 0.5),
                    _buildSummaryItem(
                        "Protein",
                        "${_totalProtein.toStringAsFixed(1)} g",
                        "",
                        Colors.blue),
                    const Divider(
                        color: Color.fromARGB(255, 3, 85, 207), thickness: 0.5),
                    _buildSummaryItem("Fat",
                        "${_totalFat.toStringAsFixed(1)} g", "", Colors.orange),
                    const Divider(
                        color: Color.fromARGB(255, 224, 130, 7),
                        thickness: 0.5),
                    _buildSummaryItem(
                        "Carbohydrates",
                        "${_totalCarbs.toStringAsFixed(1)} g",
                        "",
                        Colors.purple),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              // Input fields for custom food item
              _buildCustomFoodInput(),

              const SizedBox(height: 16),

              // List of Food Categories
              ..._categorizedFoods.entries.map((entry) {
                return _buildCategory(entry.key, entry.value);
              }).toList(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSummaryItem(
      String title, String value, String target, Color color) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                  color: color, fontWeight: FontWeight.bold, fontSize: 16),
            ),
            if (target.isNotEmpty)
              Text(
                target,
                style: const TextStyle(color: Colors.grey, fontSize: 12),
              ),
          ],
        ),
        Text(
          value,
          style: const TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget _buildCustomFoodInput() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 255, 255, 255),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              blurRadius: 5,
              spreadRadius: 2),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Add Custom Food",
            style: TextStyle(
                color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          TextField(
            controller: _foodController,
            decoration: InputDecoration(
              labelText: "Food Name",
              filled: true,
              fillColor: const Color.fromARGB(255, 240, 240, 240),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              labelStyle: const TextStyle(color: Colors.black),
            ),
            style: const TextStyle(color: Colors.black),
          ),
          const SizedBox(height: 10),
          TextField(
            controller: _calorieController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: "Calories",
              filled: true,
              fillColor: const Color.fromARGB(255, 240, 240, 240),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              labelStyle: const TextStyle(color: Colors.black),
            ),
            style: const TextStyle(color: Colors.black),
          ),
          const SizedBox(height: 10),
          TextField(
            controller: _proteinController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: "Protein (g)",
              filled: true,
              fillColor: const Color.fromARGB(255, 240, 240, 240),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              labelStyle: const TextStyle(color: Colors.black),
            ),
            style: const TextStyle(color: Colors.black),
          ),
          const SizedBox(height: 10),
          TextField(
            controller: _fatController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: "Fat (g)",
              filled: true,
              fillColor: const Color.fromARGB(255, 240, 240, 240),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              labelStyle: const TextStyle(color: Colors.black),
            ),
            style: const TextStyle(color: Colors.black),
          ),
          const SizedBox(height: 10),
          TextField(
            controller: _carbController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: "Carbohydrates (g)",
              filled: true,
              fillColor: const Color.fromARGB(255, 240, 240, 240),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              labelStyle: const TextStyle(color: Colors.black),
            ),
            style: const TextStyle(color: Colors.black),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              String food = _foodController.text;
              int? calories = int.tryParse(_calorieController.text);
              double? protein = double.tryParse(_proteinController.text);
              double? fat = double.tryParse(_fatController.text);
              double? carbs = double.tryParse(_carbController.text);

              if (food.isNotEmpty &&
                  calories != null &&
                  protein != null &&
                  fat != null &&
                  carbs != null) {
                _addFood(food, calories, protein, fat, carbs);
                _foodController.clear();
                _calorieController.clear();
                _proteinController.clear();
                _fatController.clear();
                _carbController.clear();
              } else {
                // Show an error message if inputs are invalid
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                      content: Text("Please fill all fields correctly.")),
                );
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blueAccent,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
            ),
            child: const Text("Add Food",
                style: TextStyle(color: Colors.black, fontFamily: 'Poppins')),
          ),
        ],
      ),
    );
  }

  Widget _buildCategory(String category, List<Map<String, dynamic>> foods) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: ExpansionTile(
        backgroundColor: Colors.blue[850],
        collapsedBackgroundColor: Colors.blue[850],
        title: Text(
          category,
          style: const TextStyle(
              color: Color.fromARGB(255, 0, 0, 0),
              fontWeight: FontWeight.bold),
        ),
        children: foods.map((foodItem) {
          return ListTile(
            title: Text(
              foodItem["food"],
              style: const TextStyle(
                  color: Colors.blueAccent,
                  fontFamily: 'Poppins'),
            ),
            subtitle: Text(
              "${foodItem["calories"]} kcal | ${foodItem["protein"]} g protein | ${foodItem["fat"]} g fat | ${foodItem["carbs"]} g carbs",
              style: const TextStyle(color: Colors.grey, fontFamily: 'Poppins'),
            ),
            trailing: IconButton(
              icon: const Icon(Icons.add,
                  color: Color.fromARGB(255, 3, 133, 240)),
              onPressed: () {
                _addFood(foodItem["food"], foodItem["calories"],
                    foodItem["protein"], foodItem["fat"], foodItem["carbs"]);
              },
            ),
          );
        }).toList(),
      ),
    );
  }
}
