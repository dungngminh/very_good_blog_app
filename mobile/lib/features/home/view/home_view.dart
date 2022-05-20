import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:very_good_blog_app/app/app.dart';
import 'package:very_good_blog_app/features/home/widget/widget.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.only(top: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: const [
                _Header(),
                _SearchField(),
                _CategoryChoiceBar(),
                Padding(
                  padding: EdgeInsets.fromLTRB(24, 32, 0, 16),
                  child: Text(
                    'Phổ biến',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Palette.primaryTextColor,
                    ),
                  ),
                ),
                _PopularBlogList()
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _PopularBlogList extends StatelessWidget {
  const _PopularBlogList();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.screenHeight * 0.35,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        scrollDirection: Axis.horizontal,
        itemCount: 3,
        itemBuilder: (context, index) {
          return const BlogCard(
            title: 'Thời tiết đang chuyển biến phức tạp.',
            username: 'dungngminh',
          );
        },
        separatorBuilder: (context, index) {
          return const SizedBox(
            width: 16,
          );
        },
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.screenHeight * 0.07,
      padding: const EdgeInsets.symmetric(
        horizontal: 24,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Expanded(
                flex: 2,
                child: Text(
                  'Xin chào, Dũng',
                  style: TextStyle(
                    color: Palette.smallTextColor,
                    fontSize: 15,
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Text(
                  'Chào mừng bạn!',
                  style: TextStyle(
                    color: Palette.primaryTextColor,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              )
            ],
          ),
          CircleAvatar(
            radius: 24,
            backgroundImage: Assets.images.komkat.image().image,
          ),
        ],
      ),
    );
  }
}

class _CategoryChoiceBar extends StatelessWidget {
  const _CategoryChoiceBar();

  @override
  Widget build(BuildContext context) {
    final category = <String>[
      'Tất cả',
      'Kinh tế',
      'Khoa học',
      'Văn hóa',
      'Mghệ thuật'
    ];
    return SizedBox(
      height: context.screenHeight * 0.06,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Container(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
            decoration: BoxDecoration(
              color: index == 0 ? Palette.primaryColor : Palette.fieldColor,
              borderRadius: BorderRadius.circular(20),
            ),
            alignment: Alignment.center,
            child: Text(
              category[index],
              style: TextStyle(
                fontSize: 16,
                color: index == 0
                    ? Palette.whiteBackgroundColor
                    : Palette.unSelectedTextChipColor,
              ),
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(
            width: 16,
          );
        },
        itemCount: category.length,
      ),
    );
  }
}

class _SearchField extends StatelessWidget {
  const _SearchField();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      height: context.screenHeight * 0.07,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Palette.fieldColor,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      alignment: Alignment.center,
      child: const TextField(
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          prefixIcon: Icon(
            PhosphorIcons.magnifyingGlassFill,
            color: Palette.primaryColor,
            size: 26,
          ),
          hintText: 'Tìm kiếm',
          hintStyle: TextStyle(fontWeight: FontWeight.w500),
          contentPadding: EdgeInsets.only(right: 16),
        ),
        style: TextStyle(
          fontSize: 16,
          color: Palette.primaryTextColor,
        ),
      ),
    );
  }
}
