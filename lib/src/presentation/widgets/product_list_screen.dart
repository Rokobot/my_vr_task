import 'package:flutter/material.dart';
import 'package:task_app/src/presentation/widgets/product_item_widget.dart';
import 'package:task_app/src/utils/toast.dart';

import '../../constants/theme_constans.dart';
import '../../data/model/products_model.dart';
import '../../service/rest_service.dart';
import '../../utils/responsive.dart';



class ProductListWidget extends StatefulWidget {
  String selectedCategory;
  ProductListWidget({super.key, required this.selectedCategory});

  @override
  State<ProductListWidget> createState() => _ProductListWidgetState();
}

class _ProductListWidgetState extends State<ProductListWidget> {
  ///Propertys
  List<ProductsModel>?  productsList = [];
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadMoreData();
  }

  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Center(
        child: productsList == null ? Center(child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Wait please ...', style: TextStyle(color: ThemeColorData().productCardColor, fontSize: 18),),
            SizedBox(height: 20,),
            CircularProgressIndicator(color: ThemeColorData().productCardColor,),
          ],
        )) : widget.selectedCategory != 'All' ? ListView.builder(
          physics: AlwaysScrollableScrollPhysics(),
          controller: scrollController,
            itemCount: productsList?.length ,
            itemBuilder: (context, index){
              return productsList![index].productsCategory == widget.selectedCategory ? ProductItemWidget(index: index, productsList: productsList!): SizedBox();
            }) : ListView.builder(
            physics: AlwaysScrollableScrollPhysics(),
          controller: scrollController,
            itemCount: productsList?.length ,
            itemBuilder: (context, index){
              return ProductItemWidget(index: index, productsList: productsList!);
            })
    );
  }

  void loadMoreData(){
    ///-----------------------
    DioService().getAllProducts(productsList!.length).then((value){
      setState(() {
        productsList!.addAll(value);
      });
    });
    ///----------------------
    scrollController.addListener(() {
      if(scrollController.position.pixels == scrollController.position.maxScrollExtent){
        DioService().getAllProducts(productsList!.length).then((value){
          setState(() {
            productsList!.addAll(value);
            ShowToast().showToast('👀new data!');
            print('max');
          });
        });
      }

    });
    ///---------------------
  }
}



