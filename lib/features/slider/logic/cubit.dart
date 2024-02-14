

import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:n_m_c/features/slider/dataModel/slider_model.dart';
import 'package:n_m_c/features/slider/logic/state.dart';
import 'package:n_m_c/features/slider/repo/slider_repo.dart';

class SliderCubit extends Cubit<SliderStates> {
  SliderRepository sliderRepo;

  SliderCubit(this.sliderRepo) : super(InitialSliderState());


  static SliderCubit get(context) => BlocProvider.of(context);

  List<DataSlider>? imageSlider = [];
  Future getSliderImage() async
  {
    emit(GetImageSliderLoadingState());
    await sliderRepo.getSlider().then((getImage) =>
        {

      imageSlider = getImage.data,

      emit(GetImageSliderState()),

    });

  }

}