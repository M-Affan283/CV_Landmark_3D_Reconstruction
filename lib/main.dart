import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:developer' as developer;
import 'package:model_viewer_plus/model_viewer_plus.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // @override
  // Widget build(BuildContext context) {
  //   return MaterialApp(
  //     title: 'Camera App CV',
  //     theme: ThemeData(
  //       primarySwatch: Colors.blue,
  //     ),
  //     home: const CameraScreen(),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(  // Wrap your widget tree with MaterialApp
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Model Viewer CV Project'),
        ),
        body: const ModelViewer(
          src: 'assets/lincoln_memorial_mesh.glb',
          ar: true,
          cameraControls: true,
          scale: '0.2 0.2 0.2',
        ),
      ),
    );
  }
}

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  final ImagePicker _picker = ImagePicker();

  Future<void> _openCamera() async {
    try {
      final XFile? photo = await _picker.pickImage(source: ImageSource.camera);
      if (photo != null) {
        // You can handle the captured image here
        // print('Image path: ${photo.path}');
        //add the image to the ARCore to show the 3d model in the real world. use the ARCore plugin
        developer.log('Image path: ${photo.path}');
      
      }
    } catch (e) {
      // print('Error opening camera: $e');
      developer.log('Error opening camera: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Camera App CV'),
      ),
      body: Center(
        child: ElevatedButton.icon(
          onPressed: _openCamera,
          icon: const Icon(Icons.camera_alt),
          label: const Text('Open Camera'),
        ),
      ),
    );
  }
}
