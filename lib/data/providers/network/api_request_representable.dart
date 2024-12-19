enum HTTPMethod { GET, POST, DELETE, PUT, PATCH }

extension HTTPMethodString on HTTPMethod {
  String get string {
    switch (this) {
      case HTTPMethod.GET:
        return "GET";
      case HTTPMethod.POST:
        return "POST";
      case HTTPMethod.DELETE:
        return "DELETE";
      case HTTPMethod.PATCH:
        return "PATCH";
      case HTTPMethod.PUT:
        return "PUT";
    }
  }
}

abstract class APIRequestRepresentable {
  String get url;
  String get endpoint;
  String get path;
  HTTPMethod get method;
  Map<String, String>? get headers;
  Map<String, String>? get query;
  dynamic get body;
  Future request();
}
