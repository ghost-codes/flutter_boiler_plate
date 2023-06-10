final getIt = GetIt.instance;

Future<void> setupService() async {
  // register EventBus
  getIt.registerSingleton(EventBus());

  /// setup network event listener
  final netEventListener = NetworkEventListener(refreshSession: () async {
    return true;
  });

  final selisRestClient = RestClientImpl(ApiConstants.API_URL, netEventListener.onNetworkError);

  final sharedPref = await SharedPreferences.getInstance();
  getIt.registerLazySingleton<SharedPref>(() => SharedPrefImpl(
        prefs: sharedPref,
        secureStorage: const FlutterSecureStorage(),
      ));

  final cartRawJson = sharedPref.getString(SharedPrefKeys.cart);

  print(cartRawJson);
  getIt.registerSingleton(Cart.fromJson(json.decode(cartRawJson ?? "{}"), getIt.get()));
  getIt.registerLazySingleton(() => SelisApi(selisRestClient));
}
