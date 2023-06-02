///Movie Base URL
const String kBaseURL = "https://api.themoviedb.org/3";

///End Points
const String kGetNowPlayingEndPoint = "/movie/now_playing";
const String kGenresEndPoint = "/genre/movie/list";
const String kGetPopularMoviesEndPoint = "/movie/popular";
const String kGetTopRatedMoviesEndPoint = "/movie/top_rated";
const String kGetActorsEndPoint = "/person/popular";
const String kGetMovieDetailEndPoint = "/movie/{$kPathParameterMovieId}";
const String kGetActorsDetailEndPoint = "/person/{$kPathParameterMovieId}";
const String kGetSimilarMovieDetailEndPoint =
    "/movie/{$kPathParameterMovieId}/similar";

const String kGetCreditsEndPoint = "/movie/{$kPathParameterMovieId}/credits";

///Api Key
const kApiKey = '57c041385166dcc2256aa0fa1932e9e4';

///Query Param
const kQueryParamsApiKey = 'api_key';

///Path Parameter
const kPathParameterMovieId = "movie_id";

///Poster Path for GetNowPlaying
const kNetWortPosterPath = "https://image.tmdb.org/t/p/w500";

// const kApiPoster = "/qNBAXBIQlnOThrVvA6mA2B5ggV6.jpg";
//
// const kFullPoster = kNetWorkPosterPath + kApiPoster;

//https://image.tmdb.org/t/p/w500/2v9FVVBUrrkW2m3QOcYkuhq9A6o.jpg
