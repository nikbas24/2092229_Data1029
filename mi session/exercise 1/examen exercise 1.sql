DROP DATABASE IF EXISTS Test;
CREATE database Test;
USE Test;
-- Programs Table

CREATE TABLE Programs (
    ProgramID INT PRIMARY KEY,
    ProgramName VARCHAR(255) NOT NULL
);

-- Candidates Table
CREATE TABLE Candidates (
    IUC INT PRIMARY KEY,
    FirstName VARCHAR(255) NOT NULL,
    LastName VARCHAR(255) NOT NULL,
    DateOfBirth DATE NOT NULL,
    CountryOfOrigin VARCHAR(255) NOT NULL,
    PhoneNumber VARCHAR(15) NOT NULL,
    PassportNumber VARCHAR(20) NOT NULL,
    MaritalStatus VARCHAR(20) NOT NULL,
    ProgramID INT,
    FOREIGN KEY (ProgramID) REFERENCES Programs(ProgramID)
);
-- Spouses Table
CREATE TABLE Spouses (
    IUC INT PRIMARY KEY,
    SpouseFirstName VARCHAR(255) NOT NULL,
    SpouseLastName VARCHAR(255) NOT NULL,
    SpouseDateOfBirth DATE NOT NULL,
    SpouseCountryOfOrigin VARCHAR(255) NOT NULL,
    SpousePhoneNumber VARCHAR(15) NOT NULL,
    SpousePassportNumber VARCHAR(20) NOT NULL,
    FOREIGN KEY (IUC) REFERENCES Candidates(IUC)
);
-- LanguageTestResults Table
CREATE TABLE LanguageTestResults (
    IUC INT,
    TestDate DATE,
    TestType VARCHAR(10),
    ExpressionWritten INT,
    ExpressionOral INT,
    Listening INT,
    Reading INT,
    PRIMARY KEY (IUC, TestDate, TestType),
    FOREIGN KEY (IUC) REFERENCES Candidates(IUC)
);
-- Consultants Table
CREATE TABLE Consultants (
    ConsultantID INT PRIMARY KEY,
    ConsultantName VARCHAR(255) NOT NULL,
    MaxDossiers INT NOT NULL
);
-- ConsultantDossiers Table
CREATE TABLE ConsultantDossiers (
    ConsultantID INT,
    IUC INT,
    PRIMARY KEY (ConsultantID, IUC),
    FOREIGN KEY (ConsultantID) REFERENCES Consultants(ConsultantID),
    FOREIGN KEY (IUC) REFERENCES Candidates(IUC)
);
-- Comments Table
CREATE TABLE Comments (
    CommentID INT PRIMARY KEY,
    IUC INT,
    ConsultantID INT,
    CommentText TEXT,
    CommentDate DATETIME,
    FOREIGN KEY (IUC) REFERENCES Candidates(IUC),
    FOREIGN KEY (ConsultantID) REFERENCES Consultants(ConsultantID)
);