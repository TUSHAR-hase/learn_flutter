import 'package:flutter/material.dart';

class button extends StatelessWidget {
  final VoidCallback ontab;
  final String text;
  const button({super.key,required this.text,required this.ontab});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontab,
      child: Padding(

        padding: const EdgeInsets.symmetric(vertical :6,horizontal: 25),
        child: Container(

          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(vertical: 14),
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30)
            ),
            color: Colors.black
          ),
          child: Text(text,style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 20,),),
        ),
      ),
    );
  }
}
