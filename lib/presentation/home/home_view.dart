import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hnflutter_challenge/domain/entity/Bakery.dart';
import 'package:hnflutter_challenge/presentation/cart/cart_viewmodel/cart_bloc.dart';
import 'package:hnflutter_challenge/presentation/home/home_viewmodel/home_bloc.dart';
import 'package:hnflutter_challenge/presentation/home/home_viewmodel/home_event.dart';
import 'package:hnflutter_challenge/presentation/home/home_viewmodel/home_state.dart';
import 'package:hnflutter_challenge/presentation/home/home_viewmodel/view_bakeries_status.dart';
import 'package:hnflutter_challenge/presentation/home/profile_viewmodel/profile_bloc.dart';
import 'package:hnflutter_challenge/presentation/home/profile_viewmodel/profile_event.dart';
import 'package:hnflutter_challenge/presentation/home/profile_viewmodel/profile_state.dart';
import 'package:hnflutter_challenge/presentation/home/profile_viewmodel/view_profile_status.dart'
    as profile;

import '../../resources/route_manager.dart';
import '../widgets/show_snackbar.dart';

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String? email = ModalRoute.of(context)!.settings.arguments as String?;
    print(email);
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(children: [
          _greetingTextView(email),
          // Divider(),
          Visibility(visible: email==null,child:Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(onPressed: () {
                Navigator.pushNamed(context, Routes.cartRoute);
              }, icon: Icon(Icons.shopping_cart)),
              IconButton(onPressed: () {
                Navigator.pushNamed(context, Routes.ordersRoute);
              }, icon: Icon(Icons.shopping_bag)),
            ],
          )),
          Divider(),
          const Text('Filter By Type:'),
          Row(
            children: [
              Expanded(
                  child: ElevatedButton(
                      onPressed: () {
                        BlocProvider.of<ViewBakeriesBloc>(context,
                                listen: false)
                            .add(const FetchBakeries());
                      },
                      child: const Text('All'))),
              const SizedBox(
                width: 8,
              ),
              Expanded(
                  child: ElevatedButton(
                      onPressed: () {
                        BlocProvider.of<ViewBakeriesBloc>(context,
                                listen: false)
                            .add(const FilterByType('cake'));
                      },
                      child: const Text('Cake'))),
              const SizedBox(
                width: 8,
              ),
              Expanded(
                  child: ElevatedButton(
                      onPressed: () {
                        BlocProvider.of<ViewBakeriesBloc>(context,
                                listen: false)
                            .add(const FilterByType('bread'));
                      },
                      child: const Text('Bread'))),
              const SizedBox(
                width: 8,
              ),
              Expanded(
                  child: ElevatedButton(
                      onPressed: () {
                        BlocProvider.of<ViewBakeriesBloc>(context,
                                listen: false)
                            .add(const FilterByType('pie'));
                      },
                      child: const Text('Pie'))),
            ],
          ),
          ElevatedButton(
              onPressed: () {
                BlocProvider.of<ViewBakeriesBloc>(context, listen: false)
                    .add(const FilterByProximity());
              },
              child: const Text('Filter By Proximity')),
          _bakeriesGridView(email)
        ]),
      )),
    );
  }

  Widget _greetingTextView(String? email) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
              flex: 3,
              child: Text(
                email != null ? 'Welcome Member' : 'Welcome Guest',
                style: const TextStyle(fontWeight: FontWeight.bold),
              )),
          Expanded(
              flex: 1,
              child: Visibility(
                visible: email != null,
                child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Log Out',
                    textAlign: TextAlign.end,
                  ),
                ),
              ))
        ],
      ),
    );
  }

  _bakeriesGridView(String? email) {
    return BlocListener<ViewProfileBloc, ViewProfileState>(
        listener: (context, state) {
      final status = state.viewProfileStatus;
      if (status is profile.Failed) {
        ShowSnackBar(context, status.failureMessage);
      } else if (status is profile.Success) {
        Navigator.pushNamed(context, Routes.detailsRoute,
            arguments: [state.bakery, email]);
      }
    }, child: BlocBuilder<ViewBakeriesBloc, ViewBakeriesState>(
            builder: (context, state) {
      final viewBakeriesStatus = state.viewBakeriesStatus;
      if (viewBakeriesStatus is Failed) {
        return Center(child: Text(viewBakeriesStatus.failureMessage));
      } else if (viewBakeriesStatus is Success) {
        List<Bakery> bakeries = state.bakeries!;
        return GridView.builder(
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
            itemCount: bakeries.length,
            itemBuilder: (context, index) => InkWell(
                  onTap: () =>
                      BlocProvider.of<ViewProfileBloc>(context, listen: false)
                          .add(ViewProfile(bakeries[index].id)),
                  child: Card(
                      child: Column(children: [
                    Image.network('${bakeries[index].logo}', width: 120),
                    Text('${bakeries[index].name}'),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.star,
                          color: Colors.yellow,
                        ),
                        Text('${bakeries[index].rate}'),
                      ],
                    )
                  ])),
                ));
      } else {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
    }));
  }
}
