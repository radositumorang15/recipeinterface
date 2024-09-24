import 'package:flutter/material.dart';

void main() {
  runApp(RecipeApp());
}

class RecipeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: RecipeScreen(),
    );
  }
}

class RecipeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.menu),
        title: Text('Recipes'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.more_vert),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Image container
            Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.teal,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Center(
                child: Icon(
                  Icons.fastfood,
                  size: 100,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 20),
            // Recipe title
            Text(
              'Salad',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            // Star rating
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(5, (index) {
                return Icon(
                  Icons.star,
                  color: Colors.yellow,
                  size: 24,
                );
              }),
            ),
            SizedBox(height: 20),
            // User reviews
            Expanded(
              child: ListView(
                children: [
                  ReviewTile(
                    username: 'User1',
                    reviewText: 'Vocent option mentitum pri et.',
                    rating: 5,
                  ),
                  ReviewTile(
                    username: 'User2',
                    reviewText: 'Option mentitum et graece.',
                    rating: 4,
                  ),
                  ReviewTile(
                    username: 'User3',
                    reviewText: 'Vocent option incidenti nec!',
                    rating: 3,
                  ),
                ],
              ),
            ),
            // Button
            Container(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.yellow[700],
                  padding: EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Text(
                  'Recipe',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ReviewTile extends StatelessWidget {
  final String username;
  final String reviewText;
  final int rating;

  ReviewTile({
    required this.username,
    required this.reviewText,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: Colors.blueGrey,
            child: Icon(Icons.person, color: Colors.white),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  username,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Text(reviewText),
              ],
            ),
          ),
          Row(
            children: List.generate(rating, (index) {
              return Icon(
                Icons.star,
                color: Colors.yellow,
                size: 16,
              );
            }),
          ),
        ],
      ),
    );
  }
}
