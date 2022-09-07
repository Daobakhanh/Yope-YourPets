import 'package:flutter/material.dart';
import 'package:yope_yourpet_social_networking/modules/widget/widgets/stateless_widget/space_widget.dart';
import 'package:yope_yourpet_social_networking/themes/app_color.dart';

class SearchTextInputBar extends StatefulWidget {
  final String? userId;
  const SearchTextInputBar({Key? key, this.userId}) : super(key: key);
  @override
  State<SearchTextInputBar> createState() => _SearchTextInputBarState();
}

class _SearchTextInputBarState extends State<SearchTextInputBar> {
  String get userId => widget.userId!;
  String content = '';
  late TextEditingController _controller;
  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final scaffoldBackgroundColor = Theme.of(context).scaffoldBackgroundColor;
    final Size size = MediaQuery.of(context).size;

    return Container(
      color: scaffoldBackgroundColor,
      // color: AppColor.pinkAccent,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      width: size.width,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: 70,
            width: size.width - 80,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: SizedBox(
                height: 50,
                child: TextField(
                  controller: _controller,
                  onChanged: (String contentValue) {
                    content = contentValue;
                    debugPrint(content);
                    // widget.onSubmitContent!(value);
                  },
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                    ),
                    // prefixIcon: widget.icon,
                    labelText: 'Search...',
                    hintText: 'Enter search content',
                    hintStyle: const TextStyle(color: AppTextColor.grey),
                    suffixIcon: IconButton(
                      onPressed: _controller.clear,
                      icon: const Icon(Icons.clear),
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizeBox10W(),
          InkWell(
            onTap: () {
              debugPrint('Tap send search content');
              FocusScope.of(context).unfocus();
              // _handleCreateComment(content);
              // widget.callback;
              _controller.clear();
            },
            child: const Icon(Icons.search),
          )
        ],
      ),
    );
  }
}
