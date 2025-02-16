import 'package:blueprint/src/data/repository/account_repository.dart';
import 'package:blueprint/src/presentation/screen/change_password/bloc/change_password.dart';
import 'package:blueprint/src/presentation/screen/change_password/change_password_screen.dart';
import 'package:blueprint/src/presentation/screen/forgot_password/bloc/forgot_password.dart';
import 'package:blueprint/src/presentation/screen/forgot_password/forgot_password_screen.dart';
import 'package:blueprint/src/presentation/screen/login/login_screen.dart';
import 'package:blueprint/src/presentation/screen/register/bloc/register.dart';
import 'package:blueprint/src/presentation/screen/register/register_screen.dart';
import 'package:blueprint/src/routes/app_routes_constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AuthRoutes {
  static final List<GoRoute> routes = [
    GoRoute(
        name: 'login',
        path: ApplicationRoutesConstants.login,
        builder: (context, state) => LoginScreen()),
    GoRoute(
        name: 'login-otp',
        path: ApplicationRoutesConstants.loginOtp,
        builder: (context, state) => OtpEmailScreen()),
    GoRoute(
        name: 'login-otp-verify',
        path: '/login-otp-verify/:email',
        builder: (context, state) =>
            OtpVerifyScreen(email: state.pathParameters['email']!)),
    GoRoute(
      name: 'forgot-password',
      path: ApplicationRoutesConstants.forgotPassword,
      builder: (context, state) => BlocProvider(
          create: (_) => ForgotPasswordBloc(repository: AccountRepository()),
          child: ForgotPasswordScreen()),
    ),
    GoRoute(
      name: 'change-password',
      path: ApplicationRoutesConstants.changePassword,
      builder: (context, state) => BlocProvider(
          create: (_) => ChangePasswordBloc(repository: AccountRepository()),
          child: ChangePasswordScreen()),
    ),
    GoRoute(
        name: 'register',
        path: ApplicationRoutesConstants.register,
        builder: (context, state) => BlocProvider(
            create: (_) => RegisterBloc(repository: AccountRepository()),
            child: RegisterScreen())),
  ];
}
