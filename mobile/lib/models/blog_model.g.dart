// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'blog_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BlogModel _$BlogModelFromJson(Map<String, dynamic> json) => BlogModel(
      id: json['_id'] as String,
      title: json['title'] as String,
      likeCount: json['likes'] as int? ?? 0,
      imageUrl: json['image_url'] as String,
      category: json['category'] as String,
      content: json['content'] as String?,
      createdAt: BlogModel._fromJson(json['created_at'] as int),
      user: UserModel.fromJson(json['author_detail'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BlogModelToJson(BlogModel instance) => <String, dynamic>{
      '_id': instance.id,
      'title': instance.title,
      'likes': instance.likeCount,
      'image_url': instance.imageUrl,
      'category': instance.category,
      'content': instance.content,
      'author_detail': instance.user,
      'created_at': BlogModel._toJson(instance.createdAt),
    };
