import 'package:flutter/material.dart';

// ignore: must_be_immutable
class LoginButtonWidget extends StatefulWidget {
  final VoidCallback onLoginPressed;
  bool onLoginStatus;

  LoginButtonWidget(
      {Key? key, required this.onLoginPressed, required this.onLoginStatus})
      : super(key: key);

  @override
  _LoginButtonWidgetState createState() => _LoginButtonWidgetState();
}

class _LoginButtonWidgetState extends State<LoginButtonWidget> {
  @override
  Widget build(BuildContext context) {
    print('widget.onLoginStatus: ${widget.onLoginStatus.toString()}');
    return widget.onLoginStatus == false
        ? InkWell(
            onTap: () => widget.onLoginPressed(),
            child: Container(
              height: 45,
              width: MediaQuery.of(context).size.width / 1.2,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFFf45d27), Color(0xFFf5851f)],
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(50),
                ),
              ),
              child: Center(
                child: widget.onLoginStatus != false
                    ? const CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(
                          Colors.white,
                        ),
                      )
                    : Text(
                        'Login'.toUpperCase(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
              ),
            ),
          )
        : Container(
            height: 45,
            width: MediaQuery.of(context).size.width / 1.2,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFFf45d27), Color(0xFFf5851f)],
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(50),
              ),
            ),
            child: const Center(
              child: CircularProgressIndicator(
                strokeWidth: 1.7,
                valueColor: AlwaysStoppedAnimation<Color>(
                  Colors.white,
                ),
              ),
            ),
          );
  }
}
