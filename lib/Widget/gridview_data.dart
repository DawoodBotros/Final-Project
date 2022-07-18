import 'package:flutter/material.dart';

class GridData extends StatelessWidget{
  const GridData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height / 3,
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius:
            BorderRadius.vertical(top: Radius.circular(40))),
        color: Colors.white,
        child: GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 2.2,
            children: List.generate(
                6,
                    (index) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "MIN TEMP",
                          style: TextStyle(color: Colors.grey.shade400,fontSize: 25),
                        ),
                        Text("1017",style: TextStyle(color: Colors.grey.shade700,fontSize: 25)),
                      ]
                  ),
                ))),
      ),
    );
  }

}