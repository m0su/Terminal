# git

## clone
> git 서버에서 최초로 소스를 내려받는 것
~~~
mkdir testFolder # 원하는 폴더 생성
git init # git 설정 초기화

# 받고자 하는 리포지토리 주소(둘 다 가능)
git clone https://github.com/m0su/Terminal.git
git clone git@github.com:m0su/Terminal.git
~~~

## fetch & pull
> 원격 저장소에서 로컬 저장소로 파일을 가져오기(fetch) + 병합까지(pull)
### fetch
- 로컬 브랜치의 헤드는 유지한 채로, origin/master는 원격 저장소의 최신 커밋을 가리킨다.
- 이전 내용과 원격 저장소에 새로 추가된 내용의 차이를 알 수 있다.
~~~
git diff HEAD origin/master # 원래 내용과 새로 추가된 내용의 차이
git log --decorate --all --oneline # 로컬 브랜치 이후로 커밋이 얼마나 되었는지

git merge origin/master # 병합(fetch로 가져온 이후 pull과 동일한 효과)
~~~
### pull
- 로컬 브랜치와 원격 저장소 origin/master가 같은 위치를 가리킴



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