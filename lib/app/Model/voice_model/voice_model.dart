class VoiceModel {
  String? url;
  String? voicemodelUuid;
  String? displayName;

  VoiceModel({
    this.url,
    this.voicemodelUuid,
    this.displayName,
  });

  factory VoiceModel.fromJson(Map<String, dynamic> json) {
    return VoiceModel(
      url: json['samples'][0]['url'],
      voicemodelUuid: json['voicemodel_uuid'],
      displayName: json['display_name'],
    );
  }
}
