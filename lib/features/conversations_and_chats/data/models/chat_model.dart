import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../project_management/data/models/project_model.dart';

class ChatModel {
  final String id;
  final String projectId;
  final String projectName;
  final String lastMessageContent;
  final DateTime lastMessageDate;

  const ChatModel({
    required this.id,
    required this.projectId,
    required this.projectName,
    required this.lastMessageContent,
    required this.lastMessageDate,
  });

  factory ChatModel.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> doc,
      ) {
    final data = doc.data()!;

    return ChatModel(
      id: doc.id,
      projectId: data['projectId'] ?? '',
      projectName: data['projectName'] ?? '',
      lastMessageContent: data['lastMessageContent'] ?? '',
      lastMessageDate:
      (data['lastMessageDate'] as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'projectId': projectId,
      'projectName': projectName,
      'lastMessageContent': lastMessageContent,
      'lastMessageDate': Timestamp.fromDate(lastMessageDate),
    };
  }
}


final List<ChatModel> dummyChats = dummyProjects.map((project) {
  return ChatModel(
    id: 'chat_${project.id}',
    projectId: project.id,
    projectName: project.title,
    lastMessageContent: _messages[project.id]!['content'] as String,
    lastMessageDate: _messages[project.id]!['date'] as DateTime,
  );
}).toList();

final Map<String, Map<String, dynamic>> _messages = {
  'project_001': {
    'content': 'I have finished the product details screen.',
    'date': DateTime(2026, 11, 8, 12, 30),
  },
  'project_002': {
    'content': 'Can we discuss the task reminder feature?',
    'date': DateTime(2026, 11, 8, 11, 45),
  },
  'project_003': {
    'content': 'The course details UI is ready for review.',
    'date': DateTime(2026, 11, 8, 10, 20),
  },
  'project_004': {
    'content': 'I pushed the latest fitness tracking updates.',
    'date': DateTime(2026, 11, 7, 21, 15),
  },
  'project_005': {
    'content': 'Payment integration is almost complete.',
    'date': DateTime(2026, 11, 7, 18, 40),
  },
  'project_006': {
    'content': 'The Firebase messaging service is working now.',
    'date': DateTime(2026, 11, 7, 15, 10),
  },
  'project_007': {
    'content': 'I added Google Maps to the destination screen.',
    'date': DateTime(2026, 11, 6, 19, 30),
  },
  'project_008': {
    'content': 'Monthly expense charts are ready.',
    'date': DateTime(2026, 11, 6, 14, 25),
  },
  'project_009': {
    'content': 'We need to review the delivery tracking API.',
    'date': DateTime(2026, 11, 5, 20, 0),
  },
  'project_010': {
    'content': 'Welcome everyone! Let us start planning.',
    'date': DateTime(2026, 11, 5, 12, 0),
  },
};
