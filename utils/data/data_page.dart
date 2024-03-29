import 'package:Appapp/redesign/ui/widgets/data/data_error.dart';
import 'package:Appapp/redesign/ui/widgets/overlay/overlay_manager.dart';
import 'package:Appapp/services/core/App_core.dart';
import 'package:Appapp/services/event_bus/index.dart';
import 'package:Appapp/services/injection_container.dart';
import 'package:Appapp/ui/widgets/operation_runner.dart';
import 'package:flutter/material.dart';
import 'package:focus_detector/focus_detector.dart';

abstract class DataPage<T extends StatefulWidget> extends OperationRunnerState<T>
    with AutomaticKeepAliveClientMixin {
  bool loaded = false;
  bool loading = true;
  Object? lastError;

  bool get showLoader => true;

  bool get showError => !loading && !loaded && lastError != null;

  bool get isLoadingInitialData => loading && !loaded;

  Future<void> onLoad();
  Future<void> onRefresh();

  Widget buildPage(BuildContext context);

  void refreshChildren() {
    getIt.get<EventBus>().emit(PageReloaded());
  }

  void requestRender() {
    if (!mounted) return;
    setState(() {});
  }

  Future<void> _loadData() async {
    loading = true;
    requestRender();

    try {
      if (!loaded) {
        if (showLoader) OverlayManager.pageBusy();
        await onLoad();
        loaded = true;
      } else {
        refreshChildren();
        await onRefresh();
      }
      lastError = null;
    } catch (e, st) {
      lastError = e;
      AppCore.instance.logger.error("An error occurred while attempting to load data: $e\n$st");
    }

    OverlayManager.pageIdle();

    loading = false;
    requestRender();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return FocusDetector(
      child: showError
          ? buildError()
          : isLoadingInitialData
              ? Container(
                  color: Colors.white,
                )
              : buildPage(context),
      onFocusGained: () => _loadData(),
      onFocusLost: () {},
    );
  }

  Widget buildError() => Material(
        color: Colors.white,
        child: Center(
          child: DataError(onRetry: _loadData),
        ),
      );

  @override
  bool get wantKeepAlive => false;
}
