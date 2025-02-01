import 'package:flutter/material.dart';

void main() {
  runApp(const SubjectclassesPage());
}

class SubjectclassesPage extends StatelessWidget {
  const SubjectclassesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const CourseListPage(),
    );
  }
}

class CourseListPage extends StatefulWidget {
  const CourseListPage({super.key});

  @override
  State<CourseListPage> createState() => _CourseListPageState();
}

class _CourseListPageState extends State<CourseListPage> {
  final ScrollController _scrollController = ScrollController();
  String? selectedTopicTitle;

  final List<Map<String, String>> mathTopics = [
    {'title': 'Algebra Basics', 'image': 'assets/images/algebra.png'},
    {'title': 'Geometry Fundamentals', 'image': 'assets/images/geometrics.png'},
    {'title': 'Trigonometry Essentials', 'image': 'assets/images/trigonometry.png'},
    {'title': 'Calculus - Differentiation', 'image': 'assets/images/calculas.jpg'},
    {'title': 'Calculus - Integration', 'image': 'assets/images/integration.webp'},
    {'title': 'Probability & Statistics', 'image': 'assets/images/statistics.png'},
    {'title': 'Linear Algebra', 'image': 'assets/images/linear_algebra.png'},
    {'title': 'Number Theory', 'image': 'assets/images/number_theory.png'},
    {'title': 'Set Theory', 'image': 'assets/images/set_theory.png'},
    {'title': 'Complex Numbers', 'image': 'assets/images/complex_numbers.png'},
    {'title': 'Vector Mathematics', 'image': 'assets/images/vector.jpg'},
    {'title': 'Differential Equations', 'image': 'assets/images/differential.png'},
    {'title': 'Discrete Mathematics', 'image': 'assets/images/discrete.png'},
    {'title': 'Logic and Reasoning', 'image': 'assets/images/logic.png'},
    {'title': 'Graphs and Networks', 'image': 'assets/images/graphs.png'},
    {'title': 'Combinatorics', 'image': 'assets/images/combinatorics.png'},
  ];

  @override
  void initState() {
    super.initState();
    // Remove forced scrolling on initState to avoid layout issues
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.jumpTo(_scrollController.position.minScrollExtent);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Math Topics'),
        backgroundColor: Colors.orange,
      ),
      body: Column(
        children: [
          // Placeholder for selected topic
          SizedBox(
            height: 200,
            width: double.infinity,
            child: selectedTopicTitle == null
                ? Image.asset(
                    'assets/images/placeholder.png',
                    fit: BoxFit.cover,
                  )
                : Center(
                    child: Text(
                      selectedTopicTitle!,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
          ),
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              padding: const EdgeInsets.all(16.0),
              itemCount: mathTopics.length,
              itemBuilder: (context, index) {
                final topic = mathTopics[index];
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      // Set the selected topic title
                      selectedTopicTitle = topic['title'];
                    });
                  },
                  child: _buildTopicCard(topic['title']!, topic['image']!),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTopicCard(String title, String image) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                image,
                width: 80,
                height: 80,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}