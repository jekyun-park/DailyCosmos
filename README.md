# DailyCosmos
NASA API를 활용하여 하루 한장의 천체 사진과 그 설명을 보여주는 앱



## 프로젝트 소개

어렸을 때는 꽤 자주 하늘을 올려다 보면서 별과 달을 구경했던 것 같은데 바쁘디 바쁜 현대사회에서는

휴대폰과 모니터만 보고 있어도 하루가 금새 지나가 버려 그럴 시간이 없습니다.

그래서 `천체 사진을 앱에서 볼 수 있게 만들어 보자!` 라는 생각에서 개발하게 되었습니다.



## 유의사항

현재 API KEY가 숨겨져 있는 상태입니다. 실행을 원하시는 분은

- [NASA APIs](https://api.nasa.gov/index.html#browseAPI) 에서 API 키 발급

- [Naver Developers](https://developers.naver.com/main/) 에서 Application > 내 애플리케이션에 앱 등록

- 위에서 발급받은 NASA API KEY와 NAVER Developers에서 발급받은 Client ID, Client Secret을 APIsInfo.plist 에서 등록 

이후 실행해보실 수 있습니다.



## 기능

- DatePicker에서 날짜를 선택시 해당 날짜에 해당하는 천체 사진과 영문 설명을 제공
- 번역 버튼 클릭시 파파고 API를 사용하여 한국어로 번역



## 스크린샷

<p align="center" width="100%">

<img src="https://user-images.githubusercontent.com/19788294/205105768-6b69e567-d064-484f-ac29-2d577a2fe04d.png" width="30%">

<img src="https://user-images.githubusercontent.com/19788294/205106005-0f913ff6-b119-42f2-bbe3-acd09d8cf6b6.png" width="30%">

<img src ="https://user-images.githubusercontent.com/19788294/205106030-6a9bc4b5-1a22-479e-8852-fed8346f4712.png" width=30%>

</p>


## 사용기술

- `Swift`
-  `SwiftUI`



## 보완할 점

- [ ] 이미지 캐싱을 통한 로딩 속도 향상
- [ ] SwiftUI의 DatePicker가 아닌 UIKit의 UICalenderView를 사용하여 달력부분 재구성
- [ ] 디자인 패턴을 고민해보고 리팩토링



## 배운 점

- URLSession과 Open API를 활용한 네트워킹
- async, await을 활용한 비동기 프로그래밍 방법





