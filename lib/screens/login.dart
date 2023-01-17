import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final List<List<String>> coffees = [
    [
      'assets/images/coffee-4.jpg'
    ],
    ['assets/images/coffee-2.jpg'],
    ['assets/images/coffee-1.jpg']
  ];
  int currentIndex = 0;
  void _next() {
    setState(() {
      if(currentIndex < coffees.length - 1) {
        currentIndex++;
      } else {
        currentIndex = currentIndex;
      }
    });
  }

  void _prev() {
    setState(() {
      if (currentIndex > 0) {
        currentIndex--;
      } else {
        currentIndex = 0;
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            GestureDetector(
              onHorizontalDragEnd: (DragEndDetails details) {
                if (details.velocity.pixelsPerSecond.dx > 0){
                  _prev();
                } else if (details.velocity.pixelsPerSecond.dx < 0){
                  _next();
                }
              },
              child: Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * .6,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(coffees[currentIndex][0]),
                    fit: BoxFit.cover,
                    )
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Container(
                      width: 90,
                      margin: EdgeInsets.only(bottom: 60),
                      child: Row(
                        children: _buildIndicator(),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: Transform.translate(
                offset: Offset(0, -40),
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Colors.white
                  ),
                  child: loginButtons(context)
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _indicator(bool isActive){
    return Expanded(
      child: Container(
        height: 4,
        margin: EdgeInsets.only(right: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(60),
          color: isActive ? Colors.grey[800] : Colors.white,
        ),
      ),
    );
  }

  List<Widget> _buildIndicator(){
    List<Widget> indicators = [];
    for(int i = 0; i < coffees.length; i++){
      if(i == currentIndex){
        indicators.add(_indicator(true));
      } else {
        indicators.add(_indicator(false));
      }
    }
    return indicators;
  }

  Widget loginButtons(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "Coffee on your Desk",
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.w600),
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          "Superfast..",
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.w600),
        ),
        SizedBox(
          height: 15,
        ),
        theButton("LOGIN", MediaQuery.of(context).size.width),
        const SizedBox(
          height: 15,
        ),
        theButton("SIGNUP", MediaQuery.of(context).size.width),
        const SizedBox(
          height: 15,
        ),
        Row(children: <Widget>[
          Expanded(
            child: new Container(
                margin: const EdgeInsets.only(left: 10.0, right: 20.0),
                child: Divider(
                  color: Colors.black,
                  height: 36,
                )),
          ),
          Text("or Login with"),
          Expanded(
            child: new Container(
                margin: const EdgeInsets.only(left: 20.0, right: 10.0),
                child: Divider(
                  color: Colors.black,
                  height: 36,
                )),
          ),
        ]),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
                onPressed: () {},
                iconSize: 40,
                padding: EdgeInsets.symmetric(horizontal: 15),
                icon: FaIcon(
                  FontAwesomeIcons.google,
                )),
            IconButton(
                onPressed: () {},
                iconSize: 40,
                padding: EdgeInsets.symmetric(horizontal: 15),
                icon: FaIcon(
                  FontAwesomeIcons.facebook,
                )),
          ],
        ),
      ],
    );
  }

  Widget theButton(String caption, double width) {
    return Container(
      width: width * .75,
      child: ElevatedButton(
        onPressed: () {},
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
            padding:
                MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(15.0))),
        child: Text(
          caption,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 20),
        ),
      ),
    );
  }

}