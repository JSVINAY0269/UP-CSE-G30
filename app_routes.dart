import 'package:flutter/material.dart';
import 'package:site_manager/features/feature_auth/presentation/login_view/views/login_view.dart';
import 'package:site_manager/features/feature_auth/presentation/main_view/views/main_view.dart';
import 'package:site_manager/features/feature_auth/presentation/signup_view/views/signup_view.dart';
import 'package:site_manager/features/feature_team/presentation/add_task/views/select_member_view.dart';
import 'package:site_manager/features/feature_team/presentation/add_team/views/create_team_form_view.dart';
import 'package:site_manager/features/feature_team/presentation/add_team/views/team_location_view.dart';
import 'package:site_manager/features/feature_team/presentation/team_info_view/team_info_view.dart';
import 'package:site_manager/features/feature_team/presentation/add_task/views/add_task_view.dart';
import 'package:site_manager/features/feature_team/presentation/team_info_view/views/task_progress_pie_chart.dart';
import 'package:site_manager/features/feature_team/presentation/team_list_view/team_list_view.dart';

class AppRoutes {
  static String mainRoute = "/";
  static String loginRoute = "/login";
  static String signupRoute = "/signup";
  static String teamListRoute = "/teams";
  static String teamFormRoute = "/team/form";
  static String teamInfoRoute = "/team/info";
  static String addTaskRoute = "/task/create";
  static String selectMembersRoute = "/members/select";
  static String taskProgressChartRoute = "/task/progress";
  static String teamLocationRoute = "/team/location";

  static final Map<String, Widget Function(BuildContext context)> routes = {
    mainRoute: (context) => const MainView(),
    loginRoute: (context) => const LoginView(),
    signupRoute: (context) => const SignupView(),
    teamListRoute: (context) => const TeamListView(),
    teamFormRoute: (context) => CreateTeamFormView(),
    teamInfoRoute: (context) => const TeamInfoView(),
    addTaskRoute: (context) => AddTaskView(),
    selectMembersRoute: (context) => SelectMembersView(),
    taskProgressChartRoute: (context) => TaskProgressPieChart(),
    teamLocationRoute: (context) => TeamLocationView()
  };
}
