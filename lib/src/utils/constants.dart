import 'package:flutter/material.dart';

const BASE_URL =
    'https://zgojtokt6f.execute-api.ap-northeast-2.amazonaws.com/dev/api/';

const WeekList = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];

const PointLevelTable = [
  {
    'start': 0,
    'end': 9,
    'label': '브론즈 티끌이',
    'next': '실버 티끌이',
    'imgUrl': 'assets/bronze.png',
    'color': 0xFF815C12
  },
  {
    'start': 10,
    'end': 19,
    'label': '실버 티끌이',
    'next': '골드 티끌이',
    'imgUrl': 'assets/silver.png',
    'color': 0xFFA7A7A7
  },
  {
    'start': 20,
    'end': 29,
    'label': '골드 티끌이',
    'next': '브론즈 동산이',
    'imgUrl': 'assets/gold.png',
    'color': 0xFFFFAA00
  },
  {
    'start': 30,
    'end': 39,
    'label': '브론즈 동산이',
    'next': '실버 동산이',
    'imgUrl': 'assets/dongsan_bronze.png',
    'color': 0xFF815C12
  },
  {
    'start': 40,
    'end': 49,
    'label': '실버 동산이',
    'next': '골드 동산이',
    'imgUrl': 'assets/dongsan_silver.png',
    'color': 0xFFA7A7A7
  },
  {
    'start': 50,
    'end': 59,
    'label': '골드 동산이',
    'next': '브론즈 태산이',
    'imgUrl': 'assets/dongsan_gold.png',
    'color': 0xFFFFAA00
  },
  {
    'start': 60,
    'end': 69,
    'label': '브론즈 태산이',
    'next': '실버 태산이',
    'imgUrl': 'assets/taesan_bronze.png',
    'color': 0xFF815C12
  },
  {
    'start': 70,
    'end': 79,
    'label': '실버 태산이',
    'next': '골드 태산이',
    'imgUrl': 'assets/taesan_silver.png',
    'color': 0xFFA7A7A7
  },
  {
    'start': 80,
    'end': 1000,
    'label': '골드 태산이',
    'next': '환경보호에 동참해주시는 당신이 아름답습니다',
    'imgUrl': 'assets/taesan_gold.png',
    'color': 0xFFFFAA00
  },
];

const COLOR_BLACK = Color.fromRGBO(48, 47, 48, 1.0);
// const COLOR_GREY = Color.fromRGBO(141, 141, 141, 1.0);

const COLOR_WHITE = Colors.white;
const COLOR_DARK_BLUE = Color.fromRGBO(20, 25, 45, 1.0);

const COLOR_GREEN = Color(0xFF375854);
const COLOR_GREY = Color(0xFFF4F4F5);
const COLOR_BORDER = Color(0xFFC4C4C4);

const TitleFont =
    TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: COLOR_GREEN);
const FontBoldGreen18 = const TextStyle(
    fontSize: 18.0, fontWeight: FontWeight.bold, color: COLOR_GREEN);
const FontNormalGreen18 = const TextStyle(
    fontSize: 18.0, fontWeight: FontWeight.normal, color: COLOR_GREEN);
const FontBoldGreen20 = const TextStyle(
    fontSize: 20.0, fontWeight: FontWeight.bold, color: COLOR_GREEN);
const FontBoldGreen24 =
    TextStyle(fontSize: 24.0, fontWeight: FontWeight.w700, color: COLOR_GREEN);

const BiggerFont = TextStyle(fontSize: 18.0);
const BiggerGreyFont = TextStyle(fontSize: 18.0, color: Colors.grey);
const BiggerWhiteFont =
    TextStyle(fontSize: 18.0, color: Colors.white, fontWeight: FontWeight.w500);
const BiggerFont22 = const TextStyle(
    fontSize: 22.0, fontWeight: FontWeight.bold, color: COLOR_GREEN);

const TextTheme TEXT_THEME_DEFAULT = TextTheme(
    headline1: TextStyle(
        color: COLOR_BLACK, fontWeight: FontWeight.w700, fontSize: 26),
    headline2: TextStyle(
        color: COLOR_BLACK, fontWeight: FontWeight.w700, fontSize: 22),
    headline3: TextStyle(
        color: COLOR_BLACK, fontWeight: FontWeight.w700, fontSize: 20),
    headline4: TextStyle(
        color: COLOR_BLACK, fontWeight: FontWeight.w700, fontSize: 16),
    headline5: TextStyle(
        color: COLOR_BLACK, fontWeight: FontWeight.w700, fontSize: 14),
    headline6: TextStyle(
        color: COLOR_BLACK, fontWeight: FontWeight.w700, fontSize: 12),
    bodyText1: TextStyle(
        color: COLOR_BLACK,
        fontSize: 14,
        fontWeight: FontWeight.w500,
        height: 1.5),
    bodyText2: TextStyle(
        color: COLOR_GREY,
        fontSize: 14,
        fontWeight: FontWeight.w500,
        height: 1.5),
    subtitle1: TextStyle(
        color: COLOR_BLACK, fontSize: 12, fontWeight: FontWeight.w400),
    subtitle2: TextStyle(
        color: COLOR_GREY, fontSize: 12, fontWeight: FontWeight.w400));

const TextTheme TEXT_THEME_SMALL = TextTheme(
    headline1: TextStyle(
        color: COLOR_BLACK, fontWeight: FontWeight.w700, fontSize: 22),
    headline2: TextStyle(
        color: COLOR_BLACK, fontWeight: FontWeight.w700, fontSize: 20),
    headline3: TextStyle(
        color: COLOR_BLACK, fontWeight: FontWeight.w700, fontSize: 18),
    headline4: TextStyle(
        color: COLOR_BLACK, fontWeight: FontWeight.w700, fontSize: 14),
    headline5: TextStyle(
        color: COLOR_BLACK, fontWeight: FontWeight.w700, fontSize: 12),
    headline6: TextStyle(
        color: COLOR_BLACK, fontWeight: FontWeight.w700, fontSize: 10),
    bodyText1: TextStyle(
        color: COLOR_BLACK,
        fontSize: 12,
        fontWeight: FontWeight.w500,
        height: 1.5),
    bodyText2: TextStyle(
        color: COLOR_GREY,
        fontSize: 12,
        fontWeight: FontWeight.w500,
        height: 1.5),
    subtitle1: TextStyle(
        color: COLOR_BLACK, fontSize: 10, fontWeight: FontWeight.w400),
    subtitle2: TextStyle(
        color: COLOR_GREY, fontSize: 10, fontWeight: FontWeight.w400));
