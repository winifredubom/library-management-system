
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:library_system/presentation/Home/widgets/book_dialog.dart';
import 'package:library_system/presentation/Home/widgets/home_listile.dart';
import 'package:library_system/presentation/Home/widgets/user_dialog.dart';
import 'package:library_system/presentation/Home/widgets/sidebar.dart';
import 'package:library_system/provider/sidebarXprovider.dart';
import 'package:library_system/utils/screen_size.dart';


//change to consumerstatefulwidget
class Home extends ConsumerWidget {
  const Home({super.key, });

  @override

  
  Widget build(BuildContext context, WidgetRef ref) {
  
  final controller = ref.watch(sidebarXControllerProvider);
  final screenUtils = ScreenUtils(context);

  
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Hub Library',
        ),
        ),
        drawer:  SideBarXExample(controller: controller),
        body:  Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
             Expanded(
              child:  Column(
                children: [
                        Expanded(
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                              child: SizedBox(
                                width: screenUtils.screenWidth *0.9,
                                height: screenUtils.screenHeight * 0.2,
                                child:
                                 Card(
                                  elevation: 10,
                                  child: Padding(
                                    padding: const  EdgeInsets.all(16.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                         Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                             const Text('Book Inventory', style: TextStyle(fontSize: 20)),
                                             ElevatedButton.icon(
                                              style: ElevatedButton.styleFrom(backgroundColor: Colors.blueAccent),
                                               onPressed: (){
                                                 showDialog(context: context, 
                                            builder: (BuildContext context){
                                              return const MyFormDialog();
                                            }); }, 
                                              icon:  const  Icon(Icons.add, color: Colors.white,),
                                              label: const Text('Add ',
                                              style: TextStyle(
                                                color: Colors.white
                                              ),),
                                              ),
                                          ],
                                        ),
                                        const SizedBox(height: 10),
                                    
                                          const HomeListTile(
                                            leading: Icon(Icons.library_books),
                                          title: Text('Catalog rare editions'),
                                          trailing: Icon(Icons.arrow_forward_ios),),
                                         const HomeListTile(
                                           leading: Icon(Icons.book),
                                          title: Text('Request book reviews'),
                                          trailing: Icon(Icons.arrow_forward_ios),),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        Expanded(
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                              child: SizedBox(
                                width: screenUtils.screenWidth * 0.9,
                                child: Card(
                                  elevation: 10,
                                  child: Padding(
                                    padding:  const EdgeInsets.all(16.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                             const Text('User Activity', style: TextStyle(fontSize: 20)),
                                             ElevatedButton.icon(
                                             style: ElevatedButton.styleFrom(backgroundColor: Colors.blueAccent),
                                               onPressed: (){
                                                 showDialog(context: context, 
                                            builder: (BuildContext context){
                                              return const UserDialog();
                                            }); }, 
                                              icon:  const  Icon(Icons.add, color: Colors.white,),
                                              label: const Text('Add',
                                              style: TextStyle(
                                                color: Colors.white
                                              ),),
                                              ),
                                          ],
                                        ),
                                        
                                       const  ListTile(
                                          leading: Icon(Icons.show_chart),
                                          title: Text('Track borrowing trends'),
                                          trailing: Icon(Icons.arrow_forward_ios),
                                        ),
                                       const  ListTile(
                                          leading: Icon(Icons.person),
                                          title: Text('Manage user profiles'),
                                          trailing: Icon(Icons.arrow_forward_ios),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                ],
              ),
            ),
          ],
        ),
    );
  }
}


