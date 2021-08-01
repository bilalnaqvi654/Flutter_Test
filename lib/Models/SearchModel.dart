class SearchModel {
  List<Drinks> drinks = [];

  SearchModel({required this.drinks});

  SearchModel.fromJson(Map<String, dynamic> json) {
    if (json['drinks'] != null) {
      drinks = [];
      json['drinks'].forEach((v) {
        drinks.add(new Drinks.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.drinks != null) {
      data['drinks'] = this.drinks.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Drinks {
  late String idDrink;
  late String strDrink;
  late Null strDrinkAlternate;
  // late String strTags;

  late Null strVideo;
  late String strCategory;
  late String strIBA;
  late String strAlcoholic;
  late String strGlass;
  late String strInstructions;
  Null strInstructionsES;
//  late String strInstructionsDE;
  Null strInstructionsFR;
  late String strInstructionsIT;
  Null strInstructionsZHHANS;
  Null strInstructionsZHHANT;
  late String strDrinkThumb;
  late String strIngredient1;
  late String strIngredient2;
  late String strIngredient3;
  late String strIngredient4;
  late String strIngredient5;
  late String strIngredient6;
  late String strIngredient7;
  Null strIngredient8;
  Null strIngredient9;
  Null strIngredient10;
  Null strIngredient11;
  Null strIngredient12;
  Null strIngredient13;
  Null strIngredient14;
  Null strIngredient15;
  late String strMeasure1;
  late String strMeasure2;
  late String strMeasure3;
  late String strMeasure4;
  late String strMeasure5;
  late String strMeasure6;
  late String strMeasure7;
  late Null strMeasure8;
  late Null strMeasure9;
  late Null strMeasure10;
  late Null strMeasure11;
  late Null strMeasure12;
  late Null strMeasure13;
  Null strMeasure14;
  Null strMeasure15;
  late String strImageSource;
  late String strImageAttribution;
  late String strCreativeCommonsConfirmed;
  late String dateModified;
  bool isFav = false;

  Drinks(
      {required this.idDrink,
      required this.strDrink,
      this.strDrinkAlternate,
      // required this.strTags,
      this.strVideo,
      required this.strCategory,
      required this.strIBA,
      required this.strAlcoholic,
      required this.strGlass,
      required this.strInstructions,
      this.strInstructionsES,
      // required this.strInstructionsDE,
      this.strInstructionsFR,
      required this.strInstructionsIT,
      this.strInstructionsZHHANS,
      this.strInstructionsZHHANT,
      required this.strDrinkThumb,
      required this.strIngredient1,
      required this.strIngredient2,
      required this.strIngredient3,
      required this.strIngredient4,
      required this.strIngredient5,
      required this.strIngredient6,
      required this.strIngredient7,
      this.strIngredient8,
      this.strIngredient9,
      this.strIngredient10,
      this.strIngredient11,
      this.strIngredient12,
      this.strIngredient13,
      this.strIngredient14,
      this.strIngredient15,
      required this.strMeasure1,
      required this.strMeasure2,
      required this.strMeasure3,
      required this.strMeasure4,
      required this.strMeasure5,
      required this.strMeasure6,
      required this.strMeasure7,
      this.strMeasure8,
      this.strMeasure9,
      this.strMeasure10,
      this.strMeasure11,
      this.strMeasure12,
      this.strMeasure13,
      this.strMeasure14,
      this.strMeasure15,
      required this.strImageSource,
      required this.strImageAttribution,
      required this.strCreativeCommonsConfirmed,
      required this.dateModified,
      required this.isFav});

  Drinks.fromJson(Map<String, dynamic> json) {
    idDrink = json['idDrink'];
    strDrink = json['strDrink'];
    strDrinkAlternate = json['strDrinkAlternate'];
    // strTags = json['strTags'];
    //strVideo = json['strVideo'];
    strCategory = json['strCategory'];
    //strIBA = json['strIBA'];
    strAlcoholic = json['strAlcoholic'];
    strGlass = json['strGlass'];
    strInstructions = json['strInstructions'];
    strInstructionsES = json['strInstructionsES'];
    //  strInstructionsDE = json['strInstructionsDE'];
    strInstructionsFR = json['strInstructionsFR'];
    strInstructionsIT = json['strInstructionsIT'];
    strInstructionsZHHANS = json['strInstructionsZH-HANS'];
    strInstructionsZHHANT = json['strInstructionsZH-HANT'];
    strDrinkThumb = json['strDrinkThumb'];
    strIngredient1 = json['strIngredient1'];
    strIngredient2 = json['strIngredient2'];
    //strIngredient3 = json['strIngredient3'];
    //strIngredient4 = json['strIngredient4'];
    //strIngredient5 = json['strIngredient5'];
    //strIngredient6 = json['strIngredient6'];
    //strIngredient7 = json['strIngredient7'];
    //  strIngredient8 = json['strIngredient8'];
    // strIngredient9 = json['strIngredient9'];
    //  strIngredient10 = json['strIngredient10'];
    //   strIngredient11 = json['strIngredient11'];
    //  strIngredient12 = json['strIngredient12'];
    // strIngredient13 = json['strIngredient13'];
    //strIngredient14 = json['strIngredient14'];
    //   strIngredient15 = json['strIngredient15'];
    //strMeasure1 = json['strMeasure1'];
    //strMeasure2 = json['strMeasure2'];
    //strMeasure3 = json['strMeasure3'];
    //strMeasure4 = json['strMeasure4'];
    //  strMeasure5 = json['strMeasure5'];
    //   strMeasure6 = json['strMeasure6'];
    // strMeasure7 = json['strMeasure7'];
    // strMeasure8 = json['strMeasure8'];
    // strMeasure9 = json['strMeasure9'];
    // strMeasure10 = json['strMeasure10'];
    // strMeasure11 = json['strMeasure11'];
    // strMeasure12 = json['strMeasure12'];
    // strMeasure13 = json['strMeasure13'];
    // strMeasure14 = json['strMeasure14'];
    //  strMeasure15 = json['strMeasure15'];
    //strImageSource = json['strImageSource'];
    //strImageAttribution = json['strImageAttribution'];
    //  strCreativeCommonsConfirmed = json['strCreativeCommonsConfirmed'];
    // dateModified = json['dateModified'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idDrink'] = this.idDrink;
    data['strDrink'] = this.strDrink;
    data['strDrinkAlternate'] = this.strDrinkAlternate;
    //  data['strTags'] = this.strTags;
    data['strVideo'] = this.strVideo;
    data['strCategory'] = this.strCategory;
    data['strIBA'] = this.strIBA;
    data['strAlcoholic'] = this.strAlcoholic;
    data['strGlass'] = this.strGlass;
    data['strInstructions'] = this.strInstructions;
    data['strInstructionsES'] = this.strInstructionsES;
    //  data['strInstructionsDE'] = this.strInstructionsDE;
    data['strInstructionsFR'] = this.strInstructionsFR;
    data['strInstructionsIT'] = this.strInstructionsIT;
    data['strInstructionsZH-HANS'] = this.strInstructionsZHHANS;
    data['strInstructionsZH-HANT'] = this.strInstructionsZHHANT;
    data['strDrinkThumb'] = this.strDrinkThumb;
    data['strIngredient1'] = this.strIngredient1;
    data['strIngredient2'] = this.strIngredient2;
    data['strIngredient3'] = this.strIngredient3;
    data['strIngredient4'] = this.strIngredient4;
    data['strIngredient5'] = this.strIngredient5;
    data['strIngredient6'] = this.strIngredient6;
    data['strIngredient7'] = this.strIngredient7;
    data['strIngredient8'] = this.strIngredient8;
    data['strIngredient9'] = this.strIngredient9;
    data['strIngredient10'] = this.strIngredient10;
    data['strIngredient11'] = this.strIngredient11;
    data['strIngredient12'] = this.strIngredient12;
    data['strIngredient13'] = this.strIngredient13;
    data['strIngredient14'] = this.strIngredient14;
    data['strIngredient15'] = this.strIngredient15;
    data['strMeasure1'] = this.strMeasure1;
    data['strMeasure2'] = this.strMeasure2;
    data['strMeasure3'] = this.strMeasure3;
    data['strMeasure4'] = this.strMeasure4;
    data['strMeasure5'] = this.strMeasure5;
    data['strMeasure6'] = this.strMeasure6;
    data['strMeasure7'] = this.strMeasure7;
    data['strMeasure8'] = this.strMeasure8;
    data['strMeasure9'] = this.strMeasure9;
    data['strMeasure10'] = this.strMeasure10;
    data['strMeasure11'] = this.strMeasure11;
    data['strMeasure12'] = this.strMeasure12;
    data['strMeasure13'] = this.strMeasure13;
    data['strMeasure14'] = this.strMeasure14;
    data['strMeasure15'] = this.strMeasure15;
    data['strImageSource'] = this.strImageSource;
    data['strImageAttribution'] = this.strImageAttribution;
    data['strCreativeCommonsConfirmed'] = this.strCreativeCommonsConfirmed;
    data['dateModified'] = this.dateModified;
    return data;
  }
}
