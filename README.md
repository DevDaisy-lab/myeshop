# myeshop

The Flutter app, **myeshop**, an example of eshop. The app has four separate screens: Products Overview (**ProductsOverviewScreen**), Product Detail (**ProductDetailScreen**), Cart (**CartScreen**) and Order (**OrdersScreen**). Product Overview screen consist of **AppDrawer**, **Banner**, **SpecProductItem**, **Baged** and **ProductsGrid** widgets. Product Details screen reflects details of certain product. Cart screen consist of **OrderButton** and **CartItem**. Orders screen consist of **AppDrawer** and **OrderItem**.This example shows **provider** state managment approach and using **Firebase Realtime Database** for information of product saving and **Firebase Storage** for storing pictures of products.

This is **a widget tree** of the **myeshop** app:

![](https://github.com/CodingFlutter/myeshop/blob/master/assets/images/widget_treee.png)


# A Flutter app structure:

# lib/main.dart

In order to track states of the object, they need to be provided to widget further down the tree. Here a **MultiProvider** is used in order to provide three objects (in this case, **Products**, **Cart** and **Orders**) at once to widget further down the tree. It's done by using **ChangeNotifierProvider.value(value:** object name  **)**, in this case object instance already exist and it just needs to be exposed, that's why **.value** constructor of a **provider** is used here.

# lib/providers
This directory contains of three data models: **Products**, **Cart**, **Orders**, and an objects skeletons **Product**, **CartItem** and **OrderIt**. Above provided data models created with **ChangeNotifier** in order to notify widgets about changes.

# lib/screens
This directory contains of widgets: **ProductsOverviewScreen**, **ProductDetailScreen**,
**CartScreen**, **OrdersScreen**, **UserProductsScreen** and **EditProductScreen**.

# lib/widgets
This directory contains of widgets: **UserProductItem**, **CartItem** and **OrderItem** ,they are used to constract **ProductOverviewScreen**, **CartScreen** and **OrdersScreen**.

# IOS Platform
<p align="left">
<img src="https://github.com/CodingFlutter/myeshop/blob/master/assets/images/1ios.png" width="300" height="600"/> 
<img src="https://github.com/CodingFlutter/myeshop/blob/master/assets/images/2ios.png" width="300"height="600"/> 
<img src="https://github.com/CodingFlutter/myeshop/blob/master/assets/images/3ios.png" width="300" height="600"/>
<img src="https://github.com/CodingFlutter/myeshop/blob/master/assets/images/4ios.png" width="300" height="600"/>
<img src="https://github.com/CodingFlutter/myeshop/blob/master/assets/images/5ios.png" width="300" height="600"/>
<img src="https://github.com/CodingFlutter/myeshop/blob/master/assets/images/6ios.png" width="300" height="600"/>
<img src="https://github.com/CodingFlutter/myeshop/blob/master/assets/images/7ios.png" width="300" height="600"/>
<img src="https://github.com/CodingFlutter/myeshop/blob/master/assets/images/8ios.png" width="300" height="600"/>
<img src="https://github.com/CodingFlutter/myeshop/blob/master/assets/images/9ios.png" width="300" height="600"/>
</p>
