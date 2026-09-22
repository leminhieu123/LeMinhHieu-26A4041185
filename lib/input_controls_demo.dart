import 'package:flutter/material.dart';

class InputControlsDemo extends StatefulWidget {
  const InputControlsDemo({super.key});

  @override
  State<InputControlsDemo> createState() => _InputControlsDemoState();
}

class _InputControlsDemoState extends State<InputControlsDemo> {
  // State variables
  double _sliderValue = 50.0;
  bool _switchValue = true;
  String _selectedOption = 'Option A';
  DateTime? _selectedDate;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exercise 2: Input Controls'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. Slider
            Text(
              '1. Slider Value: ${_sliderValue.toStringAsFixed(1)}',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Slider(
              value: _sliderValue,
              min: 0,
              max: 100,
              divisions: 100,
              label: _sliderValue.round().toString(),
              onChanged: (double value) {
                setState(() {
                  _sliderValue = value;
                });
              },
            ),
            const Divider(height: 32),

            // 2. Switch
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '2. Switch Status: ${_switchValue ? "ON" : "OFF"}',
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Switch(
                  value: _switchValue,
                  onChanged: (bool value) {
                    setState(() {
                      _switchValue = value;
                    });
                  },
                ),
              ],
            ),
            const Divider(height: 32),

            // 3. RadioListTile Group
            const Text(
              '3. Radio List Tile Group:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Card(
              child: RadioGroup<String>(
                groupValue: _selectedOption,
                onChanged: (String? value) {
                  if (value != null) {
                    setState(() {
                      _selectedOption = value;
                    });
                  }
                },
                child: const Column(
                  children: [
                    RadioListTile<String>(
                      title: Text('Option A'),
                      value: 'Option A',
                    ),
                    RadioListTile<String>(
                      title: Text('Option B'),
                      value: 'Option B',
                    ),
                    RadioListTile<String>(
                      title: Text('Option C'),
                      value: 'Option C',
                    ),
                  ],
                ),
              ),
            ),
            const Divider(height: 32),

            // 4. DatePicker Button
            const Text(
              '4. Date Picker:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                ElevatedButton.icon(
                  onPressed: () => _selectDate(context),
                  icon: const Icon(Icons.calendar_today),
                  label: const Text('Select Date'),
                ),
                const SizedBox(width: 16),
                Text(
                  _selectedDate == null
                      ? 'No date selected'
                      : '${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}',
                  style: const TextStyle(fontSize: 16, color: Colors.deepPurple),
                ),
              ],
            ),
            const Divider(height: 32),

            // Display Summary of Updated Values
            Card(
              color: Theme.of(context).colorScheme.primaryContainer,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Selected Values Summary:',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text('• Slider: ${_sliderValue.toStringAsFixed(1)}'),
                    Text('• Switch: ${_switchValue ? "Enabled" : "Disabled"}'),
                    Text('• Selected Radio: $_selectedOption'),
                    Text(
                      '• Selected Date: ${_selectedDate == null ? "None" : "${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}"}',
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
