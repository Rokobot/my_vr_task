import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_app/src/constants/theme_constans.dart';
import 'package:task_app/src/data/model/products_model.dart';
import 'package:task_app/src/logic/cubit/category_cubit/category_cubit.dart';
import 'package:task_app/src/presentation/widgets/product_list_screen.dart';
import 'package:task_app/src/service/rest_service.dart';
import 'package:task_app/src/utils/responsive.dart';



class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: BlocBuilder<CategoryCubit, CategoryState>(
        builder: (context, state){
          if(state is CategoryInitial){
            return Scaffold(
                appBar: AppBar(
                  actions: [
                    context.read<CategoryCubit>().showDropDown(),
                  ],
                  backgroundColor: ThemeColorData().productCardColor,
                  automaticallyImplyLeading: false,
                  title: Text('🛍️TerndOL ', style: TextStyle(color: Colors.white),),
                ),
                body: ProductListWidget(selectedCategory: state.value!,)
            );
          }
          if(state is CategoryNewState){
            return Scaffold(
                appBar: AppBar(
                  actions: [
                    context.read<CategoryCubit>().showDropDown(),
                  ],
                  backgroundColor: ThemeColorData().productCardColor,
                  automaticallyImplyLeading: false,
                  title: Text('🛍️TerndOL ', style: TextStyle(color: Colors.white),),
                ),
                body: ProductListWidget(selectedCategory: state.value!,)
            );
          }
          return Container();
        },
      ),
    );
  }
}
