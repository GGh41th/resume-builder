
import 'package:codecraft/ui/wdigets/appbar.dart';
import 'package:codecraft/ui/wdigets/drawer.dart';
import 'package:flutter/material.dart';


class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CAppBar(context),
      drawer: drawer(context),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Wrap(
              spacing: 18.0,
              runSpacing: 8.0,
              children: List.generate(
                10,
                    (index) => Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Container(
                      //topright edge of the card
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12.0),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black12,
                            offset: Offset(0, 5),
                            blurRadius: 10.0,
                          ),
                        ],
                      ),
                      width: 140,
                      height: 190,
                      child: Center(
                        child: Text(
                          'CV ${index + 1}',
                          style: const TextStyle(color: Colors.black, fontSize: 20.0),
                        ),
                      ),
                    ),
                    const SizedBox(height: 4.0),
                    Text(
                      'Title ${index + 1}',
                      style: const TextStyle(fontSize: 16.0),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

