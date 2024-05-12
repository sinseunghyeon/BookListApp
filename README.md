
## 1. 내일 배움캠프 - iOS 심화주차 개인과제
### - 프로젝트 명: $BookSearchApp$
- **설명 :** kakao REST API를 이용해 책 검색 데이터를 받아오고, 위시리스트에 추가할 수 있는 어플입니다.
    - 메인페이지 : 최근에 본 책 리스트와, 검색한 책의 데이터가 받아와서 보여집니다.
    - 위시리스트페이지 : 담은 책들을 볼 수 있으며, 삭제도 할 수 있습니다.
- **프로젝트 일정 :** 24/05/06 ~ 24/05/10 (5일)
- **프로젝트 결과물**
	📂 [$BookSearchApp$ GitHub주소](https://github.com/sinseunghyeon/BookListApp)

|메인페이지	|상세페이지	|위시리스트페이지
|:-:	|:-:	|:-:
|![](https://velog.velcdn.com/images/sinseunghyeon313/post/249e3c18-1792-41cf-a978-b4ee9e06aa48/image.png)	|![](https://velog.velcdn.com/images/sinseunghyeon313/post/2c91a039-f99e-4c39-830c-c9bed06ea6fc/image.png)	|![](https://velog.velcdn.com/images/sinseunghyeon313/post/44638117-bb96-40ed-baad-0fbca8dbebf0/image.png)



## 2. 프로젝트를 진행 후 느낀 점
> 1. kakao REST API를 통해 책 정보를 받아오는 경험을 할 수 있어 좋았고, 코드베이스로 레이아웃을 구현할 수 있다는 자신감을 가질 수 있는 좋은 경험이 됬던 프로젝트였습니다.

> 2. 이전에 배웠던 부분들을 다시 복습하여 활용하고, 제 자신에게 무엇이 부족한지를 알게되어 얻어가는게 많았던 기간이였습니다.

## 3. KPT(Keep Problem Try)
### 👍 Keep
- SnapKit을 활용해 AutoLayout을 보기 편하게 작성한 점
- KingFisher를 활용해 원하는 이미지를 적은 코드로 쉽게 불러온 점
- AlamoFire를 활용해 URL Session보다 적은 코드로 kakao REST API의 데이터를 불러온 점

### 🆘 Problem
- 정해진 기간동안 시간을 나눠서 활용하지 못한 점
- SearchBar에 검색어를 입력시 가끔씩 CollectionView가 사라지는 문제점
- '최근 본 책'의 Cell을 클릭 시 원하는 상세화면으로 넘어가지 않는 문제점
- 위시리스트페이지에서 Cell을 삭제 시 밑부분에 선이 남아있는 문제점
- 
### ⏩️ Try
- MVVM패턴 완벽하게 적용시켜보기
- 검색결과 페이징처리로, 무한스크롤 구현해보기
- Then 라이브러리를 사용해보기
- RxSwift나, Combine을 사용해 적용해보기
- 위시리스트에서 전체 삭제 버튼이나, 복수 선택 후 삭제 기능 구현해보기
