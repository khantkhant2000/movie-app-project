import 'package:dio/dio.dart';
import 'package:movie_app_project_test/network/response/actor_detail_response/actor_detail_response.dart';
import 'package:movie_app_project_test/network/response/get_similar_movie_response/get_similar_movie_response.dart';
import 'package:movie_app_project_test/network/response/top_rated_response/top_rated_response.dart';
import 'package:retrofit/http.dart';
import '../../constant/api_constant.dart';
import '../response/actor_response/actor_response.dart';
import '../response/credits_response/get_credits_response.dart';
import '../response/genres_response/genres_response.dart';
import '../response/movie_detail_response/movie_detail_response.dart';
import '../response/now_playing_response/now_playing_response.dart';
import '../response/popular_movies_response/popular_movies_response.dart';
import '../response/search_movie_response/search_movie_response.dart';

part 'movie_api.g.dart';

@RestApi(baseUrl: kBaseURL)
abstract class MovieAPI {
  factory MovieAPI(Dio dio) => _MovieAPI(dio);

  @GET(kGenresEndPoint)
  Future<GenresResponse> getGenresResponse(
    @Query(kQueryParamsApiKey) String apiKey,
  );

  @GET(kGetNowPlayingEndPoint)
  Future<NowPlayingResponse> getNowPlayingResponse(
    @Query(kQueryParamsApiKey) String apiKey,
  );

  @GET(kGetPopularMoviesEndPoint)
  Future<PopularMoviesResponse> getPopularMoviesResponse(
    @Query(kQueryParamsApiKey) String apiKey,
  );
  @GET(kGetTopRatedMoviesEndPoint)
  Future<TopRatedResponse> getTopRatedResponse(
    @Query(kQueryParamsApiKey) String apiKey,
  );

  @GET(kGetActorsEndPoint)
  Future<ActorResponse> getActorsResponse(
    @Query(kQueryParamsApiKey) String apiKey,
  );

  @GET(kGetMovieDetailEndPoint)
  Future<MovieDetailResponse> getMovieDetailResponse(
    @Query(kQueryParamsApiKey) String apiKey,
    @Path(kPathParameterMovieId) int movieId,
  );

  @GET(kGetActorsDetailEndPoint)
  Future<ActorDetailResponse> getActorDetailResponse(
    @Query(kQueryParamsApiKey) String apiKey,
    @Path(kPathParameterMovieId) int movieId,
  );
  @GET(kGetCreditsEndPoint)
  Future<CreditsResponse> getCreditsResponse(
    @Query(kQueryParamsApiKey) String apiKey,
    @Path(kPathParameterMovieId) int movieId,
  );
  @GET(kGetSimilarMovieDetailEndPoint)
  Future<GetSimilarMovieResponse> getSimilarResponse(
    @Query(kQueryParamsApiKey) String apiKey,
    @Path(kPathParameterMovieId) int movieId,
  );
  @GET(kSearchMovieEndPoint)
  Future<SearchMovieResponse> getSearchMovieResponse(
    @Query(kQueryParamsApiKey) String apiKey,
    @Query(kQueryParamsApiKeyForSearch) String movieName,
  );
}
