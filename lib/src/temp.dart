// // Text('카테고리로 찾기'),
// // Expanded(
// //     child: CustomScrollView(
// //   primary: false,
// //   slivers: <Widget>[
// //     SliverPadding(
// //       padding: const EdgeInsets.all(20),
// //       sliver: SliverGrid.count(
// //         crossAxisSpacing: 10,
// //         mainAxisSpacing: 10,
// //         crossAxisCount: 3,
// //         children: <Widget>[
// //           Material(
// //             color: Colors.green[100],
// //             child: InkWell(
// //                 onTap: () {
// //                   showModalBottomSheet(
// //                       context: context,
// //                       builder: (BuildContext context) {
// //                         return TodayCategoryModal(temp: temp);
// //                       });
// //                 },
// //                 child: Container(
// //                   padding: const EdgeInsets.all(8),
// //                   child: const Text('에너지 절약'),
// //                 )),
// //           ),
// //           Container(
// //             padding: const EdgeInsets.all(8),
// //             child: const Text('쓰레기 절감'),
// //             color: Colors.green[200],
// //           ),
// //           Container(
// //             padding: const EdgeInsets.all(8),
// //             child: const Text('온실가스 저감'),
// //             color: Colors.green[300],
// //           ),
// //           Container(
// //             padding: const EdgeInsets.all(8),
// //             child: const Text('환경보호 봉사 활동'),
// //             color: Colors.green[400],
// //           ),
// //           Container(
// //             padding: const EdgeInsets.all(8),
// //             child: const Text('생태계 보호'),
// //             color: Colors.green[500],
// //           ),
// //           Container(
// //             padding: const EdgeInsets.all(8),
// //             child: const Text('친환경 제품 이용'),
// //             color: Colors.green[600],
// //           ),
// //         ],
// //       ),
// //     ),
// //   ],
// // ))

//     var name;
//     return Container(
//         margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
//         padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
//         // height: 400.0,
//         child: Form(
//           key: _formKey,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               TextFormField(
//                 // The validator receives the text that the user has entered.
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter some text';
//                   }
//                   name = value;
//                   return null;
//                 },
//               ),
//               Padding(
//                 padding: const EdgeInsets.symmetric(vertical: 16.0),
//                 child: ElevatedButton(
//                   onPressed: () {
//                     // Validate returns true if the form is valid, or false otherwise.
//                     if (_formKey.currentState!.validate()) {
//                       // If the form is valid, display a snackbar. In the real world,
//                       // you'd often call a server or save the information in a database.
//                       ScaffoldMessenger.of(context).showSnackBar(
//                         const SnackBar(content: Text('로그인 되었습니다')),
//                       );
//                       Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) =>
//                                   BottomNavigator(name: name)));
//                     }
//                   },
//                   child: Center(child: const Text('Login')),
//                 ),
//               ),
//             ],
//           ),
//         ));
//   }
