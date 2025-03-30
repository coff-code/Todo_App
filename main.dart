import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(myapp());
}
class myapp extends StatelessWidget {
  const myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: todoApp(),
    );
  }
}
class todoApp extends StatefulWidget {
  const todoApp({super.key});

  @override
  State<todoApp> createState() => _todoAppState();
}

class _todoAppState extends State<todoApp> {
  
  bool onTap=false;
  Color backgroundcolor = Color(0xFF25356D);
  Color frountgroundcolor = Color(0xFF000C38);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: Stack(
          children: [
      
          //back container
      
            Container(
            padding: EdgeInsets.symmetric(horizontal: 25,vertical: MediaQuery.of(context).size.height*0.13),
              width: double.infinity,
          color: Color(0xFF000C38),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(3),
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  gradient: LinearGradient(
                    begin: Alignment.center,
                    end: Alignment(-10,10),
                    stops: [0.0,0.0,0.0,0],
                    colors: [

                  Color(0xFFCC00CA),
                  Color(0xFFCC00CA),
                     backgroundcolor,
                    backgroundcolor,
                  
                  
                ])),
                child: CircleAvatar(
                  radius: 50,
                  backgroundColor: frountgroundcolor,
                  child: CircleAvatar(
                    radius: 42,
                    backgroundColor: frountgroundcolor,
                    //backgroundImage: AssetImage("assets/images/mypic.jpg",),
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Text("Muhammad",style: TextStyle(color: Colors.white,fontSize: 23),),
              Text("Safwan",style: TextStyle(color: Colors.white,fontSize: 23),),
              ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: 0,),
                leading: Icon(Icons.bookmark_border,color: backgroundcolor,size: 27,),
                title: Text('Templets',style: TextStyle(color: Colors.white70),),
              ),
                 ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: 0,),
                leading: Icon(Icons.grid_view,color: backgroundcolor),
                title: Text('Categories',style: TextStyle(color: Colors.white70),),
              ),
                 ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: 0,),
               leading: Icon(Icons.access_time,color: backgroundcolor),
                title: Text('Analytics',style: TextStyle(color: Colors.white70),),
              ),
              SizedBox(height: 20,),
              Icon(Icons.line_axis,size: MediaQuery.of(context).size.height*0.2,color: Color(0xFFCC00CA),),
              Text("Good",style: TextStyle(color: backgroundcolor,fontSize: 15),),
              Text("Consistancy",style: TextStyle(color: Colors.white,fontSize: 20),),

            ],
          ),
            ),
      
          //front container
      
          Align(
            alignment: Alignment(8, 0),
            child: AnimatedContainer(
                width: onTap?MediaQuery.of(context).size.width*0.87:MediaQuery.of(context).size.width,
                height: onTap?800:MediaQuery.of(context).size.height,
      
            
              duration: Duration(seconds: 1),
              child:  Container(
                decoration: BoxDecoration(
                color: backgroundcolor,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Stack(
                  children: [
      
                  //alldetails contaier
      
                    Container(
                      child: ListView(
                        shrinkWrap: true,
                        children: [
                                
                        //icons
                                
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                                
                        //drawer icon
                           
                           IconButton(
                            padding: EdgeInsets.only(left: 20),
                            onPressed: (){
                              setState(() {
                                onTap=!onTap;
                              });
                            }, icon: Icon(Icons.menu,color: Colors.blue.shade100,)),
                          
                         //other icons
                                
                        Container(
                          padding: EdgeInsets.only(right: 20),
                          child: Row(children: [IconButton(onPressed: (){}, icon: Icon(CupertinoIcons.search,color: Colors.blue.shade100,)),
                        IconButton(onPressed: (){}, icon: Icon(CupertinoIcons.bell,color: Colors.blue.shade100,))],),)
                                
                          ],),
                                
                          SizedBox(height: 20,),
                            
                          //nameText
                            
                           Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: Text("What's upp, Safwan!",style: TextStyle(color: Colors.white,fontSize: 30),),
                              ),
                            
                          //categoriestext
                                          
                              Padding(
                                padding: const EdgeInsets.only(left: 25,top: 40),
                                          
                                child: Text(
                                  "CATEGORIES",style: TextStyle(color: Colors.blue.shade100,fontSize: 15) ,),
                              ),
                            
                          //categoriesGrid
                                          
                              SizedBox(height: 200,
                                child: GridView.builder(
                                  padding: EdgeInsets.all(20),
                                  shrinkWrap: false,
                                  itemCount: categorieslists.length,
                                  scrollDirection: Axis.horizontal,
                                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                    childAspectRatio: 1/1.5,
                                    mainAxisSpacing: 10,
                                    crossAxisCount: 1), itemBuilder: (context, index) {
                                  return Card(
                                    elevation: 8,
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                    color: frountgroundcolor,
                                    child: Padding(
                                      padding: const EdgeInsets.all(20),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment. spaceBetween,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                        Text(categorieslists[index].task,style: TextStyle(color: Colors.blue.shade100,fontSize: 13),),
                                        Text(categorieslists[index].name,style: TextStyle(color: Colors.white,fontSize: 25),),
                                        Transform.scale(
                                          scale: 1.4,
                                          child: SliderTheme(
                                            data: SliderThemeData(
                                              trackHeight: 1,thumbShape: RoundSliderThumbShape(enabledThumbRadius: 0)),
                                            child: Slider(
                                              activeColor: categorieslists[index].color,
                                              value:categorieslists[index].value, onChanged: (value) {
                                              
                                            },),
                                          ),
                                        )
                                      
                                      ],),
                                    ),
                                  );
                                },),
                              ),
                            
                          //Text
                            
                          Padding(
                                padding: const EdgeInsets.only(left: 25,top: 10),
                                          
                                child: Text(
                                  "TODAY'S TASKS",style: TextStyle(color: Colors.blue.shade100,fontSize: 15) ,),
                              ),
                            
                         //listview
                            
                          fillupsLists.isEmpty
                                  ? Padding(
                                    padding: const EdgeInsets.only(top: 150),
                                    child: Center(
                                        child: Text(
                                          "Empty Tasks",
                                          style: TextStyle(
                                              color: frountgroundcolor,
                                              fontSize: 40,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                  )
                                  : ListView.builder(
                                    
                                    physics: NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                      itemCount: fillupsLists.length,
                                      padding:  EdgeInsets.only(
                                       
                                        top: 10,
                                      ),
                                      itemBuilder: (context, index) {
                                        return Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 3),
                                          child: Card(
                                            elevation: 4,
                                            color: frountgroundcolor,
                                            child: ListTile(
                                                contentPadding: const EdgeInsets.all(10),
                                                shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(20)),
                                                leading: Transform.scale(
                                                  scale: 1.3,
                                                  child: Transform.scale(
                                                    scale: 1,
                                                    child: Checkbox(
                                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                                      splashRadius: 0,
                                                      checkColor: Colors.white,
                                                      fillColor: 
                                                      fillupsLists[index].checkboxvalue?
                                                      WidgetStatePropertyAll(Color(0xFF25356D)):
                                                      WidgetStatePropertyAll(Color(0xFF000C38)),
                                                      side:  BorderSide(
                                                        color: Color(0xFF25356D),
                                                       width: 2),
                                                      value: fillupsLists[index].checkboxvalue,
                                                      onChanged: (value) {
                                                        setState(() {
                                                          fillupsLists[index].checkboxvalue =
                                                              !fillupsLists[index].checkboxvalue;
                                                        });
                                                      },
                                                    ),
                                                  ),
                                                ),
                                                tileColor: frountgroundcolor,
                                                title: fillupsLists[index].checkboxvalue
                                                    ? Text(
                                                        fillupsLists[index].title,
                                                        style: const TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 20,
                                                          decoration: TextDecoration.lineThrough,
                                                          decorationThickness: 2,
                                                          decorationColor: Colors.white,
                                                        ),
                                                      )
                                                    : Text(
                                                        fillupsLists[index].title,
                                                        style: const TextStyle(
                                                            color: Colors.white, fontSize: 20),
                                                      ),
                                                trailing: GestureDetector(
                                                  onTap: () {
                                                    setState(() {
                                                      fillupsLists.removeAt(index);
                                                    });
                                                  },
                                                  child: Container(
                                                    margin: const EdgeInsets.only(right: 10),
                                                    height: 40,
                                                    width: 40,
                                                    decoration: const BoxDecoration(
                                                      
                                                        borderRadius:
                                                            BorderRadius.all(Radius.circular(0))),
                                                    child: const Icon(
                                                      Icons.delete,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                )),
                                          ),
                                        );
                                      },
                                    ),
                                    SizedBox(height: 60,)
                      
                        ],
                      ),
                    ),
      
                  //bottom text container
      
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: onTap?
                    Container(height: 0,):
                    
                    Container(
                      decoration: BoxDecoration(
                color: backgroundcolor,
                        
                        ),
                padding: const EdgeInsets.only(left: 10,right: 10,bottom: 10),
                height: 80,
                child: Row(
                  children: [
                    Expanded(
        
                      //TextField
        
                      child: TextField(
                        
                        style: TextStyle(
                            color: frountgroundcolor,
                            decorationColor: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 17),
                        controller: titlecontroller,
                        cursorColor: backgroundcolor,
                        decoration: InputDecoration(
                            contentPadding: const EdgeInsets.all(15),
                            hintText: "Add a new task",
                            hintStyle:
                                TextStyle(color: backgroundcolor, fontSize: 17),
                            fillColor: Colors.white,
                            filled: true,
                            border: const OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)))),
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
        
                    //Floating action Button
        
                    Transform.scale(
                      scale: 1,
                      child: FloatingActionButton(
                          backgroundColor: Colors.white,
                          onPressed: () {
                            String titlename = titlecontroller.text.trim();
                            if (titlename.isNotEmpty) {
                              setState(() {
                                fillupsLists.add(fillups(false, titlename));
                                titlecontroller.text = "";
                              });
                            }
                          },
                          child: Icon(
                            Icons.add,
                            size: 30,
                            color: backgroundcolor,
                          )),
                    )
                  ],
                ),
              ),
                  )
                  ],
                ),
              ),
            ),
          )
          ],
        ),
      ),
    );
  }
}

//class

class fillups {
  bool checkboxvalue = false;
  String title;
  fillups(this.checkboxvalue, this.title);
}
  List<fillups> fillupsLists = [];
  TextEditingController titlecontroller = TextEditingController();

  //categories class

  class categoriesdetails{
    String task;
    String name;
    var color;
    var value;
    categoriesdetails(this.task,this.name,this.color,this.value);
  }

 List categorieslists=[
  categoriesdetails("20 tasks", "Business",Color(0xFFCC00CA) , 0.7),
  categoriesdetails("15 tasks", "Personal",Colors.blue.shade900 , 0.5),
  categoriesdetails("30 tasks", "Plan 2",Colors.purple , 0.3)


 ];
