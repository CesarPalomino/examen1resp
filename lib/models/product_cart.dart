import 'product_cup.dart';
import 'product_drinks.dart';
import 'product_grains.dart';

class ProductCart {
   String productTitle; // nombre del producto
   String productImage; // url de imagen del producto
   double productPrice; // precio del producto autocalculado
   int productAmount; // cantidad de producto por comprar
   Object proGen; 
   bool liked;
   bool remove;


    ProductCart.productCD(ProductDrinks productD){
      this.productTitle = productD.productTitle;
      this.productImage = productD.productImage;
      this.productPrice = productD.productPrice;
      this.productAmount = productD.productAmount;
      this.proGen = productD.productSize;
      this.liked = productD.liked;
      this.remove = false;
  }

    ProductCart.productCG(ProductGrains productG){
      this.productTitle = productG.productTitle;
      this.productImage = productG.productImage;
      this.productPrice = productG.productPrice;
      this.productAmount = productG.productAmount;
      this.proGen = productG.productWeight;
      this.liked = productG.liked;
      this.remove = false;
    }
    ProductCart.productCC(ProductCup productC){
      this.productTitle = productC.productTitle;
      this.productImage = productC.productImage;
      this.productPrice = productC.productPrice;
      this.productAmount = productC.productAmount;
      this.proGen = productC.productColor.toString();
      this.liked = productC.liked;
      this.remove = false;    
    }

  

}
