library dio_proxy;

import 'dart:io';

import 'package:dio/io.dart';

/// HttpProxyAdapter
/// [ipAddr] ip地址，默认是localhost
/// [port] 端口，默认是8888
///
class HttpProxyAdapter extends IOHttpClientAdapter {
  final String proxy;

  HttpProxyAdapter(this.proxy) {
    final arrProxy = proxy.split(':');
    final port = int.tryParse(arrProxy[1]);
    final domain = int.tryParse(arrProxy[0]);
    createHttpClient = () {
      final portString = port != null ? ':$port' : '';
      final proxy = '$domain$portString';
      return HttpClient()
        ..findProxy = (url) {
          return 'PROXY $proxy';
        };
    };
  }
}
