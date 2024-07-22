// cubit/picture_state.dart
import '../models/picture_model.dart';

abstract class PictureState {}

class InitialPictureState extends PictureState {}

class LoadingPictureState extends PictureState {}

class LoadedPictureState extends PictureState {
  final List<PictureModel> allPictures;
  final List<PictureModel> filteredPictures;

  LoadedPictureState(this.allPictures, this.filteredPictures);
}

class ErrorPictureState extends PictureState {
  final String message;

  ErrorPictureState(this.message);
}
