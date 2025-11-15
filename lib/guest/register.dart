import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_example/util/style.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final _accFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: context.pop,
          icon: Icon(Icons.arrow_back_ios_new),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            autovalidateMode: AutovalidateMode.onUnfocus,
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Spacer(),
                Text(
                  '註冊',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 30),
                ),
                Spacer(),
                TextFormField(
                  focusNode: _accFocusNode,
                  textInputAction: TextInputAction.next,
                  validator: (value) =>
                      value == null || value.isEmpty ? '請輸入帳號' : null,
                  onFieldSubmitted: (value) {
                    FocusScope.of(context).requestFocus(_passwordFocusNode);
                  },
                  decoration: InputDecoration(
                    labelText: '帳號',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 20),
                TextFormField(
                  focusNode: _passwordFocusNode,
                  obscureText: _obscureText,
                  validator: (value) =>
                      value == null || value.isEmpty ? '請輸入密碼' : null,
                  decoration: InputDecoration(
                    labelText: '密碼',
                    border: OutlineInputBorder(),
                    suffixIcon: _obscureText
                        ? IconButton(
                            icon: Icon(Icons.visibility),
                            onPressed: () {
                              setState(() => _obscureText = false);
                            },
                          )
                        : IconButton(
                            icon: Icon(Icons.visibility_off),
                            onPressed: () {
                              setState(() => _obscureText = true);
                            },
                          ),
                  ),
                ),
                Spacer(flex: 2),
                FilledButton(
                  style: filledSoftButtonStyle(),
                  onPressed: _tryRegister,
                  child: Text('註冊', style: softButtonTextStyle()),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _tryRegister() {
    if (_formKey.currentState!.validate()) {
      context.pop(true);
      context.go('/explore');
    }
  }
}
