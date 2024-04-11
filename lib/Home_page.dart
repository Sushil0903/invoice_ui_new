import 'package:flutter/material.dart';
import 'package:invoice_ui/cus_detail.dart';
import 'List.dart';

class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  TextEditingController Quanlist = TextEditingController();
  TextEditingController Pricelist = TextEditingController();
  String? custname;
  String? cdate;
  String? cbankname;
  String? acno;
  List<List<TextEditingController>> productlist = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text(
            "Invioce Generater",
            style: TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.w500,
                letterSpacing: 3),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  onChanged: (value) {
                    custname = value;
                  },
                  decoration: InputDecoration(
                      hintText: "Coustmer name", border: OutlineInputBorder()),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  onChanged: (value) {
                    cdate = value;
                  },
                  decoration: InputDecoration(
                      hintText: "Date", border: OutlineInputBorder()),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  child: Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Column(
                            children: [
                              Column(
                                children: productlist
                                    .map(
                                      (e) => Row(
                                        children: [
                                          Expanded(
                                            flex: 2,
                                            child: TextFormField(
                                              controller: e[0],
                                              decoration: InputDecoration(
                                                  border: OutlineInputBorder(),
                                                  hintText: "Product"),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Expanded(
                                            child: TextFormField(
                                              controller: e[1],
                                              decoration: InputDecoration(
                                                  border: OutlineInputBorder(),
                                                  hintText: "Qun."),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Expanded(
                                            child: TextFormField(
                                              controller: e[2],
                                              decoration: InputDecoration(
                                                  border: OutlineInputBorder(),
                                                  hintText: "Price."),
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                    .toList(),
                              ),
                            ],
                          ),
                          ElevatedButton(
                            onPressed: () {
                              productlist.add([
                                TextEditingController(),
                                TextEditingController(),
                                TextEditingController(),
                              ]);

                              setState(() {});
                            },
                            child: Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStatePropertyAll(Colors.black54),
                                fixedSize:
                                    MaterialStatePropertyAll(Size(390, 20))),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  onChanged: (value) {
                    cbankname = value;
                  },
                  decoration: InputDecoration(
                      hintText: "Bank name", border: OutlineInputBorder()),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  onChanged: (value) {
                    acno = value;
                  },
                  decoration: InputDecoration(
                      hintText: "Bank Account number",
                      border: OutlineInputBorder()),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: () {
                  cdetail.products.clear();
                  cdetail.amount.clear();
                  cdetail.Qun.clear();


                  for (var element in productlist) {
                    cdetail.products.add(element[0].text);
                    cdetail.Qun.add(element[1].text);
                    cdetail.amount.add(element[2].text);
                  }


                  cdetail.name = custname;
                  cdetail.date = cdate;
                  cdetail.bankname = cbankname;
                  cdetail.acnum = acno;

                  Navigator.pushNamed(context, "my_pdf");
                },
                child: Container(
                  height: 60,
                  width: 300,
                  decoration: BoxDecoration(
                      color: Colors.black87,
                      borderRadius: BorderRadius.circular(30)),
                  child: Center(
                      child: Text(
                    "Make invoice",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  )),
                ),
              ),
            ],
          ),
        ));
  }
}
