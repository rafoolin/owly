import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../common/widgets/app_padding.dart';
import '../../../common/widgets/buttons.dart';
import '../../../common/widgets/loading_skeleton.dart';
import '../../authentication/presentation/auth_providers.dart';
import 'edit_profile_view.dart';

class ProfileView extends ConsumerWidget {
  static const path = '/ProfileView';
  static const routeName = 'ProfileView';
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(currentUserProvider);
    final isLoading = user == null;

    if (isLoading) {
      return const _ProfileViewSkeleton();
    }

    return Scaffold(
      body: ListView(
        children: [
          AppPadding.top(flex: 2),
          CircleAvatar(
            radius: 60.0,
            foregroundImage: ExtendedNetworkImageProvider(
              user.avatarUrl!.toString(),
            ),
          ),
          AppPadding.vertical(),
          Center(child: Text(user.displayName)),
          AppPadding.verticalText(),
          Center(child: Text(user.email!)),
          AppPadding.vertical(),
          Center(
            child: RoundedButton(
              text: 'Edit Profile',
              onPressed: () => context.push(EditProfileView.fullPath),
            ),
          ),
          AppPadding.vertical(),
          const Divider(indent: 20.0, endIndent: 20.0, thickness: 2.0),
          // TODO::: Add actions!
          const ListTile(
            leading: Icon(FontAwesomeIcons.gear),
            title: Text('Settings'),
            trailing: Icon(FontAwesomeIcons.chevronRight),
          ),
          const ListTile(
            leading: Icon(FontAwesomeIcons.chartLine),
            title: Text('History'),
            trailing: Icon(FontAwesomeIcons.chevronRight),
          ),
          const ListTile(
            leading: Icon(FontAwesomeIcons.trophy),
            title: Text('Achievements'),
            trailing: Icon(FontAwesomeIcons.chevronRight),
          ),
          const Divider(indent: 20.0, endIndent: 20.0, thickness: 2.0),
          ListTile(
            leading: const Icon(FontAwesomeIcons.rightFromBracket),
            title: const Text('Log out'),
            onTap: () async {
              ref.read(signInStateNotifierProvider.notifier).signOut();
            },
          ),
        ],
      ),
    );
  }
}

// TODO:: Temporary skeleton
class _ProfileViewSkeleton extends StatelessWidget {
  const _ProfileViewSkeleton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: ListView(
        children: [
          AppPadding.top(flex: 2),
          Center(child: LoadingSkeleton.circle(60.0)),
          AppPadding.vertical(),
          Center(
            child: LoadingSkeleton.rectangle(
              height: 8.0,
              width: 150.0,
              radius: 4.0,
            ),
          ),
          AppPadding.verticalText(),
          Center(
            child: LoadingSkeleton.rectangle(
              height: 8.0,
              width: 90.0,
              radius: 4.0,
            ),
          ),
          AppPadding.vertical(),
          Center(
            child: LoadingSkeleton.rectangle(
              height: 48.0,
              width: 150.0,
              radius: 48.0,
            ),
          ),
          AppPadding.vertical(),
          const Divider(indent: 20.0, endIndent: 20.0, thickness: 2.0),
          LoadingSkeleton.rectangle(
            margin: const EdgeInsets.symmetric(horizontal: 10.0),
            height: 48.0,
            width: 150.0,
            radius: 10.0,
          ),
          AppPadding.verticalText(),
          LoadingSkeleton.rectangle(
            margin: const EdgeInsets.symmetric(horizontal: 10.0),
            height: 48.0,
            width: 150.0,
            radius: 10.0,
          ),
          AppPadding.verticalText(),
          LoadingSkeleton.rectangle(
            margin: const EdgeInsets.symmetric(horizontal: 10.0),
            height: 48.0,
            width: 150.0,
            radius: 10.0,
          ),
          const Divider(indent: 20.0, endIndent: 20.0, thickness: 2.0),
          LoadingSkeleton.rectangle(
            margin: const EdgeInsets.symmetric(horizontal: 10.0),
            height: 48.0,
            width: 150.0,
            radius: 10.0,
          ),
        ],
      ),
    );
  }
}
