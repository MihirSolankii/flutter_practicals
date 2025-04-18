import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Text to Speech App',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        useMaterial3: true,
      ),
      home: const TextToSpeechScreen(),
    );
  }
}

class TextToSpeechScreen extends StatefulWidget {
  const TextToSpeechScreen({super.key});

  @override
  State<TextToSpeechScreen> createState() => _TextToSpeechScreenState();
}

class _TextToSpeechScreenState extends State<TextToSpeechScreen> {
  final FlutterTts flutterTts = FlutterTts();
  final TextEditingController textController = TextEditingController();
  double volume = 1.0;
  double pitch = 1.0;
  double rate = 0.5;
  bool isSpeaking = false;

  @override
  void initState() {
    super.initState();
    _initTts();
  }

  @override
  void dispose() {
    flutterTts.stop();
    textController.dispose();
    super.dispose();
  }

  Future<void> _initTts() async {
    await flutterTts.setLanguage("en-US");
    flutterTts.setCompletionHandler(() {
      setState(() {
        isSpeaking = false;
      });
    });
  }

  Future<void> _speak() async {
    if (textController.text.isNotEmpty) {
      setState(() {
        isSpeaking = true;
      });

      await flutterTts.setVolume(volume);
      await flutterTts.setPitch(pitch);
      await flutterTts.setSpeechRate(rate);
      await flutterTts.speak(textController.text);
    }
  }

  Future<void> _stop() async {
    await flutterTts.stop();
    setState(() {
      isSpeaking = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Text to Speech'),
        backgroundColor: Colors.purple,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: textController,
              maxLines: 5,
              decoration: InputDecoration(
                hintText: 'Enter text to speak',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                filled: true,
                fillColor: Colors.grey[200],
              ),
            ),
            const SizedBox(height: 20),

            // Volume Control
            Row(
              children: [
                const Icon(Icons.volume_up),
                const SizedBox(width: 8),
                const Text('Volume:'),
                Expanded(
                  child: Slider(
                    value: volume,
                    min: 0.0,
                    max: 1.0,
                    divisions: 10,
                    label: volume.toString(),
                    onChanged: (value) {
                      setState(() {
                        volume = value;
                      });
                    },
                  ),
                ),
                Text('${(volume * 100).round()}%'),
              ],
            ),

            // Pitch Control
            Row(
              children: [
                const Icon(Icons.music_note),
                const SizedBox(width: 8),
                const Text('Pitch:'),
                Expanded(
                  child: Slider(
                    value: pitch,
                    min: 0.5,
                    max: 2.0,
                    divisions: 15,
                    label: pitch.toString(),
                    onChanged: (value) {
                      setState(() {
                        pitch = value;
                      });
                    },
                  ),
                ),
                Text(pitch.toStringAsFixed(1)),
              ],
            ),

            // Speed Control
            Row(
              children: [
                const Icon(Icons.speed),
                const SizedBox(width: 8),
                const Text('Speed:'),
                Expanded(
                  child: Slider(
                    value: rate,
                    min: 0.0,
                    max: 1.0,
                    divisions: 10,
                    label: rate.toString(),
                    onChanged: (value) {
                      setState(() {
                        rate = value;
                      });
                    },
                  ),
                ),
                Text(rate.toStringAsFixed(1)),
              ],
            ),

            const SizedBox(height: 20),

            ElevatedButton.icon(
              onPressed: isSpeaking ? _stop : _speak,
              style: ElevatedButton.styleFrom(
                backgroundColor: isSpeaking ? Colors.red : Colors.purple,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 12),
              ),
              icon: Icon(isSpeaking ? Icons.stop : Icons.play_arrow),
              label: Text(isSpeaking ? 'Stop' : 'Speak'),
            ),
          ],
        ),
      ),
    );
  }
}