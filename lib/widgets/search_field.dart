import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//import 'package:provider/provider.dart';
import '../service/provider/search.dart';
import '../config/constant.dart';

class SearchField extends StatefulWidget {
  const SearchField({
    Key key,
  }) : super(key: key);

  @override
  SearchFieldState createState() => SearchFieldState();
}

class SearchFieldState extends State<SearchField> {
  TextEditingController controllerSearch = new TextEditingController();

  @override
  void initState() {
    super.initState();

    // Start listening to changes.
    // Comienza a escuchar los cambios
    //controllerSearch.addListener(_printLatestValue);

    controllerSearch.addListener(() {
      ///final text = controllerSearch.text.toLowerCase();
      final text = controllerSearch.text;
      controllerSearch.value = controllerSearch.value.copyWith(
        text: text,
        selection:
            TextSelection(baseOffset: text.length, extentOffset: text.length),
        composing: TextRange.empty,
      );
    });
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    controllerSearch.clear();
    controllerSearch.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final config = ConfigConstant(context);
    final providers = Provider.of<ProviderSearch>(context);

    controllerSearch.text = providers.search;

    return Container(
      width: config.mediaQueryData.size.width * 0.9,
      decoration: BoxDecoration(
        color: Color(0xFF979797).withOpacity(0.1),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          TextFormField(
            //initialValue: providers.search,
            controller: controllerSearch,

            onChanged: (value) => {
              setState(() {}),
              //print("SearchField ::" + value),
              providers.search = value
              //context.read<ProviderClient>().search = value
            },
            decoration: InputDecoration(
                //contentPadding: EdgeInsets.symmetric(vertical: 10),
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                hintText: "Search Clients",
                prefixIcon: Icon(Icons.search)),
          )
        ],
      ),
    );
  }
}
