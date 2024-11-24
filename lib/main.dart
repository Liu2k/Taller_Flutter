import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
        textTheme: GoogleFonts.robotoTextTheme(),
      ),
      home: Scaffold(
        body: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                botton(Icons.home_outlined, 'Home', () {}),
                botton(Icons.folder_open, 'My Files', () {}),
                botton(Icons.people_alt_outlined, 'Team', () {}),
                const Spacer(),
                botton(Icons.settings_outlined, 'Settings', () {}),
                botton(Icons.help_outline, 'Help', () {}),
                botton(Icons.add_circle_outline, 'New Project', () {}),
              ],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Project Overview',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Icon(Icons.notifications_none, size: 30),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Expanded(
                      child: GridView.count(
                        crossAxisCount: 2,
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 20,
                        children: List.generate(4, (index) => nota(index + 1)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Widget nota(int index) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.teal[100]!, Colors.teal[50]!],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 5, offset: Offset(2, 2)),
        ],
      ),
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(backgroundColor: Colors.teal, radius: 10),
              const SizedBox(width: 10),
              Text(
                'Project $index',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(height: 10),
          const Text(
            'This is a brief description of the project. Add more details as needed.',
            style: TextStyle(fontSize: 12),
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: Icon(Icons.edit, color: Colors.teal[700]),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.delete, color: Colors.red[700]),
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }

  InkWell botton(IconData icon, String text, Function onPressed) {
    return InkWell(
      onTap: () {
        onPressed();
        print(text);
      },
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Row(
          children: [
            Icon(icon, color: Colors.teal),
            const SizedBox(width: 10),
            Text(text, style: const TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
