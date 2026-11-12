import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skill_bridge/core/utils/string_extension.dart';
import 'package:skill_bridge/core/utils/time_and_date.dart';
import 'package:skill_bridge/features/conversations_and_chats/data/models/message_model.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';

class MessageItem extends StatelessWidget {
  const MessageItem({super.key, required this.message});

  final MessageModel message;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: message.senderId == 'user_001' ? MainAxisAlignment.end : MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if(message.senderId != 'user_001')
          CircleAvatar(
          radius: 13,
          child: Text(message.senderName.initials, style: AppTextStyles.text12w400.copyWith(fontSize: 12.sp)),
        ),
        InkWell(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(message.senderId == 'user_001' ? 14 : 0),
            topRight: Radius.circular(message.senderId == 'user_001' ? 0 : 14),
            bottomLeft: Radius.circular(14),
            bottomRight: Radius.circular(14),
          ),
          onLongPress: (){},
          child: Container(
            constraints: BoxConstraints(
              maxWidth: 200.w,
              minWidth: 100.w,
            ),
            margin: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 5,
            ),
            padding: const EdgeInsets.symmetric( horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
              color: message.senderId == 'user_001' ? AppColors.primary.withAlpha(150) : AppColors.darkSurfaceElevated,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(message.senderId == 'user_001' ? 14 : 0),
                topRight: Radius.circular(message.senderId == 'user_001' ? 0 : 14),
                bottomLeft: Radius.circular(14),
                bottomRight: Radius.circular(14),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                if(message.senderId != 'user_001')
                  Flexible(
                  child: Text(
                    message.senderName,
                    style: AppTextStyles.text14w400.copyWith(fontSize: 14.sp,color: AppColors.secondary),
                  ),
                ),
                Text(
                  message.content,
                  style: AppTextStyles.text14w400.copyWith(fontSize: 14.sp),
                ),
                SizedBox(height: 5),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    message.createdAt.getTime,
                    style: AppTextStyles.text12w400.copyWith(fontSize: 12.sp,color: AppColors.darkTextMuted),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
