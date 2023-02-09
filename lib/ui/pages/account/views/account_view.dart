import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:garifie_client/core/providers/auth.dart';
import 'package:garifie_client/ui/pages/account/widgets/display_no_user.dart';
import 'package:garifie_client/ui/pages/account/widgets/display_user_info.dart';
import 'package:nb_utils/nb_utils.dart';

class AccountView extends ConsumerWidget {
  const AccountView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoggedIn = ref.watch(isUserLoggedInProvider);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text("My Account", style: boldTextStyle()),
      ),
      body: isLoggedIn ? const DisplayUserInfo() : const DisplayNoUser(),
    );
  }
}
