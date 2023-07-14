// ignore_for_file: file_names, unnecessary_string_interpolations, non_constant_identifier_names

class SaveridesModel {
  final String name, image, From, To, Num;

 SaveridesModel(this.name, this.image, this.From, this.To,this.Num);
}


final List<SaveridesModel> fruitData = List.generate(
    userNameList.length,
    (index) => SaveridesModel('${userNameList[index]}', '${itemimageList[index]}',
        
        '${userFromList[index]}', '${usertoList[index]}','${userNumList[index]}' ));

const userFromList = [
  "Iqbal Town",
  "Awan Town",
  "Ali Town",
  "Ichraa",
  "Hafeez Center",
  "Mall Road",
  "Thokar",
  "Mansoora"
];
const usertoList = [
  "Hafeez Center",
  "Mall Road",
  "Thokar",
  "Mansoorah",
  "Iqbal Town",
  "Awan Town",
  "Ali Town",
  "Ichraa",
  
];
const userNameList = [
  "Saif",
  "Ali",
  "Asra",
  "Anas",
  "Laiba",
  "Zeeshan",
  "Dilawar",
  "Aqsa"
];
const userNumList = [
  "+923249470845",
  "+923249470845",
  "+923249470845",
  "+923249470845",
  "+923249470845",
  "+923249470845",
  "+923249470845",
  "+923249470845"
];
const itemimageList = [p1, p2, p3, p4, p5, p6, p7, p8];
const p1 = "images/1.jpg",
    p2 = "images/2.jpg",
    p3 = "images/3.jpg",
    p4 = "images/4.jpg",
    p5 = "images/5.JPG",
    p6 = "images/6.JPG",
    p7 = "images/7.jpg",
    p8 = "images/8.png";
