import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
// import 'package:get/get.dart';

class TrandingCardView extends StatelessWidget {
  final String imageUrl;
  final String tags;
  final String time;
  final String title;
  final String author;
  final VoidCallback ontap;

  const TrandingCardView({
    super.key,
    required this.imageUrl,
    required this.tags,
    required this.time,
    required this.title,
    required this.author,
    required this.ontap,
  });

  String getFormattedDateTime(String rawDateTime) {
    try {
      DateTime dateTime = DateTime.parse(rawDateTime);
      return DateFormat('dd MMM yyyy').format(dateTime);
    } catch (e) {
      return 'Invalid date';
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
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
            // Image section
            Container(
              height: 170,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Theme.of(context).colorScheme.surface,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  errorBuilder: (context, error, stackTrace) {
                    return const Icon(Icons.error); // Handle image load error
                  },
                ),
              ),
            ),
            const SizedBox(height: 10),

            // Tags and Time section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  tags,
                  style: Theme.of(context).textTheme.labelSmall,
                ),
                Text(
                  getFormattedDateTime(time), // Use the formatted date-time
                  style: Theme.of(context).textTheme.labelSmall,
                ),
              ],
            ),
            const SizedBox(height: 5),

            // Title section
            Text(
              title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis, // Handle text overflow
              style: const TextStyle(
                fontSize: 15,
              ),
            ),
            const SizedBox(height: 10),

            // Author section
            Row(
              children: [
                const SizedBox(width: 10),
                CircleAvatar(
                  radius: 15,
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  child: Text(
                    author.isNotEmpty ? author[0] : '?',
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Flexible(
                  child: Text(
                    author,
                    maxLines: 1,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
