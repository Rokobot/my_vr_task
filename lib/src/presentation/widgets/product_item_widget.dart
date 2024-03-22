import 'package:flutter/material.dart';

import '../../constants/theme_constans.dart';
import '../../data/model/products_model.dart';
import '../../utils/responsive.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';



class ProductItemWidget extends StatelessWidget {
  int? index;
  List<ProductsModel> productsList;
  ProductItemWidget({super.key, required this.index, required this.productsList});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Responsive().height(context, 0.45),
      width: Responsive().width(context, 0.8),
      child: Card(
        color: ThemeColorData().productCardColor,
        child: Center(child: Column(

          children: [
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(margin: EdgeInsets.only(top: 5, bottom: 5,), decoration: BoxDecoration(borderRadius: BorderRadius.only(topRight: Radius.circular(10), bottomRight: Radius.circular(10)), color: Colors.deepOrange.withOpacity(0.8)), child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text('${AppLocalizations.of(context)!.price}: \$${productsList[index!].productsPrice}',style: const TextStyle(color: Colors.white,),textAlign: TextAlign.center,maxLines: 1,overflow: TextOverflow.ellipsis,),
                )),
                Container( margin: EdgeInsets.only(top: 5, bottom: 5,), decoration: BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(10), bottomLeft: Radius.circular(10)),color: Colors.green.withOpacity(0.8)), child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text('${AppLocalizations.of(context)!.category} : ${productsList[index!].productsCategory}',style: const TextStyle(color: Colors.white,),textAlign: TextAlign.center,maxLines: 1,overflow: TextOverflow.ellipsis,),
                )),
              ],
            ),

            Image.network(productsList[index!].productsImage!, width: Responsive().width(context, 0.9),height:Responsive().height(context, 0.2) ,fit: BoxFit.cover, ),
            Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.white12), margin: EdgeInsets.all(5), child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text(productsList[index!].productsTitle!,style: const TextStyle(color: Colors.white),textAlign: TextAlign.center,maxLines: 1,overflow: TextOverflow.ellipsis,),
            )),
            Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.white12), margin: EdgeInsets.all(5), child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text(productsList[index!].productsDescription!,style: const TextStyle(color: Colors.white),textAlign: TextAlign.center,maxLines: 1,overflow: TextOverflow.ellipsis,),
            )),
            Row(

              children: [
                Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.white12), margin: EdgeInsets.all(5), child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text('${AppLocalizations.of(context)!.rate}: ${productsList[index!].ratingModel!.rate}',style: const TextStyle(color: Colors.white),textAlign: TextAlign.center,maxLines: 1,overflow: TextOverflow.ellipsis,),
                )),
                Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.white12), margin: EdgeInsets.all(5), child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text('${AppLocalizations.of(context)!.count}: ${productsList[index!].ratingModel!.count}',style: const TextStyle(color: Colors.white),textAlign: TextAlign.center,maxLines: 1,overflow: TextOverflow.ellipsis,),
                )),
                Spacer(),
                Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.white12), margin: EdgeInsets.all(5), child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text('🛒',style: const TextStyle(color: Colors.white),textAlign: TextAlign.center,maxLines: 1,overflow: TextOverflow.ellipsis,),
                )),
              ],
            )
          ],
        )),
      ),
    );
  }
}
