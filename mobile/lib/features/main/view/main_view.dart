import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:very_good_blog_app/app/app.dart';
import 'package:very_good_blog_app/features/authentication/authentication.dart';
import 'package:very_good_blog_app/features/home/home.dart';
import 'package:very_good_blog_app/features/notification/notification.dart';
import 'package:very_good_blog_app/features/profile/profile.dart';
import 'package:very_good_blog_app/features/reading_list/reading_list.dart';
import 'package:very_good_blog_app/repository/repository.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  late int _currentIndex;

  @override
  void initState() {
    super.initState();
    _currentIndex = 0;
  }

  void _onPageChanged(int newIndex) => setState(() {
        _currentIndex = newIndex;
      });

  @override
  Widget build(BuildContext context) {
    final isKeyBoardShowing = MediaQuery.of(context).viewInsets.bottom != 0;
    return BlocListener<AuthenticationBloc, AuthenticationState>(
      listener: (context, state) {
        if (state.status == AuthenticationStatus.unauthenticated) {
          context.go('/login');
        }
      },
      child: Scaffold(
        body: IndexedStack(
          index: _currentIndex,
          children: const [
            HomeView(),
            NotificationView(),
            ReadingListView(),
            ProfileView(),
          ],
        ),
        floatingActionButton: Visibility(
          visible: !isKeyBoardShowing,
          child: SizedBox.square(
            dimension: 65,
            child: FloatingActionButton(
              onPressed: () {},
              backgroundColor: Palette.primaryColor,
              shape: const CircleBorder(),
              child: const Icon(
                PhosphorIcons.plus,
                color: Palette.whiteBackgroundColor,
              ),
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          color: Palette.whiteBackgroundColor,
          clipBehavior: Clip.hardEdge,
          shape: const CircularNotchedRectangle(),
          child: SizedBox(
            height: 70,
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: IconButton(
                    icon: Assets.icons.home.svg(
                      color: _currentIndex == 0
                          ? Palette.primaryColor
                          : Palette.unSelectedColor,
                      height: _currentIndex == 0 ? 30 : 26,
                    ),
                    onPressed: () => _onPageChanged(0),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: IconButton(
                    icon: Assets.icons.bell.svg(
                      color: _currentIndex == 1
                          ? Palette.primaryColor
                          : Palette.unSelectedColor,
                      height: _currentIndex == 1 ? 30 : 26,
                    ),
                    onPressed: () => _onPageChanged(1),
                  ),
                ),
                const Spacer(),
                Expanded(
                  flex: 2,
                  child: IconButton(
                    icon: Assets.icons.bookmark.svg(
                      color: _currentIndex == 2
                          ? Palette.primaryColor
                          : Palette.unSelectedColor,
                      height: _currentIndex == 2 ? 30 : 26,
                    ),
                    onPressed: () => _onPageChanged(2),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: IconButton(
                    icon: Assets.icons.user.svg(
                      color: _currentIndex == 3
                          ? Palette.primaryColor
                          : Palette.unSelectedColor,
                      height: _currentIndex == 3 ? 30 : 26,
                    ),
                    onPressed: () => _onPageChanged(3),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
