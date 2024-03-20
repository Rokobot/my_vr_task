import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:task_app/src/constants/theme_constans.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  String value = 'All';
  CategoryCubit() : super(CategoryInitial(value: 'All'));

  Widget showDropDown(){
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
          items: [
            DropdownMenuItem(child: Text('jewelery'),value: 'jewelery',),
            DropdownMenuItem(child: Text('men\'s clothing'),value: 'men\'s clothing',),
            DropdownMenuItem(child: Text('women\'s clothing'),value: 'women\'s clothing',),
            DropdownMenuItem(child: Text('electronics'),value: 'electronics',),
            DropdownMenuItem(child: Text('All'),value: 'All',),
          ],
          onChanged: (newValue){
            value = newValue!;
            return emit(CategoryNewState(value: value));
          },
          value: value,
        ),
      ),
    );
  }
}
