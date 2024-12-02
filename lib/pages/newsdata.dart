import 'package:flutter/material.dart';

class NewsList {
  String title;
  String details;

  String headlines;
  String image;

  NewsList(
      {required this.title,
        required this.details,
        required this.image,

        required this.headlines});
}

List<NewsList> newsList = [
  NewsList(
    title: 'Huawei partners with Zambia for ICT Development',
    details: "",
    headlines: 'Huawei partners with Zambia for ICT Development. In a latest development, Huawei has partnered with Zambia for ICT development. The Zambian tech industry has now welcomed the new partnership with Huawei as Zambia aims to develop its technological sectors and boost IT services in the country.',
    image: 'assets/hua.jpg'
  ),

  NewsList(
    title: 'Zambia Food Market Prices Go Up',
    details: "",
    headlines: 'Food market prices have recently skyrocketed from last week following an increase in fuel and tax prices. The increase in prices have now taken affected the Zambian food market as transport costs have in turn increased. This will greatly affect majority of Zambians more especially consumers of farm produce. Farmers in turn will have to hike prices of food stuff like vegetables to keep up with the status quo',
      image: 'assets/zed1.jpg'
  ),

  NewsList(
    title: 'Zaffico stock prices go up',
    details: "",
    headlines: 'Zaffico share prices have now gone up. The increase in share prices means that investors now have to pay more to invest in the companys shares. But this also means that investors who already have shares in the company can now sell their shares and make a profit.',
      image: 'assets/zaffi.jpeg'
  ),

  NewsList(
    title: 'More company shares go public',
    details: "",
    headlines: 'The Lusaka Stock Exchange has now welcomed more companys as more stocks have gone public and now can attract investors. More companies will now enable and attract more investors into the fold and more shares can be bought and sold.',
      image: 'assets/lusess.jpg'
  ),

  NewsList(
title: 'Ethiopian Airlines joins hands with Zambian government',
details: "",
headlines: 'Ethiopian Airlines has teamed with the Zambia government in economic effort to boost the flight and travel industry.',
      image: 'assets/zair.jpg'
),







];