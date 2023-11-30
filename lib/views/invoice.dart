import 'dart:async';

import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:nike_ecommerce/views/homepage.dart';
import 'package:nike_ecommerce/views/sneaker_shop.dart';
import 'package:nike_ecommerce/views/util.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class Invoice extends StatefulWidget {
  const Invoice({super.key});

  @override
  State<Invoice> createState() => _InvoiceState();
}

class _InvoiceState extends State<Invoice> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Invoice",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: cartlist.map(
          (cart) {
            return Expanded(
              child: PdfPreview(
                build: (PdfPageFormat format) {
                  return Invoicepdf();
                },
              ),
            );
          },
        ).toList(),
      ),
    );
  }

  FutureOr<Uint8List> Invoicepdf() async {
    var document = pw.Document();
    final netImage = await AssetImage("assets/nike1.png");
    document.addPage(
      pw.Page(
        build: (context) {
          return pw.Column(
            children: [
              pw.Align(
                alignment: pw.Alignment.topCenter,
                child: pw.Text(
                  "INVOICE",
                  style: pw.TextStyle(
                    fontWeight: pw.FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
              pw.SizedBox(height: 50),
              pw.Row(
                children: [
                  pw.Column(
                    children: [
                      pw.Align(
                        alignment: pw.Alignment.topLeft,
                        child: pw.Text(
                          "Customer name:${profile.fname}",
                          style: pw.TextStyle(
                              color: PdfColors.black,
                              fontSize: 20,
                              fontWeight: pw.FontWeight.bold),
                        ),
                      ),
                      pw.Align(
                        alignment: pw.Alignment.topLeft,
                        child: pw.Text(
                          "Address:${profile.location}",
                          style: pw.TextStyle(
                              color: PdfColors.black,
                              fontSize: 20,
                              fontWeight: pw.FontWeight.bold),
                        ),
                      ),
                      pw.SizedBox(height: 30),
                      pw.Text("Billing Address:${profile.location}",
                          style: pw.TextStyle(
                              fontSize: 20, fontWeight: pw.FontWeight.bold))
                    ],
                  ),
                  pw.SizedBox(width: 30),
                  pw.Text(
                    "Shipping Address",
                    style: pw.TextStyle(
                        fontSize: 15, fontWeight: pw.FontWeight.bold),
                  ),
                ],
              ),
              pw.SizedBox(height: 18),
              pw.Container(
                height: 250,
                width: 500,
                decoration: pw.BoxDecoration(
                  border: pw.Border.all(color: PdfColors.black),
                ),
                child: pw.Column(
                  children: [
                    pw.Row(
                      children: [
                        pw.Container(
                          height: 30,
                          width: 481,
                          decoration: pw.BoxDecoration(
                            border: pw.Border.all(color: PdfColors.black),
                          ),
                          child: pw.Row(
                            mainAxisAlignment: pw.MainAxisAlignment.spaceAround,
                            children: [
                              pw.Text(
                                "            Product",
                                style: pw.TextStyle(
                                    fontWeight: pw.FontWeight.bold),
                              ),
                              pw.SizedBox(width: 5),
                              pw.Text(
                                "Description",
                                style: pw.TextStyle(
                                    fontWeight: pw.FontWeight.bold),
                              ),
                              pw.SizedBox(width: 5),
                              pw.Text(
                                "Qty",
                                style: pw.TextStyle(
                                    fontWeight: pw.FontWeight.bold),
                              ),
                              pw.SizedBox(),
                              pw.Text(
                                "Prize",
                                style: pw.TextStyle(
                                    fontWeight: pw.FontWeight.bold),
                              ),
                              pw.SizedBox(width: 4),
                              pw.Text(
                                "subtotal",
                                style: pw.TextStyle(
                                    fontWeight: pw.FontWeight.bold),
                              ),
                              pw.SizedBox(width: 0),
                            ],
                          ),
                        ),
                      ],
                    ),
                    pw.Row(
                      children: [
                        pw.Container(
                            height: 220,
                            width: 120,
                            decoration: pw.BoxDecoration(
                              border: pw.Border.all(color: PdfColors.black),
                            ),
                            child: pw.Text("  ${cart?["name"]}")),
                        pw.Container(
                          height: 220,
                          width: 120,
                          decoration: pw.BoxDecoration(
                            border: pw.Border.all(color: PdfColors.black),
                          ),
                          child: pw.Text(
                              "         Best seller \n       Exclusive offers"),
                        ),
                        pw.Container(
                            height: 220,
                            width: 50,
                            decoration: pw.BoxDecoration(
                              border: pw.Border.all(
                                  color: PdfColors.black, width: 2),
                            ),
                            child: pw.Text(
                                "      ${cart?["product".toString()]}")),
                        pw.Container(
                            height: 220,
                            width: 80,
                            decoration: pw.BoxDecoration(
                              border: pw.Border.all(
                                  color: PdfColors.black, width: 2),
                            ),
                            child: pw.Text("      ${cart?["prize"]}")),
                        pw.Container(
                          height: 220,
                          width: 110,
                          decoration: pw.BoxDecoration(
                            border:
                                pw.Border.all(color: PdfColors.black, width: 2),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              pw.Container(
                  height: 50,
                  width: 500,
                  decoration: pw.BoxDecoration(
                    border: pw.Border.all(color: PdfColors.black),
                  ),
                  child: pw.Row(
                      mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                      children: [
                        pw.Align(
                          alignment: pw.Alignment(-0.9, 0),
                          child: pw.Text(
                            "Total: ${cartlist.length}",
                            style: pw.TextStyle(
                                fontWeight: pw.FontWeight.bold, fontSize: 15),
                          ),
                        ),
                      ])),
              pw.SizedBox(height: 10),
              pw.Align(
                alignment: pw.Alignment.topLeft,
                child: pw.Text(
                  "\nSeller Registred Address: Nike Agency,\n Nike Agency,Delhi-302009",
                  style: pw.TextStyle(color: PdfColors.black),
                  maxLines: 5,
                ),
              ),
              pw.SizedBox(height: 20),
              pw.Align(
                alignment: pw.Alignment.topLeft,
                child: pw.Text(
                  "Declaration :",
                  style: pw.TextStyle(
                      color: PdfColors.black, fontWeight: pw.FontWeight.bold),
                ),
              ),
              pw.SizedBox(height: 10),
              pw.Align(
                alignment: pw.Alignment.topLeft,
                child: pw.Text(
                    "The good  sold are intended for end user consumption and not for resale."),
              ),
              pw.SizedBox(height: 50),
              pw.Align(
                alignment: pw.Alignment.bottomRight,
                child: pw.Text(
                  "NIKE AGENCY INDIA",
                  style: pw.TextStyle(
                      color: PdfColors.blue,
                      fontSize: 20,
                      fontWeight: pw.FontWeight.bold),
                ),
              ),
              pw.Align(
                alignment: pw.Alignment(0.7, 0),
                child: pw.Text(
                  "Authorized Signature",
                  style: pw.TextStyle(
                    color: PdfColors.black,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
    return document.save();
  }
}
