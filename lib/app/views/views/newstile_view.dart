import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
// import 'package:get/get.dart';

class NewstileView extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String author;
  final String time;
  final VoidCallback onTap;

  const NewstileView({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.author,
    required this.time,
    required this.onTap,
  });

  String getFormattedDateTime(String rawDateTime) {
    try {
      DateTime dateTime = DateTime.parse(rawDateTime);
      return DateFormat('EEEE, dd MMM yyyy HH:mm a').format(dateTime);
    } catch (e) {
      return 'Invalid date';
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 15),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primaryContainer,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                borderRadius: BorderRadius.circular(20),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 10,
                        backgroundColor: Theme.of(context).colorScheme.primary,
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          author,
                          overflow: TextOverflow.ellipsis, // Handle overflow
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Text(
                    title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis, // Handle overflow
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const SizedBox(height: 15),
                  Text(
                    getFormattedDateTime(time), // Use the formatted date-time
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
