import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../app_flavor/presentation/app_flavor_providers.dart';
import '../../../../common/screens/in_progress_view.dart';
import '../../../authentication/presentation/auth_providers.dart';
import '../../../overview/daily/presentation/daily_overview.dart';
import '../../../profile/presentation/profile_view.dart';
import '../../../task_management/categories/presentation/categories_view.dart';

class HomeDrawer extends HookConsumerWidget {
  const HomeDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(currentUserProvider);
    final flavorConfig = ref.watch(flavorConfigProvider);

    if (user == null) {
      return const InProgressView();
    }

    return Drawer(
      child: ListView(
        children: [
          GestureDetector(
            onTap: () => context.push(ProfileView.path),
            child: UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.grey,
                child: Image(
                  fit: BoxFit.contain,
                  image: user.avatarUrl == null
                      ? ExtendedAssetImageProvider(flavorConfig.flavor.asset)
                      : ExtendedNetworkImageProvider(user.avatarUrl!.toString())
                          as ImageProvider<Object>,
                ),
              ),
              accountName: Text(user.displayName),
              accountEmail: Text(user.email!),
            ),
          ),
          ListTile(
            title: const Text('Overview'),
            onTap: () => context.push(DailyOverView.path),
          ),
          ListTile(
            title: const Text('Categories'),
            onTap: () => context.push(CategoriesView.path),
          ),
          const Divider(),
          const ListTile(title: Text('Settings')),
          AboutListTile(
            applicationIcon: ExtendedImage.asset(
              flavorConfig.flavor.asset,
              width: 64.0,
              height: 64.0,
            ),
            applicationName: 'Owly',
            applicationVersion: '1.0.0',
            aboutBoxChildren: const [
              Text(
                'This is a very simple and minimal to-do application '
                'its focus is on adding tasks and sub-tasks and plan to do them!',
                textAlign: TextAlign.justify,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
