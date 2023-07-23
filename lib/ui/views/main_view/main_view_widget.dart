import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_project/ui/views/main_view/main_view_view_model.dart';
import 'package:sizer/sizer.dart';

class MainViewWidget extends StatefulWidget {
  const MainViewWidget({super.key});

  @override
  State<MainViewWidget> createState() => _MainViewWidgetState();
}

class _MainViewWidgetState extends State<MainViewWidget> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    context.read<MainScreenViewModel>().loadPhotos();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: _BodyWidget(),
    );
  }
}

class _BodyWidget extends StatelessWidget {
  const _BodyWidget();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(
        vertical: 2.0.h,
        horizontal: 2.5.h,
      ),
      child: ListView(
        children:  [
          const _FirstExpansionTileButton(),
          SizedBox(height: 3.h),
          const _SecondExpansionTileButton(),
          SizedBox(height: 3.h),
          const _ThirdExpansionTileButton()
        ],
      ),
    );
  }
}

class _FirstExpansionTileButton extends StatelessWidget {
  const _FirstExpansionTileButton();

  @override
  Widget build(BuildContext context) {
    final model = context.read<MainScreenViewModel>();
    return ExpansionTile(
      title: const Text('Button 1'),
      children: [
        Padding(
          padding:  EdgeInsets.all(2.0.h),
          child: AspectRatio(
            aspectRatio: 0.96,
            child: Image.asset(model.insideImage),
          ),
        ),
      ],
    );
  }
}

class _SecondExpansionTileButton extends StatelessWidget {
  const _SecondExpansionTileButton();

  @override
  Widget build(BuildContext context) {
    final ScrollController scrollController = ScrollController();
    final model = context.watch<MainScreenViewModel>();
    return ExpansionTile(
      title: const Text('Button 2'),
      children: [
        ListView.builder(
          controller: scrollController,
          shrinkWrap: true,
          itemCount: model.comments.length,
          itemBuilder: (context, index) {
            return _CommentsListDisplay(index: index);
          },
        ),
      ],
      onExpansionChanged: (isExpanded) => {
        if (isExpanded) model.loadComments(),
      },
    );
  }
}

class _CommentsListDisplay extends StatelessWidget {
  final int index;
  const _CommentsListDisplay({required this.index});

  @override
  Widget build(BuildContext context) {
    final model = context.read<MainScreenViewModel>();
    final comment = model.comments[index];
    return ListTile(
      title: Text(comment.email),
      subtitle: Text(comment.body),
    );
  }
}

class _ThirdExpansionTileButton extends StatelessWidget {
  const _ThirdExpansionTileButton();

  @override
  Widget build(BuildContext context) {
    final ScrollController scrollController = ScrollController();
    final model = context.watch<MainScreenViewModel>();
    return ExpansionTile(
      title: const Text('Button 3'),
      children: [
        Padding(
          padding:  EdgeInsets.all(2.0.h),
          child: ListView.builder(
            controller: scrollController,
            shrinkWrap: true,
            itemCount: model.photos.length,
            itemBuilder: (context, index) {
              return _PhotosListDisplay(index: index);
            },
          ),
        ),
      ],
    );
  }
}

class _PhotosListDisplay extends StatelessWidget {
  final int index;
  const _PhotosListDisplay({required this.index});

  @override
  Widget build(BuildContext context) {
    final model = context.watch<MainScreenViewModel>();
    final photo = model.photos[index];
    return Column(
      children: [
        Text(photo.title),
        SizedBox(height: 2.0.h),
        AspectRatio(
          aspectRatio: 1,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Image.network(photo.url),
          ),
        ),
        SizedBox(height: 4.0.h),
      ],
    );
  }
}
