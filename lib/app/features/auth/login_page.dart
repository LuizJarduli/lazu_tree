import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lazu_tree/app/core/logger/logger.dart';
import 'package:lazu_tree/app/features/auth/auth_repository.dart';
import 'package:lazu_tree/app/features/auth/firebase_auth_repository_impl.dart';
import 'package:lazu_tree/app/features/auth/login_cubit.dart';
import 'package:lazu_tree/app/shared/extensions/app_breakpoints_ext.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  static Widget providerPageBuilder(BuildContext context, GoRouterState state) {
    return MultiBlocProvider(
      providers: [
        RepositoryProvider<AuthRepository>(
          create: (context) => FirebaseAuthRepositoryImpl(),
        ),
        BlocProvider<LoginCubit>(
          create:
              (context) => LoginCubit(
                context.read<AuthRepository>(),
                context.read<Logger>(),
              ),
        ),
      ],
      child: const LoginPage(),
    );
  }

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
                Material(
                  color: Theme.of(context).colorScheme.surface,
                  child: Container(
                    width: 350,
                    padding: const EdgeInsets.all(24),
                    child: BlocBuilder<LoginCubit, LoginState>(
                      builder: (context, state) {
                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              'Olá, seja bem vindo',
                              style: Theme.of(context).textTheme.headlineSmall,
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(
                              height: 24,
                            ),
                            Text(
                              'Digite suas credenciais abaixo para '
                              'realizar o login',
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
                            const SizedBox(height: 8),
                            ElevatedButton.icon(
                              icon: const Icon(
                                Icons.apple,
                                size: 24,
                              ),
                              label: const Text('Entrar com apple'),
                              onPressed:
                                  state is LoginLoading
                                      ? null
                                      : () =>
                                          context
                                              .read<LoginCubit>()
                                              .loginWithApple(),
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
