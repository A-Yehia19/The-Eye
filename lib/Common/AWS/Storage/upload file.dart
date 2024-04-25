import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:the_eye/Pages/Creator%20Upload/Data/variables.dart';

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
        uploadProgress.value = progress.fractionCompleted;
      },
    ).result;
    uploadProgress.value = 2; // Completed
    return getDownloadUrl(path: result.uploadedItem.key);
  } on StorageException {
    uploadProgress.value = -1; // Error
    return null;
  }
}
