import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skill_bridge/core/utils/padding.dart';
import 'package:skill_bridge/features/conversations_and_chats/data/models/chat_model.dart';
import 'package:skill_bridge/features/shared_widgets/chat_item.dart';
import 'package:skill_bridge/features/shared_widgets/custom_textFormField.dart';

class ConversationsScreen extends StatefulWidget {
  const ConversationsScreen({super.key});

  @override
  State<ConversationsScreen> createState() => _ConversationsScreenState();
}

class _ConversationsScreenState extends State<ConversationsScreen> {
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 15.h,
      children: [
        CustomTextFormField(
            controller: searchController,
          hint: Text("Search for chat..."),
          keyboardType: TextInputType.text,
          prefix: Icon(Icons.search_outlined),
        ),
        Expanded(child: ListView.separated(
            itemBuilder: (_, index) => ChatItem(chat: dummyChats[index],),
            separatorBuilder: (_, _) => 10.verticalSpace,
            itemCount: dummyChats.length))
      ],
    ).constPaddingForPage();
  }
}
