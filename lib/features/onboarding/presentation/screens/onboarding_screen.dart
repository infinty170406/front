import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../routes.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Map<String, String>> _pages = [
    {
      'title': 'Pourquoi se protéger ?',
      'desc':
          'Internet est vaste. Protégez vos enfants des contenus inappropriés et des dangers en ligne.',
      'icon': 'shield',
    },
    {
      'title': 'L\'IA à vos côtés',
      'desc':
          'Notre intelligence artificielle analyse et vous conseille en temps réel pour une protection adaptée.',
      'icon': 'ai',
    },
    {
      'title': 'Sérénité Totale',
      'desc':
          'Gardez le contrôle avec bienveillance. L\'IA pense, vous décidez.',
      'icon': 'peace',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() => _currentPage = index);
                },
                itemCount: _pages.length,
                itemBuilder: (context, index) {
                  return _buildPage(_pages[index]);
                },
              ),
            ),
            _buildBottomControls(),
          ],
        ),
      ),
    );
  }

  Widget _buildPage(Map<String, String> data) {
    IconData iconData;
    switch (data['icon']) {
      case 'shield':
        iconData = Icons.security_rounded;
        break;
      case 'ai':
        iconData = Icons.auto_awesome_rounded;
        break;
      case 'peace':
        iconData = Icons.favorite_rounded;
        break;
      default:
        iconData = Icons.circle;
    }

    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FadeInDown(
            child: Container(
              padding: const EdgeInsets.all(40),
              decoration: BoxDecoration(
                color: AppTheme.primaryBlue.withOpacity(0.05),
                shape: BoxShape.circle,
              ),
              child: Icon(
                iconData,
                size: 100,
                color: AppTheme.primaryBlue,
              ),
            ),
          ),
          const SizedBox(height: 48),
          FadeInUp(
            delay: const Duration(milliseconds: 200),
            child: Text(
              data['title']!,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.displayMedium,
            ),
          ),
          const SizedBox(height: 16),
          FadeInUp(
            delay: const Duration(milliseconds: 400),
            child: Text(
              data['desc']!,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: AppTheme.textGrey,
                  ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomControls() {
    return Container(
      padding: const EdgeInsets.all(32),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              _pages.length,
              (index) => AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                margin: const EdgeInsets.symmetric(horizontal: 4),
                height: 8,
                width: _currentPage == index ? 24 : 8,
                decoration: BoxDecoration(
                  color: _currentPage == index
                      ? AppTheme.primaryBlue
                      : AppTheme.primaryBlue.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ),
          ),
          const SizedBox(height: 32),
          SizedBox(
            width: double.infinity,
            height: 56,
            child: ElevatedButton(
              onPressed: () {
                if (_currentPage < _pages.length - 1) {
                  _pageController.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                } else {
                  Navigator.pushReplacementNamed(context, AppRoutes.signup);
                }
              },
              child: Text(
                  _currentPage == _pages.length - 1 ? 'Commencer' : 'Suivant'),
            ),
          ),
        ],
      ),
    );
  }
}
