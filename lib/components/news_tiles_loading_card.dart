import 'package:berita/components/loading_container.dart';
import 'package:flutter/material.dart';

class Newstilesloadingcard extends StatelessWidget {
  const Newstilesloadingcard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          // Loading shimmer
          const Loadingcontainer(
            width: 150,
            height: 150,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Loadingcontainer(
                      width: 30,
                      height: 30,
                    ),
                    const SizedBox(width: 10),
                    // Loading shimmer
                    Loadingcontainer(
                      width: MediaQuery.of(context).size.width / 2.6,
                      height: 20,
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                Loadingcontainer(
                  width: MediaQuery.of(context).size.width / 2.4,
                  height: 10,
                ),
                const SizedBox(height: 15),
                Loadingcontainer(
                  width: MediaQuery.of(context).size.width / 2.4,
                  height: 10,
                ),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Loadingcontainer(
                      width: MediaQuery.of(context).size.width / 6,
                      height: 10,
                    ),
                    Loadingcontainer(
                      width: MediaQuery.of(context).size.width / 6,
                      height: 10,
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
