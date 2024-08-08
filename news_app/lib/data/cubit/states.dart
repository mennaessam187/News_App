abstract class NewsStates {}

class NewsInitialState extends NewsStates {}

class ChangeBottomNavigationBarState extends NewsStates {}

class GetSportsDataLoading extends NewsStates {}

class GetBusinessDataSuccessfully extends NewsStates {}

class GetBusinessDataError extends NewsStates {
  final String error;

  GetBusinessDataError({required this.error});
}
