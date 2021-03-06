import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gerenciador_de_boletos/modules/barcode_scanner/barcode_scanner_status.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:image_picker/image_picker.dart';

class BarcodeScannerController {
  final statusNotifier = ValueNotifier<BarcodeScannerStatus>(BarcodeScannerStatus());

  BarcodeScannerStatus get status => statusNotifier.value;
  set status(BarcodeScannerStatus status) => statusNotifier.value = status;
  final barcodeScanner = GoogleMlKit.vision.barcodeScanner();

  void getAvailableCameras() async {
    try {
      final response = await availableCameras();
      final camera = response.firstWhere(
          (element) => element.lensDirection == CameraLensDirection.back);

      final cameraController = CameraController(
        camera,
        ResolutionPreset.max,
        enableAudio: false,
      );
      await cameraController.initialize();
      status = BarcodeScannerStatus.available(cameraController);
    } catch (e) {
      status = BarcodeScannerStatus.error(e.toString());
    }
  }

  void scanWithCamera(){
    Future.delayed(const Duration(seconds: 10)).then((value) {
      if(status.cameraController != null){
        if(status.cameraController!.value.isStreamingImages) {
          status.cameraController!.stopImageStream();
        }
      }
      status = BarcodeScannerStatus.error("Timeout de leitura de boleto");
    });
    listenCamera();
  }

  Future<void> scannerBarCode(InputImage inputImage) async {
    try{
      if(status.cameraController != null){
        if(status.cameraController!.value.isStreamingImages){
          status.cameraController!.stopImageStream();
        }
      }
      final barcodes = await barcodeScanner.processImage(inputImage);
      // ignore: prefer_typing_uninitialized_variables
      var barcode;
      for(Barcode item in barcodes){
        barcode = item.value.displayValue;
      }

      if(barcode != null && status.barcode.isEmpty){
        status = BarcodeScannerStatus.barcode(barcode);
        status.cameraController!.dispose();
      }else{
        getAvailableCameras();
      }
    }catch(e){
      // ignore: avoid_print
      print(e.toString());
    }
  }

  void scanWithImagePicker() async {
    await status.cameraController!.stopImageStream();
    final response = await ImagePicker().pickImage(source: ImageSource.gallery);
    final inputImage = InputImage.fromFilePath(response!.path);
    scannerBarCode(inputImage);
  }

  void listenCamera() {
    if (status.cameraController!.value.isStreamingImages == false) {
      status.cameraController!.startImageStream(
        (image) => () async {
          try {
            final WriteBuffer allBytes = WriteBuffer();
            for(Plane plane in image.planes){
              allBytes.putUint8List(plane.bytes);
            }
            final bytes = allBytes.done().buffer.asUint8List();
            final Size imageSize = 
              Size(image.width.toDouble(), image.height.toDouble());
            const InputImageRotation imageRotation = InputImageRotation.Rotation_0deg;
            final InputImageFormat inputImageFormat = InputImageFormatMethods.fromRawValue(image.format.raw) ?? 
                InputImageFormat.YUV420;
            final planeData = image.planes.map(
              (Plane plane) {
                return InputImagePlaneMetadata(
                  bytesPerRow: plane.bytesPerRow,
                  height: plane.height,
                  width: plane.width,
                );
              }).toList();

            final inputImageData = InputImageData(
              size: imageSize,
              imageRotation: imageRotation,
              inputImageFormat: inputImageFormat,
              planeData: planeData,
            );

            final inputImageCamera = InputImage.fromBytes(
              bytes: bytes, 
              inputImageData: inputImageData
            );
            await Future.delayed(const Duration(seconds: 3));
            await scannerBarCode(inputImageCamera);
          } catch (e) {            
            // ignore: avoid_print
            print(e.toString());
          }
        },
      );
    }
  }

  void dispose(){
    statusNotifier.dispose();
    barcodeScanner.close();
    if(status.showCamera){
      status.cameraController!.dispose();
    }
  }
}
