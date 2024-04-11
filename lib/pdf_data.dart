import 'dart:typed_data';

import 'package:invoice_ui/cus_detail.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'package:printing/printing.dart';
class PdfData {
  PdfPreview getPdfPreview() {
    return PdfPreview(
      build: (format) {
        // return generateInvoice(format);
        return getPdf();
      },
    );
  }

  Future<Uint8List> getPdf() async {
    var document = Document();

    document.addPage(Page(build: (context) {
      int? Q;
      return Column(
          children: [
        Row(
          children :[
            Text("Salford & Co.",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
          ]
        ),
        Row(
          children :[
            Text("123 Anywhere 5t,any City,ST 12345",style: TextStyle(fontSize: 15)),
          ]
        ),
        Row(
          children :[
            Text("Tel : +913-456-321",style: TextStyle(fontSize: 15)),
          ]
        ),
        SizedBox(height: 80),
        Row(
          children: [
            Text("INVOICE",style: TextStyle(fontSize: 50,letterSpacing: 4))
          ]
        ),
        SizedBox(height: 20),
        Row(
          children: [
            Text("Invoice No: ",style: TextStyle(fontSize: 15)),
            Spacer(),
            Text("Date : ",style: TextStyle(fontSize: 15)),
            Text("${cdetail.date}",style: TextStyle(fontSize: 15,)),
          ]
        ) ,
        SizedBox(height: 10),
        Row(children: [Text("Coustomer Name : ${cdetail.name}",style: TextStyle(fontSize: 15) )]),

        SizedBox(height: 10),
         Divider(),
            Row(
              children: [
                Text("Item",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
                Spacer(),
                Text("Product",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
                Spacer(),
                Text("Quantity",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
                Spacer(),
                Text("Amount",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
              ]
            ),
            Divider(),
            Row(children: [
              Column(
                  children: [
                    for(int i=1;i<=cdetail.products.length;i++)
                      Text("${i}",style: TextStyle(fontSize: 18)),

                  ]
              ),
              Spacer(),
              Column(
                  children: [
                    for(int i=0;i<cdetail.products.length;i++)
                      Text("${cdetail.products[i]}",style: TextStyle(fontSize: 18)),

                  ]
              ),
              Spacer(),
              Column(
                  children: [
                    for(int i=0;i<cdetail.Qun.length;i++)
                      // Q=int.tryParse(cdetail.Qun[i]??0);
                      Text("${int.tryParse(cdetail.Qun[i])??0}",style: TextStyle(fontSize: 18)),

                  ]
              ),
              Spacer(),
              Column(
                  children: [
                    for(int i=0;i<cdetail.amount.length;i++)
                      Text("${int.tryParse(cdetail.amount[i])??0*cdetail.Qun[i]}",style: TextStyle(fontSize: 18)),
                      // Text("${int.tryParse(cdetail.amount[i])??0*cdetail.Qun[i]}",style: TextStyle(fontSize: 18)),



                  ]
              ),
            ]),

            Divider(),
            Text("Totle"),

            Spacer(),
            Row(children: [
              Text("Bank Name : ",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold)),
              Text("${cdetail.bankname}",style: TextStyle(fontSize: 15)),
            ]),SizedBox(height: 10),
            Row(children: [
              Text("Bank Name : ",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
              Text("${cdetail.acnum}",style: TextStyle(fontSize: 15)),
            ]),
            Divider(),
            Row(
              children: [
                Spacer(),
                Text("If you have any question please contact :jayveer9@gmail.com ",style: TextStyle(fontSize: 10)),
                Spacer(),
              ]
            )
      ]);
    }));

    // document.addPage(Page(
    //   build: (context) {
    //     return Text("New Page");
    //   },
    // ));

    return document.save();
  }
}