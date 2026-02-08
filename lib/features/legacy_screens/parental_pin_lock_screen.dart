import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';

class ParentalPinLockScreen extends StatefulWidget {
  const ParentalPinLockScreen({super.key});

  @override
  State<ParentalPinLockScreen> createState() => _ParentalPinLockScreenState();
}

class _ParentalPinLockScreenState extends State<ParentalPinLockScreen> {
  final List<String> _pin = [];
  final int _pinLength = 4;

  void _onNumberPressed(String number) {
    if (_pin.length < _pinLength) {
      setState(() {
        _pin.add(number);
      });
    }
  }

  void _onDeletePressed() {
    if (_pin.isNotEmpty) {
      setState(() {
        _pin.removeLast();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final textColor = isDark ? AppColors.textMainDark : AppColors.textMain;

    return Scaffold(
      backgroundColor:
          isDark ? AppColors.backgroundDark : AppColors.backgroundLight,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 48),
              const Icon(Icons.lock_outline, size: 64, color: AppColors.primary),
              const SizedBox(height: 24),
              Text(
                'Enter Guard PIN',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: textColor,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Please enter your 4-digit PIN to continue',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: isDark ? AppColors.textSubDark : AppColors.textSub,
                ),
              ),
              const SizedBox(height: 48),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(_pinLength, (index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    width: 16,
                    height: 16,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: index < _pin.length
                          ? AppColors.primary
                          : (isDark ? AppColors.gray700 : AppColors.gray300),
                    ),
                  );
                }),
              ),
              const Spacer(),
              _buildNumberPad(textColor),
              const SizedBox(height: 24),
              TextButton(
                onPressed: () {},
                child: const Text(
                  'Forgot PIN?',
                  style: TextStyle(color: AppColors.primary),
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNumberPad(Color textColor) {
    return Column(
      children: [
        _buildRow(['1', '2', '3'], textColor),
        const SizedBox(height: 24),
        _buildRow(['4', '5', '6'], textColor),
        const SizedBox(height: 24),
        _buildRow(['7', '8', '9'], textColor),
        const SizedBox(height: 24),
        _buildRow(['', '0', 'del'], textColor),
      ],
    );
  }

  Widget _buildRow(List<String> keys, Color textColor) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: keys.map((key) {
        if (key == '') return const SizedBox(width: 80, height: 80);
        if (key == 'del') {
          return SizedBox(
            width: 80,
            height: 80,
            child: IconButton(
              onPressed: _onDeletePressed,
              icon: Icon(Icons.backspace_outlined, color: textColor),
            ),
          );
        }
        return Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.primary.withOpacity(0.1),
          ),
          child: InkWell(
            customBorder: const CircleBorder(),
            onTap: () => _onNumberPressed(key),
            child: Center(
              child: Text(
                key,
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary,
                ),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
