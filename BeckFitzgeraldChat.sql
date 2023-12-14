USE BeckFitzgeraldChat;

CREATE TABLE Users (
    UserID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100),
    DateOfBirth DATE,
    SafePhoneNumber VARCHAR(15),
    SafeEmail VARCHAR(100),
    INDEX(Name)
);

CREATE TABLE ChatSessions (
    SessionID INT AUTO_INCREMENT PRIMARY KEY,
    UserID INT,
    StartTime TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    EndTime TIMESTAMP NULL,
    Status VARCHAR(50),
    INDEX(StartTime),
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

CREATE TABLE Messages (
    MessageID INT AUTO_INCREMENT PRIMARY KEY,
    SessionID INT,
    MessageText TEXT,
    TimeStamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    INDEX(TimeStamp),
    FOREIGN KEY (SessionID) REFERENCES ChatSessions(SessionID)
);

CREATE TABLE Priority (
    PriorityID INT AUTO_INCREMENT PRIMARY KEY,
    SessionID INT,
    PriorityLevel TINYINT,  
    FOREIGN KEY (SessionID) REFERENCES ChatSessions(SessionID)
);

CREATE TABLE LegalInquiries (
    InquiryID INT AUTO_INCREMENT PRIMARY KEY,
    SessionID INT,
    SectorsOfLaw TEXT,
    AssetsBreakdown TEXT,
    AnnualSalary TEXT,
    FinancialResponsibilities TEXT,
    JointAccounts TEXT,
    AdditionalInfo TEXT,
    FOREIGN KEY (SessionID) REFERENCES ChatSessions(SessionID)
);

CREATE TABLE Attachments (
    AttachmentID INT AUTO_INCREMENT PRIMARY KEY,
    SessionID INT,
    FilePath VARCHAR(255),
    FileType VARCHAR(100),
    Description TEXT,
    UploadedTime TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (SessionID) REFERENCES ChatSessions(SessionID)
);

CREATE TABLE UserResponses (
    ResponseID INT AUTO_INCREMENT PRIMARY KEY,
    SessionID INT,
    ResponseType VARCHAR(100),
    ResponseText TEXT,
    FOREIGN KEY (SessionID) REFERENCES ChatSessions(SessionID)
);