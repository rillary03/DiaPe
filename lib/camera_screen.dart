import 'package:camera/camera.dart';
import 'package:diape/preview_screen.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart'; // Removido 'dart:io'

class CameraScreen extends StatefulWidget {
  const CameraScreen({Key? key}) : super(key: key); // Adicionado o key no construtor

  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  CameraController? _controller;
  List<CameraDescription>? _cameras;
  bool _isFlashOn = false; // Flash desligado por padrão
  bool _isRearCamera = true;
  // Removido o _imageFile, pois não está sendo usado

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

    if (!mounted) return; // Certifica-se de que o widget ainda está montado
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
    final currentContext = context; // Capture o BuildContext antes do async
    setState(() {
      _isRearCamera = !_isRearCamera;
    });
    await _initializeCamera();
    if (!mounted) return; // Certifica-se de que o widget ainda está montado
  }

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
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
      return const Center(child: CircularProgressIndicator()); // Adicionado 'const'
    }

    return Scaffold(
      backgroundColor: Colors.black, // Garante que a cor de fundo seja preta
      body: Stack(
        children: [
          // Tela da câmera em tela cheia usando Expanded
          Expanded(
            child: CameraPreview(_controller!), // Usa Expanded para cobrir toda a tela
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
              icon: const Icon( // Adicionado 'const'
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
              child: const Icon(Icons.camera_alt, color: Colors.black, size: 30), // Adicionado 'const'
            ),
          ),
          // Ícone para selecionar imagem da galeria
          Positioned(
            bottom: 40,
            left: 30,
            child: IconButton(
              icon: const Icon(Icons.photo_library, color: Colors.white, size: 30), // Adicionado 'const'
              onPressed: _pickImage,
            ),
          ),
          // Ícone para alternar entre câmera frontal e traseira
          Positioned(
            bottom: 40,
            right: 30,
            child: IconButton(
              icon: const Icon(Icons.cameraswitch, color: Colors.white, size: 30), // Adicionado 'const'
              onPressed: _switchCamera,
            ),
          ),
        ],
      ),
    );
  }
}
