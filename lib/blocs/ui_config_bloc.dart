import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:flutter/services.dart';

class UiConfigBloc extends Bloc<UiConfigEvent, UiConfigState> {
  UiConfigBloc() : super(UiConfigLoading()) {
    on<LoadUiConfigEvent>((event, emit) async {
      emit(UiConfigLoading());
      try {
        // Load the JSON configuration
        final String response = await rootBundle.loadString('assets/ui_config.json');
        final data = jsonDecode(response);
        emit(UiConfigLoaded(data['sections']));
      } catch (e) {
        emit(UiConfigError('Failed to load UI configuration: ${e.toString()}'));
      }
    });
  }
}

abstract class UiConfigEvent {}

class LoadUiConfigEvent extends UiConfigEvent {}

abstract class UiConfigState {}

class UiConfigLoading extends UiConfigState {}

class UiConfigLoaded extends UiConfigState {
  final List<dynamic> sections;
  UiConfigLoaded(this.sections);
}

class UiConfigError extends UiConfigState {
  final String message;
  UiConfigError(this.message);
}
