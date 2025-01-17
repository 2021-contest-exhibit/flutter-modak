
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modak/bloc/ModakEvent.dart';
import 'package:modak/bloc/ModakState.dart';
import 'package:modak/dto/Chat.dart';
import 'package:modak/dto/Matching.dart';
import 'package:modak/dto/ModakChat.dart';
import 'package:modak/dto/ModakMatching.dart';
import 'package:modak/repository/APIRepository.dart';
import 'package:modak/repository/FireStoreRepository.dart';
import 'package:modak/repository/FirebaseStorageRepository.dart';
import 'package:modak/repository/UserRepository.dart';
import 'package:modak/rest/ResponseGetCampings.dart';

class ModakBloc extends Bloc<ModakEvent, ModakState> {
  final FireStoreRepository fireStoreRepository;
  final UserRepository userRepository;
  final APIRepository apiRepository;
  final FirebaseStorageRepository firebaseStorageRepository;
  ModakBloc({required this.fireStoreRepository, required this.userRepository, required this.apiRepository, required this.firebaseStorageRepository}) : super(Empty());

  @override
  Stream<ModakState> mapEventToState(ModakEvent event) async* {
    if (event is CreateMatchingEvent) {
      yield* _mapCreateMatchingEvent(event);
    } else if (event is LoadMatchingEvent) {
      yield* _mapLoadMatchingEvent(event);
    } else if (event is LoadMyMatchingEvent) {
      yield* _mapLoadMyMatchingEvent(event);
    } else if (event is LoadChattingEvent) {
      yield* _mapLoadChattingEvent(event);
    } else if (event is PushMessageEvent) {
      yield* _mapPushMessageEvent(event);
    } else if (event is LoadJoinMatchingEvent) {
      yield* _mapLoadJoinMatchingEvent(event);
    } else if (event is LoadIsJoinMatchingEvent) {
      yield* _mapLoadIsJoinMatchingEvent(event);
    } else if (event is JoinMatchingEvent) {
      yield* _mapJoinMatchingEvent(event);
    } else if (event is CampingSelectedEvent) {
      yield* _mapCampingSelectedEvent(event);
    } else if (event is ChangeProfileImageEvent) {
      yield* _mapChangeProfile(event);
    }
  }

  Stream<ModakState> _mapCampingSelectedEvent(CampingSelectedEvent event) async*{
    yield CampingSelectedLoading();

    yield CampingSelected(content: event.content);
  }

  Stream<ModakState> _mapPushMessageEvent(PushMessageEvent event) async* {
    var uid = userRepository.getUserToken();

    if (uid != null) {
      await fireStoreRepository.appendChatting(event.matchingId, uid, event.message, false);
    } else {
      yield Error(message: "로그인 필요한 서비스입니다.");
    }

  }

  Stream<ModakState>_mapCreateMatchingEvent(CreateMatchingEvent event) async* {
    yield Loading();

    var token = userRepository.getUserToken();

    if (token != null) {
      var response = await fireStoreRepository.saveMatching(
          Matching(
              user: token,
              campingId: event.campingId,
              startDate: event.startDate,
              endDate: event.endDate,
              createDate: event.createDate,
              userList: [token]
          )
      );
      if (response != null) {
        yield Loaded();
      } else {
        yield Error(message: '매칭 생성에 실패하였습니다.');
      }
    } else {
      yield Error(message: "로그인이 필요한 서비스 입니다.");
    }

  }

  Stream<ModakState> _mapLoadMatchingEvent(LoadMatchingEvent event) async* {
    yield MatchingLoading();

    var response = await fireStoreRepository.loadMatching(event.matchingId??"", event.lastDate??"").onError((error, stackTrace) => null);

    if (response != null) {
      var matchings = await Stream.fromIterable(response).asyncMap((e) async {
        var campings = await apiRepository.getCampings(contentId: e[e.keys.first]!.campingId);
        var user = await fireStoreRepository.loadUser(e[e.keys.first]!.user!);
        var userEmail = user != null ? user.email : "";
        var userUid = user != null ? user.uid : "";
        print('campings: ${campings!.content}');
        return ModakMatching(matching: e[e.keys.first], content: campings.content[0], email: userEmail, uid: userUid, matchingId: e.keys.first, user: user);
      }).toList();
      yield MatchingLoaded(matchings: matchings);
    } else {
      yield Error(message: 'response null');
    }
  }

