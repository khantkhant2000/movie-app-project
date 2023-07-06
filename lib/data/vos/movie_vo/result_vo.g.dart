// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'result_vo.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MovieVOAdapter extends TypeAdapter<MovieVO> {
  @override
  final int typeId = 2;

  @override
  MovieVO read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MovieVO(
      fields[0] as bool?,
      fields[1] as String?,
      (fields[2] as List?)?.cast<int>(),
      fields[3] as int?,
      fields[4] as String?,
      fields[5] as String?,
      fields[6] as String?,
      fields[7] as double?,
      fields[8] as String?,
      fields[9] as String?,
      fields[10] as String?,
      fields[11] as bool?,
      fields[12] as double?,
      fields[13] as int?,
      isGetNowPlayingMovies: fields[14] as bool?,
      isPopularMovies: fields[15] as bool?,
      isSimilarMovies: fields[17] as bool?,
      isTopRatedMovies: fields[16] as bool?,
      isGetMovieByGenres: fields[18] as bool?,
    );
  }

  @override
  void write(BinaryWriter writer, MovieVO obj) {
    writer
      ..writeByte(19)
      ..writeByte(0)
      ..write(obj.adult)
      ..writeByte(1)
      ..write(obj.backdropPath)
      ..writeByte(2)
      ..write(obj.genreIds)
      ..writeByte(3)
      ..write(obj.id)
      ..writeByte(4)
      ..write(obj.originalLanguage)
      ..writeByte(5)
      ..write(obj.originalTitle)
      ..writeByte(6)
      ..write(obj.overview)
      ..writeByte(7)
      ..write(obj.popularity)
      ..writeByte(8)
      ..write(obj.posterPath)
      ..writeByte(9)
      ..write(obj.releaseDate)
      ..writeByte(10)
      ..write(obj.title)
      ..writeByte(11)
      ..write(obj.video)
      ..writeByte(12)
      ..write(obj.voteAverage)
      ..writeByte(13)
      ..write(obj.voteCount)
      ..writeByte(14)
      ..write(obj.isGetNowPlayingMovies)
      ..writeByte(15)
      ..write(obj.isPopularMovies)
      ..writeByte(16)
      ..write(obj.isTopRatedMovies)
      ..writeByte(17)
      ..write(obj.isSimilarMovies)
      ..writeByte(18)
      ..write(obj.isGetMovieByGenres);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MovieVOAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieVO _$MovieVOFromJson(Map<String, dynamic> json) => MovieVO(
      json['adult'] as bool?,
      json['backdrop_path'] as String?,
      (json['genre_ids'] as List<dynamic>?)?.map((e) => e as int).toList(),
      json['id'] as int?,
      json['original_language'] as String?,
      json['original_title'] as String?,
      json['overview'] as String?,
      (json['popularity'] as num?)?.toDouble(),
      json['poster_path'] as String?,
      json['release_date'] as String?,
      json['title'] as String?,
      json['video'] as bool?,
      (json['vote_average'] as num?)?.toDouble(),
      json['vote_count'] as int?,
      isGetNowPlayingMovies: json['isGetNowPlayingMovies'] as bool? ?? false,
      isPopularMovies: json['isPopularMovies'] as bool? ?? false,
      isSimilarMovies: json['isSimilarMovies'] as bool? ?? false,
      isTopRatedMovies: json['isTopRatedMovies'] as bool? ?? false,
      isGetMovieByGenres: json['isGetMovieByGenres'] as bool? ?? false,
    );

Map<String, dynamic> _$MovieVOToJson(MovieVO instance) => <String, dynamic>{
      'adult': instance.adult,
      'backdrop_path': instance.backdropPath,
      'genre_ids': instance.genreIds,
      'id': instance.id,
      'original_language': instance.originalLanguage,
      'original_title': instance.originalTitle,
      'overview': instance.overview,
      'popularity': instance.popularity,
      'poster_path': instance.posterPath,
      'release_date': instance.releaseDate,
      'title': instance.title,
      'video': instance.video,
      'vote_average': instance.voteAverage,
      'vote_count': instance.voteCount,
      'isGetNowPlayingMovies': instance.isGetNowPlayingMovies,
      'isPopularMovies': instance.isPopularMovies,
      'isTopRatedMovies': instance.isTopRatedMovies,
      'isSimilarMovies': instance.isSimilarMovies,
      'isGetMovieByGenres': instance.isGetMovieByGenres,
    };
