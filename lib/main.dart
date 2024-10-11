import 'package:cloud_files/pages/team_folder.dart';
import 'package:flutter/material.dart';
void main(){
 runApp(const CloudFileManager());
}

class CloudFileManager extends StatelessWidget {
  const CloudFileManager({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TeamFolder(),
    );
  }
}
