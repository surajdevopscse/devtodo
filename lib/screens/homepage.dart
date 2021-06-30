import 'package:devtodo/screens/newchecklist.dart';
import 'package:devtodo/screens/newnote.dart';
import 'package:devtodo/screens/newtask.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      home: homePage(),
    );
  }
}

class homePage extends StatefulWidget {
  @override
  _homePageState createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  var monthName = [
    'JAN',
    'FEB',
    'MAR',
    'APR',
    'MAY',
    'JUN',
    'JULY',
    'AUG',
    'SEP',
    'OCT',
    'NOV',
    'DEC'
  ];
  DateTime? _selectedDay;
  String filterType = 'today';
  String taskPop = 'close';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppBar(
                backgroundColor: Colors.redAccent,
                elevation: 0,
                title: Text(
                  'Work List',
                  style: TextStyle(fontSize: 30),
                ),
                actions: [
                  IconButton(
                    icon: Icon(
                      Icons.short_text,
                      color: Colors.white,
                      size: 30,
                    ),
                    onPressed: () {},
                  )
                ],
              ),
              Container(
                height: 70,
                color: Colors.redAccent,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        InkWell(
                          onTap: () {
                            changeFilter('today');
                          },
                          child: Text(
                            'Today',
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                        ),
                        Container(
                          height: 4,
                          width: 120,
                          color: (filterType == 'today')
                              ? Colors.white
                              : Colors.transparent,
                        )
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        InkWell(
                          onTap: () {
                            changeFilter('monthly');
                          },
                          child: Text(
                            'Monthly',
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                        ),
                        Container(
                          height: 4,
                          width: 120,
                          color: (filterType == 'monthly')
                              ? Colors.white
                              : Colors.transparent,
                        )
                      ],
                    ),
                  ],
                ),
              ),
              (filterType == 'monthly')
                  ? TableCalendar(
                      firstDay: DateTime.utc(2010, 10, 16),
                      lastDay: DateTime.utc(2030, 3, 14),
                      focusedDay: _focusedDay,
                      calendarFormat: _calendarFormat,
                      selectedDayPredicate: (day) {
                        // Use `selectedDayPredicate` to determine which day is currently selected.
                        // If this returns true, then `day` will be marked as selected.

                        // Using `isSameDay` is recommended to disregard
                        // the time-part of compared DateTime objects.
                        return isSameDay(_selectedDay, day);
                      },
                      onDaySelected: (selectedDay, focusedDay) {
                        if (!isSameDay(_selectedDay, selectedDay)) {
                          // Call `setState()` when updating the selected day
                          setState(() {
                            _selectedDay = selectedDay;
                            _focusedDay = focusedDay;
                          });
                        }
                      },
                      onFormatChanged: (format) {
                        if (_calendarFormat != format) {
                          // Call `setState()` when updating calendar format
                          setState(() {
                            _calendarFormat = format;
                          });
                        }
                      },
                      onPageChanged: (focusedDay) {
                        // No need to call `setState()` here
                        _focusedDay = focusedDay;
                      },
                    )
                  : Container(),
              Expanded(
                child: SingleChildScrollView(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        children: [
                          Text(
                            'Today ${monthName[_focusedDay.month - 1]}, ${_focusedDay.day}/${_focusedDay.year}',
                            style: TextStyle(fontSize: 18, color: Colors.grey),
                          )
                        ],
                        crossAxisAlignment: CrossAxisAlignment.start,
                      ),
                    ),
                    taskWidget(Colors.blue, "Meeting with Someone", "1:00 AM"),
                    taskWidget(
                        Colors.yellow, "Meeting with Someone", "12:00 AM"),
                    taskWidget(Colors.green, "Meeting with Someone", "8:00 AM"),
                  ],
                )),
              ),
              Container(
                height: 110,
                child: Stack(
                  children: [
                    Positioned(
                      bottom: 0,
                      child: Container(
                        color: Colors.red,
                        height: 90,
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.all(20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              child: Column(
                                children: [
                                  Icon(
                                    Icons.check_circle,
                                    color: Colors.white,
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    'My Task',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 15),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              child: Column(
                                children: [
                                  Icon(
                                    Icons.menu,
                                    color: Colors.white,
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    'Menu',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 15),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              width: 80,
                            ),
                            Container(
                              child: Column(
                                children: [
                                  Icon(
                                    Icons.content_paste,
                                    color: Colors.white,
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    'Quick',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 15),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              child: Column(
                                children: [
                                  Icon(
                                    Icons.account_circle,
                                    color: Colors.white,
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    'Profile',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 15),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 25,
                      left: 0,
                      right: 0,
                      child: InkWell(
                        onTap: openTaskPop,
                        child: Container(
                          height: 80,
                          width: 80,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topRight,
                              end: Alignment.bottomLeft,
                              colors: [Color(0xfff96060), Colors.black],
                            ),
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Text(
                              '+',
                              style: TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
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
          Container(
            child: (taskPop == 'open')
                ? Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.black.withOpacity(0.3),
                    child: Center(
                      child: InkWell(
                        onTap: closeTaskPop,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Colors.white,
                          ),
                          height: MediaQuery.of(context).size.height * 0.3,
                          width: MediaQuery.of(context).size.width * 0.7,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              SizedBox(
                                height: 1,
                              ),
                              InkWell(
                                onTap: openNewTask,
                                child: Container(
                                  child: Text('Add Task',
                                      style: TextStyle(fontSize: 18)),
                                ),
                              ),
                              Container(
                                height: 1,
                                margin: EdgeInsets.symmetric(horizontal: 30),
                                color: Colors.black.withOpacity(0.2),
                              ),
                              InkWell(
                                onTap: openNewNote,
                                child: Container(
                                  child: Text('Add Quick Note',
                                      style: TextStyle(fontSize: 18)),
                                ),
                              ),
                              Container(
                                height: 1,
                                margin: EdgeInsets.symmetric(horizontal: 30),
                                color: Colors.black.withOpacity(0.2),
                              ),
                              InkWell(
                                onTap: openNewCheckList,
                                child: Container(
                                  child: Text('Add Cheklist',
                                      style: TextStyle(fontSize: 18)),
                                ),
                              ),
                              SizedBox(
                                height: 1,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                : Container(),
          ),
        ],
      ),
    );
  }

  changeFilter(String filter) {
    setState(() {
      filterType = filter;
    });
  }

  void openTaskPop() {
    setState(() {
      taskPop = "open";
    });
  }

  void closeTaskPop() {
    setState(() {
      taskPop = "close";
    });
  }

  void openNewCheckList() {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => NewCheckList(),
        ));
  }

  void openNewTask() {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => NewTask(),
        ));
  }

  void openNewNote() {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => NewNote(),
        ));
  }

  Slidable taskWidget(Color color, String title, String time) {
    return Slidable(
      actionPane: SlidableBehindActionPane(),
      actionExtentRatio: 0.3,
      child: Container(
        height: 80,
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.03),
              offset: Offset(0, 9),
              blurRadius: 20,
              spreadRadius: 1)
        ]),
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              height: 25,
              width: 25,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                border: Border.all(color: color, width: 4),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: TextStyle(color: Colors.black, fontSize: 18),
                ),
                Text(
                  time,
                  style: TextStyle(color: Colors.grey, fontSize: 18),
                ),
              ],
            ),
            Expanded(
              child: Container(),
            ),
            Container(
              height: 50,
              width: 5,
              color: color,
            ),
          ],
        ),
      ),
      secondaryActions: [
        IconSlideAction(
          caption: 'Edit',
          color: Colors.white,
          icon: Icons.edit,
          onTap: () {},
        ),
        IconSlideAction(
          caption: 'Delete',
          color: color,
          icon: Icons.delete,
          onTap: () {},
        ),
      ],
    );
  }
}
