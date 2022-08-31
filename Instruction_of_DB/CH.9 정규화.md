## 1. 정규화의 개념과 이상 현상
### 1.1 정규화의 개념
* 정규화(normalization)
    - DB 설계 이후 설계 결과물을 검증하기 위해 사용
    - 이상 현상이 발생하지 않도록, 릴레이션을 관련 있는 속성들로만 구성하기 위해 릴레이션을 분해(decomposition)하는 과정
* 이상현상(anomaly)  
: 불필요한 데이터 중복으로 인해 릴레이션에 대한 데이터의 삽입/수정/삭제 연산을 수행할 때 발생하는 부작용
    - 관련이 없는 데이터(속성)들을 하나의 릴레이션에 모아두고 있기 때문에 발생
### 1.2 이상 현상의 종류

#### 1.2.1 삽입 이상(insertion anomaly)
: 릴레이션에 새 데이터를 삽입하기 위해 원치 않는 불필요한 데이터도 함께 삽입해야하는 문제

#### 1.2.2 갱신 이상(update anomaly)
: 릴레이션의 중복된 튜플들 중 일부만 수정하여 데이터가 불일치하는 문제

#### 1.2.3 삭제 이상(delete anomaly)
: 릴레이션에서 튜플을 삭제하면 필요한 데이터까지 함께 삭제하여 데이터가 손실되는 연쇄 삭제 현상
  
