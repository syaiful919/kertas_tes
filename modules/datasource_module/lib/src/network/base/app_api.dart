import 'base_api.dart';

class AppApi extends BaseApi {
  @override
  String getUrl() {
    // TODO: inject via env variable
    return 'https://x.xom/';
  }
}
