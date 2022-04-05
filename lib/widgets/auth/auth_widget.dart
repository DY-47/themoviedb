import 'package:flutter/material.dart';
import 'package:themoviedb/theme/app_bottom_style.dart';
import 'package:themoviedb/widgets/main_screen/main_screen_widget.dart';

class AuthWidget extends StatefulWidget {
  const AuthWidget({Key? key}) : super(key: key);

  @override
  State<AuthWidget> createState() => _AuthWidgetState();
}

class _AuthWidgetState extends State<AuthWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Войти в свою учётную запись',
        ),
      ),
      body: ListView(
        children: const [
          _HeaderWidget(),
        ],
      ),
    );
  }
}

class _HeaderWidget extends StatelessWidget {
  const _HeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(
      fontSize: 15,
      color: Colors.black,
    );

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 25),
          const Text(
            'Чтобы пользоваться правкой и возможностями рейтинга TMDB, а также получить персональные рекомендации, необходимо войти в свою учётную запись. Если у вас нет учётной записи, её регистрация является бесплатной и простой.',
            style: textStyle,
          ),
          TextButton(
            onPressed: () {},
            style: AppButtonStyle.linkButton,
            child: const Text('Зарегистрировать учётную запись'),
          ),
          const Text(
            'Если Вы зарегистрировались, но не получили письмо для подтверждения.',
            style: textStyle,
          ),
          TextButton(
            onPressed: () {},
            style: AppButtonStyle.linkButton,
            child: const Text('Отправить письмо с активацией ещё раз'),
          ),
          const SizedBox(height: 25),
          const _FormWidget(),
        ],
      ),
    );
  }
}

class _FormWidget extends StatefulWidget {
  const _FormWidget({Key? key}) : super(key: key);

  @override
  State<_FormWidget> createState() => __FormWidgetState();
}

class __FormWidgetState extends State<_FormWidget> {
  final _loginTextController = TextEditingController();
  final _passwordTextController = TextEditingController();
  String? errorText = null;

  // void _auth() {
  //   final login = _loginTextController.text;
  //   final password = _passwordTextController.text;
  //   if (login == 'admin' && password == 'admin') {
  //     errorText = null;
  //
  //     Navigator.of(context).pushNamed('/main_screen');
  //
  //     print('open app');
  //   } else {
  //     errorText = 'Не верный логин или пароль';
  //   }
  //   setState(() {});
  // }

  void _resetPassword() {
    print('reser password');
  }

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(
      fontSize: 15,
      color: Colors.black,
    );

    const textFieldDecorator = InputDecoration(
      border: OutlineInputBorder(),
      contentPadding: EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 5,
      ),
      isCollapsed: true,
    );

    const color = Color(0xFF01B4E4);

    final errorText = this.errorText;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (errorText != null) ...[
          Text(
            errorText,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.red,
            ),
          ),
          const SizedBox(height: 5)
        ],
        const Text(
          'Имя пользователя',
          style: textStyle,
        ),
        const SizedBox(height: 5),
        TextField(
          controller: _loginTextController,
          decoration: textFieldDecorator,
        ),
        const SizedBox(height: 15),
        const Text(
          'Пароль',
          style: textStyle,
        ),
        const SizedBox(height: 5),
        TextField(
          controller: _passwordTextController,
          decoration: textFieldDecorator,
          obscureText: true,
        ),
        const SizedBox(height: 25),
        Row(
          children: [
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed:   () {
                Navigator.of(context).pushNamed('/main_screen');
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(color),
                foregroundColor: MaterialStateProperty.all(Colors.white),
                textStyle: MaterialStateProperty.all(
                  const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                padding: MaterialStateProperty.all(
                  const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 8,
                  ),
                ),
              ),
              child: const Text('Войти'),
            ),
            const SizedBox(width: 30),
            TextButton(
              onPressed: _resetPassword,
              style: AppButtonStyle.linkButton,
              child: const Text('Сбросить пароль'),
            ),
          ],
        ),
      ],
    );
  }
}
