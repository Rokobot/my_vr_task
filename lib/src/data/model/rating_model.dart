class RatingModel{
  final double? rate;
  final int? count;


  double? get _rate => rate;
  int? get _count => count;

  RatingModel({required this.rate, required this.count});

  factory RatingModel.fromJson(Map<String, dynamic> json){
    return RatingModel(rate: json['rate']?.toDouble(), count: json['count']);
  }
}