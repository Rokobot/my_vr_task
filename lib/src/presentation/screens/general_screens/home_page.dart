import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_app/src/constants/theme_constans.dart';
import 'package:task_app/src/logic/cubit/category_cubit/category_cubit.dart';
import 'package:task_app/src/presentation/screens/general_screens/profile_page.dart';
import 'package:task_app/src/presentation/widgets/product_list_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';



class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentPageIndex=0;

  @override
  Widget build(BuildContext context) {

    return  SafeArea(
      child: BlocBuilder<CategoryCubit, CategoryState>(
        builder: (context, state){
          if(state is CategoryInitial){
            return buildScaffold(context, state);
          }
          if(state is CategoryNewState){
            return buildScaffold(context, state);
          }
          return Container();
        },
      ),
    );
  }

  Scaffold buildScaffold(BuildContext context,  state) {
    return Scaffold(
              appBar: AppBar(
                actions: [
                  context.read<CategoryCubit>().showDropDown(context),
                ],
                backgroundColor: ThemeColorData().productCardColor,
                automaticallyImplyLeading: false,
                title: Text('🛍️TerndOL ', style: TextStyle(color: Colors.white),),
              ),
              body: currentPageIndex == 0 ?  ProductListWidget(selectedCategory: state.value!,) : ProfilePage(),
              bottomNavigationBar: BottomNavigationBar(
                selectedItemColor: ThemeColorData().scaffoldBackgrounColor,
                unselectedItemColor: Colors.grey,
                unselectedFontSize: 13,
                selectedFontSize: 16,
                showUnselectedLabels: false,
                currentIndex: currentPageIndex,
                onTap: (index){
                  setState(() {
                    currentPageIndex = index;
                  });
                },
                  backgroundColor: ThemeColorData().productCardColor,
                  items: [BottomNavigationBarItem(icon: Icon(Icons.store), label: '${AppLocalizations.of(context)!.store}'),BottomNavigationBarItem(icon: Icon(Icons.person),label: '${AppLocalizations.of(context)!.profile}')]),
          );
  }
}
