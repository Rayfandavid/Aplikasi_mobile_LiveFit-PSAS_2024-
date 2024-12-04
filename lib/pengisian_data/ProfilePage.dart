import 'package:flutter/material.dart';
import 'package:flutter_application_1/halaman_utama/MainPage.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfilePage extends StatefulWidget {
  final Function(String?, String?, double?, double?, DateTime?) onSaveProfile;
  final String? name;
  final String? gender;
  final double? height;
  final double? weight;
  final DateTime? birthday;

  const ProfilePage({
    Key? key,
    required this.onSaveProfile,
    this.name,
    this.gender,
    this.height,
    this.weight,
    this.birthday,
  }) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late String? name;
  late String? gender;
  late double? height;
  late double? weight;
  late DateTime? birthday;

  final TextEditingController _nameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    name = widget.name;
    gender = widget.gender;
    height = widget.height;
    weight = widget.weight;
    birthday = widget.birthday;

    _nameController.text = name ?? '';
    _nameController.addListener(() {
      setState(() {
        name = _nameController.text;
      });
    });
  }

  void _selectGender() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Select Gender", style: TextStyle(color: Colors.blue)),
          content: DropdownButton<String>(
            value: gender,
            items: <String>['Male', 'Female', 'Other'].map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (String? newValue) {
              setState(() {
                gender = newValue;
              });
              Navigator.pop(context);
            },
          ),
          actions: [
            TextButton(
              child: const Text("Close", style: TextStyle(color: Colors.blue)),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _enterHeight() {
    final TextEditingController heightController =
        TextEditingController(text: height?.toString() ?? '');
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: const Text("Enter Height (cm)",
              style: TextStyle(color: Colors.blue)),
          content: TextField(
            controller: heightController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              hintText: "Enter your height in cm",
              hintStyle: TextStyle(color: Colors.grey),
            ),
            style: const TextStyle(color: Colors.black),
          ),
          actions: [
            TextButton(
              child: const Text("Save", style: TextStyle(color: Colors.blue)),
              onPressed: () {
                setState(() {
                  height = double.tryParse(heightController.text);
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _enterWeight() {
    final TextEditingController weightController =
        TextEditingController(text: weight?.toString() ?? '');
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: const Text("Enter Weight (kg)",
              style: TextStyle(color: Colors.blue)),
          content: TextField(
            controller: weightController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              hintText: "Enter your weight in kg",
              hintStyle: TextStyle(color: Colors.grey),
            ),
            style: const TextStyle(color: Colors.black),
          ),
          actions: [
            TextButton(
              child: const Text("Save", style: TextStyle(color: Colors.blue)),
              onPressed: () {
                setState(() {
                  weight = double.tryParse(weightController.text);
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _selectBirthday() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: Colors.blue,
            hintColor: Colors.blue,
            colorScheme: ColorScheme.light(primary: Colors.blue),
          ),
          child: child!,
        );
      },
    );
    if (pickedDate != null) {
      setState(() {
        birthday = pickedDate;
      });
    }
  }

  void _saveProfile() {
    widget.onSaveProfile(name, gender, height, weight, birthday);
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => MainPage(
          name: name,
          gender: gender,
          height: height,
          weight: weight,
          birthday: birthday,
        ),
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Profile Saved")),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 2),
              Text(
                'LiveFit',
                style: GoogleFonts.poppins(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
              TextField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: "Your Username",
                  labelStyle: const TextStyle(
                      color: Colors.black54, fontWeight: FontWeight.bold),
                  fillColor: Colors.blue[100],
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide.none,
                  ),
                ),
                style: const TextStyle(color: Colors.black),
              ),
              const SizedBox(height: 15),
              _buildOptionField(
                label: gender ?? "Select Gender",
                onTap: _selectGender,
              ),
              const SizedBox(height: 15),
              _buildOptionField(
                label: height != null
                    ? "Height: ${height!.toStringAsFixed(1)} cm"
                    : "Enter Height (cm)",
                onTap: _enterHeight,
              ),
              const SizedBox(height: 15),
              _buildOptionField(
                label: weight != null
                    ? "Weight: ${weight!.toStringAsFixed(1)} kg"
                    : "Enter Weight (kg)",
                onTap: _enterWeight,
              ),
              const SizedBox(height: 15),
              _buildOptionField(
                label: birthday != null
                    ? "Birthday: ${birthday!.toLocal()}".split(' ')[0]
                    : "Select Birthday",
                onTap: _selectBirthday,
              ),
              const SizedBox(height: 25),
              ElevatedButton(
                onPressed: _saveProfile,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: const Text(
                  "Buat",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                "Semangat Olahraga!",
                style: GoogleFonts.poppins(color: Colors.blue, fontSize: 14),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOptionField(
      {required String label, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        decoration: BoxDecoration(
          color: Colors.blue[50],
          borderRadius: BorderRadius.circular(5),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: label.contains("Select") || label.contains("Enter")
                ? Colors.grey[500]
                : Colors.black,
          ),
        ),
      ),
    );
  }
}
