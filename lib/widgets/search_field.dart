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
  _SearchFieldState createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  @override
  Widget build(BuildContext context) {
    final config = ConfigConstant(context);
    final provider = ProviderClient();
    var providers = Provider.of<ProviderClient>(context).getSearch;

    //var provider = Provider.of<ProviderClient>(context);

    return Container(
      width: config.mediaQueryData.size.width * 0.9,
      decoration: BoxDecoration(
        color: Color(0xFF979797).withOpacity(0.1),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          TextField(
            onChanged: (value) => {
              setState(() {}),
              print("SearchField ::" + value),
              provider.search = value
            },
            decoration: InputDecoration(
                //contentPadding: EdgeInsets.symmetric(vertical: 10),
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                hintText: "Search product",
                prefixIcon: Icon(Icons.search)),
          ),
          Text(Provider.of<ProviderClient>(context).getSearch)
        ],
      ),
    );
  }
}
