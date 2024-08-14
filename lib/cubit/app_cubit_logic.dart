import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelapp/cubit/app_cubit.dart';
import 'package:travelapp/cubit/app_state.dart';
import 'package:travelapp/pages/details.dart';
import 'package:travelapp/pages/nav_pages/main.dart';
import 'package:travelapp/pages/welcomepage.dart';
import 'package:travelapp/services/connectivity_service.dart';

class AppCubitLogics extends StatefulWidget {
  const AppCubitLogics({super.key});

  @override
  State<AppCubitLogics> createState() => _AppCubitLogicsState();
}

class _AppCubitLogicsState extends State<AppCubitLogics> {
  // late ConnectivityService connectivityService;

  // @override
  // void initState() {
  //   super.initState();
  //   connectivityService = ConnectivityService();
  // }

  // @override
  // void dispose() {
  //   connectivityService.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    // return StreamBuilder<ConnectivityResult>(
    //   stream: connectivityService.connectionStatus,
    //   builder: (context, snapshot) {
    //     if (snapshot.connectionState == ConnectionState.active) {
    //       final result = snapshot.data;
    //       if (result == ConnectivityResult.none) {
    //         WidgetsBinding.instance.addPostFrameCallback((_) {
    //           _showNoInternetDialog(context);
    //         });
    //       } else {
    //         Navigator.of(context, rootNavigator: true)
    //             .pop(); // Close dialog when internet is back
    //       }
    //     }

        return Scaffold(
          body: BlocBuilder<AppCubits, CubitStates>(
            builder: (context, state) {
              if (state is WelcomeState) {
                return const WelcomePage();
              }
              if (state is SuccesState) {
                return const homepage();
              }
              if (state is DetailsState) {
                return const detailsPage();
              }
              if (state is LoadingState) {
                return Center(
                  child: CircularProgressIndicator(
                    color: Colors.blue[500],
                  ),
                );
              } else {
                return Container();
              }
            },
          ),
        );
    //   },
    // );
  }
    void _showNoInternetDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('No Internet Connection'),
          content: const Text('Please check your internet connection and try again.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
      barrierDismissible: false,
    );
  }
}
