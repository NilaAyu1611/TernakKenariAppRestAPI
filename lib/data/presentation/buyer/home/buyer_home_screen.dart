import 'package:canarry_app1/core/components/spaces.dart';
import 'package:canarry_app1/data/presentation/auth/login_screen.dart';
import 'package:canarry_app1/data/presentation/bloc/get_all_burung_tersedia/get_burung_tersedia_bloc.dart';
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
      body: RefreshIndicator(
        onRefresh: () async {
          //refresh data burung tersedia
          context.read<GetBurungTersediaBloc>().add(GetAllBurungTersediaEvent(),
          );
        },
        child: Column(          
          children: [
            const SpaceHeight(10),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                "Daftar Burung Tersedia",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            const SpaceHeight(10),
            //search bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Cari burung...",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),                    
                  ),
                  prefixIcon: const Icon(Icons.search),
                ),
                onChanged: (value) {
                  //implemnetasi search functionality if needed
                },
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: BlocBuilder<GetBurungTersediaBloc, GetBurungTersediaState>(
                  builder: (context, state) {
                    if (state is GetBurungTersediaLoading) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    if (state is GetBurungTersediaError) {
                      return Center(child: Text("Terjadi kesalahan: ${state.message}"));
                    }

                    if (state is GetBurungTersediaLoaded) {
                      final List<DataBurungTersedia> burungList = state.burungTersedia.data;

                      if (burungList.isEmpty) {
                        return const Center(child: Text("Tidak ada burung tersedia."));
                      }                      
                    }                    
                    },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
                                                  
                                  

            



           