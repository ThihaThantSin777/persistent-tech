import 'package:flutter/material.dart';
import 'package:persistent/data/model/user_model.dart';
import 'package:persistent/data/vo/user_vo.dart';
import 'package:persistent/widget/text_field_widget.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  String _userName = '';
  String _age = '';
  final UserModel _userModel = UserModel();

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () {
      _userModel.save(UserVO(1, "Mg Mg", 23));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Info'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: TextFieldWidget(
                  hintText: 'User Name',
                  prefixIcon: Icons.person,
                  onChanged: (text) {
                    _userName = text;
                  }),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: TextFieldWidget(
                  hintText: 'Age',
                  textInputType: TextInputType.number,
                  prefixIcon: Icons.accessibility,
                  onChanged: (text) {
                    _age = text;
                  }),
            ),
            Center(
              child: MaterialButton(
                  minWidth: 200,
                  height: 40,
                  textColor: Colors.black,
                  onPressed: () {
                    if (mounted) {
                      setState(() {
                        _userModel.save(UserVO(1, _userName, int.parse(_age)));
                      });
                    }
                  },
                  child: const Text('Submit')),
            ),
            const SizedBox(
              height: 50,
            ),
            // Center(
            //   child: Text(
            //     _userModel.getUser != null ? _userModel.getUser.toString() : '',
            //     style: const TextStyle(color: Colors.black),
            //   ),
            // ),

            Center(
              child: StreamBuilder<UserVO?>(
                stream: _userModel.getUserStream,
                builder: (_, snapShot) {
                  if (snapShot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (snapShot.hasError) {
                    return Center(
                      child: Text(snapShot.error.toString()),
                    );
                  }
                  return Text(
                    snapShot.data.toString(),
                    style: const TextStyle(color: Colors.black),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
