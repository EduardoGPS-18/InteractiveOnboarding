const String _onboardingPath = 'assets/onboarding';

enum OnboardImages {
  peopleWalking(path: "$_onboardingPath/images/people_walking.png"),
  peopleOnCellPhone(path: "$_onboardingPath/images/person_on_cell_phone.png"),
  peoplesOnCellPhone(path: "$_onboardingPath/images/people_on_cell_phone.png");

  final String path;
  const OnboardImages({required this.path});
}

enum OnboardIcons {
  googleLogo(path: "$_onboardingPath/icons/google_logo.png");

  final String path;
  const OnboardIcons({required this.path});
}
