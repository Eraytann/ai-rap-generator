class GPTMessageResponseModel {
  String? message;

  GPTMessageResponseModel({
    this.message,
  });

  factory GPTMessageResponseModel.fromJson(Map<String, dynamic> json) {
    return GPTMessageResponseModel(
      message: json['choices']?[0]['message']['content'] as String?,
    );
  }
}
