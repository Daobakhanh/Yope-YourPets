import 'package:flutter/material.dart';
import 'package:yope_yourpet_social_networking/modules/widget/widgets/stateless_widget/space_widget.dart';
import 'package:yope_yourpet_social_networking/themes/app_color.dart';

class MessageInteractiveWidget extends StatelessWidget {
  const MessageInteractiveWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      height: 50,
      child: Row(
        children: const [
          ButtonInkwellBasic(
            icon: Icons.add_circle,
          ),
          ButtonInkwellBasic(
            icon: Icons.camera_alt,
          ),
          ButtonInkwellBasic(
            icon: Icons.photo,
          ),
          ButtonInkwellBasic(
            icon: Icons.photo,
          ),
        ],
      ),
    );
  }
}

class ButtonInkwellBasic extends StatelessWidget {
  final double? size;
  final IconData icon;
  const ButtonInkwellBasic({Key? key, this.size, required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: InkWell(
        onTap: () {},
        child: Icon(
          icon,
          size: size,
        ),
      ),
    );
  }
}

class MessageTextInputBar extends StatefulWidget {
  final String? userId;
  final VoidCallback? callback;
  const MessageTextInputBar({Key? key, this.userId, this.callback})
      : super(key: key);
  @override
  State<MessageTextInputBar> createState() => _MessageTextInputBarState();
}

class _MessageTextInputBarState extends State<MessageTextInputBar> {
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
                    labelText: 'Message...',
                    hintText: 'Enter message',
                    hintStyle: const TextStyle(color: AppTextColor.grey),
                    prefixIcon: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.camera_alt),
                    ),
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
              debugPrint('Tap send message');
              FocusScope.of(context).unfocus();
              // _handleCreateComment(content);
              // widget.callback;
              _controller.clear();
            },
            child: const Icon(Icons.send),
          )
        ],
      ),
    );
  }
}
