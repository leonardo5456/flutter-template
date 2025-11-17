import 'package:flutter/material.dart';
import '../../../../core/router/app_router.dart';
import '../../../../core/storage/shared_prefs_service.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController _controller = PageController();
  int _currentIndex = 0;

  final _pages = const [
    _OnboardingSlide(
      title: "Find the item you've been looking for",
      subtitle:
          'Browse rich varieties of goods, carefully classified for seamless shopping.',
      icon: Icons.touch_app_outlined,
    ),
    _OnboardingSlide(
      title: 'Notify latest offers & availability',
      subtitle:
          'Enable notifications to stay updated with new offers and product stock.',
      icon: Icons.notifications_none_outlined,
    ),
    _OnboardingSlide(
      title: 'Fast & secure checkout',
      subtitle:
          'Save your details once and enjoy a quick and safe payment experience.',
      icon: Icons.credit_card_outlined,
    ),
  ];

  void _goNext() async {
    if (_currentIndex < _pages.length - 1) {
      _controller.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    } else {
      await SharedPrefsService.setBool('seen_onboarding', true);
      if (!mounted) return;
      Navigator.pushReplacementNamed(context, AppRoutes.login);
    }
  }

  @override
  Widget build(BuildContext context) {
    final isLast = _currentIndex == _pages.length - 1;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Header: Back to Home + Skip
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        AppRoutes.home,
                        (route) => false,
                      );
                    },
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: () async {
                      await SharedPrefsService.setBool('seen_onboarding', true);
                      if (!mounted) return;
                      Navigator.pushReplacementNamed(context, AppRoutes.login);
                    },
                    child: const Text('Skip'),
                  ),
                ],
              ),
            ),

            Expanded(
              child: PageView.builder(
                controller: _controller,
                itemCount: _pages.length,
                onPageChanged: (index) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
                itemBuilder: (_, index) => _pages[index],
              ),
            ),

            // Indicators + Next
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 24.0, vertical: 24),
              child: Row(
                children: [
                  Row(
                    children: List.generate(
                      _pages.length,
                      (index) => Container(
                        margin: const EdgeInsets.only(right: 6),
                        width: 8,
                        height: 8,
                        decoration: BoxDecoration(
                          color: _currentIndex == index
                              ? Theme.of(context).colorScheme.primary
                              : Theme.of(context)
                                  .colorScheme
                                  .primary
                                  .withOpacity(0.2),
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                    ),
                  ),
                  const Spacer(),
                  FloatingActionButton(
                    onPressed: _goNext,
                    child: Icon(isLast ? Icons.check : Icons.arrow_forward),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _OnboardingSlide extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;

  const _OnboardingSlide({
    required this.title,
    required this.subtitle,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8),
      child: Column(
        children: [
          const SizedBox(height: 16),
          Expanded(
            child: Center(
              child: Container(
                width: 220,
                height: 220,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: [
                      colorScheme.primary.withOpacity(0.8),
                      colorScheme.secondary.withOpacity(0.8),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Icon(
                  icon,
                  size: 96,
                  color: colorScheme.onPrimary,
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            title,
            style: Theme.of(context).textTheme.titleLarge,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 12),
          Text(
            subtitle,
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(color: colorScheme.onSurfaceVariant),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
