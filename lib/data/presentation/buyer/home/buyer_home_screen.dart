import 'package:canarry_app1/data/presentation/auth/login_screen.dart';
import 'package:canarry_app1/data/presentation/buyer/profile/bloc/profile_buyer_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BuyerHomeScreen extends StatefulWidget {
  const BuyerHomeScreen({super.key});

  @override
  State<BuyerHomeScreen> createState() => _BuyerHomeScreenState();
}

class _BuyerHomeScreenState extends State<BuyerHomeScreen> {
  @override
  void initState() {
    super.initState();
    context.read<ProfileBuyerBloc>().add(GetProfileBuyerEvent());
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(        
        title: const Text('Home Screen'),
        centerTitle: true,
        backgroundColor: Colors.white,
        
        actions: [
          IconButton(
            icon: const Icon(Icons.logout, color: Colors.black),
            //pakai loading
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return CupertinoAlertDialog(
                    title: const Text('Konfirmasi'),
                    content: const Text('Apakah anda yakin ingin keluar?'),
                    actions: [
                      CupertinoDialogAction(                        
                        child: const Text('Batal'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                       CupertinoDialogAction(                        
                        child: const Text('Keluar'),
                        onPressed: () {
                          Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(builder: (context) => const LoginScreen(),),
                            (route) => false,
                          );
                        },
                      ),                    
                    ],
                  );
                },
              );
            },
          ),
        ],
      ),

                
    );
  }
}
            