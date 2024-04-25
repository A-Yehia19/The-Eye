import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';

ValueNotifier <PlatformFile?> videoPath = ValueNotifier(null);
ValueNotifier <String?> thumbnailPath = ValueNotifier(null);
ValueNotifier <double> uploadProgress = ValueNotifier(0);
