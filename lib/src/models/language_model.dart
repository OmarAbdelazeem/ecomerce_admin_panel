import 'package:equatable/equatable.dart';

class LanguageModel extends Equatable{
  final int id;
  final String name;
  final String flag;
  final String languageCode;

  LanguageModel(this.id, this.name, this.flag, this.languageCode);


  static List<LanguageModel> languageList() {
    return <LanguageModel>[
      LanguageModel(1, 'english', 'πΊπΈ' , 'en'),
      LanguageModel(2, 'arabic', 'πͺπ¬' , 'ar'),
    ];
  }

  @override
  // TODO: implement props
  List<Object?> get props => [id,name,flag,languageCode];
}