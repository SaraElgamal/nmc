import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:n_m_c/core/constant/components/components.dart';
import 'package:n_m_c/features/categories/types_of_cat/cat_items/all_cat_items_logic/cubit.dart';
import 'package:n_m_c/features/categories/types_of_cat/cat_items/all_cat_items_logic/state.dart';

import '../../../core/constant/const/const.dart';
import '../../../core/data_base/filtration_model.dart';
import '../../../generated/l10n.dart';
import '../another_filt.dart';



List<Governorate> governorates = [];

class EnteredTest extends StatefulWidget {
  final String? title ;
  EnteredTest({required this.title});
  @override
  _EnteredTestState createState() => _EnteredTestState();
}

String? selectedGovern = '';

var x;
class _EnteredTestState extends State<EnteredTest> {

  final GlobalKey<_EnteredTestState> _key = GlobalKey<_EnteredTestState>();
  Widget searchBarField({

    required BuildContext context,
  }) =>  TextFormField(


    decoration: InputDecoration(
      filled: true,

      fillColor: fillRectangular,
      labelText: 'يمكنك البحث من هنا',

      labelStyle: GoogleFonts.tajawal(

        fontSize: 16.sp,

        color: const Color(0xff606F7B),
      ),

      enabledBorder: const OutlineInputBorder(borderSide: BorderSide(color: fillRectangular)),
      border: OutlineInputBorder(
          borderSide: const BorderSide(

              color: fillRectangular),

          borderRadius: BorderRadius.circular(8)),

      contentPadding: EdgeInsets.symmetric(horizontal: 26.w),

      prefixIconConstraints: const BoxConstraints(
        minHeight: 24,
        minWidth: 24,
      ),

      suffixIconConstraints: const BoxConstraints(
        minHeight: 24,
        minWidth: 24,
      ),
      suffixIcon: Padding(
        padding:  EdgeInsets.only(left: 16.0.w),
        child: InkWell(
            onTap: () {
              showFilterPopupMenu(

                context,


              );


            },
            child: SvgPicture.asset('assets/images/lets-icons_filter.svg')),
      ),
      prefixIcon: Padding(
        padding:  EdgeInsets.only(right: 16.0.w, left: 16.0.w),
        child: SvgPicture.asset(


            'assets/images/material-symbols-light_search.svg'),
      ), ///temporary

    ), );
  showFilterPopupMenu(BuildContext context,

      ) async {

    String? selectedValue = await showMenu<String>(
      constraints: const BoxConstraints(

        minWidth: double.infinity,
      ),

      context: context,
      position: const RelativeRect.fromLTRB(300,150,100,100 ),
      items: [

        PopupMenuItem<String>(
          value: 'value',
          child: InkWell(
            onTap:

                ()
            {
              showGovernorateDialog(context);
            },
            child:  Row(
              children: [
                Text('${S.of(context).third_label}'),
                const    Spacer(),
                const  Icon(Icons.arrow_drop_down_rounded,color: Colors.grey,),
              ],
            ),
          ),
        ),


        PopupMenuItem<String>(
          value: 'hello',
          child: InkWell(
            onTap:
                ()
            {
              showRegionDialog(context);
            },
            child:  Row(
              children: [
                Text(S.of(context).four_label),
                const Spacer(),
                const   Icon(Icons.arrow_drop_down_rounded,color: Colors.grey,),
              ],
            ),
          ),
        ),

        PopupMenuItem<String>(
          value: 'hello',
          child: BlocConsumer<ClinicCubit,ClinicStates>(
            listener: (context, state) {

            },
            builder : (context, state) =>  InkWell(
              onTap:

                  ()
              {

                showSpecDialog(context);
              },
              child:  Row(
                children: [
                  Text(widget.title.toString()),
                  const Spacer(),
                  const Icon(Icons.arrow_drop_down_rounded,color: Colors.grey,),
                ],
              ),
            ),
          ),
        ),
      ],
    );


  }
  void showGovernorateDialog(BuildContext context) async {
    selectedGovern =  await showDialog<String>(

      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          shape: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
          backgroundColor: Colors.purple.shade50,
          title:  Text( S.of(context).third_label  ,style: GoogleFonts.tajawal(color: primaryColor),),
          children: <Widget>[
            BlocConsumer<ClinicCubit,ClinicStates>(
              listener: (context, state) {

              },
              builder: (context, state) =>  Container(
                height: 500,
                width: 600,
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: governorates.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(governorates[index].name!),
                      onTap: () {
                        setState(() {
                          selectedGovernorate = governorates[index].id!;
                          selectedGovernorateName = governorates[index].name!;

                          selectedRegion = '';
                          selectedCategory = '';
                        });
                        Navigator.pop(context); // Close the dialog if needed
                      },
                    );
                  },
                ),
              ),
            ),
          ],
        );
      },
    );



  }
  void showRegionDialog(BuildContext context) async {
    await showDialog<String>(

      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          shape: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
          backgroundColor: Colors.purple.shade50,
          title:  Text(S.of(context).four_label,style: GoogleFonts.tajawal(color: primaryColor),),
          children: <Widget>[
            BlocConsumer<ClinicCubit,ClinicStates>(
              listener: (context, state) {

              },
              builder: (context, state) =>  Container(
                height: 500,
                width: 600,
                child: selectedGovernorate.isNotEmpty ?
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: getRegionsForGovernorate(selectedGovernorate).length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(
                          getRegionsForGovernorate(selectedGovernorate)[index]),
                      onTap: () {
                        setState(() {
                          selectedRegion =
                          getRegionsForGovernorate(selectedGovernorate)[index];
                          ClinicCubit.get(context).getCategoryByRegionAndGov(selectedGovernorateName, selectedRegion);
                          log('lllll$selectedGovernorateName' );
                          log('oooooo$selectedRegion ' );
                          selectedCategory = '';


                        });
                        Navigator.pop(context);
                      },
                    );
                  },
                )
                    :  ListTile(title: Text(S.of(context).button_first_ch),),
              ),
            ),
          ],
        );
      },
    );


  }
  String? selectedSpec = '';
  void showSpecDialog(BuildContext context) async {
    selectedSpec = await showDialog<String>(

      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(

          shape: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
          backgroundColor: Colors.purple.shade50,
          title:  Text(S.of(context).second_label,style: GoogleFonts.tajawal(color: primaryColor),),
          children: <Widget>[
            BlocConsumer<ClinicCubit,ClinicStates>(
              listener: (context, state) {

              },
              builder: (context, state) => Container(
                height: 500,
                width: 600,
                child: ClinicCubit.get(context).allofFilter.contains(widget.title) ? ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: 1,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(
                          widget.title.toString()),
                      onTap: () {
                        ClinicCubit.get(context).getGridViewByRegionAndGov(

                            governateSelection:
                            selectedGovernorateName,
                            regionSelection: selectedRegion,
                            categoery: widget.title.toString());
                        //x  =  ClinicCubit.get(context).allofFilter[index].toString();
                        Navigator.pop(context);
                        ClinicCubit.get(context).allofFilter = [] ;

                      },

                    );

                  },
                )

                    :  ListTile(title: Text(S.of(context).nothing),),
              ),
            ),
          ],
        );
      },
    );
  }


  List<Regions> regions = [];
  String threegovern = '';
  String selectedGovernorate = '';
  String selectedGovernorateName = '';
  String selectedRegion = '';
  String selectedCategory = '';

  @override
  void initState() {
    super.initState();
    loadData();

  }

  Future<void> loadData() async {
    String jsonString = await DefaultAssetBundle.of(context)
        .loadString('assets/DataSearch.json');
    Map<String, dynamic> jsonData = json.decode(jsonString);
    setState(() {
      governorates = (jsonData['Governorate'] as List)
          .map((governorate) => Governorate.fromJson(governorate))
          .toList();
      regions = (jsonData['Regions'] as List)
          .map((region) => Regions.fromJson(region))
          .toList();
    });
  }

  List<String> getGovernorateNames() {
    return governorates.map((governorate) => governorate.name!).toList();
  }

  List<String> getRegionsForGovernorate(String governorate) {
    return regions
        .where((region) => region.governorateId == governorate)
        .map((region) => region.cityNameAr!)
        .toList();
  }
  @override
  void dispose() {
    ClinicCubit.get(context).clearData();
    // TODO: implement dispose
    super.dispose();
  }
  @override
  void deactivate() {
    ClinicCubit.get(context).clearData();
    // TODO: implement deactivate
    super.deactivate();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBarDefaultTheme(context: context,title: ''),
      body:
      Padding(
        padding:  EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [

            // searchBarField(
            //     context: context,
            // ),

            InkWell(
              onTap: () async
              {
                showFilterPopupMenu(

                  context,


                );
                ClinicCubit.get(context).clearData();
              },
              child: Container(
                decoration: BoxDecoration(color: fillRectangular,
                  borderRadius: BorderRadius.circular(8),
                ),

                height: 45.h,

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [
                    SvgPicture.asset('assets/images/lets-icons_filter.svg'),
                    SizedBox(width: 30.w,),
                    Text(S.of(context).filter_text,style: GoogleFonts.tajawal(fontSize: 16.sp,
                        color: mainLineColor),),
                  ], ),
              ),
            ),
            BlocConsumer<ClinicCubit,ClinicStates>(
              listener: (context, state) {

              },
              builder: (context, state) =>  Expanded(
                child: ListView.builder(

                  //shrinkWrap: true,
                  itemCount: ClinicCubit.get(context).matchAll.length,
                  itemBuilder: (context, index) {
                    return
                      InkWell(
                        onTap: ()
                        {

                          navigateTo(context, Filtration(
                            title: widget.title,
                            index: ClinicCubit.get(context).idMatchAll[index]!,
                          ));
                        },
                        child: Container(

                          decoration: BoxDecoration(
                            color: primaryColor,
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          margin: EdgeInsets.symmetric(vertical: 10.0.h),
                          child: ListTile(

                            shape: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            title: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                children: [
                                  Text(
                                    ClinicCubit.get(context).matchAll[index].toString(),style: GoogleFonts.tajawal(color: Colors.white,fontWeight: FontWeight.bold),),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
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