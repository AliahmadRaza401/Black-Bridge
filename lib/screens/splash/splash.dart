import 'package:the_blackbridge_group/screens/home/home.dart';
import 'package:the_blackbridge_group/screens/introScreen.dart';
import 'package:the_blackbridge_group/widgets/widgets_imports.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView>
    with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  Animation<double>? _scaleAnimation;
  DateTime? trialEndDate;
  bool? isTrialExpired;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);

    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.2).animate(_controller!);

    Future.delayed(const Duration(seconds: 3), () async {
      SharedPreferences pref = await SharedPreferences.getInstance();
      var isLogged = pref.getBool("isLogged");

      if (isLogged == true) {
        Get.offAll(Home());
      } else {
        Get.offAll(IntroScreen());
      }
    });
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedBuilder(
          animation: _controller!,
          builder: (context, child) {
            return Transform.scale(
              scale: _scaleAnimation!.value,
              child: Image.asset(
                "assets/images/bl_trns.png",
                scale: 5,
              ),
            );
          },
        ),
      ),
    );
  }
}
