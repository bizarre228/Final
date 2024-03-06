CREATE TABLE IF NOT EXISTS Users (
    "Id" INTEGER PRIMARY KEY AUTOINCREMENT,
    "Email" TEXT NOT NULL UNIQUE,
    "Username" TEXT NOT NULL UNIQUE,
    "Password" TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS Session(
    "Id" INTEGER PRIMARY KEY AUTOINCREMENT,
    "Token" VARCHAR NOT NULL,
    "ExpDate" TIMESTAMP NOT NULL,
    "UserId" INTEGER NOT NULL,
    FOREIGN KEY ("UserId") REFERENCES Users("Id")
);

CREATE TABLE IF NOT EXISTS Post(
    "Id" INTEGER PRIMARY KEY AUTOINCREMENT,
    "Name" TEXT NOT NULL,
    "Text" TEXT NOT NULL,
    "CreationTime" TIMESTAMP,
    "UserId" INTEGER NOT NULL,
    "ImagePath" TEXT NOT NULL,
    FOREIGN KEY ("UserId") REFERENCES Users("Id")
);

CREATE TABLE IF NOT EXISTS Category(
    "Id" INTEGER PRIMARY KEY AUTOINCREMENT,
    "Name" TEXT NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS PostCategory (
    "PostId" INTEGER,
    "CategoryId" INTEGER,
    FOREIGN KEY ("PostId") REFERENCES Post("Id"),
    FOREIGN KEY ("CategoryId") REFERENCES Category("Id"),
    PRIMARY KEY ("PostId", "CategoryId")
);

CREATE TABLE IF NOT EXISTS Comment(
    "Id" INTEGER PRIMARY KEY AUTOINCREMENT,
    "UserId" INTEGER NOT NULL,
    "PostId" INTEGER NOT NULL,
    "Text" TEXT NOT NULL,
    FOREIGN KEY ("UserId") REFERENCES Users("Id"),
    FOREIGN KEY ("PostId") REFERENCES Post("Id")
);

CREATE TABLE IF NOT EXISTS Grade(
    "Id" INTEGER PRIMARY KEY AUTOINCREMENT,
    "UserId" INTEGER NOT NULL,
    "PostId" INTEGER,
    "CommentId" INTEGER,
    "GradeValue" INTEGER CHECK(GradeValue IN (-1, 1)),
    FOREIGN KEY ("UserId") REFERENCES Users("Id"),
    FOREIGN KEY ("PostId") REFERENCES Post("Id"),
    FOREIGN KEY ("CommentId") REFERENCES Comment("Id")
);