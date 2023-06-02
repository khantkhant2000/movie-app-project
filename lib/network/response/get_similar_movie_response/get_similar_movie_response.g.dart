// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_similar_movie_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetSimilarMovieResponse _$GetSimilarMovieResponseFromJson(
        Map<String, dynamic> json) =>
    GetSimilarMovieResponse(
      page: json['page'] as int?,
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => MovieVO.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalPages: json['total_pages'] as int?,
      totalResults: json['total_results'] as int?,
    );

Map<String, dynamic> _$GetSimilarMovieResponseToJson(
        GetSimilarMovieResponse instance) =>
    <String, dynamic>{
      'page': instance.page,
      'results': instance.results,
      'total_pages': instance.totalPages,
      'total_results': instance.totalResults,
    };
