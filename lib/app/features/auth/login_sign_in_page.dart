import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lazu_tree/app/core/logger/logger.dart';
import 'package:lazu_tree/app/features/auth/auth_repository.dart';
import 'package:lazu_tree/app/features/auth/firebase_auth_repository_impl.dart';
import 'package:lazu_tree/app/features/auth/login_cubit.dart';
import 'package:lazu_tree/app/features/auth/widgets/login_logo.dart';
import 'package:lazu_tree/app/shared/extensions/app_breakpoints_ext.dart';
import 'package:lazu_tree/app/shared/utils/app_toast_mixin.dart';

class LoginSignInPage extends StatefulWidget {
  const LoginSignInPage({super.key});

  static Widget providerPageBuilder(BuildContext context, GoRouterState state) {
    return MultiBlocProvider(
      providers: [
        RepositoryProvider<AuthRepository>(
          create:
              (context) => FirebaseAuthRepositoryImpl(
                FirebaseAuth.instance,
              ),
        ),
        BlocProvider<LoginCubit>(
          create:
              (context) => LoginCubit(
                context.read<AuthRepository>(),
                context.read<Logger>(),
              ),
        ),
      ],
      child: const LoginSignInPage(),
    );
  }

  @override
  State<LoginSignInPage> createState() => _LoginSignInPageState();
}

class _LoginSignInPageState extends State<LoginSignInPage> with AppToastMixin {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: LayoutBuilder(
        builder: (context, constraints) {
          final isSmall = constraints.isSmall;
          final effectiveAlignment =
              isSmall ? MainAxisAlignment.start : MainAxisAlignment.center;

          return SizedBox.expand(
            child: Column(
              mainAxisAlignment: effectiveAlignment,
              children: [
                const Padding(
                  padding: EdgeInsets.fromLTRB(24, 24, 24, 0),
                  child: LoginLogo(),
                ),
                Material(
                  color: Theme.of(context).colorScheme.surface,
                  child: Container(
                    width: 350,
                    padding: const EdgeInsets.all(24),
                    child: BlocConsumer<LoginCubit, LoginState>(
                      listener: (context, state) {
                        final handler = switch (state) {
                          LoginSuccess() => () {
                            showSuccessToast(
                              title: 'Login realizado com sucesso!',
                            );
                            context.go('/links');
                          },
                          LoginError() => () {
                            showErrorToast(
                              title: state.errorMessage,
                              description: state.additionalMessage,
                            );
                          },
                          _ => null,
                        };

                        handler?.call();
                      },
                      builder: (context, state) {
                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              'Olá, seja bem-vindo',
                              style: Theme.of(context).textTheme.headlineSmall,
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(
                              height: 24,
                            ),
                            Text(
                              'Digite suas credenciais abaixo\n para '
                              'realizar o login:',
                              style: Theme.of(context).textTheme.bodyMedium,
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(
                              height: 24,
                            ),
                            TextField(
                              controller: _emailController,
                              decoration: const InputDecoration(
                                labelText: 'Email',
                              ),
                              keyboardType: TextInputType.emailAddress,
                            ),
                            const SizedBox(height: 16),
                            TextField(
                              controller: _passwordController,
                              decoration: const InputDecoration(
                                labelText: 'Senha',
                              ),
                              obscureText: true,
                            ),
                            const SizedBox(height: 24),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                textStyle: const TextStyle(height: 1.71),
                              ),
                              onPressed:
                                  state is LoginLoading
                                      ? null
                                      : () {
                                        context
                                            .read<LoginCubit>()
                                            .loginWithEmail(
                                              _emailController.text,
                                              _passwordController.text,
                                            );
                                      },
                              child:
                                  state is LoginLoading
                                      ? const SizedBox(
                                        height: 20,
                                        width: 20,
                                        child: CircularProgressIndicator(
                                          strokeWidth: 2,
                                        ),
                                      )
                                      : const Text('Entrar'),
                            ),
                            if (state is LoginError)
                              Padding(
                                padding: const EdgeInsets.only(top: 12),
                                child: Text(
                                  state.errorMessage,
                                  style: TextStyle(
                                    color: Theme.of(context).colorScheme.error,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            const SizedBox(height: 24),
                            const Row(
                              children: [
                                Expanded(child: Divider()),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 8),
                                  child: Text('ou'),
                                ),
                                Expanded(child: Divider()),
                              ],
                            ),
                            const SizedBox(height: 16),
                            ElevatedButton.icon(
                              icon: const Icon(
                                Icons.g_mobiledata_rounded,
                                size: 24,
                              ),
                              label: const Text('Entrar com Google'),
                              onPressed:
                                  state is LoginLoading
                                      ? null
                                      : () =>
                                          context
                                              .read<LoginCubit>()
                                              .loginWithGoogle(),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
