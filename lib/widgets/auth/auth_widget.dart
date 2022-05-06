import 'package:flutter/material.dart';
import 'package:themoviedb/theme/app_bottom_style.dart';
import 'package:themoviedb/widgets/auth/auth_model.dart';

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

class _FormWidget extends StatelessWidget {
  const _FormWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = AuthProvider.read(context)?.model;

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

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _AuthButtonWidget(),
        const _ErrorMessageWidget(),
        const Text(
          'Имя пользователя',
          style: textStyle,
        ),
        const SizedBox(height: 5),
        TextField(
          controller: model?.loginTextController,
          decoration: textFieldDecorator,
        ),
        const SizedBox(height: 15),
        const Text(
          'Пароль',
          style: textStyle,
        ),
        const SizedBox(height: 5),
        TextField(
          controller: model?.passwordTextController,
          decoration: textFieldDecorator,
          obscureText: true,
        ),
        const SizedBox(height: 25),
        Row(
          children: [
            const SizedBox(height: 10),
            const SizedBox(width: 30),
            TextButton(
              onPressed: () => model?.auth(context),
              style: AppButtonStyle.linkButton,
              child: const Text('Сбросить пароль'),
            ),
          ],
        ),
      ],
    );
  }
}

class _ErrorMessageWidget extends StatelessWidget {
  const _ErrorMessageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final errorMessage = AuthProvider.watch(context)?.model.errorMessage;
    if (errorMessage == null) return const SizedBox.shrink();
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Text(
        errorMessage,
        style: const TextStyle(
          fontSize: 16,
          color: Colors.red,
        ),
      ),
    );
  }
}

class _AuthButtonWidget extends StatelessWidget {
  const _AuthButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = AuthProvider.watch(context)?.model;
    const color = Color(0xFF01B4E4);
    final onPressed =
        model?.canStartAuth == true ? () => model?.auth(context) : null;

    return ElevatedButton(
      onPressed: onPressed,
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
    );
  }
}
