import 'package:amplify_flutter/amplify_flutter.dart';

Future<void> removeFileAWS({required String key}) async {
  try {
    final result = await Amplify.Storage.remove(
      key: key,
      options: const StorageRemoveOptions(
        accessLevel: StorageAccessLevel.guest,
      ),
    ).result;
    safePrint('Removed file: ${result.removedItem.key}');
  } on StorageException catch (e) {
    safePrint('Error deleting file: ${e.message}');
    rethrow;
  }
}
