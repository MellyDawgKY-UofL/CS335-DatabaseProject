CREATE TABLE BookInfo (
    BookID INT PRIMARY KEY AUTO_INCREMENT,
    Title VARCHAR(255),
    Authors VARCHAR(255),
    ISBN VARCHAR(50),
    PublisherID INT,
    language_code VARCHAR(10),
    num_pages INT,
    FOREIGN KEY (ISBN) REFERENCES PublisherData(ISBN),
    INDEX idx_authors (Authors),
    INDEX idx_language (language_code),
    INDEX idx_publisher (PublisherID)
);