![image](https://user-images.githubusercontent.com/104348646/187610085-366d6378-0ffa-4f98-987b-5ba84f95af04.png) 
  
### 1.3 정규화의 필요성
* 함수적 종속성(FD: Function Dependency)  
: 정규화 과정에서 고려해야 하는 속성들 간의 관련성  
    - 일반적으로 릴레이션에 함수적 종속성이 하나 이상 존재하도록 정규화를 통해 릴레이션을 분해  

## 2. 함수 종속
* 하나의 릴레이션을 구성하는 속성들의 부분 집합을 X와 Y라고 할 때, 어느 시점에서든 릴레이션 내의 모든 튜플을 대상으로 한 X 값에 대한 Y 값이 항상 하나임
    - X -> Y로 표현  
    ![image](https://user-images.githubusercontent.com/104348646/187610123-e7255fef-fb1f-45d7-bdc5-abe844ad4c7f.png)  
    - 현재 시점에 릴레이션에 포함된 속성 값만이 아닌 속성 자체가 가지고 있는 특성과 의미를 기반으로 판단해야 함
    - 결정자
        + 일반적으로 튜플의 기본키와 후보키
        + 이외에 속성 Y 값을 유일하게 결정하는 속성 X
        + 릴레이션 내의 여러 튜플에서 속성 X값이 같으면, 이 값과 연관된 속성 Y 값도 모두 같아야 함
* 예시 1  
![image](https://user-images.githubusercontent.com/104348646/187610149-2bbc9200-61df-4360-9a11-36229fc10b77.png)  
```
# 함수 종속 관계

고객아이디 -> 고객이름
고객아이디 -> 등급

or

고객아이디 -> (고객이름, 등급)
```
![image](https://user-images.githubusercontent.com/104348646/187610173-85c6ff5b-7e40-4edf-a8eb-d9f47e5bf107.png)

* 완전 함수 종속(FFD: Full Functional Dependency)
: 릴레이션에서 속성 집합 Y가 속성 집합 X에 함수적으로 종속되어 있지만, 속성 집합 X의 전체가 아닌 일부분에는 종속되지 않음
    - 일반적인 함수 종속을 의미
* 부분 함수 종속(PFD: Partial Function Dependency)
: 속성 집합 Y가 속성 집합 X의 전체가 아닌 일부분에도 함수적으로 종속됨
    - 결정자가 여러 개의 속성들로 구성됨

* 함수 종속의 예시  
![image](https://user-images.githubusercontent.com/104348646/187610200-d8f0747a-0b3c-40d8-8f58-3a9e9eb1b305.png)
```
# 함수 종속 관계

{고객아이디, 이벤트번호} -> 당첨여부 ## {고객아이디, 이벤트번호} 속성 집합에 완전 함수 종속
{고객아이디, 이벤트번호} -> 고객이름  ## 이중 종속됨 -> {고객아이디, 이벤트번호} 속성 집합에 부분 함수 종속
고객아이디 -> 고객이름
```
![image](https://user-images.githubusercontent.com/104348646/187610229-4017e22b-485e-4207-86fa-c1a3c3672948.png)

## 3. 기본 정규형과 정규화 과정
### 3.1 정규화의 개념과 종류
* 정규형(NF: Normal Form)
: 릴레이션이 정규화된 정도를 표현한 것

* 종류
    - 기본 정규형
        + 제 1 정규형
        + 제 2 정규형
        + 제 3 정규형
        + 보이스/코드 정규형
    - 고급 정규형
        + 제 4 정규형
        + 제 5 정규형
* 정규형에 속한다
: 릴레이션이 특정 정규형의 제약조건을 만족한다
    - 정규형의 차수가 높아질수록 요구되는 제약조건이 많고 엄격해짐
    - 차수가 높은 정규형에 속하는 릴레이션일수록 데이터 중복이 줄어 데이터 중복에 의한 이상 현상이 발생하지 않음
    - 릴레이션의 특성을 고려해서 적합한 정규형을 선택
        + 모든 릴레이션이 제 5 정규형에 속해야하는 것은 아님
        + 대부분 기본 정규형에 속하도록 정규화 함


### 3.2 제 1 정규형(1NF: First Normal Form)
```
릴레이션에 속한 모든 속성의 도메인이 원자 값(atomic value)로만 구성되어 있으면 제 1 정규형에 속한다
```
* 원자 값
: 릴레이션에 속한 모든 속성이 더는 분해되지 않는 값
* 튜플마다 속성 값을 하나씩만 포함하도록 분해햐여, 모든 속성이 원자 값을 가지도록 함

![image](https://user-images.githubusercontent.com/104348646/187610253-c3ae232e-7141-4596-bfd3-72589d1f741a.png)  
![image](https://user-images.githubusercontent.com/104348646/187610407-a7f72966-6f2d-4755-a0d9-d64b3244ded2.png)  
![image](https://user-images.githubusercontent.com/104348646/187610516-dbf27f28-5ca9-4974-998f-e774fb718da7.png)  
 
* 불필요한 데이터 중복으로 인해 이상 현상 발생  
![image](https://user-images.githubusercontent.com/104348646/187610551-27494842-9ac7-4876-be3a-406dc5e3fca6.png) 

### 3.3 제 2 정규형(2NF: Second Normal Form)
```
릴레이션이 제 1 정규형에 속하고, 기본키가 아닌 모든 속성이 기본키에 완전 함수 종속되면 제 2 정규형에 속한다
```
* 릴레이션을 분해하는 정규화 과정
    - 부분 함수 종속을 제거
    - 모든 속성을 기본키에 완전 함수 종속되게 함  
![image](https://user-images.githubusercontent.com/104348646/187610667-3e8bb28b-91df-49b9-8754-335e23acf6af.png)  
![image](https://user-images.githubusercontent.com/104348646/187610716-7602d783-04ad-46a6-92bf-67f5daa28853.png)  
![image](https://user-images.githubusercontent.com/104348646/187610762-f7ac4e7e-e37d-4934-bcc9-354a836a1186.png)  
  
### 3.4 제 3 정규형(3NF: Third Normal Form)
```
릴레이션이 제 2 정규형에 속하고, 기본키가 아닌 모든 속성이 기본키에 이행적 함수 종속이 되지 않으면 제 3 정규형에 속한다
```
* 이행적 함수 종속(transitive FD)  
: 릴레이션을 구성하는 세 개의 속성 집합 X, Y, Z에 대해 함수 종속 관계 X -> Y와 Y -> Z가 존재하면 논리적으로 X -> Z가 성립함  
![image](https://user-images.githubusercontent.com/104348646/187611073-b4c1f872-89ad-4b19-9b98-d6f70e9b0cf2.png)  
*  이행적 함수 종속되지 않도록 릴레이션을 분해  
    - 일반적으로, 함수 종속 관계의 의미를 유지하도록 X와 Y 속성 집합의 릴레이션과 Y와 Z 속성의 집합 릴레이션으로 분해  
![image](https://user-images.githubusercontent.com/104348646/187611039-e2e9ea4c-23be-4b4b-8367-85a3aa9a76ee.png)  
![image](https://user-images.githubusercontent.com/104348646/187611014-67dd98d3-7e57-48f6-a6ed-a5c57eaff62b.png)  
  
### 3.5 보이스/코드 정규형(BCNF: Boyce/Codd Normal Form) (= string 3NF)
```
릴레이션의 함수 종속 관계에서 모든 결정자가 후보키이면 보이스/코드 정규형에 속한다
```
* 릴레이션에 여러 개의 후보키가 존재하는 경우에 발생하는 이상 현상을 해결
    - 제 3 정규형보다 더 엄격한 제약 조건을 제시

* 보이스/코드 정규형에 속하지 않는 예시
    - 삽입/갱신/삭제 이상 현상 발생  
![image](https://user-images.githubusercontent.com/104348646/187611111-75d548e7-9b2e-4065-be87-688806956064.png)  

* 보이스/코드 정규형에 속하는 예시
    - 고객담당강사 릴레이션
        + 고객아이디, 담당강사 번호 속성의 종속 관계 삭제
        + 기본키: {고객아이디, 담당강사번호}
    - 강좌담당 릴레이션
        + 담당강사번호 -> 인터넷강좌
        + 기본기(+ 후보키) -> 담당강사번호
    - 후보키가 아닌 결정자가 존재하지 않음  
![image](https://user-images.githubusercontent.com/104348646/187611269-5e2bb253-1ef3-4872-bda5-946ea189c0de.png)  
![image](https://user-images.githubusercontent.com/104348646/187611217-741550b0-ecf1-4421-9d90-364af242f4b6.png)  

### 3.6 제 4 정규형과 제 5 정규형
* 제 4 정규형
```
릴레이션이 보이스/코드 정규형을 만족하면서, 함수 종속이 아닌 다치 종속(MVD: MultiValued Dependency)를 제거하면 제 4 정규형에 속한다
```
* 제 5 정규형
```
릴레이션이 제 4 정규형을 만족하면서 후보키를 통하지 않는 조인 종속(JD: Join Dependency)를 제거하면 제 5 정규형에 속한다
```
### 3.7 정규화 과정 정리  
![image](https://user-images.githubusercontent.com/104348646/187611291-0b535b45-2534-4858-888c-caaa4436cb2a.png)  
