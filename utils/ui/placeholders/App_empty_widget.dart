class AppEmptyWidget extends StatelessWidget {
  const AppEmptyWidget({super.key, required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      child: BoxContainer(
        alignment: Alignment.center,
        fillColorLight: AppColors.whiteSmoke,
        useBorder: false,
        child: AppText.paragraphRegular(message, textAlign: TextAlign.center),
      ),
    );
  }
}
