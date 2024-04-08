part of 'app.dart';

class ApiInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    AuthModel? auth = App.instance.currentUser();

    if (auth != null) {
      options.headers['x-access-token'] = auth.accessToken;
    }

    String name =
        'Request - ${options.uri.toString().replaceAll(options.baseUrl, '')}';
    String data = options.data.toString();

    log(options.data is Map ? data : "can't mapped", name: name);

    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    String name =
        'Response - ${response.realUri.toString().replaceAll(response.requestOptions.baseUrl, '')}';
    String data = response.data.toString();

    log(response.data is Map ? data : "can't mapped", name: name);

    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    String name = 'Response Error - ${err.response?.realUri.path}';
    String data = (err.response?.data).toString();

    log(err.response?.data is Map ? data : "can't mapped", name: name);

    super.onError(err, handler);
  }
}

class Api {
  static Api? _api;

  Api._();

  static Api get instance => _api ??= Api._();

  Dio _init() {
    Dio client = Dio();

    client.interceptors.add(ApiInterceptor());
    client.options.baseUrl = Uri.https(Config.host, '/api').toString();

    return client;
  }
}
