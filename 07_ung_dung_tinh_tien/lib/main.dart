import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final memberA = TextEditingController();
  final memberB = TextEditingController();
  final memberC = TextEditingController();
  final memberD = TextEditingController();
  final memberE = TextEditingController();

  String average = "21" ;

  void _calAverage() {
    setState(() {
      var x = (double.parse(memberA.text)
          + double.parse(memberB.text)
          + double.parse(memberC.text)
          + double.parse(memberD.text)
          + double.parse(memberE.text))/5;
      average = x.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ứng dụng chia tiền"),
      ),
      body: ListView(
        children: <Widget>[
          Text("""
          Bài toán chia tiền:
          - Có một team rủ nhau đi dã ngoại, cả team có 5 bạn. Cả team thống nhất với nhau rằng, mỗi người cứ chi cho team sau đó sẽ chia đều. 
          + Bạn A chi 700,000 VND
          + Bạn B chi 1,200,000 VND
          + Bạn C chi 78,000 VND
          + Bạn D chi 200,000 VND
          + Bạn E chi 1,500,000 VND
          
          Hãy viết ứng dụng chia tiền hộ team để các bạn ấy không phải đau đầu tính toán.
          Một số bạn không tham gia các hoạt động được tính tiền phải chịu ít đi (tỉ lệ)
          """),
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: TextField(
              controller: memberA,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: TextField(
              controller: memberB,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: TextField(
              controller: memberC,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: TextField(
              controller: memberD,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: TextField(
              controller: memberE,
            ),
          ),
          RaisedButton(
            onPressed: () {
             print(memberA.text);
             print(memberB.text);
             _calAverage();
            },
            child: Text(
              "Tính tiền",
              style: TextStyle(color: Colors.red, fontSize: 40),
            ),
          ),
          Text('Trung bình mỗi người cần trả: $average'),
          Text((double.parse(average) - double.parse(memberA.text)) < 0
              ? "Bạn A nhận lại ${(double.parse(memberA.text) - double.parse(average))}"
              : "Bạn A cần nộp thêm ${(double.parse(average) - double.parse(memberA.text))}"),
          Text((double.parse(average) - double.parse(memberB.text)) < 0
              ? "Bạn B nhận lại ${(double.parse(memberB.text) - double.parse(average))}"
              : "Bạn B cần nộp thêm ${(double.parse(average) - double.parse(memberB.text))}"),
          Text((double.parse(average) - double.parse(memberC.text)) < 0
              ? "Bạn C nhận lại ${(double.parse(memberC.text) - double.parse(average))}"
              : "Bạn C cần nộp thêm ${(double.parse(average) - double.parse(memberC.text))}"),
          Text((double.parse(average) - double.parse(memberD.text)) < 0
              ? "Bạn D nhận lại ${(double.parse(memberD.text) - double.parse(average))}"
              : "Bạn D cần nộp thêm ${(double.parse(average) - double.parse(memberD.text))}"),
          Text((double.parse(average) - double.parse(memberE.text)) < 0
              ? "Bạn E nhận lại ${(double.parse(memberE.text) - double.parse(average))}"
              : "Bạn E cần nộp thêm ${(double.parse(average) - double.parse(memberE.text))}"),
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
