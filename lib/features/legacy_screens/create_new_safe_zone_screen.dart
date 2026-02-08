import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';

class CreateNewSafeZoneScreen extends StatefulWidget {
  const CreateNewSafeZoneScreen({super.key});

  @override
  State<CreateNewSafeZoneScreen> createState() =>
      _CreateNewSafeZoneScreenState();
}

class _CreateNewSafeZoneScreenState extends State<CreateNewSafeZoneScreen> {
  final _nameController = TextEditingController();
  final _addressController = TextEditingController();
  double _radius = 150.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      appBar: AppBar(
        title: const Text('Add Safe Zone'),
        backgroundColor: Colors.white,
        foregroundColor: AppColors.textMain,
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Zone Name',
                  hintText: 'e.g., School, Library, Home',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _addressController,
                decoration: InputDecoration(
                  labelText: 'Address',
                  hintText: 'Search or enter address',
                  prefixIcon: const Icon(Icons.search),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none),
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                'Zone Radius',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    child: Slider(
                      value: _radius,
                      min: 50,
                      max: 1000,
                      divisions: 19,
                      label: '${_radius.round()}m',
                      activeColor: AppColors.primary,
                      onChanged: (v) => setState(() => _radius = v),
                    ),
                  ),
                  Text('${_radius.round()}m',
                      style: const TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
              const SizedBox(height: 24),
              Container(
                height: 250,
                decoration: BoxDecoration(
                  color: AppColors.gray200,
                  borderRadius: BorderRadius.circular(16),
                  image: const DecorationImage(
                    image: NetworkImage(
                        'https://maps.googleapis.com/maps/api/staticmap?center=40.714728,-73.998672&zoom=15&size=600x300&maptype=roadmap&key=AIzaSyA_example'), // Mock API key
                    fit: BoxFit.cover,
                  ),
                ),
                child: Center(
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: AppColors.primary.withOpacity(0.2),
                      shape: BoxShape.circle,
                      border: Border.all(color: AppColors.primary, width: 2),
                    ),
                    child:
                        const Icon(Icons.location_on, color: AppColors.primary),
                  ),
                ),
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  foregroundColor: Colors.white,
                  minimumSize: const Size(double.infinity, 56),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text('Save Safe Zone'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
