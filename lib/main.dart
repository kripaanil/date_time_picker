import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flter Demout',
      
      home: Home(),
    );
  }
}
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}
 var time = TimeOfDay.now();
 var date =" ";

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      // backgroundColor: const Color.fromARGB(255, 156, 196, 228),
      
     
      body: SafeArea(
        child:Column(
         
          children: [
          const  Padding(
              padding:  EdgeInsets.only(top: 50),
              child:  Text("Pick Date And Time",style: TextStyle(
                fontSize: 25,
                color: Color.fromARGB(255, 3, 0, 0)
                
              ),),
            ),
        
            Padding(
              padding: const EdgeInsets.only(top: 100,bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  
                  IconButton(onPressed: ()async{
                    // ignore: no_leading_underscores_for_local_identifiers
                    final _showdate = await showDatePicker(
                      context: context,
                      initialDate:  DateTime.now(),
                      firstDate: DateTime.now().subtract(const Duration(days: 1000)),
                      lastDate: DateTime(3535));
                      setState(() {
                        date = DateFormat.yMMMMEEEEd().format(_showdate!);
                      });
                    
                    
                  },
                   icon: const Icon(Icons.calendar_month,
                   size: 35,
                   color: Color.fromARGB(255, 0, 0, 0),)),
                    
                   Text(date,
                   style: const TextStyle(
                    fontSize: 20,
            
                   ),)
                ],
              ),
            ),
        
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () async {
                    // ignore: no_leading_underscores_for_local_identifiers
                    final _showtime = await showTimePicker(
                      context: context, 
                      initialTime: TimeOfDay.now());
                      setState(() {
                        time = _showtime!;
                      });
        
        
        
        
        
                  }, 
                  icon: const Icon(Icons.alarm,
                  size: 35,)),
        
                   Text(time.format(context),
                   style: const TextStyle(
                    fontSize: 20
                   ),)
              ],
            ),
        
             
        
        
         
          
          ],
        ) ),
    );
  }
}






















