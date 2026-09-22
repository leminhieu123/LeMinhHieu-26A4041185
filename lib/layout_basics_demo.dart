import 'package:flutter/material.dart';

class LayoutBasicsDemo extends StatelessWidget {
  const LayoutBasicsDemo({super.key});

  final List<Map<String, String>> movies = const [
    {
      'title': 'Inception',
      'genre': 'Sci-Fi / Action',
      'rating': '8.8',
    },
    {
      'title': 'The Dark Knight',
      'genre': 'Action / Crime',
      'rating': '9.0',
    },
    {
      'title': 'Interstellar',
      'genre': 'Sci-Fi / Drama',
      'rating': '8.7',
    },
    {
      'title': 'Avatar: The Way of Water',
      'genre': 'Sci-Fi / Adventure',
      'rating': '7.6',
    },
    {
      'title': 'Spider-Man: Across the Spider-Verse',
      'genre': 'Animation / Action',
      'rating': '8.7',
    },
    {
      'title': 'Oppenheimer',
      'genre': 'Biography / Drama',
      'rating': '8.9',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exercise 3: Layout Basics'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0), // Consistent spacing (16px)
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Section 1: Header Row
            const Text(
              'Movie Explorer',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
              ),
            ),
            const SizedBox(height: 8.0), // Consistent spacing (8px)

            // Section 2: Quick Stats Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildStatChip(Icons.movie, 'Total: ${movies.length}'),
                _buildStatChip(Icons.star, 'Top Rated: 9.0'),
                _buildStatChip(Icons.category, '6 Genres'),
              ],
            ),
            const SizedBox(height: 16.0), // Consistent spacing (16px)

            // Section 3: Subtitle / Section Header
            const Text(
              'Featured Movies',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 12.0), // Consistent spacing (12px)

            // Section 4: ListView.builder
            Expanded(
              child: ListView.builder(
                itemCount: movies.length,
                itemBuilder: (context, index) {
                  final movie = movies[index];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 12.0), // Consistent spacing (12px)
                    child: Card(
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0), // Consistent spacing (12px)
                        child: Row(
                          children: [
                            Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                color: Colors.deepPurple.shade100,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: const Icon(
                                Icons.local_movies_rounded,
                                color: Colors.deepPurple,
                              ),
                            ),
                            const SizedBox(width: 16.0), // Consistent spacing (16px)
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    movie['title']!,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 4.0),
                                  Text(
                                    movie['genre']!,
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey.shade600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              children: [
                                const Icon(Icons.star, color: Colors.amber, size: 18),
                                const SizedBox(width: 4.0),
                                Text(
                                  movie['rating']!,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatChip(IconData icon, String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8), // Consistent spacing
      decoration: BoxDecoration(
        color: Colors.deepPurple.shade50,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.deepPurple.shade200),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16, color: Colors.deepPurple),
          const SizedBox(width: 6),
          Text(
            label,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: Colors.deepPurple,
            ),
          ),
        ],
      ),
    );
  }
}
