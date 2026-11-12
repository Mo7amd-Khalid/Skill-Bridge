import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skill_bridge/core/theme/app_colors.dart';
import 'package:skill_bridge/core/utils/padding.dart';
import 'package:skill_bridge/features/conversations_and_chats/data/models/chat_model.dart';
import 'package:skill_bridge/features/conversations_and_chats/data/models/message_model.dart';
import 'package:skill_bridge/features/shared_widgets/message_item.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../shared_widgets/custom_textFormField.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key, required this.chat});

  final ChatModel chat;

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.chat.projectName, style: AppTextStyles.text18w600),
      ),
      body: Column(
        children: [
          Expanded(child: ListView.separated(
              itemBuilder: (_ ,index) =>  MessageItem(message: dummyMessages[index]),
              separatorBuilder: (_, _) => 10.verticalSpace,
              itemCount: dummyMessages.length
          )),
          Row(
            children: [
              Expanded(
                child: CustomTextFormField(
                  controller: messageController,
                  hint: Text("Type a message..."),
                  keyboardType: TextInputType.text,
                ),
              ),
              IconButton(onPressed: (){}, icon: Icon(Icons.send, color: AppColors.secondary,))
            ],
          )
        ],
      ).constPaddingForPage(),
    );
  }
}
//