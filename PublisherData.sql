USE G8;

CREATE TABLE PublisherData (
    PublisherID INT AUTO_INCREMENT PRIMARY KEY,
    Publisher VARCHAR(255),
    ISBN VARCHAR(50) UNIQUE,
    ISBN13 VARCHAR(50),
    PublicationDate DATE,
    INDEX idx_pubdate (PublicationDate),
    INDEX idx_isbn13 (ISBN13)
);
