import 'package:amplify_flutter/amplify_flutter.dart';

import 'get download URL.dart';

Future<String?> uploadFileAWS(platformFile, creatorID, videoID) async {
  // Upload file with its filename as the key
  try {
    final result = await Amplify.Storage.uploadFile(
      localFile: AWSFile.fromStream(
        platformFile.readStream!,
        size: platformFile.size,
      ),
      key: "videos/$creatorID/$videoID.${platformFile.extension}",
      onProgress: (progress) {
        safePrint('Fraction completed: ${progress.fractionCompleted}');
      },
    ).result;
    safePrint('Successfully uploaded video: ${result.uploadedItem.key}');
    safePrint(getDownloadUrl(path: result.uploadedItem.key));
    return getDownloadUrl(path: result.uploadedItem.key);
  } on StorageException catch (e) {
    safePrint('Error uploading file: $e');
    return null;
  }
}
