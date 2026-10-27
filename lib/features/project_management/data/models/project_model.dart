
class ProjectModel {
  final String id;
  final String title;
  final String description;
  final String projectManagerId;
  final List<String> memberIds;
  final List<RequiredSkillModel> requiredSkills;
  final List<String> existingSkills;
  final DateTime createdAt;
  final ProjectStatus status;

  const ProjectModel({
    required this.id,
    required this.title,
    required this.description,
    required this.projectManagerId,
    required this.memberIds,
    required this.requiredSkills,
    required this.existingSkills,
    required this.createdAt,
    required this.status,
  });

  factory ProjectModel.fromJson(Map<String, dynamic> json) {
    return ProjectModel(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      projectManagerId: json['projectManagerId'] as String,
      memberIds: List<String>.from(json['memberIds'] ?? []),
      requiredSkills: (json['requiredSkills'] as List<dynamic>? ?? [])
          .map(
            (skill) => RequiredSkillModel.fromJson(
          Map<String, dynamic>.from(skill),
        ),
      )
          .toList(),
      existingSkills: List<String>.from(json['existingSkills'] ?? []),
      createdAt: DateTime.parse(json['createdAt'] as String),
      status: ProjectStatus.values.byName(json['status'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'projectManagerId': projectManagerId,
      'memberIds': memberIds,
      'requiredSkills': requiredSkills.map((skill) => skill.toJson()).toList(),
      'existingSkills': existingSkills,
      'createdAt': createdAt.toIso8601String(),
      'status': status.name,
    };
  }
}

class RequiredSkillModel {
  final String skillName;
  final int requiredMembersCount;

  const RequiredSkillModel({
    required this.skillName,
    required this.requiredMembersCount,
  });

  factory RequiredSkillModel.fromJson(Map<String, dynamic> json) {
    return RequiredSkillModel(
      skillName: json['skillName'] as String,
      requiredMembersCount: json['requiredMembersCount'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'skillName': skillName,
      'requiredMembersCount': requiredMembersCount,
    };
  }
}

enum ProjectStatus {
  open,
  completed,
}


final List<ProjectModel> dummyProjects = [
  ProjectModel(
    id: 'project_001',
    title: 'E-Commerce Mobile App',
    description:
    'Build a mobile shopping application with product browsing, '
        'shopping cart, wishlist, and secure checkout.',
    projectManagerId: 'user_001',
    memberIds: ['user_001', 'user_002'],
    requiredSkills: const [
      RequiredSkillModel(skillName: 'Flutter', requiredMembersCount: 2),
      RequiredSkillModel(
        skillName: 'Backend Development',
        requiredMembersCount: 1,
      ),
      RequiredSkillModel(skillName: 'UI/UX Design', requiredMembersCount: 1),
    ],
    existingSkills: ['Flutter'],
    createdAt: DateTime(2026, 10, 20),
    status: ProjectStatus.open,
  ),
  ProjectModel(
    id: 'project_002',
    title: 'Task Management App',
    description:
    'Create a productivity app that allows users to manage tasks, '
        'set reminders, track progress, and collaborate with teams.',
    projectManagerId: 'user_002',
    memberIds: ['user_003', 'user_004', 'user_005'],
    requiredSkills: const [
      RequiredSkillModel(skillName: 'Flutter', requiredMembersCount: 2),
      RequiredSkillModel(skillName: 'Firebase', requiredMembersCount: 1),
      RequiredSkillModel(skillName: 'UI/UX Design', requiredMembersCount: 1),
    ],
    existingSkills: ['Flutter', 'Firebase'],
    createdAt: DateTime(2026, 10, 18),
    status: ProjectStatus.open,
  ),
  ProjectModel(
    id: 'project_003',
    title: 'Online Learning Platform',
    description:
    'Develop an educational platform where instructors can publish '
        'courses and students can watch lessons and track their learning.',
    projectManagerId: 'user_003',
    memberIds: ['user_006', 'user_007'],
    requiredSkills: const [
      RequiredSkillModel(skillName: 'Flutter', requiredMembersCount: 2),
      RequiredSkillModel(
        skillName: 'Backend Development',
        requiredMembersCount: 2,
      ),
      RequiredSkillModel(skillName: 'UI/UX Design', requiredMembersCount: 1),
    ],
    existingSkills: ['UI/UX Design'],
    createdAt: DateTime(2026, 10, 15),
    status: ProjectStatus.open,
  ),
  ProjectModel(
    id: 'project_004',
    title: 'Fitness Tracking App',
    description:
    'Build a fitness application to track workouts, daily activity, '
        'calories, and personal fitness goals.',
    projectManagerId: 'user_004',
    memberIds: ['user_008', 'user_009', 'user_010'],
    requiredSkills: const [
      RequiredSkillModel(skillName: 'Flutter', requiredMembersCount: 2),
      RequiredSkillModel(skillName: 'REST API', requiredMembersCount: 1),
      RequiredSkillModel(skillName: 'UI/UX Design', requiredMembersCount: 1),
    ],
    existingSkills: ['Flutter', 'REST API'],
    createdAt: DateTime(2026, 10, 12),
    status: ProjectStatus.open,
  ),
  ProjectModel(
    id: 'project_005',
    title: 'Event Booking Platform',
    description:
    'Create an application for discovering events, booking tickets, '
        'and managing event registrations.',
    projectManagerId: 'user_05',
    memberIds: ['user_011', 'user_012'],
    requiredSkills: const [
      RequiredSkillModel(skillName: 'Flutter', requiredMembersCount: 2),
      RequiredSkillModel(
        skillName: 'Backend Development',
        requiredMembersCount: 1,
      ),
      RequiredSkillModel(
        skillName: 'Payment Integration',
        requiredMembersCount: 1,
      ),
    ],
    existingSkills: ['Flutter'],
    createdAt: DateTime(2026, 10, 10),
    status: ProjectStatus.open,
  ),
  ProjectModel(
    id: 'project_006',
    title: 'Real-Time Chat Application',
    description:
    'Develop a messaging app with private chats, group conversations, '
        'push notifications, and online presence.',
    projectManagerId: 'user_006',
    memberIds: ['user_013', 'user_014', 'user_015'],
    requiredSkills: const [
      RequiredSkillModel(skillName: 'Flutter', requiredMembersCount: 2),
      RequiredSkillModel(skillName: 'Firebase', requiredMembersCount: 1),
      RequiredSkillModel(
        skillName: 'Backend Development',
        requiredMembersCount: 1,
      ),
    ],
    existingSkills: ['Flutter', 'Firebase'],
    createdAt: DateTime(2026, 10, 8),
    status: ProjectStatus.completed,
  ),
  ProjectModel(
    id: 'project_007',
    title: 'Travel Planner App',
    description:
    'Build a travel companion that helps users discover destinations, '
        'plan itineraries, and save their favorite places on a map.',
    projectManagerId: 'user_007',
    memberIds: ['user_016', 'user_017'],
    requiredSkills: const [
      RequiredSkillModel(skillName: 'Flutter', requiredMembersCount: 2),
      RequiredSkillModel(skillName: 'Google Maps', requiredMembersCount: 1),
      RequiredSkillModel(skillName: 'REST API', requiredMembersCount: 1),
    ],
    existingSkills: ['Flutter'],
    createdAt: DateTime(2026, 10, 5),
    status: ProjectStatus.open,
  ),
  ProjectModel(
    id: 'project_008',
    title: 'Personal Finance Tracker',
    description:
    'Create a finance app for recording income and expenses, setting '
        'budgets, and viewing monthly spending reports.',
    projectManagerId: 'user_008',
    memberIds: ['user_018', 'user_019', 'user_020'],
    requiredSkills: const [
      RequiredSkillModel(skillName: 'Flutter', requiredMembersCount: 2),
      RequiredSkillModel(
        skillName: 'Backend Development',
        requiredMembersCount: 1,
      ),
      RequiredSkillModel(
        skillName: 'Data Visualization',
        requiredMembersCount: 1,
      ),
    ],
    existingSkills: ['Flutter', 'Data Visualization'],
    createdAt: DateTime(2026, 10, 3),
    status: ProjectStatus.completed,
  ),
  ProjectModel(
    id: 'project_009',
    title: 'Food Delivery App',
    description:
    'Develop a food ordering platform with restaurant listings, '
        'live order tracking, and delivery management.',
    projectManagerId: 'user_009',
    memberIds: ['user_021', 'user_022'],
    requiredSkills: const [
      RequiredSkillModel(skillName: 'Flutter', requiredMembersCount: 2),
      RequiredSkillModel(
        skillName: 'Backend Development',
        requiredMembersCount: 2,
      ),
      RequiredSkillModel(skillName: 'Google Maps', requiredMembersCount: 1),
    ],
    existingSkills: ['Flutter'],
    createdAt: DateTime(2026, 10, 1),
    status: ProjectStatus.open,
  ),
  ProjectModel(
    id: 'project_010',
    title: 'Developer Collaboration Platform',
    description:
    'Build a platform where developers can create projects, find '
        'collaborators based on skills, and work together on shared goals.',
    projectManagerId: 'user_010',
    memberIds: ['user_023', 'user_024', 'user_025'],
    requiredSkills: const [
      RequiredSkillModel(skillName: 'Flutter', requiredMembersCount: 2),
      RequiredSkillModel(
        skillName: 'Backend Development',
        requiredMembersCount: 1,
      ),
      RequiredSkillModel(skillName: 'UI/UX Design', requiredMembersCount: 1),
      RequiredSkillModel(skillName: 'DevOps', requiredMembersCount: 1),
    ],
    existingSkills: ['Flutter', 'UI/UX Design'],
    createdAt: DateTime(2026, 9, 28),
    status: ProjectStatus.open,
  ),
];
