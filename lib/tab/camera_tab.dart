import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import '../preview_screen.dart';

class CameraScreen extends StatefulWidget {
  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  CameraController? _controller;
  List<CameraDescription>? _cameras;
  bool _isFlashOn = false; // Flash desligado por padrão
  bool _isRearCamera = true;
  XFile? _imageFile;

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    _cameras = await availableCameras();
    _controller = CameraController(
      _cameras![_isRearCamera ? 0 : 1], // Inicializa com a câmera traseira
      ResolutionPreset.high,
    );
    await _controller!.initialize();

    // Garantir que o flash está desligado por padrão
    await _controller!.setFlashMode(FlashMode.off);

    setState(() {});
  }

  void _toggleFlash() {
    setState(() {
      _isFlashOn = !_isFlashOn;
      // Define o modo do flash de acordo com o estado do botão de flash
      _controller!.setFlashMode(_isFlashOn ? FlashMode.torch : FlashMode.off);
    });
  }

  void _switchCamera() async {
    setState(() {
      _isRearCamera = !_isRearCamera;
    });
    await _initializeCamera();
  }

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      _imageFile = image;
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => PreviewScreen(imagePath: image.path)),
      );
    }
  }

  Future<void> _captureImage() async {
    if (_controller != null && _controller!.value.isInitialized) {
      // Captura a imagem com flash desligado, a menos que o usuário o tenha ativado manualmente
      await _controller!.setFlashMode(FlashMode.off);  // Certifica-se que o flash está desligado
      final XFile image = await _controller!.takePicture();
      _imageFile = image;
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => PreviewScreen(imagePath: image.path)),
      );
    }
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_controller == null || !_controller!.value.isInitialized) {
      return Center(child: CircularProgressIndicator());
    }

    return Scaffold(
      body: Stack(
        children: [
          // Tela da câmera em tela cheia
          SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: CameraPreview(_controller!),
          ),
          Positioned(
            top: MediaQuery.of(context).padding.top + 10,
            left: 10,
            child: IconButton(
              icon: Icon(
                _isFlashOn ? Icons.flash_on : Icons.flash_off,
                color: Colors.white,
                size: 30,
              ),
              onPressed: _toggleFlash,
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).padding.top + 10,
            right: 10,
            child: IconButton(
              icon: Icon(
                Icons.close,
                color: Colors.white,
                size: 30,
              ),
              onPressed: () {
                Navigator.pop(context); // Fecha a câmera e retorna à tela anterior
              },
            ),
          ),
          // Ícone de captura de imagem centralizado
          Positioned(
            bottom: 40,
            left: MediaQuery.of(context).size.width / 2 - 35,
            child: FloatingActionButton(
              backgroundColor: Colors.white,
              onPressed: _captureImage, // Chama o método para capturar imagem
              child: Icon(Icons.camera_alt, color: Colors.black, size: 30),
            ),
          ),
          // Ícone para selecionar imagem da galeria
          Positioned(
            bottom: 40,
            left: 30,
            child: IconButton(
              icon: Icon(Icons.photo_library, color: Colors.white, size: 30),
              onPressed: _pickImage,
            ),
          ),
          // Ícone para alternar entre câmera frontal e traseira
          Positioned(
            bottom: 40,
            right: 30,
            child: IconButton(
              icon: Icon(Icons.cameraswitch, color: Colors.white, size: 30),
              onPressed: _switchCamera,
            ),
          ),
        ],
      ),
    );
  }
}
