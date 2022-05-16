import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:very_good_blog_app/app/app.dart';
import 'package:very_good_blog_app/features/authentication/authentication.dart';
import 'package:very_good_blog_app/features/register/bloc/register_bloc.dart';
import 'package:very_good_blog_app/features/register/view/resigter_form.dart';
import 'package:very_good_blog_app/repository/repository.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthenticationBloc, AuthenticationState>(
      listener: (context, state) {
        if (state.status == AuthenticationStatus.successfullyRegistered) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              const SnackBar(content: Text('Đăng ký thành công')),
            );
          context.pop();
        } else if (state.status ==
            AuthenticationStatus.unsuccessfullyRegistered) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              const SnackBar(content: Text('Đăng ký thất bại')),
            );
        } else if (state.status == AuthenticationStatus.existed) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              const SnackBar(content: Text('Tên người dùng đã tồn tại')),
            );
        }
      },
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
          body: Column(
            children: [
              SizedBox(
                height: context.screenHeight * 0.06,
              ),
              Flexible(
                flex: 2,
                child: Center(
                  child: Container(
                    height: 120,
                    decoration: const BoxDecoration(
                      color: Palette.purpleSupportColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(90),
                        topRight: Radius.circular(90),
                        bottomLeft: Radius.circular(90),
                      ),
                    ),
                    child: FittedBox(
                      child: SvgPicture.asset(
                        'assets/images/very_good.svg',
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              Expanded(
                flex: 10,
                child: BlocProvider<RegisterBloc>(
                  create: (_) => RegisterBloc(
                    authenticationRepository:
                        context.read<AuthenticationRepository>(),
                  ),
                  child: const ResigterForm(),
                ),
              ),
              SizedBox(
                height: context.screenHeight * 0.02,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
