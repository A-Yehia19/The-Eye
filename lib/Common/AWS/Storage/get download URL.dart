String getDownloadUrl({required String path}) {
  const cdnRoot = 'https://d2qmp7544om0tu.cloudfront.net';
  return '$cdnRoot/public/$path';
}
