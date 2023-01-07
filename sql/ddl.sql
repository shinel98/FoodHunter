/** table 관리를 위해 테이블 생성 쿼리를 작성하고 관리하는 파일 **/
create table review_table
(
    reviewId BIGINT(20) NOT NULL AUTO_INCREMENT,
    storeId BIGINT(20) NOT NULL,
    userId BIGINT(20) NOT NULL,
    userName VARCHAR(30) NOT NULL,
    score INT NOT NULL,
    photo VARCHAR(200) NULL,
    regiDate TIMESTAMP NOT NULL,
    reviewContent VARCHAR(3000) NOT NULL,
    PRIMARY KEY (reviewId)
);