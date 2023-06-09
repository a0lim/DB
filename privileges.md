* 외부 사용자가 접근할 수 있도록 권한 부여
  1. 외부 사용자가 사용할 User 생성
    - 참고: https://we-always-fight-with-code.tistory.com/6
  2. 권한 부여
    ```
    # MySQL
    
    ## 모든 권한을 부여한 ROOT 계정 생성(임시)
    CREATE USER 'ROOT'@'%' IDENTIFIED BY 'ROOT';
    GRANT ALL PRIVILEGES ON *.* TO 'ROOT'@'%' WITH GRANT OPTION;
    
    ## 외부 사용자가 사용할 User에 권한 부여
    GRANT ALL PRIVILEGES ON [TABLE명].* TO [USER]@'%' WITH GRANT OPTION;
    ```
    - 참고: https://dzzienki.tistory.com/22
  3. ROOT 계정 삭제
    - 외부로 노출된 DB의 경우 위험함
