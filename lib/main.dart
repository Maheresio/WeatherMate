import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'core/helpers/firebase_init.dart';
import 'core/helpers/styled_status_bar.dart';
import 'core/utils/app_router.dart';
import 'core/utils/service_locator.dart';
import 'features/auth/data/auth_repository_impl.dart';
import 'features/auth/presentation/controller/auth_cubit.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  styledStatusBar();

  await firebaseInit();
  setupServiceLocator();
  

  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: BlocProvider(
          create: (context) => AuthCubit(getIt<AuthRepositoryImpl>()),
          child: MaterialApp.router(
            locale: DevicePreview.locale(context),
            builder: DevicePreview.appBuilder,
            debugShowCheckedModeBanner: false,
            theme: ThemeData.light().copyWith(
              textTheme: GoogleFonts.poppinsTextTheme(),
            ),
            routerConfig: AppRouter.router,
          ),
        ),
      ),
    ),
  );
}
