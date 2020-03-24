터미널과 CLI 관련한 아카이브

## git
~~~
log 옵션

git log -(n) // n개의 로그만 보기
git log --since=1.days // 하루치 로그 보기 (--after/--before)
git log --grep // 메시지가 일치한 로그보기(대소문자 구분)

~~~

### 태그
커밋 메시지, 브랜치와는 독자적으로 커밋에 태그를 붙여 쉽게 관리할 수도 있다.
~~~
// 태그 조회
git tag
git tag -l v1.1.* // 특정 버전의 태그 조회

// 태그 붙이기
git tag v1.0.2 // Lightweight 방식

git tag -a v1.0.3 -m"Release version 1.0.3" // Annotated 방식(만든사람, 이메일, 날짜, 메시지 등)
git show v1.0.3  

// 이전 커밋에 태그 붙이기
git tag v1.0.0 #커밋해쉬#
git tag -a v1.0.1 -m"Release version 1.0.1" #커밋해쉬#

// 원격저장소에 올리기
git push origin v1.0.3
git push origin --tags // 모든 태그 올리기

// 태그 삭제하기
git tag -d v1.0.0
git push origin :v1.0.0 // 원격저장소에 올라간 태그 삭제
~~~