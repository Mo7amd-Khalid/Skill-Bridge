import 'package:cloud_firestore/cloud_firestore.dart';

class MessageModel {
  final String id;
  final String projectId;
  final String senderId;
  final String senderName;
  final String content;
  final DateTime createdAt;
  final List<String> readBy;

  const MessageModel({
    required this.id,
    required this.projectId,
    required this.senderId,
    required this.senderName,
    required this.content,
    required this.createdAt,
    this.readBy = const [],
  });

  factory MessageModel.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> doc,
      ) {
    final data = doc.data()!;

    return MessageModel(
      id: doc.id,
      projectId: data['projectId'] ?? '',
      senderId: data['senderId'] ?? '',
      senderName: data['senderName'] ?? '',
      content: data['content'] ?? '',
      createdAt: (data['createdAt'] as Timestamp).toDate(),
      readBy: List<String>.from(data['readBy'] ?? []),
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'projectId': projectId,
      'senderId': senderId,
      'senderName': senderName,
      'content': content,
      'createdAt': Timestamp.fromDate(createdAt),
      'readBy': readBy,
    };
  }
}


final List<MessageModel> dummyMessages = [
  MessageModel(
    id: 'message_001',
    projectId: 'project_001',
    senderId: 'user_001',
    senderName: 'Ahmed Hassan',
    content: 'Hey everyone! How is the project going?',
    createdAt: DateTime.now().subtract(
      const Duration(hours: 3, minutes: 20),
    ),
    readBy: ['user_001', 'user_002', 'user_003'],
  ),
  MessageModel(
    id: 'message_002',
    projectId: 'project_001',
    senderId: 'user_002',
    senderName: 'Sara Mohamed',
    content: 'Everything is going well! I have finished the UI design.',
    createdAt: DateTime.now().subtract(
      const Duration(hours: 3, minutes: 15),
    ),
    readBy: ['user_002', 'user_001'],
  ),
  MessageModel(
    id: 'message_003',
    projectId: 'project_001',
    senderId: 'user_002',
    senderName: 'Sara Mohamed',
    content: 'I will share the Figma link with you shortly.',
    createdAt: DateTime.now().subtract(
      const Duration(hours: 3, minutes: 12),
    ),
    readBy: ['user_002'],
  ),
  MessageModel(
    id: 'message_004',
    projectId: 'project_001',
    senderId: 'user_001',
    senderName: 'Ahmed Hassan',
    content: 'Great! Looking forward to seeing it.',
    createdAt: DateTime.now().subtract(
      const Duration(hours: 2, minutes: 50),
    ),
    readBy: ['user_001', 'user_002', 'user_003'],
  ),
  MessageModel(
    id: 'message_005',
    projectId: 'project_001',
    senderId: 'user_003',
    senderName: 'Mohamed Khaled',
    content: 'I have started working on the Flutter implementation.',
    createdAt: DateTime.now().subtract(
      const Duration(hours: 2, minutes: 30),
    ),
    readBy: ['user_003', 'user_001'],
  ),
  MessageModel(
    id: 'message_006',
    projectId: 'project_001',
    senderId: 'user_003',
    senderName: 'Mohamed Khaled',
    content:
    'The authentication screens are almost ready. '
        'I just need to connect them with Firebase Authentication '
        'and handle the validation.',
    createdAt: DateTime.now().subtract(
      const Duration(hours: 2, minutes: 25),
    ),
    readBy: ['user_003'],
  ),
  MessageModel(
    id: 'message_007',
    projectId: 'project_001',
    senderId: 'user_001',
    senderName: 'Ahmed Hassan',
    content: 'Perfect! Let me know if you need any help.',
    createdAt: DateTime.now().subtract(
      const Duration(hours: 1, minutes: 45),
    ),
    readBy: ['user_001', 'user_002', 'user_003'],
  ),
  MessageModel(
    id: 'message_008',
    projectId: 'project_001',
    senderId: 'user_002',
    senderName: 'Sara Mohamed',
    content: 'Here is the updated design. Please check it.',
    createdAt: DateTime.now().subtract(
      const Duration(minutes: 30),
    ),
    readBy: ['user_002', 'user_001'],
  ),
  MessageModel(
    id: 'message_009',
    projectId: 'project_001',
    senderId: 'user_003',
    senderName: 'Mohamed Khaled',
    content: 'Looks good! I will start implementing the remaining screens.',
    createdAt: DateTime.now().subtract(
      const Duration(minutes: 15),
    ),
    readBy: ['user_003'],
  ),
  MessageModel(
    id: 'message_010',
    projectId: 'project_001',
    senderId: 'user_001',
    senderName: 'Ahmed Hassan',
    content: 'Awesome work everyone! 🚀',
    createdAt: DateTime.now().subtract(
      const Duration(minutes: 5),
    ),
    readBy: ['user_001'],
  ),
];
