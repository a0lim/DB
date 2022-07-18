## 1. 데이터 모델링과 데이터 모델의 개념
* 데이터 모델링(data modeling)
: 현실 세계에 존재하는 데이터를 컴퓨터 세계의 데이터베이스로 옮기는 변환 과정
    - 추상화(abstraction)을 통해 대상에 관해 중요한 데이터를 찾아 데이터베이스에 저장
    - 데이터 모델링 = 개념적 모델링 + 논리적 모델링
      + 개념적 모델링(conceptual modeling): 중요 데이터를 추출하여 개념 세계로 옮기는 작업
      + 논리적 모델링(logical modeling): 개념 세계의 데이터를 데이터베이스에 저장할 구조를 결정하고 이 구조로 표현하는 작업

![4-3](https://user-images.githubusercontent.com/104348646/179453011-f822f926-8fbb-411b-9bb7-e678090cff64.jpg)

* 데이터 모델(data model)
: 데이터 모델링의 도구
    - 데이터 모델 = 개념적 데이터 모델 + 논리적 데이터 모델
    - 개념적 데이터 모델
    : 현실 세계를 개념적 데이터 모델링하여 데이터 베이스의 개념적 구조로 표현하는 도구
      + 구성된 요소를 표현
    - 논리적 데이터 모델
    : 개념적 구조를 논리적 데이터 모델링하여 데이터베이스의 논리적 구조로 표현하는 도구
      + 저장할 모습을 표현
    - 데이터 모델 = 구조(data structure), 연산(operation), 제약조건(constraint)

![4-4](https://user-images.githubusercontent.com/104348646/179453158-6e1f3580-813e-42f2-9487-ad533b4aafdd.jpg)

## 2. 개체-관계 모델(E-R Model = Entity-Relationship Model)  
: 현실 세계를 개체(entity)와 개체 간의 관계(relationship)를 표현한 개념적 데이터 모델  

* 개체-관계 다이어그램(E-R Diagram = Entity-Relationship Diagram)  
: 개체-관계 모델을 이용해 개념적으로 모델링하여 그림으로 표현한 것  

![4-6](https://user-images.githubusercontent.com/104348646/179454746-0295727c-1539-4e21-b07c-f3447fec2abc.jpg)

### 2-1 개체(Entity)
: 저장할 만한 가치가 있는 구별되는 중요 데이터를 가지고 있는 사람이나 사물, 개념 등  

- 다른 개체와 구별되는 이름을 가짐  
- 속성(각 개체만의 고유한 특성이나 상태)를 하나 이상 가짐  

* 개체 타입(Entity type)  
: 개체를 고유의 이름과 속성들로 정의한 것  

![4-5](https://user-images.githubusercontent.com/104348646/179453162-4461a49e-7e13-4894-a9b8-e0506c3db004.jpg)

* 개체 인스턴스(entity Instance) (= 개체 어커런스 = entity occurrence)  
: 개체를 구성하고 있는 속성이 실체 값을 가짐으로써 실체화된 개체  
    - 객체 타입을 구성하는 각 속성에 구체적인 값을 가지는 개체 인스턴스가 여러 개 존재 가능  

* 개체 집합(entity set)  
: 개체 인스턴스들의 모임  
    - 데이터베이스에서 실제로 저장하고 관리  

### 2.2 속성(attribute)  
: 개체가 가지고 있는 고유의 특성  
- 일반적으로 의미 있는 데이터의 가장 작은 논리적 단위로 인식  

![4-7](https://user-images.githubusercontent.com/104348646/179467776-e1bb1106-eccb-423d-a3e1-620151db7bc7.jpg)

![4-8](https://user-images.githubusercontent.com/104348646/179467145-8e369b77-35c2-4a7a-9700-fa698ec06e34.jpg)

#### 2.2.1 단일 값 속성과 다중 값 속성  
* 단일 값 속성(single-valued attribute)  
: 특정 개체를 구성하는 속성의 값이 1개  

* 다중 값 속성(multi-valued attribute)  
: 특정 개체를 구성하는 속성의 값이 여러 개  

![4-9](https://user-images.githubusercontent.com/104348646/179453166-d3aa8841-6733-4eb7-8fe9-c24d0ee00876.jpg)

#### 2.2.2 단순 속성과 복합 속성  
* 단순 속성(simple attribute)  
: 의미를 더 분해할 수 없는 속성  
    - 단순 속성의 값은 1개의 의미를 가짐  
* 복합 속성(composite attribute)  
: 의미를 분해할 수 있는 속성  
    - 복합 속성의 값은 여러 개의 의미를 가짐  
	  - 단순 속성이 여러 개 모여 만들어진 속성  
	  - ex) 주소 -> 도, 시, 동, 우편번호  

![4-10](https://user-images.githubusercontent.com/104348646/179469087-91f5ab48-cc13-428d-88aa-51f11fbdd1b9.jpg)

#### 2.2.3 유도 속성(derived attribute)  
: 값이 별도로 저장되는 것이 아니라 기존의 다른 속성의 값에서 유도되어 결정되는 속성  
    - 유도속성: 필요할 때마다 계산되므로 값을 따로 저장할 필요가 없음  
    - cf) <-> 저장 속성: 실제로 값을 저장  

![4-11](https://user-images.githubusercontent.com/104348646/179470979-67161ac5-6bac-480e-b063-b310a0107dea.jpg)

#### 2.2.4 널 속성(null attribute)  
: 널 값이 허용되는 속성  

* 널(null)  
: 아직 결정되지 않았거나, 모르는 값(unknown value)  
    - cf) 공백(blank), 0 과는 구별됨(다름)  

#### 2.2.5 키 속성(key attribute)  
: 개체 집합에 존재하는 각 개체 인스턴스들을 식별하는 데 사용  
  - 키를 두 이상의 속성들로 구성할 수 있음  
  - 키 속성의 값이 개체 인스턴스마다 달라서 키 값으로 개체 인스턴스를 식별할 수 있어야 함  

![4-12](https://user-images.githubusercontent.com/104348646/179471003-742a43ea-5884-4e88-90a9-7452a158a980.jpg)

### 2.3 관계(relationship)  
: 개체와 개체가 맺고 있는 의미 있는 연관성  
- 대응 관계(correspondence), 매핑(mapping)을 의미  

![4-13](https://user-images.githubusercontent.com/104348646/179471007-8b8ddfb5-9f10-4fb8-b091-8349cdbdef0b.jpg)

#### 2.3.1 관계의 유형
* 관계에 참여하는 개체 타입의 수를 기준으로 한 분류: 이항 관계, 삼항 관계, 순환 관계

* 매핑 카디널리티(mapping cardinality)  
: 관계를 맺는 두 개체 집합에서 각 개체 인스턴스가 연관성을 맺고 있는 상대 개체 집합의 인스턴스 개수  
    - 매핑 카디널리티를 기준으로 한 분류: 일대일(1:1), 일대다(1:n), 다대다(n:m)  

#### 2.3.2 관계의 참여 특성
* 필수적 참여(= 전체 참여)  
: 개체의 모든 개체 인스턴스가 관계에 반드시 참여  
    - cf) <-> 선택적 참여(=부분 참여)  
    - 개체 관계의 참여 특성은 DB 구축 후에 새로운 개체 인스턴스를 삽입하거나, 기존 개체 인스턴스를 삭제/변경할 때 제약 사항으로 활용  

![4-17](https://user-images.githubusercontent.com/104348646/179453169-c126a310-2288-4f90-81c4-604676ea232c.jpg)

#### 2.3.3. 관계의 종속성
* 존재 종속(existence dependence)  
: 개체 B가 개체 A에 종속되어 있다.  
    = 개체 B가 독자적으로는 존재할 수 없고, 다른 개체 A의 존재 여부에 의존적이다.  
    = 개체 A가 존재해야 개체 B가 존재할 수 있다.  
    = 개체 A가 삭제되면 개체 B도 함께 삭제되어야 한다.  

* 오너 개체(owner entity)
: 다른 개체의 존재 여부를 결정하는 개체(개체 A가 해당)

* 약한 개체(weak entity)
: 다른 개체의 존재 여부에 의존적인 개체(개체 B가 해당)
  	- 오너 개체와 약한 개체는 일반적으로 일대다의 관계를 가짐
  
* 구별자(delimiter) (=부분키 = partial key)
: 약한 개체를 구별하는 역할을 하는 속성

![4-18](https://user-images.githubusercontent.com/104348646/179453170-fe50058d-658b-4b66-b4c6-a00a8b3da2a8.jpg)

#### 2.4 E-R 다이어그램
- 개체: 사각형
- 개체 간의 관계: 마름모
- 개체나 관계의 속성: 타원
- 각 요소를 연결하는 링크: 연결선
- 일대일, 일대다, 다대다 관계: 레이블로 표기

- ex)
![4-19](https://user-images.githubusercontent.com/104348646/179453172-1ee60ab7-3121-45ec-b95a-b8f083bb3845.jpg)





