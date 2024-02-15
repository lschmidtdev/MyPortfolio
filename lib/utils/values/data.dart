part of 'values.dart';

class CertificationData {
  CertificationData({
    required this.title,
    required this.image,
    required this.imageSize,
    required this.url,
    required this.awardedBy,
  });

  final String image;
  final double imageSize;
  final String url;
  final String title;
  final String awardedBy;
}

class NoteWorthyProjectDetails {
  NoteWorthyProjectDetails({
    required this.projectName,
    required this.isOnPlayStore,
    required this.isPublic,
    required this.technologyUsed,
    required this.isWeb,
    required this.isLive,
    this.projectDescription,
    this.playStoreUrl,
    this.webUrl,
    this.hasBeenReleased,
    this.gitHubUrl,
  });

  final String projectName;
  final bool isPublic;
  final bool isOnPlayStore;
  final bool isWeb;
  final String? projectDescription;
  final bool isLive;
  final bool? hasBeenReleased;
  final String? playStoreUrl;
  final String? gitHubUrl;
  final String? webUrl;
  final String? technologyUsed;
}

class ExperienceData {
  ExperienceData({
    required this.position,
    required this.roles,
    required this.location,
    required this.duration,
    required this.company,
    this.companyUrl,
  });

  final String company;
  final String? companyUrl;
  final String location;
  final String duration;
  final String position;
  final List<String> roles;
}

class SkillData {
  SkillData({
    required this.skillName,
    required this.skillLevel,
  });

  final String skillName;
  final double skillLevel;
}

class SubMenuData {
  SubMenuData({
    required this.title,
    this.isSelected,
    this.content,
    this.skillData,
    this.isAnimation = false,
  });

  final String title;
  final String? content;
  final List<SkillData>? skillData;
  bool isAnimation;
  bool? isSelected;
}

class Data {
  static List<NavItemData> menuItems = [
    NavItemData(name: StringConst.HOME, route: StringConst.HOME_PAGE),
    NavItemData(name: StringConst.ABOUT, route: StringConst.ABOUT_PAGE),
    NavItemData(name: StringConst.WORKS, route: StringConst.WORKS_PAGE),
    NavItemData(
      name: StringConst.EXPERIENCE,
      route: StringConst.EXPERIENCE_PAGE,
    ),
    NavItemData(
      name: StringConst.CERTIFICATIONS,
      route: StringConst.CERTIFICATION_PAGE,
    ),
    NavItemData(name: StringConst.CONTACT, route: StringConst.CONTACT_PAGE),
  ];

  static List<SocialData> socialData = [
    SocialData(
      name: StringConst.GITHUB,
      iconData: FontAwesomeIcons.github,
      url: StringConst.GITHUB_URL,
    ),
    SocialData(
      name: StringConst.LINKED_IN,
      iconData: FontAwesomeIcons.linkedin,
      url: StringConst.LINKED_IN_URL,
    ),
  ];

  static List<String> mobileTechnologies = [
    "Android",
    "Kotlin",
    "Jetpack Compose",
    "Flutter",
    "Dart",
    "Java Android",
  ];

  static List<String> otherTechnologies = [
    "HTML 5",
    "Delphi",
    "JavaScript",
    "PLSQL",
    "SQL",
    "Node JS",
    "Git",
    "Docker",
    "Firebase",
    "Azure",
    "C++",
    "Python",
    "Figma",
    "Scrum",
    "Agile"

  ];
  static List<SocialData> socialData1 = [
    SocialData(
      name: StringConst.GITHUB,
      iconData: FontAwesomeIcons.github,
      url: StringConst.GITHUB_URL,
    ),
    SocialData(
      name: StringConst.LINKED_IN,
      iconData: FontAwesomeIcons.linkedin,
      url: StringConst.LINKED_IN_URL,
    ),
  ];

  static List<SocialData> socialData2 = [
    SocialData(
      name: StringConst.LINKED_IN,
      iconData: FontAwesomeIcons.linkedin,
      url: StringConst.LINKED_IN_URL,
    ),
  ];

  static List<ProjectItemData> recentWorks = [
    Projects.SpeechToText,

  ];

  static List<ProjectItemData> projects = [
    Projects.SpeechToText
  ];

