// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_movie_by_genres_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetMovieByGenresResponse _$GetMovieByGenresResponseFromJson(
        Map<String, dynamic> json) =>
    GetMovieByGenresResponse(
      dates: json['dates'] == null
          ? null
          : DatesVO.fromJson(json['dates'] as Map<String, dynamic>),
      page: json['page'] as int?,
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => MovieVO.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalPages: json['total_pages'] as int?,
      totalResults: json['total_results'] as int?,
    );

Map<String, dynamic> _$GetMovieByGenresResponseToJson(
        GetMovieByGenresResponse instance) =>
    <String, dynamic>{
      'dates': instance.dates,
      'page': instance.page,
      'results': instance.results,
      'total_pages': instance.totalPages,
      'total_results': instance.totalResults,
    };
