import 'dart:typed_data';
import 'package:cross_file/cross_file.dart';
import 'package:image/image.dart' as img;
import 'package:matrix/matrix.dart';
import 'package:mime/mime.dart';

/// Helper class to resize images before upload
class ImageResizer {
  /// Max dimension (width or height) for resized images
  static const int maxDimension = 1200;
  
  /// JPEG quality for resized images (0-100)
  static const int quality = 40;

  /// Resize an image file if it's an image, returning a MatrixImageFile
  /// Returns null if the file is not an image
  static Future<MatrixImageFile?> resizeImage(XFile xfile) async {
    final mimeType = xfile.mimeType ?? lookupMimeType(xfile.path);
    if (mimeType == null || !mimeType.startsWith('image')) {
      return null;
    }

    try {
      final bytes = await xfile.readAsBytes();
      final image = img.decodeImage(Uint8List.fromList(bytes));
      
      if (image == null) {
        return null;
      }

      // Check if resize is needed
      if (image.width <= maxDimension && image.height <= maxDimension) {
        // No resize needed, return original
        return MatrixImageFile.create(
          bytes: bytes,
          name: xfile.name,
          mimeType: mimeType,
        );
      }

      // Calculate new dimensions maintaining aspect ratio
      int newWidth = image.width;
      int newHeight = image.height;
      
      if (image.width > image.height) {
        if (image.width > maxDimension) {
          newWidth = maxDimension;
          newHeight = (image.height * maxDimension / image.width).round();
        }
      } else {
        if (image.height > maxDimension) {
          newHeight = maxDimension;
          newWidth = (image.width * maxDimension / image.height).round();
        }
      }

      // Resize the image
      final resized = img.copyResize(
        image,
        width: newWidth,
        height: newHeight,
        interpolation: img.Interpolation.linear,
      );

      // Encode as JPEG with compression
      final resizedBytes = img.encodeJpg(resized, quality: quality);

      return MatrixImageFile.create(
        bytes: Uint8List.fromList(resizedBytes),
        name: xfile.name,
        mimeType: 'image/jpeg', // Always output as JPEG for size
      );
    } catch (e) {
      // If resize fails, return null to let caller handle it
      return null;
    }
  }
}