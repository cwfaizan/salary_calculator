import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final gsController = TextEditingController();
  final taxController = TextEditingController();
  double salary = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Salary Calculator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Gross Salary'),
            TextFormField(
              controller: gsController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                hintText: 'Gross Salary',
              ),
            ),
            const SizedBox(height: 50),
            const Text('Tax Amount'),
            TextFormField(
              controller: taxController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                hintText: 'Tax Amount',
              ),
            ),
            const SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FilledButton.icon(
                  icon: const Icon(Icons.calculate),
                  onPressed: () {
                    String gSalary = gsController.text;
                    String tAmount = taxController.text;
                    double grossSalary = double.parse(gSalary);
                    double taxAmount = double.parse(tAmount);
                    double netSalary =
                        grossSalary - (grossSalary * taxAmount / 100);
                    setState(() {
                      salary = netSalary;
                    });
                  },
                  label: const Text('Calculate'),
                ),
                FilledButton(
                  onPressed: () {
                    gsController.clear();
                    taxController.clear();
                    setState(() {
                      salary = 0.0;
                    });
                  },
                  child: const Text('Clear'),
                ),
              ],
            ),
            Text('Net Salary $salary'),
          ],
        ),
      ),
    );
  }
}
