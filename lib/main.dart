import 'package:flutter/material.dart';

main(){
  runApp( const myApp());// Application

}
class myApp extends StatelessWidget{
  const myApp({super.key});

  @override
  Widget build(BuildContext context) {


   return MaterialApp(
        theme: ThemeData(primarySwatch: Colors.green),
        darkTheme: ThemeData(primarySwatch: Colors.amber),
        color:Colors.blue,
        debugShowCheckedModeBanner:false,
        home:const HomeActivity(),

   );
  }

}

class HomeActivity extends StatelessWidget{
  const HomeActivity({super.key});

  mySnacksbar(message, context ){
    return ScaffoldMessenger.of(context).showSnackBar( 
      SnackBar(content: Text(message))
    );
  }

  @override
  Widget build(BuildContext context) {
    final  ButtonStyle buttonStyle = OutlinedButton.styleFrom(
        padding: EdgeInsets.all(25),
      backgroundColor: Colors.green,
      foregroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10))
      )

    );
      
    

     return Scaffold(
       appBar:AppBar(

         title:Text("Cask Book"),
         titleSpacing: 10,
         toolbarHeight: 50,
         toolbarOpacity: 1,
         elevation: 0,
         backgroundColor: Colors.green,
         actions: [
           IconButton(onPressed: (){mySnacksbar( 'I am wallet ', context);}, icon:Icon(Icons.account_balance_wallet)),
           IconButton(onPressed: (){mySnacksbar('I am email', context);}, icon:Icon(Icons.email)),
           IconButton(onPressed: (){mySnacksbar('I am search', context);}, icon:Icon(Icons.search)),
           IconButton(onPressed: (){mySnacksbar('I am comment ', context);}, icon:Icon(Icons.comment)),
         ],

       ),
       floatingActionButton: FloatingActionButton(
         elevation: 10,
         child: Icon(Icons.add_call),
         backgroundColor: Colors.green,
         onPressed: (){
           mySnacksbar('I am a Floating action btn', context);

         },
       ),
       bottomNavigationBar: BottomNavigationBar(
           backgroundColor: Colors.green,
           type: BottomNavigationBarType.fixed,  // Add this line
         currentIndex: 0,

         items:const [
           BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
           BottomNavigationBarItem(icon: Icon(Icons.medical_services_outlined), label: "Lab Test"),
           BottomNavigationBarItem(icon: Icon(Icons.health_and_safety), label: "Beauty"),
           BottomNavigationBarItem(icon: Icon(Icons.medical_information_outlined), label: "HealthCare"),
           BottomNavigationBarItem(icon: Icon(Icons.person), label: "Account"),

         ],

         onTap: (int index){
           if(index==0){
             mySnacksbar('I am home ', context);
           }
           if(index==1){
             mySnacksbar('I am Lab test  ', context);
           }if(index==2){
             mySnacksbar('I am Beauty  ', context);
           }if(index==3){
             mySnacksbar('I am  Health Care ', context);
           }if(index==4){
             mySnacksbar('I am Profile ', context);
           }
         }
       ),
       endDrawer: Drawer(
        child: ListView(
          children:   [
            DrawerHeader(
                padding: EdgeInsets.zero,
                child:UserAccountsDrawerHeader(
                  decoration: BoxDecoration(color:Colors.white),
                  accountName: Text('Reaz Uddin ',style: TextStyle(color:Colors.black)),
                  accountEmail: Text('Reaz@gmail.com',style: TextStyle(color:Colors.black)),
                  currentAccountPicture: Image.network("https://w7.pngwing.com/pngs/350/365/png-transparent-bird-desktop-album-design-blue-marine-mammal-animals.png"),
                )),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap:  (){
                mySnacksbar("Home", context);

              },
            ),

            ListTile(
                leading: Icon(Icons.add_shopping_cart),
                title: Text('Cart'),
                onTap: (){
                  mySnacksbar('Cart', context);
                },

            ),
            ListTile(
                leading: Icon(Icons.balance),
                title: Text('Balance'),
              onTap: (){
                  mySnacksbar("Balance", context);
              },
            ),
            ListTile(
                leading: Icon(Icons.wallet),
                title: Text('Account'),
              onTap: (){
                  mySnacksbar("Wallet", context);

              },
            ),
            ListTile(
                leading: Icon(Icons.support),
                title: Text('Support'),
                onTap: (){
                  mySnacksbar("Care Support ", context);

                },
            ),
            ListTile(
                leading: Icon(Icons.location_city),
                title: Text('Addresss'),
                onTap: (){
                  mySnacksbar("Addresss", context);
                },
            )
          ],
        ),
      ),
       body: Row(
         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
         children: [
           TextButton(onPressed:  (){mySnacksbar("message", context);}, child: Text('Text Btn')),
           ElevatedButton(onPressed:  (){mySnacksbar("message", context);}, child: Text('Eleveted btn')),
           OutlinedButton(onPressed:  (){mySnacksbar("message", context);}, child: Text('Sign Up'),style: buttonStyle,),

         ],
       ),
     );// scaffold
  }
}