### Catalina에서 코코아팟 업데이트 에러
- Catalina로 업데이트후 코코아팟을 업데이트하면 아래와 같은 에러가 발생한다.
- homebrew로 설치한 코코아팟에서 발생한 문제라고 한다.
~~~
zsh: /usr/local/bin/pod: bad interpreter: /System/Library/Frameworks/Ruby.framework/Versions/2.3/usr/bin/ruby: no such file or directory

// 아래를 실행하면 해결
sudo gem install -n /usr/local/bin cocoapods
~~~