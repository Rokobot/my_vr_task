import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:task_app/src/constants/theme_constans.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  String value = 'All';
  CategoryCubit() : super(CategoryInitial(value: 'All'));

  Widget showDropDown(BuildContext context){
    List<String> downList =['jewelery','men\'s clothing','women\'s clothing', 'electronics', 'All'];
    List<String> selectedList =['💎','👦️','👧', '⚡', '😎'];
    return Container(

      decoration: BoxDecoration(
          color: ThemeColorData().scaffoldBackgrounColor,
          borderRadius: BorderRadius.circular(100)
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: DropdownButton(
          dropdownColor: ThemeColorData().scaffoldBackgrounColor,
          borderRadius: BorderRadius.circular(20),

          elevation: 100,
          underline: SizedBox(),
          items: downList.map((item) =>DropdownMenuItem( child: Container(constraints: BoxConstraints(minWidth: 200, maxWidth: 200),child: Text(item, style: TextStyle(color: Colors.white),)),value: item,),
          ).toList(),
          onChanged: (newValue){
            value = newValue!;
            return emit(CategoryNewState(value: value));
          },
          value: value,

          selectedItemBuilder: (value)=> selectedList.map((item) => DropdownMenuItem(child: Text('${AppLocalizations.of(context)!.category} ${item}',style: TextStyle(color: Colors.white,fontSize: 14),))).toList()

        ),
      ),
    );
  }
}
