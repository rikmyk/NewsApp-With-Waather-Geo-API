import 'package:berita/components/loading_container.dart';
import 'package:flutter/material.dart';

class Trandingloadingcard extends StatelessWidget {
  const Trandingloadingcard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      padding: const EdgeInsets.all(5),
      width: 250,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Theme.of(context).colorScheme.primaryContainer,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Loading shimmer
          Loadingcontainer(
            width: MediaQuery.of(context).size.width,
            height: 200,
          ),
          const SizedBox(height: 10),

          // Tags and Time section
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Loading shimmer
              Loadingcontainer(
                width: MediaQuery.of(context).size.width / 4,
                height: 10,
              ),
              // Loading shimmer
              Loadingcontainer(
                width: MediaQuery.of(context).size.width / 6,
                height: 10,
              ),
            ],
          ),
          const SizedBox(height: 10),

          // Title
          // Loading shimmer
          Row(
            children: [
              Loadingcontainer(
                width: MediaQuery.of(context).size.width / 1.7,
                height: 15,
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Loadingcontainer(
                width: MediaQuery.of(context).size.width / 2 - 0.2,
                height: 15,
              ),
            ],
          ),
          const SizedBox(height: 10),

          // Author section
          Row(
            children: [
              const SizedBox(width: 10),
              // Loading shimmer
              const Loadingcontainer(
                width: 30,
                height: 30,
              ),
              const SizedBox(width: 10),
              Flexible(
                child: // Loading shimmer
                    Loadingcontainer(
                  width: MediaQuery.of(context).size.width / 2.3,
                  height: 10,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}


