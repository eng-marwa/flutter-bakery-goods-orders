import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String? email = ModalRoute.of(context)!.settings.arguments as String?;
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(flex:3,
                    child: Text(
                  email != null ? 'Welcome Member' : 'Welcome Guest',
                  style: TextStyle(fontWeight: FontWeight.bold),
                )),
                Expanded(flex:1,child:TextButton(onPressed: (){}, child: Text('Log Out',textAlign: TextAlign.end,),

                ),)

              ],
            ),
          ),
          GridView.builder(
              shrinkWrap: true,
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemCount: 3,
              itemBuilder: (context, index) => Card(
                    child: Column(children: [
                      //  Image.network(''),
                      OutlinedButton(
                          onPressed: () {}, child: Text('Add To Cart'))
                    ]),
                  ))
        ]),
      )),
    );
  }
}
