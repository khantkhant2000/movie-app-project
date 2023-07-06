import 'package:movie_app_project_test/data/model/movie_model.dart';
import 'package:movie_app_project_test/data/vos/cast-_vo/cast_vo.dart';
import 'package:movie_app_project_test/data/vos/crew_vo/crew_vo.dart';
import 'package:movie_app_project_test/data/vos/crew_vo/hive_crew_vo.dart';
import 'package:movie_app_project_test/data/vos/movie_vo/hive_movie_by_genres_id.dart';
import 'package:movie_app_project_test/data/vos/movie_vo/hive_similar_movie.dart';
import 'package:movie_app_project_test/data/vos/movie_vo/result_vo.dart';
import 'package:movie_app_project_test/data/vos/search_movie_vo/search_movie_vo.dart';
import 'package:movie_app_project_test/network/data_agent/movie_data_agent_impl.dart';
import 'package:movie_app_project_test/network/response/actor_detail_response/actor_detail_response.dart';
import 'package:movie_app_project_test/network/response/movie_detail_response/movie_detail_response.dart';
import 'package:movie_app_project_test/persistent/actor_dao/actor_dao.dart';
import 'package:movie_app_project_test/persistent/actor_dao/actor_dao_impl.dart';
import 'package:movie_app_project_test/persistent/genres_dao/genres_dao.dart';
import 'package:movie_app_project_test/persistent/genres_dao/genres_dao_impl.dart';
import 'package:movie_app_project_test/persistent/movie_dao/movie_dao.dart';
import 'package:movie_app_project_test/persistent/movie_dao/movie_dao_impl.dart';
import 'package:movie_app_project_test/persistent/movie_detail_dao/movie_detail_dao.dart';
import 'package:movie_app_project_test/persistent/movie_detail_dao/movie_detail_dao_impl.dart';
import 'package:stream_transform/stream_transform.dart';
import '../../network/data_agent/movie_data_agent.dart';
import '../../persistent/actor_detail_dao/actor_detail_dao.dart';
import '../../persistent/actor_detail_dao/actor_detail_dao_impl.dart';
import '../../persistent/cast_dao/cast_dao.dart';
import '../../persistent/cast_dao/cast_dao_impl.dart';
import '../../persistent/crew_dao/crew_dao.dart';
import '../../persistent/crew_dao/crew_dao_impl.dart';
import '../vos/actor_result_vo/actor_result_vo.dart';
import '../vos/cast-_vo/hive_cast_vo.dart';
import '../vos/genres_vo/genres_vo.dart';

class MovieModelImpl extends MovieModel {
  MovieModelImpl._();
  static final MovieModelImpl _singleton = MovieModelImpl._();
  factory MovieModelImpl() => _singleton;

  final MovieDataAgent _movieDataAgent = MovieDataAgentImpl();

  final GenresDAO _genresDAO = GenresDAOImpl();
  final MovieDAO _movieDAO = MovieDAOImpl();
  final ActorsDAO _actorsDAO = ActorsDAOImpl();
  final MovieDetailDAO _movieDetailDAO = MovieDetailDAOImpl();
  final CastDAO _castDAO = CastDAOImpl();
  final CrewDAO _crewDAO = CrewDAOImpl();
  final ActorDetailDAO _actorDetailDAO = ActorDetailDAOImpl();

  @override
  Future<List<GenresVO>?> getGenresList() =>
      _movieDataAgent.getGenresList().then((value) {
        if (value != null) {
          _genresDAO.saveForGenresList(value);
        }
        return value;
      });

  // @override
  // Future<List<MovieVO>?> getNowPlayingMovieList() =>
  //     _movieDataAgent.getNowPlayingMovieList().then((value) {
  //       if (value != null) {
  //         var temp = value;
  //         temp = temp.map((e) {
  //           e.isGetNowPlayingMovies = true;
  //           return e;
  //         }).toList();
  //         _movieDAO.saveForMovieList(temp);
  //       }
  //       return value;
  //     });

  @override
  Future<List<MovieVO>?> getPopularMovieList(int moviePage) =>
      _movieDataAgent.getPopularMovieList(moviePage).then((value) {
        if (value != null) {
          var temp = value;
          temp = temp.map((e) {
            e.isPopularMovies = true;
            return e;
          }).toList();
          _movieDAO.saveForMovieList(temp);
        }
        return value;
      });

  @override
  Future<List<MovieVO>?> getTopRateMovieList(int moviePage) =>
      _movieDataAgent.getTopRateMovieList(moviePage).then((value) {
        if (value != null) {
          var temp = value;
          temp = temp.map((e) {
            e.isTopRatedMovies = true;
            return e;
          }).toList();
          _movieDAO.saveForMovieList(temp);
        }
        return value;
      });

  @override
  Future<List<MovieVO>?> getSimilarMovieList(int movieId) =>
      _movieDataAgent.getSimilarMovieList(movieId).then((value) {
        if (value != null) {
          var temp = value;
          temp = temp.map((e) {
            e.isSimilarMovies = true;
            return e;
          }).toList();
          HiveSimilarMovieVO hiveSimilarMovieVO = HiveSimilarMovieVO(value);
          _movieDAO.saveForSimilarMovieList(movieId, hiveSimilarMovieVO);
        }
        return value;
      });
  @override
  Future<List<MovieVO>?> getMovieByGenres(int genresID) =>
      _movieDataAgent.getMovieByGenres(genresID).then((value) {
        if (value != null) {
          var temp = value;
          temp = temp.map((e) {
            e.isGetMovieByGenres = true;
            return e;
          }).toList();
          HiveMovieByGenresIDVO hiveMovieByGenresID =
              HiveMovieByGenresIDVO(value);
          _movieDAO.saveForGetMovieByGenresID(genresID, hiveMovieByGenresID);
        }
        return value;
      });

