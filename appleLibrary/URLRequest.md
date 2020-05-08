[Alamofire timeout 이슈](https://github.com/Alamofire/Alamofire/issues/2732)

 > `timeoutIntervalForRequest`를 60초 이내로 설정해도, 60초까지 timeout을 기다리는 객체가 있다.

`timeoutIntervalForRequest`는 `URLSessionConfiguration`의 프로퍼티로 `URLRequest`의 `timeoutInterval`에는 영향을 주지 않는다.

`URLSession`의 타임아웃과 `URLRequest`의 타임아웃이 다르게 동작한다.
- 추후 추가바람

### timeoutInterval
- you must create your own URLRequest values with the appropriate setting before passing them to Alamofire
- Alamofire에 전달하기 전에 적절한 설정으로 고유한 URLRequest 값을 생성하십시오.