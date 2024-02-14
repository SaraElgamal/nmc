import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:n_m_c/features/ui/test.dart';

import '../../core/constant/const/const.dart';
import '../categories/categories_logic/cubit.dart';

class Filtration extends StatefulWidget {
  const Filtration({Key? key}) : super(key: key);

  @override
  State<Filtration> createState() => _FiltrationState();
}

class _FiltrationState extends State<Filtration> {
  String? selectedGovernorate = '';
  String currentGov = '';
   showGovernorateDialog(BuildContext context) async {
     selectedGovernorate =  await showDialog<String>(

      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          shape: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
          backgroundColor: Colors.purple.shade50,
          title:  Text( 'اختر المحافظة'  ,style: GoogleFonts.tajawal(color: primaryColor),),
          children: <Widget>[
            Container(
              height: 500,
              width: 600,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: CategoriesCubit.get(context).nameOnly.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(CategoriesCubit.get(context).nameOnly[index],

                    ),
                    onTap: () {
                      setState(() {
                        currentGov = CategoriesCubit.get(context).nameOnly[index];
                      });
                      Navigator.pop(context,CategoriesCubit.get(context).nameOnly[index]);
                    },
                  );
                },
              ),
            ),
          ],
        );
      },
    );


  }

   showFilterPopupMenu(BuildContext context) async {

    String? selectedValue = await showMenu<String>(
      constraints: BoxConstraints(

        minWidth: double.infinity,
      ),

      context: context,
      position: const RelativeRect.fromLTRB(300,150,100,100 ),
      items: [

        PopupMenuItem<String>(
          value: 'hello',
          child: InkWell(
            onTap: ()
            {
              showGovernorateDialog(context);
            },
            child:  Row(
              children: [
                Text( currentGov != '' ? currentGov : 'اختر المحافظة'),
                Spacer(),
                Icon(Icons.arrow_drop_down_rounded,color: Colors.grey,),
              ],
            ),
          ),
        ),


        PopupMenuItem<String>(
          value: 'hello',
          child: InkWell(
            onTap: ()
            {
            //  showRegionDialog(context);
            },
            child: const Row(
              children: [
                Text('اختر المنطقة'),
                Spacer(),
                Icon(Icons.arrow_drop_down_rounded,color: Colors.grey,),
              ],
            ),
          ),
        ),

        PopupMenuItem<String>(
          value: 'hello',
          child: InkWell(
            onTap: ()
            {
              showSpecDialog(context);
            },
            child: const Row(
              children: [
                Text('اختر التخصص'),
                Spacer(),
                Icon(Icons.arrow_drop_down_rounded,color: Colors.grey,),
              ],
            ),
          ),
        ),
      ],
    );


  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Item Grid'),
        actions: [
          InkWell(
              onTap: ()
              {


                showFilterPopupMenu(context);
              },
              child: SvgPicture.asset('assets/images/lets-icons_filter.svg')),

        ],
      ),
      // body: GridView.builder(
      //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      //     crossAxisCount: 2,
      //     crossAxisSpacing: 8.0,
      //     mainAxisSpacing: 8.0,
      //   ),
      //   itemCount: displayedItems.length,
      //   itemBuilder: (context, index) {
      //     return Container(
      //       color: Colors.blue,
      //       child: Center(
      //         child: Text(
      //           displayedItems[index].title,
      //           style: TextStyle(color: Colors.white),
      //         ),
      //       ),
      //     );
      //   },
      // ),
    );
  }
}






//
// String? selectedRegion = '';
// void showRegionDialog(BuildContext context) async {
//   selectedRegion = await showDialog<String>(
//
//     context: context,
//     builder: (BuildContext context) {
//       return SimpleDialog(
//         shape: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
//         backgroundColor: Colors.purple.shade50,
//         title:  Text('اختر المنطقة',style: GoogleFonts.tajawal(color: primaryColor),),
//         children: <Widget>[
//           Container(
//             height: 500,
//             width: 600,
//             child: ListView.builder(
//               physics: const BouncingScrollPhysics(),
//               itemCount: CategoriesCubit.get(context).region!.length,
//               itemBuilder: (context, index) {
//                 return ListTile(
//                   title: Text(CategoriesCubit.get(context).region![index]),
//                   onTap: () {
//                     Navigator.pop(context,CategoriesCubit.get(context).region![index]);
//                   },
//                 );
//               },
//             ),
//           ),
//         ],
//       );
//     },
//   );
//
//   if (selectedRegion != null) {
//     print('Selected منطقة: $selectedRegion');
//     // Do something with the selected governorate
//   }
// }


String? selectedSpec = '';
void showSpecDialog(BuildContext context) async {
  selectedSpec = await showDialog<String>(

    context: context,
    builder: (BuildContext context) {
      return SimpleDialog(
        shape: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
        backgroundColor: Colors.purple.shade50,
        title:  Text('اختر التخصص',style: GoogleFonts.tajawal(color: primaryColor),),
        children: <Widget>[
          // Container(
          //   height: 500,
          //   width: 600,
          //   child: ListView.builder(
          //     physics: const BouncingScrollPhysics(),
          //     itemCount: medicalServices.length,
          //     itemBuilder: (context, index) {
          //       return ListTile(
          //         title: Text(medicalServices[index]),
          //         onTap: () {
          //           Navigator.pop(context, medicalServices[index]);
          //         },
          //       );
          //     },
          //   ),
          // ),
        ],
      );
    },
  );

  if (selectedSpec != null) {
    print(': اختر التخصص: $selectedSpec');
    // Do something with the selected governorate
  }
}