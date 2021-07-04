import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:whenv3/model/AuthResponse.dart';
import 'package:whenv3/network/NetworkApi.dart';
import 'package:whenv3/util/CloseKeyboard.dart';
import 'package:whenv3/widget/StyleWidget.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key key}) : super(key: key);

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  VideoPlayerController _controller;
  final formState = GlobalKey<FormState>();
  String email,emailRegister;
  String password,passwordRegister;
  String usernameRegister;
  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('assets/raw/video.mov')
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formState,
        child: SingleChildScrollView(
          child: Stack(
            alignment: Alignment.center,
            children: [
              AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: _controller.value.isInitialized
                    ? AspectRatio(
                        aspectRatio: _controller.value.aspectRatio,
                        child: VideoPlayer(_controller),
                      )
                    : Container(),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(left: 15.0, right: 15, bottom: 15),
                child: Column(
                  children: [
                    Image.asset(
                      "assets/logo.png",
                      height: MediaQuery.of(context).size.height / 4,
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Container(
                      decoration: kBoxDecorationStyle,
                      child: TextFormField(
                          onSaved: (value) => email = value.trim(),
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.all(8),
                            hintText: "E-posta",
                            labelText: "E-posta",
                            labelStyle: TextStyle(color: Colors.black87),
                          ),
                          textAlign: TextAlign.center,
                          validator: (value) {
                            if (value.isEmpty) {
                              return "Lütfen email adresinizi giriniz";
                            }
                          }),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Container(
                      decoration: kBoxDecorationStyle,
                      child: TextFormField(
                          onSaved: (value) => password = value.trim(),
                          keyboardType: TextInputType.text,
                          obscureText: true,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.all(8),
                            hintText: "Parola",
                            labelText: "Parola",
                            labelStyle: TextStyle(color: Colors.black87),
                          ),
                          textAlign: TextAlign.center,
                          validator: (value) {
                            if (value.isEmpty) {
                              return "Lütfen parolanızı giriniz";
                            }
                          }),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: CupertinoButton(
                          color: Colors.green,
                          child: Text("Giriş Yap"),
                          onPressed: () async {
                            keyboardHide();
                            if (formState.currentState.validate()) {
                              formState.currentState.save();
                              AuthResponse auth = await NetworkApi()
                                  .login(email: email, password: password);
                              if (auth.success) {
                                Navigator.pushNamedAndRemoveUntil(context, "/bottom", (route) => false);
                              } else {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return CupertinoAlertDialog(
                                      title: Text(
                                          "Yanlış e-posta yada parola girdiniz. Lütfen tekrar deneyin."),
                                      actions: [
                                        CupertinoButton(
                                            child: Text("Tamam"),
                                            onPressed: () {
                                              Navigator.pop(context);
                                            })
                                      ],
                                    );
                                  },
                                );
                              }
                            }
                          }),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: CupertinoButton(
                          color: Colors.grey,
                          child: Text("Kayıt Ol"),
                          onPressed: () {
                            keyboardHide();
                            showRegisterBottom();
                          }),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Parolamı unuttun ?",
                          style: kLabelStyle,
                        ),
                        ElevatedButton(
                            style: ButtonStyle(
                                shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20))),
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.pink)),
                            child: Text(
                              "Buraya Tıkla",
                              style: kLabelStyle,
                            ),
                            onPressed: () {
                              showForgotPasswordBottom();
                            }),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  showRegisterBottom() {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return Container(
            color: Colors.black54,
            height: MediaQuery.of(context).size.height,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 25,
                      ),
                      Container(
                        decoration: kBoxDecorationStyle,
                        child: TextFormField(
                            onSaved: (value) => emailRegister = value.trim(),
                            keyboardType: TextInputType.text,
                            obscureText: true,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.all(8),
                              hintText: "E-posta",
                              labelText: "E-posta",
                              labelStyle: TextStyle(color: Colors.black87),
                            ),
                            textAlign: TextAlign.center,
                            validator: (value) {
                              if (value.isEmpty) {
                                return "Lütfen E-posta giriniz";
                              }
                            }),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Container(
                        decoration: kBoxDecorationStyle,
                        child: TextFormField(
                            onSaved: (value) => usernameRegister = value.trim(),
                            keyboardType: TextInputType.text,
                            obscureText: true,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.all(8),
                              hintText: "Kullanıcı Adı",
                              labelText: "Kullanıcı Adı",
                              labelStyle: TextStyle(color: Colors.black87),
                            ),
                            textAlign: TextAlign.center,
                            validator: (value) {
                              if (value.isEmpty) {
                                return "Lütfen Kullanıcı Adı giriniz";
                              }
                            }),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Container(
                        decoration: kBoxDecorationStyle,
                        child: TextFormField(
                            onSaved: (value) => passwordRegister = value.trim(),
                            keyboardType: TextInputType.text,
                            obscureText: true,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.all(8),
                              hintText: "Parola",
                              labelText: "Parola",
                              labelStyle: TextStyle(color: Colors.black87),
                            ),
                            textAlign: TextAlign.center,
                            validator: (value) {
                              if (value.isEmpty) {
                                return "Lütfen parolanızı giriniz";
                              }
                            }),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: CupertinoButton(
                            color: Colors.green,
                            child: Text("Kayıt Ol"),
                            onPressed: () async {
                              keyboardHide();
                              AuthResponse auth = await NetworkApi().register(
                                  password: passwordRegister,
                                  username: usernameRegister,
                                  email: emailRegister);
                              if (auth.success) {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return CupertinoAlertDialog(
                                        title: Text(
                                            "Başarıyla kayıt oldunuz. E-posta adresinize gelen doğrulama mail'i ile hesabınızı doğrulayınız."),
                                        actions: [
                                          CupertinoButton(
                                              child: Text("Tamam"),
                                              onPressed: () {
                                                Navigator.pop(context);
                                                Navigator.pop(context);
                                              })
                                        ]);
                                  },
                                );
                              } else {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return CupertinoAlertDialog(
                                        title: Text(auth.errorMessage),
                                        actions: [
                                          CupertinoButton(
                                              child: Text("Tamam"),
                                              onPressed: () {
                                                Navigator.pop(context);
                                                Navigator.pop(context);
                                              })
                                        ]);
                                  },
                                );
                              }
                            }),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }

  showForgotPasswordBottom() {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return Container(
            color: Colors.black54,
            height: MediaQuery.of(context).size.height,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 25,
                      ),
                      Container(
                        decoration: kBoxDecorationStyle,
                        child: TextFormField(
                            onSaved: (value) =>  emailRegister = value.trim(),
                            keyboardType: TextInputType.text,
                            obscureText: true,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.all(8),
                              hintText: "E-posta",
                              labelText: "E-posta",
                              labelStyle: TextStyle(color: Colors.black87),
                            ),
                            textAlign: TextAlign.center,
                            validator: (value) {
                              if (value.isEmpty) {
                                return "Lütfen E-posta giriniz";
                              }
                            }),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: CupertinoButton(
                            color: Colors.green,
                            child: Text("Parolamı Unuttum"),
                            onPressed: () async{
                              keyboardHide();
                              String res = await NetworkApi().forgotPassword(
                                email: emailRegister
                              );
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return CupertinoAlertDialog(
                                      title: Text(res),
                                      actions: [
                                        CupertinoButton(
                                            child: Text("Tamam"),
                                            onPressed: () {
                                              Navigator.pop(context);
                                              Navigator.pop(context);
                                            })
                                      ]);
                                },
                              );
                            }),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
