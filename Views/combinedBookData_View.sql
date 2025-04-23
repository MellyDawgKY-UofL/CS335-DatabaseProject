CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `student_msgand01`@`%` 
    SQL SECURITY DEFINER
VIEW `CombinedBookData` AS
    SELECT 
        `b`.`BookID` AS `BookID`,
        `b`.`Title` AS `Title`,
        `b`.`Authors` AS `Authors`,
        `r`.`avgRating` AS `average_rating`,
        `b`.`ISBN` AS `ISBN`,
        `p`.`ISBN13` AS `ISBN13`,
        `b`.`language_code` AS `language_code`,
        `b`.`num_pages` AS `num_pages`,
        `r`.`ratingsCount` AS `ratings_count`,
        `r`.`textReviewsCount` AS `text_reviews_count`,
        `p`.`PublicationDate` AS `publication_date`,
        `p`.`Publisher` AS `Publisher`
    FROM
        ((`BookInfo` `b`
        JOIN `PublisherData` `p` ON ((`b`.`ISBN` = `p`.`ISBN`)))
        JOIN `Reviews` `r` ON ((`p`.`ISBN13` = `r`.`ISBN13`)))
