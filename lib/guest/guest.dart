import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_example/util/style.dart';

class GuestPage extends StatelessWidget {
  const GuestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Spacer(),
              Text(
                'Go Router 範例',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 30),
              ),
              Spacer(),
              FilledButton(
                style: filledSoftButtonStyle(),
                onPressed: () {
                  goLoginPage(context);
                },
                child: Text('登入', style: softButtonTextStyle()),
              ),
              SizedBox(height: 10),
              OutlinedButton(
                style: outlinedSoftButtonStyle(),
                onPressed: () {
                  goRegisterPage(context);
                },
                child: Text('註冊', style: softButtonTextStyle()),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> goRegisterPage(BuildContext context) async {
    final r = await context.push('./register');
    log('$r');
  }

  Future<void> goLoginPage(BuildContext context) async {
    final r = await context.push('./login');
    log('$r');
  }
}
