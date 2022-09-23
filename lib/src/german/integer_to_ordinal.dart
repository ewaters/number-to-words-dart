import 'package:number_to_words/src/german/integer_to_words.dart';

const _ordinalUnits = [
  "",
  "erste",
  "zweite",
  "dritte",
  "vierte",
  "fünfte",
  "sechste",
  "siebte",
  "achte",
];

String integerToOrdinalImpl(int number) {
  if (number < _ordinalUnits.length) {
    return _ordinalUnits[number];
  }
  final base = integerToWordsImpl(number);

  if (number < 20) {
    return "${base}te";
  }
  return "${base}ste";
}

/*
 *
Numeral	Cardinal	Ordinal	Pronunciation	Numeric Form
1	eins	erste	EHR-ste	1.
2	zwei	zweite	TSVEY-te	2.
3	drei	dritte	DRIT-te	3.
4	vier	vierte	FEAR-te	4.
5	fünf	fünfte	FUHNF-te	5.
6	sechs	sechste	ZEX-te	6.
7	sieben	siebte	ZEEB-te	7.
8	acht	achte	AHKT-te	8.
9	neun	neunte	NOIN-te	9.
10	zehn	zehnte	TSAYN-te	10.
11	elf	elfte	ELF-te	11.
12	zwölf	zwölfte	TSVOLF-te	12.
13	dreizehn	dreizehnte	DRY-tsain-te	13.
14	vierzehn	vierzehnte	FEAR-tsain-te	14.
15	fünfzehn	fünfzehnte	FUHNF-tsain-te	15.
16	sechzehn	sechzehnte	ZEX-tsain-te	16.
17	siebzehn	siebzehnte	ZEEB-tsain-te	17.
18	achtzehn	achtzehnte	AHKT-tsain-te	18.
19	neunzehn	neunzehnte	NOIN-tsain-te	19.
20	zwanzig	zwanzigste	TSVAN-tsig-ste	20.
21	einundzwanzig	einundzwanzigste	EYN-unt-tswan-tsig-ste	21.
*/
