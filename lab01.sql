CREATE DATABASE lab01
GO
USE lab01

CREATE TABLE Account
(
    AccountID INT IDENTITY PRIMARY KEY,
    Username VARCHAR(50),
    [Password] VARCHAR(50),
)

CREATE TABLE Album
(
    AlbumID INT IDENTITY PRIMARY KEY,
    AlbumName VARCHAR(255),
    CreatorID INT,
    CoverPhotoID INT,
    TotalViewCount INT,

    CONSTRAINT fk_Album_Account FOREIGN KEY (CreatorID) REFERENCES Account(AccountID),
    
)

CREATE TABLE Photo
(
    PhotoID INT IDENTITY PRIMARY KEY,
    PhotoName VARCHAR(255),
    PhotoLink VARCHAR(255), -- đường dẫn tuyệt đối tới photo
    PhotoUploaderID INT,
    ParentALbumID INT,
    PhotoViewCount INT,

    CONSTRAINT fk_Photo_Account FOREIGN KEY (PhotoUploaderID) REFERENCES Account(AccountID),
    CONSTRAINT fk_Photo_Album FOREIGN KEY (ParentALbumID) REFERENCES Album(AlbumID)
)

CREATE TABLE Tag
(
    TagID INT IDENTITY PRIMARY KEY,
    TagName VARCHAR(50)
)

CREATE TABLE Photo_Tag
(
    PhotoID INT,
    TagID INT,

    CONSTRAINT pk_PhoToTag PRIMARY KEY(PhotoID, TagID),
    CONSTRAINT fk_PhotoTag_Photo FOREIGN KEY (PhotoID) REFERENCES Photo(PhotoID),
    CONSTRAINT fk_PhotoTag_Tag FOREIGN KEY (TagID) REFERENCES Tag(TagID)

)

CREATE TABLE Article
(
    ArticleID INT IDENTITY PRIMARY KEY,
    Title VARCHAR(50),
    CoverPhotoID INT,
    AuthorID INT,
    ArticleViewCount INT,

    CONSTRAINT fk_Article_Photo FOREIGN KEY (CoverPhotoID) REFERENCES Photo(PhotoID),
    CONSTRAINT fk_Article_Account FOREIGN KEY (AuthorID) REFERENCES Account(AccountID)
)

CREATE TABLE Comment
(
    CommentID INT IDENTITY PRIMARY KEY,
    Content NVARCHAR(255) NOT NULL,
    ArticleID INT NOT NULL,
    CommentatorID INT,

    CONSTRAINT fk_Comment_Article FOREIGN KEY (ArticleID) REFERENCES Article(ArticleID),
    CONSTRAINT fk_Comment_Account FOREIGN KEY (CommentatorID) REFERENCES Account(AccountID)
)

ALTER TABLE Album
ADD CONSTRAINT fk_Album_Photo FOREIGN KEY (CoverPhotoID) REFERENCES Photo(PhotoID)