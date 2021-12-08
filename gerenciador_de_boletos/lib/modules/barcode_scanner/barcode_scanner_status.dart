import 'package:camera/camera.dart';

class BarcodeScannerStatus{
  final bool isCameraAvaliable;
  final String error;
  final String barcode;
  
  CameraController? cameraController;

  BarcodeScannerStatus({
    this.isCameraAvaliable = false,
    this.cameraController,
    this.error = "",
    this.barcode = "",
  });

  factory BarcodeScannerStatus.available(CameraController controller) => 
    BarcodeScannerStatus(
      isCameraAvaliable: true, 
      cameraController: controller
    );

  factory BarcodeScannerStatus.error(String message) => BarcodeScannerStatus(error: message);

  factory BarcodeScannerStatus.barcode(String barcode) => BarcodeScannerStatus(barcode: barcode);

  bool get showCamera => isCameraAvaliable && error.isEmpty;

  bool get hasError => error.isNotEmpty;

  bool get hasBarcode => barcode.isNotEmpty;

}