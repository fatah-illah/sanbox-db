-- Create database (uncomment if needed)
-- CREATE DATABASE CourseManagement;
-- USE CourseManagement;

-- Course Type lookup table
CREATE TABLE CourseType (
    TypeID INT PRIMARY KEY IDENTITY(1,1),
    TypeName NVARCHAR(50) NOT NULL UNIQUE,
    CreatedDate DATETIME DEFAULT GETDATE(),
    UpdatedDate DATETIME DEFAULT GETDATE()
);

-- Language lookup table
CREATE TABLE Language (
    LanguageID INT PRIMARY KEY IDENTITY(1,1),
    LanguageName NVARCHAR(50) NOT NULL UNIQUE,
    CreatedDate DATETIME DEFAULT GETDATE(),
    UpdatedDate DATETIME DEFAULT GETDATE()
);

-- Path (Category) lookup table
CREATE TABLE Path (
    PathID INT PRIMARY KEY IDENTITY(1,1),
    PathName NVARCHAR(100) NOT NULL UNIQUE,
    CreatedDate DATETIME DEFAULT GETDATE(),
    UpdatedDate DATETIME DEFAULT GETDATE()
);

-- Topic (Subcategory) lookup table
CREATE TABLE Topic (
    TopicID INT PRIMARY KEY IDENTITY(1,1),
    TopicName NVARCHAR(100) NOT NULL UNIQUE,
    PathID INT REFERENCES Path(PathID),
    CreatedDate DATETIME DEFAULT GETDATE(),
    UpdatedDate DATETIME DEFAULT GETDATE()
);

-- Group lookup table
CREATE TABLE UserGroup (
    GroupID INT PRIMARY KEY IDENTITY(1,1),
    GroupName NVARCHAR(100) NOT NULL UNIQUE,
    GroupType NVARCHAR(50) NOT NULL, -- "ALL", "Department", "Project", "User Group", etc.
    CreatedDate DATETIME DEFAULT GETDATE(),
    UpdatedDate DATETIME DEFAULT GETDATE()
);

-- Badge table
CREATE TABLE Badge (
    BadgeID INT PRIMARY KEY IDENTITY(1,1),
    BadgeName NVARCHAR(100) NOT NULL,
    BadgeDescription NVARCHAR(255),
    BadgeImageURL NVARCHAR(255),
    CreatedDate DATETIME DEFAULT GETDATE(),
    UpdatedDate DATETIME DEFAULT GETDATE()
);

-- Main Course table
CREATE TABLE Course (
    CourseID INT PRIMARY KEY IDENTITY(1,1),
    CourseTitle NVARCHAR(50) NOT NULL,
    Description NVARCHAR(500),
    CourseTypeID INT REFERENCES CourseType(TypeID),
    CourseURL NVARCHAR(255),
    LanguageID INT REFERENCES Language(LanguageID),
    Duration DECIMAL(5,2) NOT NULL, -- in hours
    IsMandatory BIT DEFAULT 0,
    PIC NVARCHAR(100), -- Person In Charge/Contact person
    PathID INT REFERENCES Path(PathID),
    TopicID INT REFERENCES Topic(TopicID),
    HasAssignment BIT DEFAULT 0,
    HasQuiz BIT DEFAULT 0,
    Points INT DEFAULT 0,
    BadgeID INT REFERENCES Badge(BadgeID),
    CourseMaterial NVARCHAR(255), -- File path or URL
    GroupID INT REFERENCES UserGroup(GroupID) DEFAULT 1, -- Default to "ALL"
    DisplayYN BIT DEFAULT 1,
    CreatedBy INT, -- User ID of creator
    CreatedDate DATETIME DEFAULT GETDATE(),
    UpdatedBy INT, -- User ID of last updater
    UpdatedDate DATETIME DEFAULT GETDATE()
);

-- Course Material table for multiple materials
CREATE TABLE CourseMaterial (
    MaterialID INT PRIMARY KEY IDENTITY(1,1),
    CourseID INT REFERENCES Course(CourseID) ON DELETE CASCADE,
    MaterialType NVARCHAR(50), -- "File", "URL", etc.
    MaterialPath NVARCHAR(255) NOT NULL,
    MaterialName NVARCHAR(100),
    UploadedBy INT,
    UploadDate DATETIME DEFAULT GETDATE()
);

