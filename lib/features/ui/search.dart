import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:n_m_c/core/constant/components/components.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarDefaultTheme(context: context
      ,title: '',

      ),
      body: Column(
        children: [
        // searchTextField(search: (value) => searchItem(value),),

        ],
      ),
    );
  }
}


