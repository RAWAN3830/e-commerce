//
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:pdf/pdf.dart';
// import 'package:pdf/widgets.dart' as pw;
// import 'package:printing/printing.dart';
//
// class Invoice extends StatefulWidget {
//   Widget PaddedText(
//       final String text, {
//         final TextAlign align = TextAlign.left,
//       }) =>
//       Padding(
//         padding: EdgeInsets.all(10),
//         child: Text(
//           text,
//           textAlign: align,
//         ),
//       );
//   const Invoice({Key? key}) : super (key : key);
//   @override
//   State<Invoice> createState() => _InvoiceState();
// }
//
// class _InvoiceState extends State<Invoice> {
//
//   final doc = pw.Document();
//   //  List<pw.Column> itemlist = [];
//   // final name = cartpdf[index].name.toString();
//   // final price = cartpdf[index].price.toString();
//   // final quantity = cartpdf[index].qty.toString();
//   // final total = cartpdf[index].name.toString();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Flutter PDF Demo',
//             style: TextStyle(color: Colors.orange, fontSize: 30)),
//       ),
//       body: PdfPreview(
//         maxPageWidth: 500,
//         build: (format) {
//           return buildPdf();
//         },
//       ),
//     );
//   }
//
//   Future<Uint8List> buildPdf() async {
//     final doc = pw.Document();
//     final iconImage = (await rootBundle.load('assets/images/ninja_cart.png'))
//         .buffer
//         .asUint8List();
//
//     doc.addPage(pw.Page(
//         pageFormat: PdfPageFormat.a4,
//         build: (context) {
//           return pw.Column(
//               children: [
//                 pw.Row(
//                     children: [
//                       pw.Image(
//                           pw.MemoryImage(iconImage), height: 70, width: 70),
//                       pw.SizedBox(width: 1 * PdfPageFormat.mm),
//                       pw.Column(
//                         mainAxisSize: pw.MainAxisSize.min,
//                         crossAxisAlignment: pw.CrossAxisAlignment.start,
//                         children: [
//                           pw.Text(
//                             'INVOICE',
//                             style: pw.TextStyle(
//                               fontSize: 17.0,
//                               fontWeight: pw.FontWeight.bold,
//                             ),
//                           ),
//                           pw.Text(
//                             'Food Ninja Appmania',
//                             style: const pw.TextStyle(
//                               fontSize: 15.0,
//                               color: PdfColors.grey700,
//                             ),
//                           ),
//                         ],
//                       ),
//                       pw.Spacer(),
//                       pw.Column(
//                         mainAxisSize: pw.MainAxisSize.min,
//                         crossAxisAlignment: pw.CrossAxisAlignment.start,
//                         children: [
//                           pw.Text(
//                             'Ved patel',
//                             style: pw.TextStyle(
//                               fontSize: 16,
//                               fontWeight: pw.FontWeight.bold,
//                             ),
//                           ),
//                           pw.Text(
//                             'vedpatel@gmail.com',
//                           ),
//                           pw.Text(DateTime.now().toString(),
//                           ),
//                         ],
//                       ),
//                     ]),
//                 pw.SizedBox(height: 2 * PdfPageFormat.mm),
//                 pw.Divider(),
//                 pw.SizedBox(height: 2 * PdfPageFormat.mm),
//                 pw.Text(
//                     'Dear Customer , this is your bill if any changes happen'
//                         'in bill you will complain of this changes'
//                         'there is always help of you from our side',
//                     textAlign: pw.TextAlign.justify,
//                     style: pw.TextStyle(fontSize: 14)),
//                 pw.SizedBox(height: 12 * PdfPageFormat.mm),
//
//                 pw.Container(
//                   height: 300,
//                   child: pw.Table(
//                       defaultColumnWidth: pw.FixedColumnWidth(100),
//                       defaultVerticalAlignment:  pw.TableCellVerticalAlignment.top,
//                       border: pw.TableBorder.all(style: pw.BorderStyle.solid,width: 2,color: PdfColors.white),
//                       children:[
//                         pw.TableRow(
//                             decoration: pw.BoxDecoration(color: PdfColors.cyan300),
//                             children: [
//                               pw.Column(children: [pw.Text('Item',style: pw.TextStyle(fontSize: 20,fontWeight: pw.FontWeight.bold))]),
//                               pw.Column(children: [pw.Text('Quantity',style: pw.TextStyle(fontSize: 20,fontWeight: pw.FontWeight.bold))]),
//                               pw.Column(children: [pw.Text('Price',style: pw.TextStyle(fontSize: 20,fontWeight: pw.FontWeight.bold))]),
//                             ]),
//                         ...cartdata.map((e) => pw.TableRow(
//                             decoration: pw.BoxDecoration(color:PdfColors.deepOrange100),
//                             children: [
//                               pw.Text(e.name!, style: pw.TextStyle(fontSize: 18.0),textAlign: pw.TextAlign.center),
//                               pw.Text(e.qty!.toString(), style: pw.TextStyle(fontSize: 18.0),textAlign: pw.TextAlign.center),
//                               pw.Text(e.price!.toString(), style: pw.TextStyle(fontSize: 18.0),textAlign: pw.TextAlign.center),
//                             ]
//                         )).toList()
//                       ]
//                   ),
//
//                 ),
//
//                 pw.Divider(),
//                 pw.Container(
//                   alignment: pw.Alignment.centerRight,
//                   child: pw.Row(
//                     children: [
//                       pw.Spacer(flex: 6),
//                       pw.Expanded(
//                         flex: 4,
//                         child: pw.Column(
//                           crossAxisAlignment: pw.CrossAxisAlignment.start,
//                           children: [
//                             pw.Row(
//                               children: [
//                                 pw.Expanded(
//                                   child: pw.Text(
//                                     //'${cartdata[index].name}',
//                                     'Net total',
//                                     style: pw.TextStyle(
//                                       fontSize: 16.0,
//                                       fontWeight: pw.FontWeight.bold,
//                                     ),
//                                   ),
//                                 ),
//                                 pw.Text(
//                                   "\$"+ subTotalPrice().toString(),
//                                   style: pw.TextStyle(
//                                     fontSize: 16.0,
//                                     fontWeight: pw.FontWeight.bold,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                             pw.Row(
//                               children: [
//                                 pw.Expanded(
//                                   child: pw.Text(
//                                     'Delivery',
//                                     style: pw.TextStyle(
//                                       fontSize: 16.0,
//                                       fontWeight: pw.FontWeight.bold,
//                                     ),
//                                   ),
//                                 ),
//                                 pw.Text(
//                                   '\$ 3.50',
//                                   style: pw.TextStyle(
//                                     fontSize: 16.0,
//                                     fontWeight: pw.FontWeight.bold,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                             pw.Divider(),
//                             pw.Row(
//                               children: [
//                                 pw.Expanded(
//                                   child: pw.Text(
//                                     'Total amount due',
//                                     style: pw.TextStyle(
//                                       fontSize: 16.0,
//                                       fontWeight: pw.FontWeight.bold,
//                                     ),
//                                   ),
//                                 ),
//                                 pw.Text(
//                                   "\$"+ totalPrice().toString(),
//                                   style: pw.TextStyle(
//                                     fontSize: 16.0,
//                                     fontWeight: pw.FontWeight.bold,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                             pw.SizedBox(height: 2 * PdfPageFormat.mm),
//                             pw.Container(height: 1, color: PdfColors.grey400),
//                             pw.SizedBox(height: 0.5 * PdfPageFormat.mm),
//                             pw.Container(height: 1, color: PdfColors.grey400),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ]);
//         }));
//
//     await Printing.layoutPdf(
//         onLayout: (PdfPageFormat format) async => doc.save());
//     return doc.save();
//   }
// }
//
// totalPrice()
// {
//   double c;
//   c = subTotalPrice() + 3.5;
//   return c;
// }
//
// subTotalPrice()
// {
//   int total = 0;
//   for(int i = 0;i<cartdata.length;i++)
//   {
//     int c;
//     c = cartdata[i].qty! * cartdata[i].price!.toInt();
//     total = total + c;
//   }
//   return total;
// }
//
// total_qua_Price(int a, int b)
// {
//   int total = 0;
//   int c;
//   c = a * b;
//   total = total + c;
//   return c;
// }
//
// Widget PaddedText(
//     final String text, {
//       final TextAlign align = TextAlign.left,
//     }) =>
//     Padding(
//       padding: EdgeInsets.all(10),
//       child: Text(
//         text,
//         textAlign: align,
//       ),
//     );