-- Quiz table
CREATE TABLE Quiz (
    QuizID SERIAL PRIMARY KEY,
    CourseID INT REFERENCES Course(CourseID) ON DELETE CASCADE,
    QuizTitle VARCHAR(100) NOT NULL,
    Description VARCHAR(500),
    PassingScore INT DEFAULT 70, -- percentage
    CreatedBy INT,
    CreatedDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UpdatedBy INT,
    UpdatedDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Quiz Questions table
CREATE TABLE QuizQuestion (
    QuestionID SERIAL PRIMARY KEY,
    QuizID INT REFERENCES Quiz(QuizID) ON DELETE CASCADE,
    QuestionText VARCHAR(500) NOT NULL,
    QuestionType VARCHAR(50) NOT NULL, -- "Multiple Choice", "True/False", "Text", etc.
    PointValue INT DEFAULT 1,
    OrderNumber INT,
    CreatedDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UpdatedDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Quiz Question Options table
CREATE TABLE QuizQuestionOption (
    OptionID SERIAL PRIMARY KEY,
    QuestionID INT REFERENCES QuizQuestion(QuestionID) ON DELETE CASCADE,
    OptionText VARCHAR(255) NOT NULL,
    IsCorrect BOOLEAN DEFAULT FALSE,
    OrderNumber INT,
    CreatedDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UpdatedDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- User Course Enrollment table
CREATE TABLE UserCourseEnrollment (
    EnrollmentID SERIAL PRIMARY KEY,
    UserID INT NOT NULL, -- Foreign key to your Users table
    CourseID INT REFERENCES Course(CourseID) ON DELETE CASCADE,
    EnrollmentDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CompletionDate TIMESTAMP,
    Progress DECIMAL(5,2) DEFAULT 0, -- percentage
    Status VARCHAR(50) DEFAULT 'Enrolled', -- "Enrolled", "In Progress", "Completed", "Failed"
    PointsEarned INT DEFAULT 0,
    BadgeEarned BOOLEAN DEFAULT FALSE,
    LastAccessDate TIMESTAMP
);

-- User Quiz Attempts table
CREATE TABLE UserQuizAttempt (
    AttemptID SERIAL PRIMARY KEY,
    UserID INT NOT NULL,
    QuizID INT REFERENCES Quiz(QuizID),
    AttemptDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    Score DECIMAL(5,2),
    PassStatus BOOLEAN,
    TimeSpent INT -- in seconds
);

-- User Quiz Answers table
CREATE TABLE UserQuizAnswer (
    AnswerID SERIAL PRIMARY KEY,
    AttemptID INT REFERENCES UserQuizAttempt(AttemptID) ON DELETE CASCADE,
    QuestionID INT REFERENCES QuizQuestion(QuestionID),
    SelectedOptionID INT REFERENCES QuizQuestionOption(OptionID),
    TextAnswer TEXT, -- For text-based answers
    IsCorrect BOOLEAN
);

-- User Assignment Submission table
CREATE TABLE UserAssignmentSubmission (
    SubmissionID SERIAL PRIMARY KEY,
    UserID INT NOT NULL,
    CourseID INT REFERENCES Course(CourseID),
    SubmissionText TEXT,
    SubmissionURL VARCHAR(255),
    SubmissionDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    GradeStatus VARCHAR(50) DEFAULT 'Pending', -- "Pending", "Approved", "Rejected"
    FeedbackText TEXT,
    GradedBy INT,
    GradedDate TIMESTAMP
);

-- Create indexes for better performance
CREATE INDEX IX_UserCourseEnrollment_UserID ON UserCourseEnrollment(UserID);
CREATE INDEX IX_UserCourseEnrollment_CourseID ON UserCourseEnrollment(CourseID);
CREATE INDEX IX_UserCourseEnrollment_Status ON UserCourseEnrollment(Status);
CREATE INDEX IX_UserQuizAttempt_UserID ON UserQuizAttempt(UserID);
CREATE INDEX IX_UserQuizAttempt_QuizID ON UserQuizAttempt(QuizID);

-- Insert default values
INSERT INTO Path (PathName) VALUES ('Default');
INSERT INTO UserGroup (GroupName, GroupType) VALUES ('ALL', 'ALL');
INSERT INTO CourseType (TypeName) VALUES ('Offline'), ('Online');
INSERT INTO Language (LanguageName) VALUES ('English'), ('Korean'), ('Chinese'), ('Japanese');

-- Create indexes for better performance
CREATE INDEX IX_Course_CourseTitle ON Course(CourseTitle);
CREATE INDEX IX_Course_CourseTypeID ON Course(CourseTypeID);
CREATE INDEX IX_Course_PathID ON Course(PathID);
CREATE INDEX IX_Course_TopicID ON Course(TopicID);
CREATE INDEX IX_Course_DisplayYN ON Course(DisplayYN);
CREATE INDEX IX_UserCourseEnrollment_UserID ON UserCourseEnrollment(UserID);
CREATE INDEX IX_UserCourseEnrollment_CourseID ON UserCourseEnrollment(CourseID);
CREATE INDEX IX_UserCourseEnrollment_Status ON UserCourseEnrollment(Status);