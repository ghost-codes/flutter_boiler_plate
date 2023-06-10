import 'package:Appapp/redesign/app/deeplinking/branch_data.dart';
import 'package:Appapp/redesign/app/deeplinking/deeplink.dart';
import 'package:Appapp/redesign/app/deeplinking/deeplink_manager.dart';
import 'package:Appapp/redesign/router/user_router.dart';
import 'package:Appapp/services/core/components/analytics/metrics_client.dart';
import 'package:Appapp/services/event_bus/index.dart';
import 'package:Appapp/services/injection_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DeeplinkHandler extends StatefulWidget {
  const DeeplinkHandler({super.key, required this.child, required this.router});

  final GoRouter router;
  final Widget child;

  @override
  State<DeeplinkHandler> createState() => _DeeplinkHandlerState();
}

class _DeeplinkHandlerState extends State<DeeplinkHandler> implements EventBusListener {
  @override
  void initState() {
    super.initState();
    getIt.get<EventBus>().registerListener<DeeplinkLaunched>(this);
    getIt.get<DeeplinkManager>().init();
  }

  @override
  void onEvent(event) {
    if (event is DeeplinkLaunched) {
      final deeplink = event.deeplink;
      if (deeplink.referralData != null && maybeLaunchGroupInvite(deeplink.referralData!)) {
        return;
      } else {
        widget.router.goDeeplink(event.deeplink);
      }
    }
  }

  bool maybeLaunchGroupInvite(ReferralData link) {
    final branchData = BranchData.fromParams(link.data);
    if ([branchData.groupId, branchData.groupAppId].contains(null)) {
      return false;
    }

    widget.router.pushNamed(UserRoutes.group, pathParameters: {
      'group_id': branchData.groupId!,
      'group_App_id': branchData.groupAppId!,
    });

    return true;
  }

  @override
  void dispose() {
    getIt.get<EventBus>().unregisterListener<DeeplinkLaunched>(this);

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}

extension BuildContextExtension on BuildContext {
  void goDeeplink(Deeplink deeplink) {
    GoRouter.of(this).goDeeplink(deeplink);
  }
}

extension GoRouterExtension on GoRouter {
  void goDeeplink(Deeplink deeplink) {
    push(deeplink.route);
  }
}

// xcrun simctl openurl booted "https://app.theAppproject.com/payroll?code=SQC5W7"

// https://app.theAppproject.com/payroll?code=O02M7B


// Future<bool> navigateDeepLink(BuildContext context, Uri uri, {StackRouter? router}) async {
//   router ??= AutoRouter.of(context);

//   String route = getPathAndQueryFromUri(uri).trim();

//   /// make special case for payroll path
//   if (route.contains(PAYROLL_PATH)) {
//     await router.push(
//         AppGalleryRoute(config: ParnerAppConfig(PartnerApp.payroll, params: uri.queryParameters)));
//     return true;
//   }

//   if (route.startsWith('/')) {
//     route = route.replaceFirst('/', '');
//   }

//   await Future.delayed(const Duration(milliseconds: 500));

//   await router.pushNamed(route);
//   return true;
// }


// Future<bool> _handleDeeplink(Deeplink deeplink) async {


//   switch (deeplink.uri.path) {
//     case PAYROLL_PATH:
//       // context.goNamed(GuestRoutes.register, queryParams: {"employee_code": uri.queryParameters['code']});
//       // await router.push(AppGalleryRoute(config: ParnerAppConfig(PartnerApp.payroll, params: uri.queryParameters)));
//       return true;
//   }

//   if (![deeplink.branchData?.groupId, deeplink.branchData?.groupAppId].contains(null)) {
//     // showAppBottomSheet(
//     //   context: context,
//     //   builder: (context) => GroupInviteSheet(
//     //     groupId: branchData.groupId,
//     //     groupAppId: branchData.groupAppId,
//     //   ),
//     // );
//     return true;
//   }

//   // final route = getPathAndQueryFromUri(deeplink.link);

//   return false;
// }


//  @override
//   Future<bool> handleDeeplink(Deeplink deeplink) async {
//     final route = getPathAndQueryFromUri(deeplink.uri);

//     if (route.contains(PAYROLL_PATH)) {
//       final params = Uri.dataFromString(route).queryParameters;
//       context.goNamed(GuestRoutes.register, queryParams: {"employee_code": params['code']});

//       return true;
//     }

//     return false;
//   }