import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/values/values.dart';
import '../../provider/auth_state.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    print("Build");
    return Scaffold(
      extendBody: false,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          "Flutter Provider",
          style: AppTextStyles.normalText,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 25,
            ),
            title(),
            const SizedBox(
              height: 5,
            ),
            subTitle(),
            const SizedBox(
              height: 25,
            ),
            TextFormField(
              controller: email,
              style: AppTextStyles.listText,
              decoration: InputDecoration(
                hintText: "Email",
                hintStyle: AppTextStyles.subHeader,
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.green.withOpacity(0.5),
                    width: 1.0,
                  ),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.black.withOpacity(0.5),
                    width: 1.0,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Consumer<AuthProvider>(builder: (context, value, child) {
              return TextFormField(
                controller: password,
                obscureText: value.toggle,
                style: AppTextStyles.listText,
                decoration: InputDecoration(
                  hintText: "Password",
                  hintStyle: AppTextStyles.subHeader,
                  suffixIcon: GestureDetector(
                    onTap: () => value.setToggle(),
                    child: Icon(
                      value.toggle ? Icons.visibility_off : Icons.visibility,
                      color: Colors.black,
                    ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.green.withOpacity(0.5),
                      width: 1.0,
                    ),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black.withOpacity(0.5),
                      width: 1.0,
                    ),
                  ),
                ),
              );
            }),
            const SizedBox(
              height: 15,
            ),
            Consumer<AuthProvider>(builder: (context, value, child) {
              return value.loading == true
                  ? const Center(
                      child: SizedBox(
                        height: 30,
                        width: 30,
                        child: CircularProgressIndicator(
                          color: Colors.black,
                          strokeWidth: 1,
                        ),
                      ),
                    )
                  : Center(
                      child: ElevatedButton(
                          onPressed: () =>
                              value.login(email.text, password.text),
                          style: ButtonStyles.primaryDecoration,
                          child: Text(
                            'Login',
                            style: AppTextStyles.normalText,
                          )),
                    );
            })
          ],
        ),
      ),
    );
  }

  Widget title() {
    return Text(
      'Login API',
      style: AppTextStyles.titleText,
    );
  }

  Widget subTitle() {
    return Text(
      'Using Provider',
      style: AppTextStyles.subHeader,
    );
  }
}
