// import 'package:flutter/material.dart';
// import 'package:search_widget/search_widget.dart';
//
// class Search extends StatefulWidget {
//   const Search({Key? key}) : super(key: key);
//
//   @override
//   _SearchState createState() => _SearchState();
// }
//
// class _SearchState extends State<Search> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SearchWidget(
//         dataList: [],
//         hideSearchBoxWhenItemSelected: false,
//         listContainerHeight: MediaQuery
//             .of(context)
//             .size
//             .height / 4,
//         queryBuilder: (String query, List<dynamic> list) {
//           return list.where((Leaderboa element) => element.);
//         },
//       ),
//       // SearchWidget<LeaderBoard>(
//       //   dataList: list,
//       //   hideSearchBoxWhenItemSelected: false,
//       //   listContainerHeight: MediaQuery.of(context).size.height / 4,
//       //   queryBuilder: (String query, List<LeaderBoard> list) {
//       //     return list
//       //         .where((LeaderBoard item) =>
//       //             item.username.toLowerCase().contains(query.toLowerCase()))
//       //         .toList();
//       //   },
//       //   popupListItemBuilder: (LeaderBoard item) {
//       //     return PopupListItemWidget(item);
//       //   },
//       //   selectedItemBuilder:
//       //       (LeaderBoard selectedItem, VoidCallback deleteSelectedItem) {
//       //     return SelectedItemWidget(selectedItem, deleteSelectedItem);
//       //   },
//       //   // widget customization
//       //   noItemsFoundWidget: NoItemsFound(),
//       //   textFieldBuilder:
//       //       (TextEditingController controller, FocusNode focusNode) {
//       //     return MyTextField(controller, focusNode);
//       //   },
//       // ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
//
// class Search extends StatefulWidget {
//   @override
//   _SearchState createState() => _SearchState();
// }
//
// class _SearchState extends State<Search> {
//   String? _result;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Search')),
//       body: Center(
//         child: Column(
//           children: <Widget>[
//             Text(_result ?? '', style: TextStyle(fontSize: 18)),
//             RaisedButton(
//               onPressed: () async {
//                 var result = await showSearch<String>(
//                   context: context,
//                   delegate: CustomDelegate(),
//                 );
//                 setState(() => _result = result);
//               },
//               child: Text('Search'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class CustomDelegate<T> extends SearchDelegate<T> {
//   List<String> data = nouns.take(100).toList();
//
//   @override
//   List<Widget> buildActions(BuildContext context) => [IconButton(icon: Icon(Icons.clear), onPressed: () => query = '')];
//
//   @override
//   Widget buildLeading(BuildContext context) => IconButton(icon: Icon(Icons.chevron_left), onPressed: () => close(context, null));
//
//   @override
//   Widget buildResults(BuildContext context) => Container();
//
//   @override
//   Widget buildSuggestions(BuildContext context) {
//     List listToShow;
//     if (query.isNotEmpty) listToShow = data.where((e) => e.contains(query) && e.startsWith(query)).toList();
//     else listToShow = data;
//
//     return ListView.builder(
//       itemCount: listToShow.length,
//       itemBuilder: (_, i) {
//         return ListTile(
//           title: Text(listToShow[i]),
//           onTap: () => close(context, listToShow[i]),
//         );
//       },
//     );
//   }
// }