  @override
  Future<List<SearchMovieResultVO>?> getSearchMovie(String name) =>
      _movieDataAgent.getSearchMovieList(name);

  @override
  Future<List<ActorResultsVO>?> getActorsList() =>
      _movieDataAgent.getActorsList().then((value) {
        if (value != null) {
          _actorsDAO.saveForActor(value);
        }
        return value;
      });

  @override
  Future<ActorDetailResponse?> getActorDetail(int id) =>
      _movieDataAgent.getActorDetail(id).then((value) {
        if (value != null) {
          _actorDetailDAO.saveForActorDetail(value);
        }
        return value;
      });

  @override
  Future<MovieDetailResponse?> getMovieDetail(int movieId) =>
      _movieDataAgent.getMovieDetail(movieId).then((value) {
        if (value != null) {
          _movieDetailDAO.saveForMovieDetail(value);
        }
        return value;
      });

  @override
  Future<List<CastVO>?> getCastList(int movieID) =>
      _movieDataAgent.getCast(movieID).then((value) {
        if (value != null) {
          HiveCastVO hiveCastVO = HiveCastVO(value);
          _castDAO.saveForCastVO(movieID, hiveCastVO);
        }
        return value;
      });

  @override
  Future<List<CrewVO>?> getCrewList(int movieID) =>
      _movieDataAgent.getCrew(movieID).then((value) {
        if (value != null) {
          HiveCrewVO hiveCrewVO = HiveCrewVO(value);
          _crewDAO.saveForCrewVO(movieID, hiveCrewVO);
        }
        return value;
      });

  /*------------------------------------------------------------------------------*/
  @override
  Stream<List<GenresVO>?> getGenresListFromDataBase() => _genresDAO
      .watchGenresBox()
      .startWith(_genresDAO.getGenresListFromDataBaseStream())
      .map((event) => _genresDAO.getGenresListFromDataBase());

  // @override
  // Stream<List<MovieVO>?> getNowPlayingMovieListFormDataBase() => _movieDAO
  //     .watchMovieBox()
  //     .startWith(_movieDAO.getMovieListByGenresFromDataBaseStream())
  //     .map((event) => _movieDAO.getMovieListByGenresFromDataBase());

  @override
  Stream<List<MovieVO>?> getPopularMovieListFormDataBase() => _movieDAO
      .watchMovieBox()
      .startWith(_movieDAO.getPopularMovieListFromDataBaseStream())
      .map((event) => _movieDAO.getPopularMovieListFromDataBase());

  @override
  Stream<HiveSimilarMovieVO?> getSimilarMovieListFormDataBase(int movieID) =>
      _movieDAO
          .watchSimilarMovieBox()
          .startWith(_movieDAO.getSimilarMovieListFormDataBaseStream(movieID))
          .map((event) => _movieDAO.getSimilarMovieListFormDataBase(movieID));

  @override
  Stream<List<MovieVO>?> getTopRatedMovieListFormDataBase() => _movieDAO
      .watchMovieBox()
      .startWith(_movieDAO.getTopRatedMovieListFromDataBaseStream())
      .map((event) => _movieDAO.getTopRatedMovieListFromDataBase());

  @override
  Stream<List<ActorResultsVO>?> getActorResultListFormDataBase() => _actorsDAO
      .watchActorResults()
      .startWith(_actorsDAO.getActorsResultListFromDataBaseStream())
      .map((event) => _actorsDAO.getActorsResultListFromDataBase());

  @override
  Stream<MovieDetailResponse?> getMovieDetailFromDataBase(int movieID) =>
      _movieDetailDAO
          .watchMovieDetailBox()
          .startWith(
              _movieDetailDAO.getForMovieDetailFromDataBaseStreamByID(movieID))
          .map((event) =>
              _movieDetailDAO.getForMovieDetailFromDataBaseByID(movieID));

  @override
  Stream<HiveCastVO?> getCastFromDataBase(int movieID) => _castDAO
      .watchCastBox()
      .startWith(_castDAO.getCastListFromDataBaseStream(movieID))
      .map((event) => _castDAO.getCastListFromDataBase(movieID));

  @override
  Stream<HiveCrewVO?> getCrewFromDataBase(int movieID) => _crewDAO
      .watchCrewBox()
      .startWith(_crewDAO.getCrewListFromDataBaseStream(movieID))
      .map((event) => _crewDAO.getCrewListFromDataBase(movieID));

  @override
  Stream<ActorDetailResponse?> getActorDetailFormDataBase(int actorID) =>
      _actorDetailDAO
          .watchActorsBox()
          .startWith(
              _actorDetailDAO.getActorDetailFromDataBaseStreamByID(actorID))
          .map((event) =>
              _actorDetailDAO.getActorDetailFromDataBaseByID(actorID));

  @override
  Stream<HiveMovieByGenresIDVO?> getMovieByGenresIDFromDataBase(int genresID) =>
      _movieDAO
          .watchMovieBox()
          .startWith(_movieDAO.getMovieByGenresIDFromDataBaseStream(genresID))
          .map((event) => _movieDAO.getMovieByGenresIDFormDataBase(genresID));
}
