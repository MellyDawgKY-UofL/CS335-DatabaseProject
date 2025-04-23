CREATE DEFINER=`student_msgand01`@`%` PROCEDURE `GetCombinedBookData`()
BEGIN
    SELECT
        b.BookID,
        b.Title,
        b.Authors,
        r.AvgRating AS average_rating,
        b.ISBN,
        p.ISBN13,
        b.language_code,
        b.num_pages,
        r.RatingsCount AS ratings_count,
        r.TextReviewsCount AS text_reviews_count,
        p.PublicationDate AS publication_date,
        p.Publisher
    FROM
        BookInfo b
    JOIN
        PublisherData p ON b.ISBN = p.ISBN
    JOIN
        Reviews r ON p.ISBN13 = r.ISBN13;
END
