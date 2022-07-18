import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../common/widgets/app_padding.dart';
import '../../../common/widgets/buttons.dart';
import '../../../common/widgets/custom_text_field.dart';
import '../../../common/widgets/loading_skeleton.dart';
import '../../authentication/presentation/auth_providers.dart';
import 'profile_view.dart';

// TODO:: #11
class EditProfileView extends HookConsumerWidget {
  static const path = 'EditProfileView';
  static const fullPath = '${ProfileView.path}/EditProfileView';
  static const routeName = 'EditProfileView';
  const EditProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(currentUserProvider);
    final nameCtrl = useTextEditingController();
    final emailCtrl = useTextEditingController();
    final isLoading = user == null;

    if (isLoading) {
      return const _EditProfileViewSkeleton();
    }

    useEffect(() {
      nameCtrl.text = user.displayName;
      emailCtrl.text = user.email!;
      return;
    }, [user]);

    return Scaffold(
      body: ListView(
        children: [
          AppPadding.top(flex: 2),
          GestureDetector(
            child: CircleAvatar(
              radius: 60.0,
              foregroundImage: ExtendedNetworkImageProvider(
                user.avatarUrl!.toString(),
              ),
              child: const Icon(FontAwesomeIcons.camera),
            ),
            onTap: () {},
          ),
          AppPadding.vertical(flex: 3),
          // Name
          ListTile(
            title: const Text('Name'),
            subtitle: CustomTextField.form(controller: nameCtrl),
          ),
          AppPadding.vertical(),
          // Email
          ListTile(
            title: const Text('Email'),
            subtitle: CustomTextField.form(controller: emailCtrl),
          ),
          AppPadding.vertical(),
          AppPadding.vertical(),
          const Center(child: RoundedButton(text: 'Save changes')),
        ],
      ),
    );
  }
}

class _EditProfileViewSkeleton extends StatelessWidget {
  const _EditProfileViewSkeleton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Edit Profile')),
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
