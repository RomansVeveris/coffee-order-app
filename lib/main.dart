import 'package:flutter/material.dart';
import 'home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    
    return const MaterialApp(
      home: StartPage(),
    );
  }
}

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      extendBodyBehindAppBar: true,
      body: 

      Container(
        color: Colors.black,
          width: double.infinity,
         height: double.infinity,  
        child: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: ShaderMask(
                shaderCallback: (rect) {
                  return LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.black,
                      Colors.transparent,
                    ],
                    stops: [0.9, 1.0],
                  ).createShader(Rect.fromLTWH(0, 0, rect.width, rect.height));
                },
                blendMode: BlendMode.dstIn,
                child: Image.asset(
                  'assets/images/coffee_bg.png',
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),

            SafeArea(
              child: 
              Container(
                margin: EdgeInsets.only(bottom: 34),
                padding: EdgeInsets.only(left: 24, right: 24),
                child:
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      
                      Text('Fall in Love with Coffee in Blissful Delight!',
                        style: TextStyle(color: Colors.white, fontSize: 36, fontFamily: 'Sora', fontWeight: FontWeight.w600),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 20),
                      Text("Welcome to our cozy coffee corner, where every cup is a delightful for you.",
                        style: TextStyle(color: Color(0xFFA2A2A2), fontSize: 16, fontFamily: 'Sora', fontWeight: FontWeight.w400),
                        textAlign: TextAlign.center,
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 32),
                        width: double.infinity,
                        height: 62,
                        child:
                        ElevatedButton( onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const HomePage()),
                          );

                        },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFFC67C4E),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                          child:
                            Text("Get Started", style: TextStyle(color: Colors.white, fontSize: 16, fontFamily: 'Sora', fontWeight: FontWeight.w600))
                          ),
                      ),
                  ]
                ),
              )
            )
          ]
        ),
      ),
    );
  }
}