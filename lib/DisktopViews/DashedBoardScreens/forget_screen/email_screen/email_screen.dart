import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:referral_admin_web/DisktopViews/DashedBoardScreens/forget_screen/email_screen/email_screen_provider.dart';
import 'package:referral_admin_web/DisktopViews/DisktopSignInScreen/admin_model.dart';


class EnteremailScreen extends StatefulWidget {
  final List<adminModel> mylist;
  const EnteremailScreen({super.key, required this.mylist});

  @override
  State<EnteremailScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<EnteremailScreen> {
  var value = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  // ApiCallService statesServices = ApiCallService();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return ChangeNotifierProvider(
        create: (context) => EmailScreenProvider(adminlist: widget.mylist),
        child: Consumer<EmailScreenProvider>(
            builder: (BuildContext context, model1, Widget? child) {
          return SafeArea(
            child: Scaffold(
                backgroundColor: Colors.white,
                body: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 75,
                        ),
                        KText(
                          text: 'Enter Email Here',
                          width: width,
                          fw: FontWeight.w500,
                          fs: width * 0.040,
                          colour: Colors.black,
                        ),
                        SizedBox(
                          height: 35,
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: KText(
                            text: 'Email',
                            width: width,
                            fs: width * 0.012,
                            colour: Colors.black,
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        KTextFieldwithShadow(
                            onchange: (email) {
                              model1.currentemail = email;
                            },
                            textEditingController: emailController),
                        SizedBox(
                          height: 15,
                        ),
                        kButton1(
                          onPressed: () {
                            model1.getAllEmail(context);
                          },
                          h: 48,
                          w: 100,
                          text: "Verify",
                          textColor: Colors.white,
                          colour: Colors.blue,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ],
                )),
          );
        }));
  }
}

class KText extends StatelessWidget {
  KText(
      {Key? key,
      required this.width,
      this.fw,
      this.fs,
      required this.text,
      required this.colour,
      this.ovrFlow,
      this.ltrSpacing,
      this.wordSpacng,
      this.textAlign,
      this.h})
      : super(key: key);

  final double width;
  final FontWeight? fw;
  final double? fs, wordSpacng;
  double? ltrSpacing;
  final String text;
  final Color colour;
  TextAlign? textAlign;
  TextOverflow? ovrFlow;
  double? h;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign ?? TextAlign.start,
      overflow: ovrFlow,
      style: TextStyle(
          height: h,
          wordSpacing: wordSpacng ?? 0,
          fontWeight: fw ?? FontWeight.normal,
          fontSize: fs,
          letterSpacing: ltrSpacing,
          color: colour),
    );
  }
}

class KTextFieldwithShadow extends StatelessWidget {
  KTextFieldwithShadow(
      {Key? key,
      this.h,
      this.w,
      this.hintText,
      this.textEditingController,
      this.icon,
      this.iconTrue,
      this.onchange,
      this.isobsecure,
      this.borderRadius})
      : super(key: key);
  double? w, h;
  final onchange;
  String? hintText;
  final isobsecure;
  IconData? icon;
  bool? iconTrue = false;
  TextEditingController? textEditingController;
  double? borderRadius;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Container(
      width: w ?? 610,
      height: h ?? height * 0.055,
      padding: iconTrue == true
          ? EdgeInsets.only(left: 10, top: 5)
          : EdgeInsets.zero,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius ?? 10),
        color: Colors.transparent,

        // border: Border.all(
        //   color: blueAxent,
        //   width: 1.w,
        //   strokeAlign: BorderSide.strokeAlignOutside,
        // )
      ),
      child: TextField(
        obscureText: isobsecure ?? false,
        textAlign: TextAlign.start,
        onChanged: onchange,
        decoration: InputDecoration(
          focusColor: Colors.transparent,

          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 10),
            borderSide: iconTrue == true
                ? BorderSide.none
                : BorderSide(
                    color: Colors.blue.withOpacity(0.7),
                    // strokeAlign: BorderSide.strokeAlignOutside,
                    width: 5),
          ),
          icon: iconTrue == true
              ? Icon(
                  icon!,
                  color: Colors.blue,
                )
              : null,

          // InputBorder.none,
          hintText: hintText,

          hintStyle: TextStyle(
            fontSize: 20,
            color: Colors.blue,
          ),

          // focusColor: Colors.blue,
          // fillColor: Colors.pink,

          contentPadding: EdgeInsets.only(left: 10, top: 5),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide:
                  BorderSide(width: 1, color: Colors.blue.withOpacity(0.7))),
        ),
        controller: textEditingController,
      ),
    );
  }
}

class kButton1 extends StatelessWidget {
  kButton1(
      {required this.h,
      required this.w,
      required this.text,
      this.colour,
      this.textColor,
      this.textSiz,
      this.onPressed});
  VoidCallback? onPressed;
  double h, w;
  double? textSiz;
  String text;

  Color? colour, textColor;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        // padding: EdgeInsets.all(5.r),
        height: h,
        width: w,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: colour,
            boxShadow: [
              BoxShadow(
                  spreadRadius: 2,
                  blurRadius: 2,
                  color: Colors.grey.withOpacity(0.2))
            ]),
        child: Center(
            child: Text(
          text,
          style: TextStyle(
              color: textColor,
              fontWeight: FontWeight.w500,
              fontSize: textSiz ?? 17),
        )),
      ),
    );
  }
}
