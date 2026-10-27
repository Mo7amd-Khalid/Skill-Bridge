
class ContributorModel {
  final String id;
  final String name;
  final String title;
  final String email;
  final String bio;
  final List<String> skills;
  final ExperienceLevel experienceLevel;
  final List<String> portfolioLinks;
  final List<String> contributedProjectsIDs;
  final List<String> managedProjectsIDs;
  final int availableHours;

  const ContributorModel({
    required this.id,
    required this.name,
    required this.title,
    required this.email,
    required this.bio,
    required this.skills,
    required this.experienceLevel,
    this.portfolioLinks = const [],
    this.contributedProjectsIDs = const [],
    this.managedProjectsIDs = const [],
    required this.availableHours,
  });

  factory ContributorModel.fromJson(Map<String, dynamic> json) {
    return ContributorModel(
      id: json['id'] as String,
      name: json['name'] as String,
      title: json['title'] as String,
      email: json['email'] as String,
      bio: json['bio'] as String,
      skills: List<String>.from(json['skills'] ?? []),
      experienceLevel: ExperienceLevel.values.byName(
        json['experienceLevel'] as String,
      ),
      portfolioLinks: List<String>.from(json['portfolioLinks'] ?? []),
      contributedProjectsIDs: List<String>.from(json['contributedProjectsIDs'] ?? []),
      managedProjectsIDs: List<String>.from(json['managedProjectsIDs'] ?? []),
      availableHours: json['availableHours'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'title': title,
      'email': email,
      'bio': bio,
      'skills': skills,
      'experienceLevel': experienceLevel.name,
      'portfolioLinks': portfolioLinks,
      'contributedProjectsIDs': contributedProjectsIDs,
      'managedProjectsIDs': managedProjectsIDs,
      'availableHours': availableHours,
    };
  }
}

enum ExperienceLevel {
  junior,
  midLevel,
  senior,
}


final List<ContributorModel> dummyUsers = [
  ContributorModel(
    id: 'user_001',
    name: 'Ahmed Hassan',
    title: 'Flutter Developer',
    email: 'ahmed@example.com',
    bio: 'Flutter developer interested in building scalable mobile apps.',
    skills: ['Flutter', 'Dart', 'Firebase','Flutter','Flutter','Flutter','Flutter','Flutter','Flutter','Flutter','Flutter',],
    experienceLevel: ExperienceLevel.midLevel,
    portfolioLinks: ['https://github.com/ahmed-hassan'],
    availableHours: 4,
    contributedProjectsIDs: ['project_001', 'project_005', 'project_010'],
    managedProjectsIDs: ['project_001']
  ),
  ContributorModel(
    id: 'user_002',
    name: 'Sara Mohamed',
    title: 'UI/UX Designer',
    email: 'sara@example.com',
    bio: 'UI/UX designer focused on intuitive and accessible interfaces.',
    skills: ['UI/UX Design', 'Figma', 'Prototyping'],
    experienceLevel: ExperienceLevel.senior,
    portfolioLinks: ['https://behance.net/sara-mohamed'],
    availableHours: 3,
    contributedProjectsIDs: ['project_002', 'project_004', 'project_010'],
    managedProjectsIDs: ['project_002']
  ),
  ContributorModel(
    id: 'user_003',
    name: 'Omar Ali',
    title: 'Backend Developer',
    email: 'omar@example.com',
    bio: 'Backend developer building APIs and database solutions.',
    skills: ['Backend Development', 'REST API', 'SQL'],
    experienceLevel: ExperienceLevel.senior,
    portfolioLinks: ['https://github.com/omar-ali'],
    availableHours: 5,
    contributedProjectsIDs: ['project_003', 'project_006', 'project_008'],
    managedProjectsIDs: ['project_003']
  ),
  ContributorModel(
    id: 'user_004',
    name: 'Mariam Ibrahim',
    title: 'Junior Flutter Developer',
    email: 'mariam@example.com',
    bio: 'Junior Flutter developer passionate about mobile development.',
    skills: ['Flutter', 'Dart', 'Git'],
    experienceLevel: ExperienceLevel.junior,
    portfolioLinks: ['https://github.com/mariam-ibrahim'],
    availableHours: 6,
    contributedProjectsIDs: ['project_004', 'project_003', 'project_007'],
    managedProjectsIDs: ['project_004']
  ),
  ContributorModel(
    id: 'user_005',
    name: 'Youssef Khaled',
    title: 'Full-Stack Mobile Developer',
    email: 'youssef@example.com',
    bio: 'Full-stack developer experienced in application architecture.',
    skills: ['Flutter', 'Firebase', 'Backend Development'],
    experienceLevel: ExperienceLevel.midLevel,
    portfolioLinks: ['https://github.com/youssef-khaled'],
    availableHours: 4,
    contributedProjectsIDs: ['project_005', 'project_006', 'project_009'],
    managedProjectsIDs: ['project_005']
  ),
  ContributorModel(
    id: 'user_006',
    name: 'Nour Adel',
    title: 'Mobile Application Developer',
    email: 'nour@example.com',
    bio: 'Mobile developer interested in collaborative product development.',
    skills: ['Flutter', 'Dart', 'REST API'],
    experienceLevel: ExperienceLevel.midLevel,
    portfolioLinks: ['https://github.com/nour-adel'],
    availableHours: 3,
    contributedProjectsIDs: ['project_006', 'project_005', 'project_007'],
    managedProjectsIDs: ['project_006']
  ),
  ContributorModel(
    id: 'user_007',
    name: 'Mostafa Samir',
    title: 'Flutter & Maps Developer',
    email: 'mostafa@example.com',
    bio: 'Software engineer interested in maps and location-based apps.',
    skills: ['Google Maps', 'Flutter', 'REST API'],
    experienceLevel: ExperienceLevel.senior,
    portfolioLinks: ['https://github.com/mostafa-samir'],
    availableHours: 5,
    contributedProjectsIDs: ['project_007', 'project_007', 'project_009'],
    managedProjectsIDs: ['project_007']
  ),
  ContributorModel(
    id: 'user_008',
    name: 'Farah Ahmed',
    title: 'Product Designer',
    email: 'farah@example.com',
    bio: 'Product designer who enjoys turning ideas into useful experiences.',
    skills: ['UI/UX Design', 'Figma', 'User Research'],
    experienceLevel: ExperienceLevel.midLevel,
    portfolioLinks: ['https://behance.net/farah-ahmed'],
    availableHours: 4,
    contributedProjectsIDs: ['project_008', 'project_001', 'project_010'],
    managedProjectsIDs: ['project_008']
  ),
  ContributorModel(
    id: 'user_009',
    name: 'Karim Mahmoud',
    title: 'Junior Software Developer',
    email: 'karim@example.com',
    bio: 'Developer interested in data visualization and financial applications.',
    skills: ['Flutter', 'Data Visualization', 'SQL'],
    experienceLevel: ExperienceLevel.junior,
    portfolioLinks: [],
    availableHours: 2,
    contributedProjectsIDs: ['project_009', 'project_008', 'project_010'],
    managedProjectsIDs: ['project_009']
  ),
  ContributorModel(
    id: 'user_010',
    name: 'Hana Mostafa',
    title: 'DevOps Engineer',
    email: 'hana@example.com',
    bio: 'DevOps enthusiast interested in deployment and automation.',
    skills: ['DevOps', 'Docker', 'CI/CD'],
    experienceLevel: ExperienceLevel.midLevel,
    portfolioLinks: ['https://github.com/hana-mostafa'],
    availableHours: 3,
    contributedProjectsIDs: ['project_010', 'project_006', 'project_010'],
    managedProjectsIDs: ['project_010']
  ),
  ContributorModel(
      id: 'user_011',
      name: 'Hanan Mohamed',
      title: 'DevOps Engineer',
      email: 'hanan@example.com',
      bio: 'DevOps enthusiast interested in deployment and automation.',
      skills: ['DevOps', 'Flutter', 'CI/CD'],
      experienceLevel: ExperienceLevel.junior,
      portfolioLinks: ['https://github.com/hanan-mohamed'],
      availableHours: 3,
      contributedProjectsIDs: ['project_010', 'project_006', 'project_010'],
      managedProjectsIDs: []
  )
];
