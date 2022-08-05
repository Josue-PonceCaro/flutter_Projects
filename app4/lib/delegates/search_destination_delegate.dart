import 'package:app4/models/models.dart';
import 'package:app4/themes/themes.dart';
import 'package:flutter/material.dart';

class SearchDestinationDelegate extends SearchDelegate<SearchResult> {

  SearchDestinationDelegate():super(searchFieldLabel: 'Buscar ...');
  @override
  List<Widget>? buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [
      IconButton(
        onPressed: () {
          query = "";
        },
         icon: const Icon(Icons.clear),
         )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // TODO: implement buildLeading
   return IconButton(onPressed: (){
    final result = SearchResult(cancel: true);
    close(context, result);
    },
     icon: Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    return const Text('Results');
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    return ListView(
      children: [
        ListTile(
          leading: const Icon(Icons.location_on_outlined, color: AppTheme.black,),
          title: const Text('Colocar la ubicacion manualmente',),
          onTap: () {
            final result = SearchResult(cancel: false, manual: true);
            close(context, result);
            //TODO: RETURN SOMETHING
          },
        ),
      ]
    );
  }

}