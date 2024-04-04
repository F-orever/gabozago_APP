enum TermType {
  termOfUse("서비스 이용약관", fileName: "term_of_use"),
  privacyPolicy("개인정보 수집 및 이용 동의", fileName: "privacy_policy"),
  locationService("서비스 알림 수신 동의", fileName: "location_service");

  final String termName;
  final String fileName;

  const TermType(this.termName, {required this.fileName});
}
