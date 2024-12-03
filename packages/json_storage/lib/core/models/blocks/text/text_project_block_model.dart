part of 'package:mind_palace_json_storage/core/models/project_block_model.dart';

@JsonSerializable()
class TextProjectBlockModel extends ProjectBlockModel {
  static const String typeValue = 'txt';
  final List<ModifiedTextSpanModel> textSpans;

  const TextProjectBlockModel({
    required super.id,
    required super.order,
    required super.parentNodeId,
    required this.textSpans,
  }) : super(
          type: typeValue,
        );

  factory TextProjectBlockModel.fromJson(Map<String, dynamic> json) =>
      _$TextProjectBlockModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$TextProjectBlockModelToJson(this);
}