  Stream<ModakState> _mapLoadMyMatchingEvent(LoadMyMatchingEvent event) async* {
    yield MyMatchingLoading();

    var uid = userRepository.getUserToken();
    var email = userRepository.getUserEmail();

    if (uid != null && email != null) {
      print('_mapLoadMyMatchingEvent');
      print('uid: ${uid}');
      var response = await fireStoreRepository.loadMyMatching(uid, event.lastDate??"").onError((error, stackTrace) => null);
      if (response != null) {
        var matchings = await Stream.fromIterable(response).asyncMap((e) async {
          var campings = await apiRepository.getCampings(contentId: e[e.keys.first]!.campingId);
          var user = await fireStoreRepository.loadUser(e[e.keys.first]!.user!);
          return ModakMatching(matching: e[e.keys.first], content: campings!.content[0], email: email, uid: uid, matchingId: e.keys.first, user: user);
        }).toList();
        yield MyMatchingLoaded(matchings: matchings);
      } else {
        yield Error(message: 'response null');
      }
    } else {
      yield Error(message: "로그인이 필요한 서비스 입니다.");
    }
  }

  Stream<ModakState> _mapLoadJoinMatchingEvent(LoadJoinMatchingEvent event) async* {
    yield JoinMatchingLoading();

    var uid = userRepository.getUserToken();
    var email = userRepository.getUserEmail();

    if (uid != null && email != null) {
      print('_mapLoadMyMatchingEvent');
      print('uid: ${uid}');
      var response = await fireStoreRepository.loadJoinMatchings(uid, event.lastDate??"").onError((error, stackTrace) => null);
      if (response != null) {
        var matchings = await Stream.fromIterable(response).asyncMap((e) async {
          var campings = await apiRepository.getCampings(contentId: e[e.keys.first]!.campingId);
          var user = await fireStoreRepository.loadUser(e[e.keys.first]!.user!);
          return ModakMatching(matching: e[e.keys.first], content: campings!.content[0], email: email, uid: uid, matchingId: e.keys.first, user: user);
        }).toList();
        yield JoinMatchingLoaded(matchings: matchings);
      } else {
        yield Error(message: 'response null');
      }
    } else {
      yield Error(message: "로그인이 필요한 서비스 입니다.");
    }
  }

  Stream<ModakState> _mapLoadChattingEvent(LoadChattingEvent event) async* {
    yield ChattingLoading();

    List<Chat> chatList;

    if (event.values.length > 0) {
      print('load next');
      chatList = await fireStoreRepository.getNextChatting(event.matchingId, event.values);
    } else {
      chatList = await fireStoreRepository.getChatting(event.matchingId);
    }

    List<ModakChat> modakChat = await Stream.fromIterable(chatList).asyncMap((e) async {
      var user = await fireStoreRepository.loadUser(e.userId);
      return ModakChat(chat: e, modakUser: user);
    }).toList();

    print('test: ${modakChat[0].chat!.toJson()}');

    yield ChattingLoaded(chatList: modakChat);
  }

  Stream<ModakState> _mapLoadIsJoinMatchingEvent(LoadIsJoinMatchingEvent event) async*{
    yield IsJoinMatchingLoading();

    var uid = userRepository.getUserToken();

    if (uid != null){
      var isJoined = await fireStoreRepository.loadIsJoinMatching(uid, event.matchingId);
      print('isJoined : ${isJoined}');
      yield IsJoinMatchingLoaded(isJoinMatching: isJoined, matchingId: event.matchingId);
    } else {
      yield Error(message: "로그인이 필요한 서비스 입니다.");
    }

  }

  Stream<ModakState> _mapJoinMatchingEvent(JoinMatchingEvent event) async*{
    yield JoinLoading();

    var uid = userRepository.getUserToken();

    if (uid != null){
      var isJoined = await fireStoreRepository.joinMatching(uid, event.matchingId);
      if (isJoined) {
        await fireStoreRepository.appendChatting(event.matchingId, uid, "enter", true);
        yield MachingJoined(isJoined: isJoined);
      }
    } else {
      yield Error(message: "로그인이 필요한 서비스 입니다.");
    }

  }

  Stream<ModakState> _mapChangeProfile(ChangeProfileImageEvent event) async* {
    yield ProfileUploading();
    var uid = userRepository.getUserToken();

    if (uid != null) {
      String? url = await firebaseStorageRepository.uploadImage(uid, event.file);

      String? docKey = await fireStoreRepository.getUserDocKey(uid);
      if (url != null && docKey != null) {
        bool? isUpdated = await fireStoreRepository.updateImage(docKey, url);
        if (isUpdated != null && isUpdated) {
          yield ProfileUploaded();
        }
      } else {
        yield ProfileUploadError(message: "이미지를 업로드를 실패하였습니다.");
      }
    } else {
      yield ProfileUploadError(message: "로그인이 필요한 기능입니다.");
    }
  }

}