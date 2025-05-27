class ModelFile {
  final String role;
  final String content;

  ModelFile({required this.role, required this.content});

  factory ModelFile.fromJson(Map<String, dynamic> json) {
    return ModelFile(role: json['role'], content: json['content']);
  }

  Map<String, dynamic> toJson() {
    return {'role': role, 'content': content};
  }
}
