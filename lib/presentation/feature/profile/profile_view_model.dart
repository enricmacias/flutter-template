import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/domain/services/profile_service.dart';
import 'package:flutter_template/presentation/feature/profile/profile_state.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

class ProfileViewModel extends StateNotifier<ProfileState> {
  final ProfileService profileService;

  ProfileViewModel({
    required this.profileService,
    @visibleForTesting ProfileState? state,
  }) : super(state ?? ProfileState.initial());

  void load() async {
    state = state.copyWith(isLoading: true);
    var profileName = await profileService.getProfileName() ?? "";
    state = state.copyWith(isLoading: false, name: profileName);
  }
}
