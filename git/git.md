# git

## clone
> git 서버에서 최초로 소스를 내려받는 것
~~~
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



## add
~~~
# commit할 파일 stage
git add . # 모든 변경사항 add
git add -p <hunk 옵션>

y - stage this hunk
n - do not stage this hunk
q - quit; do not stage this hunk or any of the remaining ones
a - stage this hunk and all later hunks in the file
d - do not stage this hunk or any of the later hunks in the file
g - select a hunk to go to
/ - search for a hunk matching the given regex
j - leave this hunk undecided, see next undecided hunk
J - leave this hunk undecided, see next hunk
k - leave this hunk undecided, see previous undecided hunk
K - leave this hunk undecided, see previous hunk
s - split the current hunk into smaller hunks
e - manually edit the current hunk
? - print help
~~~

## commit
~~~
# 바로 이전에 커밋한 메시지 바꾸기
git commit --amend -m "변경하고자 하는 커밋 메시지"
~~~

## log
~~~
git log -(n) // n개의 로그만 보기
git log --since=1.days // 하루치 로그 보기 (--after/--before)
git log --grep // 메시지가 일치한 로그보기(대소문자 구분)
~~~
### log naming
- 🚑 fix: 버그 수정: 올바르지 않은 동작
- ✨ feat : 기능 변경
- 📚 docs: 문서 변경
- 🎨 style: 코드형식/정렬/주석 등 변경 → 동작에 영향X
- add: 코드, 예제, 문서의 추가
- remove: 코드의 삭제
- 🚜 refactor: 전면수정
- 🔬 test: 테스트코드 수정
- etc: 코드 수정 없이 빌드스크립트, 패키지배포 설정 등
- update: 원래도 동작은 했었지만 수정,추가,보완 (코드보다는 문서나 리소스, 라이브러리 등)
- improve: 성능향상(호환성, 테스트커버리지, 접근성 등)
- make: 기존 동작 변경
- revise: 문서개정
- correct: 문법수정(타입변경, 이름변경)
- rename: 이름 변경
- verify: 검증코드 삽입
- set: 변수값 수정등 작은 수정

## 태그
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

# Branch 관리
## 신규 브랜치 생성
```shell
# 1번째 방법
git branch feature-01 master # master branch에서 분기한 feature-01 브랜치 생성

# 2번째 방법
git checkout -b feature-01 # feature-01 브랜치 생성과 함께 체크아웃
git push origin feature-01 # 원격 저장소에 push
git branch --set-upstream-to origin/feature-01 # local과 remote에 각각 있는 브랜치를 연동
```

## 브랜치명 변경
```shell
git branch -m feature-01 feature-001 # feature-01에서 feature-001로 브랜치명 변경
```

## 브랜치 삭제
```shell
# feature-01 브랜치를 삭제하려면
git checkout develop # 다른 브랜치로 이동
git branch --delete feature-01
git branch -D feature-01 # 강제삭제(push되지 않은 commit 등의 이력이 있는 경우)

git push origin :feature-01 # 원격 저장소에 삭제
```

## merge
~~~
git checkout (반영할 브랜치)

git merge (커밋된 브랜치) // 일반 머지

git merge --squash (커밋된 브랜치) // merge and squash
// squash: 여러 커밋을 합침

git rebase -i HEAD~~ // HEAD부터 ~~(전전) 커밋까지의 히스토리르 변경
~~~