library dio_proxy;

import 'dart:io';

import 'package:dio/io.dart';

/// HttpProxyAdapter
/// [ipAddr] ip地址，默认是localhost
/// [port] 端口，默认是8888
///
class HttpProxyAdapter extends IOHttpClientAdapter {
  final String ipAddr;
  final int? port;

  HttpProxyAdapter({
    required this.ipAddr,
    this.port,
  }) {
    createHttpClient = () {
      final portString = port != null ? ':$port' : '';
      final proxy = '$ipAddr$portString';
      return HttpClient()
        ..findProxy = (url) {
          return 'PROXY $proxy';
        };
    };
  }
}
