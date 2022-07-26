## 1. 관계 데이터 연산의 개념

* 데이터 연산(relationship data operation)  
: 원하는 데이터를 얻기 위해 릴레이션에 필요한 처리 요구를 수행(데이터 언어의 역할)
  - 종류: 관계 대수, 관계 해석

* 관계 대수(relational algebra)  
: 원하는 결과를 얻기 위해 데이터의 처리 과정을 순서대로 기술하는 절차 언어(procedural language)
  - 데이터 처리 기능과 표현력에서 관계 대수와 관계해석의 능력은 동일
  - 언어 유용성 검증 단계에서 관계 대수와 관계 해석으로 모든 질의가 가능하면 관계적으로 완전(relational complete)하다고 판단

* 관계 해석(relational calculus)  
: 원하는 결과를 얻기 위해 처리를 원하는 데이터가 무엇인지만 기술하는 비절차 언어(nonprocedural language)
  - 사용자의 입장에서 관계 대수보다 더 편리함을 느낄 수 있음

* 질의(query)  
: 데이터에 대한 처리 요구

## 2. 관계 대수
* 폐쇄적 특성(closure property)  
: 릴레이션에 연산자를 적용해 얻은 결과도 릴레이션임

![image](https://user-images.githubusercontent.com/104348646/180705552-5502fcff-b2cd-4f0c-b1cf-42879308b293.png)  

![image](https://user-images.githubusercontent.com/104348646/180705575-040e5cb3-d390-4089-b311-07fc9ec68730.png)  

![image](https://user-images.githubusercontent.com/104348646/180705930-a105869d-bed4-4bee-878d-6d19643938bf.png)    

### 2.2 일반 집합 연산자
* 제약 조건  
  - 1. 일반 집합 연산자는 연산을 위해 피연산자가 두 개 필요하다
  - 2. 합집합, 교집합, 차집합은 피연산자인 두 개의 릴레이션이 합병 가능 해야 한다

* 합병 가능(union-compatible)  
  - 조건 1. 두 릴레이션의 차수가 같다.  
  = 두 릴레이션은 속성 개수가 같다  
  - 조건 2. 두 개의 릴레이션에서 서로 대응되는 속성의 도메인이 같다.  
  = 도메인이 같으면 속성의 이름은 달라도 된다  
ex) 대응되는 릴레이션의 직위 속성이 INT, CHAR(20)으로 다른 경우 (X)  
ex) 대응하는 속성이 이름은 다르지만 도메인이 같다 (O)  

#### 2.2.1 합집합(union)
: R∪S

![image](https://user-images.githubusercontent.com/104348646/180704035-0f377a3d-67eb-4781-a781-a49edf3346f7.png)

* 차수  
: 결과 릴레이션 = 피연산자 릴레이션 R = 피연산자 릴레이션 S

* 카디널리티(튜플의 전체 개수)  
: 결과 릴레이션 ≤ 릴레이션 R + 릴레이션 S

* 특징  
  - 교환적 특징: R∪S = S∪R  
  - 결합적 특징 : (R∪S)∪T = R∪(S∪T)

#### 2.2.2 교집합(intersection
: R∩S

![image](https://user-images.githubusercontent.com/104348646/180704068-9f2fd9c7-bc38-4d4d-9f58-8ecca38be2d9.png)

* 차수  
: 결과 릴레이션 = 릴레이션 R = 릴레이션 S

* 카디널리티  
: 결과 릴레이션 ≤ 릴레이션 R, 릴레이션 S

* 특징  
  - 교환적 특징 : R∩S = S∩R  
  - 결합적 특징 : (R∩S ∩T = R∩(S∩T)  

#### 2.2.3 차집합(difference)
: R–S, S–R

![image](https://user-images.githubusercontent.com/104348646/180704109-0d423233-40d3-4b5d-922b-a958ae306881.png)

* 차수  
: 결과 릴레이션 = 릴레이션 R = 릴레이션 S

* 카디널리티  
: 결과 릴레이션 ≤ 릴레이션 R, 릴레이션 S

* 특징  
  - 피연산자의 순서에 따라 결과 릴레이션이 달라짐
  - 교환적 특징 (X) : R–S ≠ S–R
  - 결합적 특징 (X) : R–(S–T) ≠ (R–S)-T

#### 2.2.4 카디션 프로덕트(cartesian product)
: R✕S  
: 릴레이션 R에 속한 각 튜플과 릴레이션 S에 속한 각 튜플을 모두 연결  

![image](https://user-images.githubusercontent.com/104348646/180704132-ef488f63-a639-4888-ab84-6d23dac39ee9.png)

* 릴레이션의 속성 표기법  
: ‘릴레이션이름.속성이름’

* 차수  
: 결과 릴레이션 = 릴레이션 R + 릴레이션 S

* 카디널리티  
: 결과 릴레이션 = 릴레이션 R ✕ 릴레이션 S

* 특징  
  - 교환적 특징 : R✕S = S✕R  
  - 결합적 특징 : (R✕S) ✕T = R✕(S✕T)

### 2.3 순수 관계 연산자  
: 릴레이션의 구조와 특성을 이용  

#### 2.3.1 셀렉트(select)
: σ_조건식(릴레이션)  
: 릴레이션 where 조건식  

* 수평적 부분 집합(horizontal subset)을 생성   
: 결과 릴레이션은 주어진 릴레이션을 수평으로 절단한 것과 같음

* 조건식(=비교식) (=프레디킷 =predicate)  
: 속성과 상수의 비교나 다른 속성들 간의 비교로 표현
  - 조건식을 속성과 상수의 비교로 구성하는 경우
  : 상수의 데이터 타입이 속성의 도메인과 일치해야 함
  - 조건식을 다른 속성들 간의 비교로 구성하는 경우
  : 속성들의 도메인이 같아야 함

* 비교 연산자
  - ∧ (and): 조건을 모두 만족해야 하는 경우
  - ∨ (or): 조건들 중 하나만 만족해도 되는 경우
  - ￢ (not): 조건을 만족하지 않는 경우만 검색

ex) 고객 where 등급 = ‘gold’ and 적립금 >= 4500 (-> 조건을 모두 만족해야 함)  

![image](https://user-images.githubusercontent.com/104348646/180704189-dad3bfc4-1128-426d-80c0-39887a4c3952.png)

* 특징  
  - 교환적 특징: σ_조건식1(σ_조건식2(릴레이션)) = σ_조건식2(σ_조건식1(릴레이션)) = σ_(조건식1 ∧ 조건식2)(릴레이션)

#### 2.3.2 프로젝트(project)
: π_속성리스트(릴레이션)
: 릴레이션[속성리스트]

* 수직적 부분 집합(vertical subset)  
: 결과 릴레이션이 주어진 릴레이션의 일부 열로만 구성됨

ex) 릴레이션[고객아이디, 직업, 적립금]  

![image](https://user-images.githubusercontent.com/104348646/180704255-43d5e275-b049-43f2-a080-d0df8d912bfb.png)

#### 2.3.3 조인(join)  
: 릴레이션1 ⋈ 릴레이션2  
: 두 릴레이션이 공통으로 가지고 있는 속성 -> 두 릴레이션이 관계가 있음을 나타냄  
: 결과 릴레이션은 피연산자 릴레이션에서 조인 속성의 값이 같은 튜플만 연결하여 만들어진 새로운 튜플을 포함  

* 자연 조인(natural join)  
: ⋈_N  

![image](https://user-images.githubusercontent.com/104348646/180704281-394f4c06-d2eb-4c65-aece-29559894d392.png)  

![image](https://user-images.githubusercontent.com/104348646/180704330-8bdae280-fed7-4287-8f46-a656f236566c.png)  

* 세타 조인(θ-join)  
: 릴레이션1 ⋈_AθB 릴레이션2  
: 주어진 조건을 만족하는 두 릴레이션의 모든 튜플을 연결한 새로운 튜플로 결과를 구성  

* θ: 비교 연산자(>, ≥, <, ≤, ≠)  
  - A, B는 같은 도메인으로 정의되어야 함  

* 차수  
: 결과 릴레이션 = 릴레이션 A + 릴레이션 B  

* 릴레이션의 속성 표기법  
: ‘릴레이션이름.속성이름’  

* 동일 조인(equi-join)  
: θ 연산자가 ‘=’  
: 동일 조인의 결과 릴레이션 – 중복된 속성 = 자연 조인의 결과 릴레이션  

![image](https://user-images.githubusercontent.com/104348646/180704353-bc1c6241-6f02-4168-a1e8-a9ad0aca7494.png)

#### 2.3.4 디비전(division)  
: R ÷ S    
: 릴레이션 S의 모든 튜플과 관련 있는 릴레이션 R의 튜플로 결과 릴레이션을 구성  

* 조건  
: 릴레이션 R이 릴레이션 S의 모든 속성을 포함하고 있어야 한다.  
단, 릴레이션 S의 모든 속성과 이름이 같은 속성을 릴레이션 R이 포함할 필요는 없다.

![image](https://user-images.githubusercontent.com/104348646/180704392-c4598b30-50a0-462d-a37b-d2cb9b6cd565.png)  

![image](https://user-images.githubusercontent.com/104348646/180704434-72483281-f886-4baf-899b-c726283409a8.png)

### 2.5 확장된 관계 대수 연산자
* 종류  
  - 세미 조인
  - 외부 조인

#### 2.5.1 세미 조인(semi-join)
: R ⋉ S
: 릴레이션 S의 조인 속성으로만 구성한 릴레이션을 릴레이션 R에 자연조인

![image](https://user-images.githubusercontent.com/104348646/180704547-f87b1825-b704-4111-bf20-883b1ca5711f.png)

* 특징  
  - 교환적 특성 (X): R ⋉ S ≠ S ⋉ R
  - 검색에 불필요한 속성을 미리 제거하여 조인 연산의 비용을 절감

#### 2.5.2 외부 조인(outer-join)
: R ⋈^+ S  
: 자연 조인 시, 조인 속성 값이 같지 않았던 튜플도 모두 결과 릴레이션에 포함  

![image](https://user-images.githubusercontent.com/104348646/180704621-7ddab3f4-8c71-4d7a-89d4-ae699fb6294a.png)
