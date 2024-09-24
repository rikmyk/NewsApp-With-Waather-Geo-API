import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "About the App",
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                    ),
              ),
              const SizedBox(height: 10),
              Text(
                "This app is designed to provide the latest news articles on various topics like technology, sports, and more. It features a search functionality to easily find specific articles, and offers a personalized feed based on user preferences.",
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Colors.grey[800],
                    ),
              ),
              const SizedBox(height: 20),
              Text(
                "Version 1.0.0",
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Colors.grey[700],
                    ),
              ),
              const SizedBox(height: 10),
              Text(
                "Developed by Rico",
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Colors.grey[700],
                    ),
              ),
              const SizedBox(height: 40),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor:
                            Theme.of(context).colorScheme.primaryContainer,
                        content: Padding(
                          // Replacing AnimatedPositioned with Padding or Container
                          padding: const EdgeInsets.all(
                              10.0), // Adjust padding as needed
                          child: Center(
                            child: Text(
                              'Soon',
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ),
                        ),
                        behavior: SnackBarBehavior.floating,
                        duration: const Duration(seconds: 2),
                      ),
                    );
                  },
                  child: const Text("Learn More"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
