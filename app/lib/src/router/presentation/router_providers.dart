import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nhost_sdk/nhost_sdk.dart';

import '../../common/screens/error_view.dart';
import '../../common/screens/in_progress_view.dart';
import '../../features/add_task/presentation/add_task_view.dart';
import '../../features/authentication/presentation/auth_providers.dart';
import '../../features/authentication/presentation/forgot_password_view.dart';
import '../../features/authentication/presentation/sign_in_view.dart';
import '../../features/authentication/presentation/sign_up_with_email_view.dart';
import '../../features/categories/presentation/categories_view.dart';
import '../../features/edit_category/presentation/edit_category_view.dart';
import '../../features/home/presentation/home_view.dart';
import '../../features/profile/presentation/edit_profile_view.dart';
import '../../features/profile/presentation/profile_view.dart';
import '../../features/task_management/add_category/presentation/add_category_view.dart';
import '../../features/task_management/presentation/category_view.dart';
import '../../features/task_management/presentation/edit_task_view.dart';
import '../../features/task_management/presentation/task_view.dart';
import 'router_notifier.dart';

/// A provider for router notifier
final _routerNotifier = Provider<RouterNotifier>((ref) => RouterNotifier(ref));

final routerProvider = Provider<GoRouter>(
  (ref) {
    // Listenable for routes changes based on the auth changes.
    final notifier = ref.watch(_routerNotifier);

    final router = GoRouter(
      initialLocation: SignInView.path,
      refreshListenable: notifier,
      debugLogDiagnostics: kDebugMode,
      urlPathStrategy: UrlPathStrategy.path,
      routes: [
        /// Sign in view
        GoRoute(
          path: SignInView.path,
          builder: (BuildContext context, GoRouterState state) =>
              const SignInView(),
          routes: [
            /// Sign up with email and password
            GoRoute(
              path: SignUpWithEmailView.path,
              builder: (BuildContext context, GoRouterState state) =>
                  const SignUpWithEmailView(),
            ),

            /// Forgot password
            GoRoute(
              path: ForgotPasswordView.path,
              builder: (BuildContext context, GoRouterState state) =>
                  const ForgotPasswordView(),
            ),
          ],
        ),

        ///  Home View
        GoRoute(
          path: HomeView.path,
          builder: (BuildContext context, GoRouterState state) =>
              const HomeView(),
        ),

        /// Task view
        GoRoute(
          path: TaskView.path,
          builder: (BuildContext context, GoRouterState state) =>
              TaskView(taskId: state.params['id']!),
          routes: [
            /// Edit Task view
            GoRoute(
              path: EditTaskView.path,
              builder: (BuildContext context, GoRouterState state) =>
                  EditTaskView(taskId: state.params['id']!),
            ),
          ],
        ),

        ///  Profile View
        GoRoute(
          path: ProfileView.path,
          builder: (BuildContext context, GoRouterState state) =>
              const ProfileView(),
          routes: [
            ///  Edit Profile View
            GoRoute(
              path: EditProfileView.path,
              builder: (BuildContext context, GoRouterState state) =>
                  const EditProfileView(),
            ),
          ],
        ),

        /// Category view
        GoRoute(
          path: CategoryView.path,
          builder: (BuildContext context, GoRouterState state) =>
              CategoryView(id: state.params['id']!),
        ),

        /// Add Tasks view
        GoRoute(
          path: AddTaskView.path,
          builder: (BuildContext context, GoRouterState state) =>
              const AddTaskView(),
        ),

        GoRoute(
          path: AddTaskView.categoryPath,
          builder: (BuildContext context, GoRouterState state) =>
              AddTaskView(id: state.params['id']!),
        ),

        /// Add Category view
        GoRoute(
          path: AddCategoryView.path,
          builder: (BuildContext context, GoRouterState state) =>
              const AddCategoryView(),
        ),

        /// Categories view
        GoRoute(
          path: CategoriesView.path,
          builder: (BuildContext context, GoRouterState state) =>
              const CategoriesView(),
        ),

        /// Edit Category view
        GoRoute(
          path: EditCategoryView.path,
          builder: (BuildContext context, GoRouterState state) =>
              EditCategoryView(id: state.params['id']!),
        ),

        /// In progress view
        GoRoute(
          path: InProgressView.path,
          builder: (BuildContext context, GoRouterState state) =>
              const InProgressView(),
        ),
      ],
      // Error view
      errorBuilder: (BuildContext context, GoRouterState state) =>
          const ErrorView(),
      redirect: (state) {
        final authState = ref.read(authenticationStateProvider);
        // // User is in sign in view
        final signingIn = state.subloc.startsWith(SignInView.path);

        // Route name for home view
        const rootView = HomeView.path;
        // user is in progress view
        final inProgressView = state.location == InProgressView.path;

        switch (authState) {
          case AuthenticationState.signedIn:
            // Navigate to root view if the location is sign up/ sign in view
            if (signingIn || inProgressView) {
              return rootView;
            }
            return null;

          case AuthenticationState.signedOut:
            // Only change the location to sign in view if already is not in
            // login or sign up view.
            if (signingIn) {
              return null;
            }
            return SignInView.path;

          case AuthenticationState.inProgress:
            // If not already in progress view, change to its location.
            if (inProgressView) {
              return null;
            }
            return InProgressView.path;
          default:
            return null;
        }
      },
    );

    return router;
  },
);
