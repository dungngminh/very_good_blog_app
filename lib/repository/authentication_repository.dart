import 'dart:async';

enum AuthenticationStatus { unknown, authenticated, unauthenticated }

class AuthenticationRepository {
  final _controller = StreamController<AuthenticationStatus>();

  //action
  Stream<AuthenticationStatus> get status async* {
    await Future<void>.delayed(const Duration(seconds: 2));
    yield AuthenticationStatus.unauthenticated;
    yield* _controller.stream;
  }

  Future<void> logIn({
    required String username,
    required String password,
  }) async =>
      Future.delayed(
        const Duration(seconds: 2),
        () => _controller.add(AuthenticationStatus.authenticated),
      );

  Future<void> logOut() async => Future.delayed(
        const Duration(seconds: 1),
        () => _controller.add(AuthenticationStatus.unauthenticated),
      );

  void dispose() => _controller.close();
}
