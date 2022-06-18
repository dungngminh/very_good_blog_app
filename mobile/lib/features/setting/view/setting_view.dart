import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:very_good_blog_app/app/app.dart';
import 'package:very_good_blog_app/features/profile/profile.dart'
    show ProfileBloc, ProfileUserLogoutRequested;
import 'package:very_good_blog_app/features/setting/setting.dart'
    show SettingTile;
import 'package:very_good_blog_app/widgets/widgets.dart' show ActionBar;

class SettingView extends StatelessWidget {
  const SettingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 16,
          vertical: context.padding.top + 8,
        ),
        child: Column(
          children: [
            const ActionBar(
              title: 'Thiết lập',
            ),
            SettingTile(
              iconPath: Assets.icons.profile.path,
              onTap: () {},
              title: 'Thông tin cá nhân',
              primaryColor: AppPalette.purple700Color,
              supportBackgroundColor: AppPalette.purple700SupportColor,
            ),
            SettingTile(
              iconPath: Assets.icons.filter.path,
              onTap: () {},
              title: 'Tùy chọn',
              primaryColor: AppPalette.pink500Color,
              supportBackgroundColor: AppPalette.pink500SupportColor,
            ),
            SettingTile(
              iconPath: Assets.icons.info.path,
              onTap: () {},
              title: 'Về Very Good Blog App',
              primaryColor: AppPalette.mintColor,
              supportBackgroundColor: AppPalette.mintSupportColor,
            ),
            SettingTile(
              iconPath: Assets.icons.logOut.path,
              onTap: () =>
                  context.read<ProfileBloc>().add(ProfileUserLogoutRequested()),
              title: 'Đăng xuất',
              primaryColor: AppPalette.primaryColor,
              supportBackgroundColor: AppPalette.purpleSupportColor,
            )
          ],
        ),
      ),
    );
  }
}
