import 'widgets_imports.dart';

Future compressImage(File? img) async {
  File? result =
      await CompressImagesFlutter().compressImage(img!.path, quality: 20);
  File rotatedImage = await FlutterExifRotation.rotateImage(path: result!.path);
  return rotatedImage;
}

class KRadio<T> extends StatelessWidget {
  const KRadio({
    Key? key,
    required this.value,
    required this.title,
    this.groupValue,
    this.maxLines = 1,
    this.fontSize = 14,
    this.onChanged,
  }) : super(key: key);

  final String title;
  final T value;
  final T? groupValue;
  final int maxLines;
  final double fontSize;
  final T? Function(T?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return ListTileTheme(
      horizontalTitleGap: kWidth(.02),
      child: RadioListTile<T>(
        value: value,
        dense: false,
        enableFeedback: true,
        contentPadding: EdgeInsets.zero,
        visualDensity: const VisualDensity(
          horizontal: -4,
          vertical: -4,
        ),
        title: CustomText(
          text: title,
          textStyle: KTextStyles().normal(),
          alignText: TextAlign.start,
        ),
        activeColor: KColors.kPrimary,
        groupValue: groupValue,
        onChanged: onChanged,
      ),
    );
  }
}

class KCheckList<T> extends StatelessWidget {
  const KCheckList({
    Key? key,
    required this.value,
    required this.title,
    this.onChanged,
  }) : super(key: key);

  final bool value;
  final String title;
  final bool Function(bool?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      fillColor:
          MaterialStateProperty.resolveWith((states) => KColors.kPrimary),
      checkColor: KColors.kWhite,
      activeColor: KColors.kPrimary,
      controlAffinity: ListTileControlAffinity.leading,
      contentPadding: EdgeInsets.zero,
      value: value,
      visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
      title: CustomText(
        maxLines: 3,
        text: title,
        textStyle: KTextStyles().normal(),
        alignText: TextAlign.start,
      ),
      onChanged: onChanged,
    );
  }
}

class KLoadingOverlay extends StatelessWidget {
  const KLoadingOverlay({
    Key? key,
    required this.isLoading,
    required this.child,
  }) : super(key: key);

  final RxBool isLoading;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return LoadingOverlay(
        isLoading: isLoading.value,
        color: KColors.kGrey,
        progressIndicator: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: Container(
            color: KColors.kWhite.withOpacity(.4),
            alignment: Alignment.center,
            child: const CustomLoader(),
          ),
        ),
        child: child,
      );
    });
  }
}
