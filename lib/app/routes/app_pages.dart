import 'package:get/get.dart';


import '../modules/about_us/about_us.dart';
import '../modules/competitions/bindings/competition_bindings.dart';
import '../modules/competitions/views/competition_view.dart';
import '../modules/dashboard/bindings/dashboard_binding.dart';
import '../modules/dashboard/views/dashboard_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/leaderboard/bindings/leaderboard_binding.dart';
import '../modules/leaderboard/views/leaderboard_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/pair_page/bindings/pair_bindings.dart';
import '../modules/pair_page/views/pair_view.dart';
import '../modules/profile/bindings/profile_bindings.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/quizpage/bindings/quizpage_binding.dart';
import '../modules/quizpage/views/quizpage_view.dart';
import '../modules/registration/bindings/registration_binding.dart';
import '../modules/registration/views/registration_view.dart';
import '../modules/results_page/bindings/results_page_binding.dart';
import '../modules/results_page/views/results_page_view.dart';

part 'app_routes.dart';


class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.REGISTRATION,
      page: () => const RegistrationView(),
      binding: RegistrationBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () =>const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.DASHBOARD,
      page: () => const DashboardView(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: _Paths.QUIZPAGE,
      page: () => const QuizpageView(),
      binding: QuizpageBinding(),
    ),
    GetPage(
      name: _Paths.RESULTS_PAGE,
      page: () => const ResultsPageView(),
      binding: ResultsPageBinding(),
    ),
    GetPage(
        name: _Paths.COMPETITION,
        page: () => const CompetitionView(),
        binding: CompetitionBinding()
    ),
    GetPage(
        name: _Paths.PAIR,
        page: () => const PairView(),
        binding: PairBinding()
    ),
    GetPage(
        name: _Paths.LEADERBOARD,
        page: () => const LeaderBoardView(),
        binding: LeaderBoardBinding()
    ),
    GetPage(
        name: _Paths.PROFILE,
        page: () => const ProfileView(),
        binding: ProfileBinding()
    ),
  ];
}

