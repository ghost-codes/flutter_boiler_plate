class App extends StatelessWidget {
  const App({Key? key, required this.initializer}) : super(key: key);

  final Future<void> initializer;

  @override
  Widget build(BuildContext context) {
    return UserInteractionObserver(
      child: AnimatedFadeIn(
        child: ResponsiveLayoutBuilder(
          small: (_, __) => _App(theme: AppTheme.small, initializer: initializer),
          medium: (_, __) => _App(theme: AppTheme.medium, initializer: initializer),
          large: (_, __) => _App(theme: AppTheme.standard, initializer: initializer),
        ),
      ),
    );
  }
}

class _App extends StatefulWidget {
  const _App({
    Key? key,
    required this.theme,
    required this.initializer,
  }) : super(key: key);

  final ThemeData theme;
  final Future<void> initializer;

  @override
  State<_App> createState() => __AppState();
}

class __AppState extends State<_App> with EventBusListener {
  bool initialized = false;
  final AppStateManager _appStateManager = getIt.get<AppStateManager>();
  late StreamSubscription<RemoteMessage> fcmMessageSub;

  @override
  void initState() {
    super.initState();
    getIt.get<EventBus>().registerListener<AppStateChanged>(this);

    initialize();
  }

  Future<void> initialize() async {
    getIt.get<EventBus>().emit(RouteChanged('Initializer'));

    await widget.initializer;

    fcmMessageSub = FcmHelper.instance.onMessage.listen(
      (message) {
        FcmHelper.instance.showNotification(message);
      },
    );

    setState(() => initialized = true);
  }

  Widget _wrapper(String key, Widget child) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: MaterialApp(
        key: ValueKey(key),
        home: OverlayManager(child: child),
        title: 'Title',
        theme: widget.theme,
        debugShowCheckedModeBanner: false,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (!initialized) {
      return _wrapper(
        'Initializer',
        Scaffold(
          body: Container(
            color: AppColors.green,
          ),
        ),
      );
    }

    final appState = _appStateManager.appState;

    if (appState == AppState.maintenance) {
      return _wrapper('Maintenance', const MaintenanceHost());
    }

    if (!_appStateManager.initialized) {
      return _wrapper(
        'Splash',
        const SplashHost(),
      );
    }

    switch (appState) {
      case AppState.forceUpdate:
        return _wrapper('ForceUpdate', const ForceUpdateHost());
      case AppState.authenticated:
        return AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.dark,
          child: UserHost(
            theme: widget.theme,
            key: const ValueKey('Authenticated'),
          ),
        );
      case AppState.unauthenticated:
        return AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.dark,
          child: GuestHost(
            theme: widget.theme,
            key: const ValueKey('Guest'),
          ),
        );
      default:
        throw Exception("Unhandled app state: $appState");
    }
  }

  @override
  void dispose() {
    getIt.get<EventBus>().unregisterListener<AppStateChanged>(this);
    fcmMessageSub.cancel();
    super.dispose();
  }

  @override
  void onEvent(event) {
    setState(() {});
  }
}
