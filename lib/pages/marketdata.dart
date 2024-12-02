import 'package:flutter/material.dart';

class MarkList {
  String title;
  String details;
  double description;
  String imageUrl;
  String stockprice;
  String prevstockprice;
  String openstockprice;
  String closestockprice;
  String sector;



  MarkList(
  {required this.title,
    required this.description,
    required this.imageUrl,
    required this.details,
    required this.stockprice,
    required this.prevstockprice,
    required this.openstockprice,
    required this.closestockprice,
    required this.sector,
  });
}

List<MarkList> marketList = [
  MarkList(
    title: 'Copperbelt Energy',
    description: 3.00,
    stockprice: 'K15.13',
    imageUrl: 'assets/cec.png',
    prevstockprice:'K12.13',
    openstockprice:'K12.13',
    closestockprice:'K15.13',
    sector: 'Energy',
    details: 'The Copperbelt Energy Corporation Plc (CEC) is a Zambian incorporated power transmission, generation, distribution and supply company respected for its skills in designing and operating transmission systems.',
  ),

  MarkList(
    title: 'Shoprite',
    description: -4.00,
    stockprice: 'K20.30',
    imageUrl: 'assets/Shoprite.png',
    prevstockprice:'K24.30',
    openstockprice:'K24.30',
    closestockprice:'K20.30',
    sector: 'Retail Trading',
    details: 'Shoprite is an investment holding company with an international presence of retail and wholesale food and non-food outlets. The holding company is based in South Africa (RSA).',
  ),

  MarkList(
    title: 'Lafarge',
    description: 3.50,
    stockprice: 'K10.23',
    imageUrl: 'assets/laf.webp',
    prevstockprice:'K6.73',
    openstockprice:'K6.73',
    closestockprice:'K10.23',
    sector: 'Manufacturing',
    details: 'Lafarge manufactures and sells cement and collective products for the local building and construction industry in Zambia and for international export. Lafarge Zambia has two fully integrated cement plants in Ndola and Lusaka. Lafarge also exports cement products to countries such as: Tanzania, Burundi, Malawi, Congo, Namibia and Zimbabwe.',
  ),

  MarkList(
    title: 'Dangote',
    description: -2.20,
    stockprice: 'K14.01',
    imageUrl: 'assets/dang.webp',
    prevstockprice:'K16.21',
    openstockprice:'K16.21',
    closestockprice:'K14.01',
    sector: 'Manufacturing',
    details: 'Dangote Cement is a renowned cement manufacturing company in Zambia that provides cement for building and industrial use.',
  ),
  MarkList(
    title: 'Bata',
    description: 1.00,
    stockprice: 'K5.00',
    imageUrl: 'assets/bata.webp',
    prevstockprice:'K4.00',
    openstockprice:'K4.00',
    closestockprice:'K5.00',
    sector: 'Manufacturing',
    details: 'Bata manufactures as well as markets a variety of both smart and casual footwear. Additionally, its product range is inclusive of other leather and plastic products, and accessories like handbags and belts. The company has a national presence of 50 stores located in the major towns and cities of Zambia.',
  ),
  MarkList(
    title: 'Zambia Sugar',
    description: 2.00,
    stockprice: 'K3.00',
    imageUrl: 'assets/zamsugar.webp',
    prevstockprice:'K1.00',
    openstockprice:'K1.00',
    closestockprice:'K3.00',
    sector: 'Agricultural Processing',
    details: 'Zambia sugar is the largest sugar producer in Zambia. The company grows sugar cane and produces raw sugar and specialty sugar products for domestic and export markets. It produces sugar products under the Whitespoon brand name, and exports to countries in the European Union.',
  ),
  MarkList(
    title: 'Zaffico',
    description: -2.10,
    stockprice: 'K6.20',
    imageUrl: 'assets/zaffico.png',
    prevstockprice:'K8.30',
    openstockprice:'K8.30',
    closestockprice:'K6.20',
    sector: 'Manufacturing',
    details: 'Zaffico is a State owned enterprise (SOE) and a member of the Industrial Development Corporation (IDC) Group. It was established for the purpose of developing and maintaining of pine and eucalyptus plantations and for the harvesting and commercial processing of timber to supply timber to the local and foreign market.',
  ),


];






