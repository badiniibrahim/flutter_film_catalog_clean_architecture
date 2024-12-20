import 'package:film_catalog/core/config/environment.dart';
import 'package:film_catalog/data/providers/network/api_provider.dart';
import 'package:film_catalog/data/providers/network/api_request_representable.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class MovieByGenreApi extends APIRequestRepresentable {
  MovieByGenreApi({required this.movieId});
  int movieId;

  @override
  get body => null;

  @override
  String get endpoint => Environment.apiUrl;

  @override
  Map<String, String>? get headers => null;

  @override
  HTTPMethod get method {
    return HTTPMethod.GET;
  }

  @override
  String get path =>
      "/discover/movie?with_genres=$movieId&api_key=${dotenv.env['API_KEY']}&language=en";

  @override
  Map<String, String>? get query => null;

  @override
  Future request() {
    return APIProvider.instance.request(this);
  }

  @override
  String get url => endpoint + path;
}
