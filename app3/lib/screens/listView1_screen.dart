import 'package:flutter/material.dart';

class Listview1Screen extends StatelessWidget {
  final options = const [
    'Megaman 3',
    'Metal Gear',
    'Power Ranger',
    'Super Smash'
  ];

  const Listview1Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('First Listview'),
          // backgroundColor: Colors.indigo,
          // elevation: 0,
        ),
        // Is better work with the listView Builder or separated, because 
        // we can set the number of objetcs to be shown
        // Using just list view will show all the options, if have a million data, will try to show all
        body: ListView.separated(
          // itemBuilder: (context, index) => Text(options[index]), 
          itemBuilder: (context, index) => ListTile(
            title: Text(options[index]),
            trailing: const Icon(Icons.arrow_forward_ios_outlined, color: Colors.indigo,),
            onTap: () => print(options[index]),
            // onLongPress: () => print(options[index]),
           
            ), 
          separatorBuilder: (_, __) => const Divider(height: 3, color: Color.fromARGB(255, 155, 143, 109), thickness: 2,),
          itemCount: options.length
          
          // reverse: true,
          ),
          
        );
  }
}
