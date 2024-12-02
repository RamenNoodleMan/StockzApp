import 'package:flutter/material.dart';

class PortfolioList {
  String title;
  String description;

  String stockprice;

  PortfolioList(
      {required this.title,
        required this.description,

        required this.stockprice});
}

List<PortfolioList> portList = [
  PortfolioList(
    title: 'LONG: CEC',
    description: "HOLDING BALANCE: K0",
    stockprice: 'ZM0000000136',

  ),

  PortfolioList(
    title: 'LONG: SHOPRITE',
    description: "HOLDING BALANCE: K0",
    stockprice: 'ZM0000000011',

  ),

  PortfolioList(
    title: 'LONG: BATA',
    description: "HOLDING BALANCE: K0",
    stockprice: 'ZMEMAFS06798',

  ),

  PortfolioList(
    title: 'LONG: DANGOTE',
    description: "HOLDING BALANCE: K0",
    stockprice: 'ZM000039394',

  ),
  PortfolioList(
    title: 'LONG: ZAMBIA SUGAR',
    description: "HOLDING BALANCE: K0",
    stockprice: 'ZMKG0009655',

  ),
  PortfolioList(
    title: 'LONG: ZAFFICO',
    description: "HOLDING BALANCE: K0",
    stockprice: 'ZM455550111',

  ),
  PortfolioList(
    title: 'LONG: LAFARGE',
    description: "HOLDING BALANCE: K0",
    stockprice: 'ZMF47777777',

  ),


];

