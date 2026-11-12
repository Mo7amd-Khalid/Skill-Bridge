import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skill_bridge/core/utils/string_extension.dart';
import 'package:skill_bridge/core/utils/time_and_date.dart';
import 'package:skill_bridge/features/conversations_and_chats/data/models/chat_model.dart';

import '../../core/routes/routes.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';

class ChatItem extends StatelessWidget {
  const ChatItem({super.key, required this.chat});

  final ChatModel chat;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, Routes.chatScreen, arguments: chat);
      },
      child: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: AppColors.darkSurfaceElevated,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          spacing: 10.w,
          children: [
            CircleAvatar(
              radius: 22.r,
              child: Text(
                chat.projectName.initials,
                style: AppTextStyles.text14w400.copyWith(fontSize: 14.sp,),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    chat.projectName,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.text16w400.copyWith(fontSize: 16.sp,),
                  ),
                  Text(
                    chat.lastMessageContent,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.text12w400.copyWith(fontSize: 12.sp,),
                  ),
                ],
              ),
            ),
            Text(
              chat.lastMessageDate.timeAgo,
              style: AppTextStyles.text12w400.copyWith(fontSize: 12.sp,),
            )
          ],
        ),
      ),
    );
  }
}
