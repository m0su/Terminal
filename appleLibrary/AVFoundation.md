1. 미디어 재생 및 편집
2. 비디오/오디오 녹음
3. 오디오 트랙 엔지니어링
4. 스피치(TTS)

# AVAudioSession
> 오디오 관련 설정을 시스템에 전달하는 객체
- [apple](https://developer.apple.com/documentation/avfoundation/avaudiosession)
- [developer.apple](https://developer.apple.com/library/archive/documentation/Audio/Conceptual/AudioSessionProgrammingGuide/AudioSessionCategoriesandModes/AudioSessionCategoriesandModes.html#//apple_ref/doc/uid/TP40007875-CH10)
- [gitbook](https://melod-it.gitbook.io/sagwa/media/avfoundation/system-audio-interaction/avaudiosession)

|카테고리|음소거|기존 AV차단|input-output|Mode|
|-|-|-|-|-|-|
|ambient|O|X|output|
|soloAmbient|O|O|output|
|playback|X|O/X|output|moviePlayback, spokenAudio, measurement|
|record|X(잠금화면 녹음만 가능)|O|input|videoRecording, measurement|
|playAndRecord|X|O/X|input/output|videoRecording, voiceChat, gameChat, videoChat, measurement|
|multiRoute|X|O|input/output|

## Notification
>AV의 중단, 변경, 리셋 등과 같은 상태변화를 알려준다 (`NSNotification.Name`)
- interruptionNotification: 오디오 중단
- routeChangeNotification: 시스템 오디오 라우트 변경
- silenceSecondaryAudioHintNotification: 다른 앱의 오디오가 시작되거나 중지됨
- mediaServiceWereLostNotification: 미디어 서버가 중지됨
- mediaServicesWereResetNotification: 미디어 서버가 재시작

## Route
- currentRoute: 현재 오디오 입출력 라우트
- preferredInput: 우선되는 오디오 라우트 입력 포트 { set }



### 백그라운드
- [UIBackgroundModes](https://developer.apple.com/library/archive/documentation/General/Reference/InfoPlistKeyReference/Articles/iPhoneOSKeys.html#//apple_ref/doc/plist/info/UIBackgroundModes): 백그라운드에서 사용하려면 info.plist에서 권한 허용이 필요함
