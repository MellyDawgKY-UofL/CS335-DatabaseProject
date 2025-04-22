CREATE TABLE Reviews (
    ReviewsID INT PRIMARY KEY,
    ISBN13 BIGINT,
    avgRating DECIMAL(3,2),
    ratingsCount INT,
    textReviewsCount INT
);
