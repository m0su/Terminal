# UIView Extension
```swift
let view = UIView()

view.setBorder(color: .white, width: 5, radius: 4, position: .bottom) // 테두리 그리기
view.setSgadows(color: .black) // 그림자 넣기
view.makeCircle(borderColor: .clear) // 원형으로 만들기

view.startBlink() // 깜빡이는 애니메이션 넣기
view.stopBlink() // 깜빡이는 애니메이션 종료

view.shake() // view 흔드는 효과 ex. 입력값이 잘못 되었을 때

view.setGradientBackground(color: [.black, .white]) // black에서 white로 그라데이션으로 배경색 채우기

view.appear() // 은은하게 나타나는 애니메이션 넣기
view.disappear() // 은은하게 사라지는 애니메이션 넣기
```