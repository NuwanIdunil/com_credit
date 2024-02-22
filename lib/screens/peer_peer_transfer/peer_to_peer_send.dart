import 'dart:typed_data';

import 'package:com_credit_mobile/colors.dart';
import 'package:com_credit_mobile/constants.dart';
import 'package:com_credit_mobile/routes.dart';
import 'package:com_credit_mobile/screens/peer_peer_transfer/peer_peer_bottomSheet.dart';
import 'package:com_credit_mobile/screens/widgets/component/footer_text.dart';
import 'package:com_credit_mobile/screens/widgets/const_column_spacer.dart';
import 'package:com_credit_mobile/utils/navigation_util.dart';
import 'package:com_credit_mobile/utils/text_Style.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class PeerToPeerSend extends StatefulWidget {
  const PeerToPeerSend({super.key});

  @override
  State<PeerToPeerSend> createState() => _PeerToPeerSendState();
}

class _PeerToPeerSendState extends State<PeerToPeerSend> {
  late MobileScannerController cameraController;
  bool isTorchEnabled = false;
  XFile? imageXFile;
  Uint8List bytes = Uint8List(0);
  String? file;
  Future<void> _getimage() async {
    file = await ImagePicker()
        .pickImage(source: ImageSource.gallery)
        .then((picked) {
      if (picked == null) return null;

      return picked.path;
    });

    setState(() {
      imageXFile;
      file;
    });
  }

  @override
  void initState() {
    super.initState();
    initializeCameraController();
  }

  void initializeCameraController() {
    cameraController = MobileScannerController(
      facing: CameraFacing.back,
      torchEnabled: isTorchEnabled,
    );
  }

  void toggleTorch() {
    setState(() {
      isTorchEnabled = !isTorchEnabled;
      cameraController.toggleTorch();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              children: [
                const ConstColumnSpacer(2),
                Center(
                  child: Container(
                    width: Ui.getPadding(35),
                    height: Ui.getPadding(35),
                    decoration: BoxDecoration(
                      color: AppColors.black,
                      border: Border.all(
                        color: const Color(0xFFC01621), // Set border color
                        width: 1.0, // Set border width
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(Ui.padding),
                      child: MobileScanner(
                          allowDuplicates: false,
                          controller: cameraController,
                          onDetect: (barcode, args) {
                            if (barcode.rawValue == null) {
                              debugPrint('Failed to scan Barcode');
                            } else {
                              final String code = barcode.rawValue!;
                              debugPrint('Barcode found! $code');
                              PeerToPerrBottomSheet(
                                      context: context,
                                      ismanualtranfer: false,
                                      iscoformation: false)
                                  .opensheet()
                                  .then((_) {
                                initializeCameraController();
                              });
                            }
                          }),
                    ),
                  ),
                ),
                const ConstColumnSpacer(2),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _tourchButton(context),
                    const SizedBox(
                      width: Ui.padding2,
                    ),
                    _uploadQr(context),
                  ],
                ),
                const ConstColumnSpacer(3),
                Text(
                  "Or",
                  style: TextStyles.BlackDefaultBigText.copyWith(
                    fontSize: Ui.getFontSize(1.5),
                  ),
                ),
                const ConstColumnSpacer(3),
                _addManualButton(context),
                const ConstColumnSpacer(5),
                const FooterText(),
                //const ConstColumnSpacer(2),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    cameraController.dispose();
    super.dispose();
  }

  Widget _tourchButton(BuildContext contex) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.graylight,
        borderRadius: BorderRadius.circular(Ui.getRadius(1.5)),
      ),
      height: Ui.getPadding(6),
      width: Ui.getPadding(10),
      child: IconButton(
        onPressed: () => toggleTorch(),
        icon: Icon(
          isTorchEnabled
              ? Icons.flashlight_on_outlined
              : Icons.flashlight_off_outlined,
        ),
        iconSize: 25.0,
      ),
    );
  }

  Widget _uploadQr(BuildContext contex) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.graylight,
        borderRadius: BorderRadius.circular(Ui.getRadius(1.5)),
      ),
      height: Ui.getPadding(6),
      width: Ui.getPadding(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Upload QR",
            style: TextStyles.BlackDefaultText.copyWith(
                fontWeight: FontWeight.bold),
          ),
          // const SizedBox(
          //   width: Ui.padding2,
          // ),
          IconButton(
            onPressed: () => _getimage(),
            icon: const Icon(
              Icons.file_upload_outlined,
            ),
            iconSize: 25.0,
          ),
        ],
      ),
    );
  }

  Widget _addManualButton(BuildContext contex) {
    return InkWell(
      onTap: () {
        PeerToPerrBottomSheet(
                context: context, ismanualtranfer: true, iscoformation: false)
            .opensheet();
      },
      child: Ink(
          decoration: BoxDecoration(
            color: AppColors.graylight,
            borderRadius: BorderRadius.circular(Ui.getRadius(1.5)),
          ),
          height: Ui.getPadding(6),
          width: Ui.getPadding(30),
          child: Center(
            child: Text(
              "Add Manual ",
              style: TextStyles.BlackDefaultText.copyWith(
                  fontWeight: FontWeight.bold),
            ),
          )),
    );
  }
}
