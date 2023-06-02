// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'popular_movies_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PopularMoviesResponse _$PopularMoviesResponseFromJson(
        Map<String, dynamic> json) =>
    PopularMoviesResponse(
      page: json['pages'] as int?,
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => PopularVO.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalPages: json['total_pages'] as int?,
      totalResults: json['total_results'] as int?,
    );

Map<String, dynamic> _$PopularMoviesResponseToJson(
        PopularMoviesResponse instance) =>
    <String, dynamic>{
      'pages': instance.page,
      'results': instance.results,
      'total_pages': instance.totalPages,
      'total_results': instance.totalResults,
    };
