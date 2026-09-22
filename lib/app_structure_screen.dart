import 'package:flutter/material.dart';

void main() {
  runApp(const AppStructureDemoApp());
}

class AppStructureDemoApp extends StatefulWidget {
  const AppStructureDemoApp({super.key});

  @override
  State<AppStructureDemoApp> createState() => _AppStructureDemoAppState();
}

class _AppStructureDemoAppState extends State<AppStructureDemoApp> {
  ThemeMode _themeMode = ThemeMode.light;

  void _toggleTheme(bool isDark) {
    setState(() {
      _themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Exercise 4: App Structure & Theme',
      debugShowCheckedModeBanner: false,
      // Customized Light Theme
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.teal,
          brightness: Brightness.light,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.teal,
          foregroundColor: Colors.white,
          centerTitle: true,
          elevation: 2,
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Colors.teal,
          foregroundColor: Colors.white,
        ),
      ),
      // Customized Dark Theme
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.teal,
          brightness: Brightness.dark,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.teal,
          foregroundColor: Colors.white,
          centerTitle: true,
          elevation: 2,
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Colors.tealAccent,
          foregroundColor: Colors.black,
        ),
      ),
      themeMode: _themeMode,
      home: AppStructureScreen(
        isDarkMode: _themeMode == ThemeMode.dark,
        onThemeChanged: _toggleTheme,
      ),
    );
  }
}

class AppStructureScreen extends StatefulWidget {
  final bool isDarkMode;
  final ValueChanged<bool> onThemeChanged;

  const AppStructureScreen({
    super.key,
    required this.isDarkMode,
    required this.onThemeChanged,
  });

  @override
  State<AppStructureScreen> createState() => _AppStructureScreenState();
}

class _AppStructureScreenState extends State<AppStructureScreen> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('FAB Tapped! Counter: $_counter'),
        duration: const Duration(seconds: 1),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDark = widget.isDarkMode;

    return Scaffold(
      // 1. AppBar
      appBar: AppBar(
        title: const Text('App Structure & Theme'),
        actions: [
          IconButton(
            icon: Icon(isDark ? Icons.light_mode : Icons.dark_mode),
            tooltip: 'Toggle Dark Mode',
            onPressed: () {
              widget.onThemeChanged(!isDark);
            },
          ),
        ],
      ),

      // 2. Body
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Theme Mode Banner Card
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 24,
                      backgroundColor: isDark ? Colors.amber : Colors.teal,
                      child: Icon(
                        isDark ? Icons.dark_mode : Icons.light_mode,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Current Theme: ${isDark ? "Dark Mode" : "Light Mode"}',
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            isDark
                                ? 'Dark Theme is active with dark background.'
                                : 'Light Theme is active with bright colors.',
                            style: TextStyle(
                              fontSize: 12,
                              color: Theme.of(context).textTheme.bodySmall?.color,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Switch(
                      value: isDark,
                      onChanged: widget.onThemeChanged,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Scaffold Components Overview
            const Text(
              'Scaffold Components Built:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),

            _buildFeatureCard(
              context,
              icon: Icons.web_asset,
              title: 'AppBar',
              subtitle: 'Top navigation bar with title and theme toggle action button.',
            ),
            const SizedBox(height: 12),

            _buildFeatureCard(
              context,
              icon: Icons.dashboard,
              title: 'Body',
              subtitle: 'Main content area containing scrollable cards, text, and switch controls.',
            ),
            const SizedBox(height: 12),

            _buildFeatureCard(
              context,
              icon: Icons.add_circle_outline,
              title: 'FloatingActionButton (FAB)',
              subtitle: 'Floating action button at the bottom right. Tapped $_counter times.',
            ),
            const SizedBox(height: 12),

            _buildFeatureCard(
              context,
              icon: Icons.palette,
              title: 'Theme Customization (ThemeData)',
              subtitle: 'Customized Light & Dark themes with seed color, AppBarTheme, and FAB theme.',
            ),
          ],
        ),
      ),

      // 3. FloatingActionButton
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _incrementCounter,
        icon: const Icon(Icons.add),
        label: Text('Tap Me ($_counter)'),
        tooltip: 'Increment Counter',
      ),
    );
  }

  Widget _buildFeatureCard(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        leading: Icon(icon, color: Theme.of(context).colorScheme.primary),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(subtitle),
      ),
    );
  }
}
