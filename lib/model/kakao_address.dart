
class KakaoAddress {
  /// 국가기초구역번호. 2015년 8월 1일부터 시행된 새 우편번호.
  final String postCode;

  /// 기본 주소
  final String address;

  /// 기본 영문 주소
  final String addressEng;

  /// 도로명 주소
  final String roadAddress;

  /// 영문 도로명 주소
  final String roadAddressEng;

  /// 지번 주소
  final String jibunAddress;

  /// 영문 지번 주소
  final String jibunAddressEng;

  /// 건물관리번호
  final String buildingCode;

  /// 건물명
  final String buildingName;

  /// 공동주택 여부(Y/N)
  final String apartment;

  /// 검색된 기본 주소 타입: R(도로명), J(지번)
  final String addressType;

  /// 도/시 이름
  final String sido;

  /// 영문 도/시 이름
  final String sidoEng;

  /// 시/군/구 이름
  final String sigungu;

  /// 영문 시/군/구 이름
  final String sigunguEng;

  /// 시/군/구 코드
  final String sigunguCode;

  /// 도로명 코드, 7자리로 구성된 도로명 코드입니다. 추후 7자리 이상으로 늘어날 수 있습니다.
  final String roadnameCode;

  /// 법정동/법정리 코드
  final String bcode;

  /// 도로명 값, 검색 결과 중 선택한 도로명주소의 "도로명" 값이 들어갑니다.(건물번호 제외)
  final String roadname;

  /// 도로명 값, 검색 결과 중 선택한 도로명주소의 "도로명의 영문" 값이 들어갑니다.(건물번호 제외)
  final String roadnameEng;

  /// 법정동/법정리 이름
  final String bname;

  /// 영문 법정동/법정리 이름
  final String bnameEng;

  /// 법정리의 읍/면 이름
  final String bname1;

  /// 사용자가 입력한 검색어
  final String query;

  /// 검색 결과에서 사용자가 선택한 주소의 타입
  final String userSelectedType;

  /// 검색 결과에서 사용자가 선택한 주소의 언어 타입: K(한글주소), E(영문주소)
  final String userLanguageType;

  KakaoAddress({
    required this.postCode,
    required this.address,
    required this.addressEng,
    required this.roadAddress,
    required this.roadAddressEng,
    required this.jibunAddress,
    required this.jibunAddressEng,
    required this.buildingCode,
    required this.buildingName,
    required this.apartment,
    required this.addressType,
    required this.sido,
    required this.sidoEng,
    required this.sigungu,
    required this.sigunguEng,
    required this.sigunguCode,
    required this.roadnameCode,
    required this.roadname,
    required this.roadnameEng,
    required this.bcode,
    required this.bname,
    required this.bnameEng,
    required this.query,
    required this.userSelectedType,
    required this.userLanguageType,
    required this.bname1,
  });

  factory KakaoAddress.fromJson(Map json) => KakaoAddress(
        postCode: json[Constants.postCode] as String,
        address: json[Constants.address] as String,
        addressEng: json[Constants.addressEng] as String,
        roadAddress: json[Constants.roadAddress] as String,
        roadAddressEng: json[Constants.roadAddressEng] as String,
        jibunAddress: (json[Constants.jibunAddress] as String).isNotEmpty
            ? json[Constants.jibunAddress] as String
            : json[Constants.autoJibunAddress] as String,
        jibunAddressEng: (json[Constants.jibunAddressEng] as String).isNotEmpty
            ? json[Constants.jibunAddressEng] as String
            : json[Constants.autoJibunAddressEng] as String,
        buildingCode: json[Constants.buildingCode] as String,
        buildingName: json[Constants.buildingName] as String,
        apartment: json[Constants.apartment] as String,
        addressType: json[Constants.addressType] as String,
        sido: json[Constants.sido] as String,
        sidoEng: json[Constants.sidoEng] as String,
        sigungu: json[Constants.sigungu] as String,
        sigunguEng: json[Constants.sigunguEng] as String,
        sigunguCode: json[Constants.sigunguCode] as String,
        roadnameCode: json[Constants.roadnameCode] as String,
        roadname: json[Constants.roadname] as String,
        roadnameEng: json[Constants.roadnameEng] as String,
        bcode: json[Constants.bcode] as String,
        bname: json[Constants.bname] as String,
        bname1: json[Constants.bname1] as String,
        bnameEng: json[Constants.bnameEng] as String,
        query: json[Constants.query] as String,
        userSelectedType: json[Constants.userSelectedType] as String,
        userLanguageType: json[Constants.userLanguageType] as String,
      );

  @override
  String toString() {
    return "우편번호: $postCode, 주소: $userSelectedAddress";
  }

  String get userSelectedAddress {
    if (userSelectedType == 'J') {
      if (userLanguageType == 'E') return jibunAddressEng;
      return jibunAddress;
    }
    if (userLanguageType == 'E') return roadAddressEng;
    return roadAddress;
  }
}

class Constants {
  Constants._();

  static const String packageName = 'Kpostal';

  static const String localeKo = 'ko_KR';
  static const String localeUs = 'en_US';

  static const String postCode = 'zonecode';
  static const String address = 'address';
  static const String addressEng = 'addressEnglish';
  static const String roadAddress = 'roadAddress';
  static const String roadAddressEng = 'roadAddressEnglish';
  static const String jibunAddress = 'jibunAddress';
  static const String jibunAddressEng = 'jibunAddressEnglish';
  static const String autoJibunAddress = 'autoJibunAddress';
  static const String autoJibunAddressEng = 'autoJibunAddressEnglish';
  static const String buildingCode = 'buildingCode';
  static const String buildingName = 'buildingName';
  static const String apartment = 'apartment';
  static const String addressType = 'addressType';
  static const String sido = 'sido';
  static const String sidoEng = 'sidoEnglish';
  static const String sigungu = 'sigungu';
  static const String sigunguEng = 'sigunguEnglish';
  static const String sigunguCode = 'sigunguCode';
  static const String roadnameCode = 'roadnameCode';
  static const String roadname = 'roadname';
  static const String roadnameEng = 'roadnameEnglish';
  static const String bcode = 'bcode';
  static const String bname = 'bname';
  static const String bname1 = 'bname1';
  static const String bnameEng = 'bnameEnglish';
  static const String query = 'query';
  static const String userSelectedType = 'userSelectedType';
  static const String userLanguageType = 'userLanguageType';
}
