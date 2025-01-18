import 'package:image_picker/image_picker.dart';

class SendOrderRequest {
  final String orderId;
  final XFile image;

  const SendOrderRequest({
    required this.orderId,
    required this.image,
  });
}