  static List<NoteWorthyProjectDetails> noteworthyProjects = [
    NoteWorthyProjectDetails(
      projectName: StringConst.COOMING_SOON_IMPORTANT_PROJ,
      isPublic: true,
      isOnPlayStore: false,
      isWeb: false,
      technologyUsed: StringConst.COOMING_SOON_IMPORTANT_PROJ,
      projectDescription: StringConst.COOMING_SOON_IMPORTANT_PROJ,
      gitHubUrl: StringConst.FIX_URL,
      isLive: false,
    ),
  ];

  static List<CertificationData> certificationData = [
    CertificationData(
      title: StringConst.IFSC,
      url: StringConst.IFSC_URL,
      image: ImagePath.IFSC_CERT,
      imageSize: 0.325,
      awardedBy: StringConst.IFSC_NAME,
    ),
  ];

  static List<ExperienceData> experienceData = [
    ExperienceData(
      company: StringConst.COMPANY_2,
      position: StringConst.POSITION_2,
      companyUrl: StringConst.COMPANY_2_URL,
      roles: [
        StringConst.COMPANY_2_ROLE_1,
        StringConst.COMPANY_2_ROLE_2,
        StringConst.COMPANY_2_ROLE_3,
      ],
      location: StringConst.LOCATION_2,
      duration: StringConst.DURATION_2,
    ),
    ExperienceData(
      company: StringConst.COMPANY_3,
      position: StringConst.POSITION_3,
      companyUrl: StringConst.COMPANY_3_URL,
      roles: [
        StringConst.COMPANY_3_ROLE_1,
        StringConst.COMPANY_3_ROLE_2,
        StringConst.COMPANY_3_ROLE_3,
      ],
      location: StringConst.LOCATION_3,
      duration: StringConst.DURATION_3,
    ),
  ];
}

class Projects {
  static ProjectItemData COOMING_SOON = ProjectItemData(
    title: StringConst.COOMING_SOON_APP_TITLE,
    subtitle: StringConst.COOMING_SOON_SUBTITLE,
    category: StringConst.COOMING_SOON_CATEGORY,
    designer: StringConst.COOMING_SOON_DESIGNER,
    primaryColor: AppColors.coomingSoon,
    platform: StringConst.COOMING_SOON_PLATFORM,
    image: ImagePath.COOMING_SOON_COVER,
    coverUrl: ImagePath.COOMING_SOON_COVER,
    navTitleColor: AppColors.coomingSoonNavTitle,
    navSelectedTitleColor: AppColors.coomingSoonSelectedNavTitle,
    appLogoColor: AppColors.coomingSoon,
    projectAssets: [
      ImagePath.COOMING_SOON_HOME,
      ImagePath.COOMING_SOON_STARTING_FLOW,
      ImagePath.COOMING_SOON_HOME_FLOW,
      ImagePath.COOMING_SOON_REVIEW_FLOW,
      ImagePath.COOMING_SOON_TYPOGRAPHY,
    ],
    portfolioDescription: StringConst.COOMING_SOON_DETAIL,
    isPublic: true,
    isOnPlayStore: true,
    technologyUsed: StringConst.FLUTTER,
    gitHubUrl: StringConst.COOMING_SOON_GITHUB_URL,
    playStoreUrl: StringConst.COOMING_SOON_PLAYSTORE_URL,
  );

  static ProjectItemData SpeechToText = ProjectItemData(
    title: StringConst.notesAppTitle,
    subtitle: StringConst.notesAppSubtitle,
    category: StringConst.notesAppCategory,
    primaryColor: AppColors.grey300,
    platform: StringConst.notesAppPlataform,
    image: ImagePath.speechToTextCover,
    coverUrl: ImagePath.speechToTextCover,
    navTitleColor: AppColors.grey300,
    navSelectedTitleColor: AppColors.coomingSoonSelectedNavTitle,
    appLogoColor: AppColors.grey300,
    projectAssets: [
      ImagePath.speechToTextAsset2,
      ImagePath.speechToTextAsset3,
      ImagePath.speechToTextAsset4,
      ImagePath.speechToTextAsset5,
      ImagePath.speechToTextAsset6,
      ImagePath.speechToTextAsset7,
      ImagePath.speechToTextAsset8,
    ],
    portfolioDescription: StringConst.notesAppDetail,
    isPublic: true,
    isOnPlayStore: false,
    technologyUsed: StringConst.FLUTTER,
    gitHubUrl: StringConst.notesAppGithubURL,
  );
}
