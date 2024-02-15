import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:gpt_markdown/gpt_markdown.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode _themeMode = ThemeMode.dark;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      themeMode: _themeMode,
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
        colorSchemeSeed: Colors.blue,
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        colorSchemeSeed: Colors.blue,
      ),
      home: MyHomePage(
        title: 'Flutter Demo Home Page',
        onPressed: () {
          setState(() {
            _themeMode = (_themeMode == ThemeMode.dark)
                ? ThemeMode.light
                : ThemeMode.dark;
          });
        },
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title, required this.onPressed});
  final VoidCallback? onPressed;

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextDirection _direction = TextDirection.ltr;
  final TextEditingController _controller = TextEditingController(
    text: r'''
## ChatGPT Response

Welcome to ChatGPT! Below is an example of a response with Markdown and LaTeX code:

### Markdown Example

You can use Markdown to format text easily. Here are some examples:

- **Bold Text**: **This text is bold**
- *Italic Text*: *This text is italicized*
- [Link](https://www.example.com): [This is a link](https://www.example.com)
- Lists:
  1. Item 1
  2. Item 2
  3. Item 3

### LaTeX Example

You can also use LaTeX for mathematical expressions. Here's an example:

- **Equation**: \( f(x) = x^2 + 2x + 1 \)
- **Integral**: \( \int_{0}^{1} x^2 \, dx \)
- **Matrix**:

\[
\begin{bmatrix}
1 & 2 & 3 \\
4 & 5 & 6 \\
7 & 8 & 9
\end{bmatrix}
\]

### Conclusion

Markdown and LaTeX can be powerful tools for formatting text and mathematical expressions in your Flutter app. If you have any questions or need further assistance, feel free to ask!
''',
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                _direction = TextDirection.values[(_direction.index + 1) % 2];
              });
            },
            icon: const [Text("LTR"), Text("RTL")][_direction.index],
          ),
          IconButton(
            onPressed: widget.onPressed,
            icon: const Icon(Icons.sunny),
          ),
        ],
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: ListView(
                  children: [
                    AnimatedBuilder(
                        animation: _controller,
                        builder: (context, _) {
                          return Material(
                            // color: Theme.of(context).colorScheme.surfaceVariant,
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                  width: 1,
                                  color: Theme.of(context).colorScheme.outline),
                            ),
                            child:
                                LayoutBuilder(builder: (context, constraints) {
                              return SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                reverse: _direction == TextDirection.rtl,
                                child: SizedBox(
                                  width: 550,
                                  child: Theme(
                                    data: Theme.of(context).copyWith(
                                      textTheme: const TextTheme(
                                        // For H1.
                                        headlineLarge: TextStyle(fontSize: 55),
                                        // For H2.
                                        headlineMedium: TextStyle(fontSize: 45),
                                        // For H3.
                                        headlineSmall: TextStyle(fontSize: 35),
                                        // For H4.
                                        titleLarge: TextStyle(fontSize: 25),
                                        // For H5.
                                        titleMedium: TextStyle(fontSize: 15),
                                        // For H6.
                                        titleSmall: TextStyle(fontSize: 10),
                                      ),
                                    ),
                                    child: TexMarkdown(
                                      _controller.text,
                                      textDirection: _direction,
                                      onLinkTab: (url, title) {
                                        log(title, name: "title");
                                        log(url, name: "url");
                                      },
                                      textAlign: TextAlign.justify,
                                      textScaler:
                                          MediaQuery.textScalerOf(context),
                                      style: const TextStyle(
                                        // Regular text font size here.
                                        fontSize: 15,
                                      ),
                                    ),
                                    // child: const Text("Hello"),
                                  ),
                                ),
                              );
                            }),
                          );
                        }),
                  ],
                ),
              ),
              ConstrainedBox(
                constraints: const BoxConstraints(maxHeight: 200),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        label: Text("Type here:")),
                    maxLines: null,
                    controller: _controller,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
