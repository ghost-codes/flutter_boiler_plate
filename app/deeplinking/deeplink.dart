import 'package:Appapp/redesign/app/deeplinking/branch_data.dart';
import 'package:Appapp/services/core/App_core.dart';
import 'package:Appapp/utils/utils.dart';
import 'package:equatable/equatable.dart';

class Deeplink extends Equatable {
  final Uri uri;
  late final Uri deeplink;

  final ReferralData? referralData;
  late final BranchData? branchData;

  Deeplink(this.uri, {this.referralData}) {
    _setActualDeeplink();
    if (referralData != null) {
      branchData = BranchData.fromParams(referralData!.data);
    } else {
      branchData = null;
    }
  }

  void _setActualDeeplink() {
    if (uri.path == "/deeplink" && uri.queryParameters.containsKey("url")) {
      try {
        deeplink = Uri.parse(Uri.decodeFull(uri.queryParameters["url"]!));
        return;
      } catch (e) {
        // do nothing
      }
    }

    deeplink = uri;
  }

  String get route =>
      '${deeplink.path}${deeplink.queryParameters.isNotEmpty ? '?${uriEncodeMap(deeplink.queryParameters)}' : ''}'
          .trim();

  @override
  List<Object?> get props => [uri];
}
