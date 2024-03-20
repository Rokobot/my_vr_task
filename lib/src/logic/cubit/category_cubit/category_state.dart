part of 'category_cubit.dart';

class CategoryState extends Equatable {
  const CategoryState();

  @override
  List<Object?> get props => [];
}

class CategoryInitial extends CategoryState {
  final String?  value;

  CategoryInitial({required this.value});
  @override
  List<Object?> get props => [value];
}


class CategoryNewState extends CategoryState{
  final String? value;
  CategoryNewState({required this.value});

  @override
  List<Object?> get props => [value];

}
