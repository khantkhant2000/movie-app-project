// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'top_rated_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TopRatedResponse _$TopRatedResponseFromJson(Map<String, dynamic> json) =>
    TopRatedResponse(
      page: json['pages'] as int?,
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => MovieVO.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalPages: json['total_pages'] as int?,
      totalResults: json['total_results'] as int?,
    );

Map<String, dynamic> _$TopRatedResponseToJson(TopRatedResponse instance) =>
    <String, dynamic>{
      'pages': instance.page,
      'results': instance.results,
      'total_pages': instance.totalPages,
      'total_results': instance.totalResults,
    };
