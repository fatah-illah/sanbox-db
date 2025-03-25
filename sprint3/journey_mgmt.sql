-- Journey Type lookup table
CREATE TABLE JourneyType (
    TypeID SERIAL PRIMARY KEY,
    TypeName VARCHAR(50) NOT NULL UNIQUE,
    CreatedDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UpdatedDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Main Journey table
CREATE TABLE Journey (
    JourneyID SERIAL PRIMARY KEY,
    JourneyName VARCHAR(100) NOT NULL,
    Description VARCHAR(500),
    JourneyTypeID INT REFERENCES JourneyType(TypeID),
    TotalDuration DECIMAL(5,2), -- Auto-calculated in hours
    Mentor VARCHAR(50), -- For Group Journey
    GroupID INT REFERENCES UserGroup(GroupID), -- References the UserGroup table from Course system
    DisplayYN BOOLEAN DEFAULT TRUE,
    Point INT DEFAULT 0,
    BadgeID INT REFERENCES Badge(BadgeID), -- References the Badge table from Course system
    CreatedBy INT, -- User ID of creator
    CreatedDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UpdatedBy INT, -- User ID of last updater
    UpdatedDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- JourneyCourse junction table (for many-to-many relationship between Journey and Course)
CREATE TABLE JourneyCourse (
    JourneyCourseID SERIAL PRIMARY KEY,
    JourneyID INT REFERENCES Journey(JourneyID) ON DELETE CASCADE,
    CourseID INT REFERENCES Course(CourseID) ON DELETE CASCADE,
    OrderNumber INT, -- To define course sequence in a journey
    IsMandatory BOOLEAN DEFAULT TRUE,
    CreatedDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UpdatedDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UNIQUE(JourneyID, CourseID) -- Prevent duplicate courses in a journey
);

-- User Journey Enrollment table
CREATE TABLE UserJourneyEnrollment (
    EnrollmentID SERIAL PRIMARY KEY,
    UserID INT NOT NULL, -- Foreign key to your Users table
    JourneyID INT REFERENCES Journey(JourneyID) ON DELETE CASCADE,
    MentorName VARCHAR(50), -- User can specify mentor when adding to My Journal
    EnrollmentDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CompletionDate TIMESTAMP,
    Progress DECIMAL(5,2) DEFAULT 0, -- percentage
    Status VARCHAR(50) DEFAULT 'Enrolled', -- "Enrolled", "In Progress", "Completed"
    PointsEarned INT DEFAULT 0,
    BadgeEarned BOOLEAN DEFAULT FALSE,
    LastAccessDate TIMESTAMP
);

-- User Journey Course Progress table (tracks progress for each course within a journey)
CREATE TABLE UserJourneyCourseProgress (
    ProgressID SERIAL PRIMARY KEY,
    UserJourneyEnrollmentID INT REFERENCES UserJourneyEnrollment(EnrollmentID) ON DELETE CASCADE,
    CourseID INT REFERENCES Course(CourseID),
    StartDate TIMESTAMP,
    CompletionDate TIMESTAMP,
    Status VARCHAR(50) DEFAULT 'Not Started', -- "Not Started", "In Progress", "Completed", "Skipped"
    LastAccessDate TIMESTAMP
);

-- Insert default journey types
INSERT INTO JourneyType (TypeName) VALUES ('Public'), ('Group'), ('Solo');

-- Create indexes for better performance
CREATE INDEX IX_Journey_JourneyName ON Journey(JourneyName);
CREATE INDEX IX_Journey_JourneyTypeID ON Journey(JourneyTypeID);
CREATE INDEX IX_Journey_DisplayYN ON Journey(DisplayYN);
CREATE INDEX IX_JourneyCourse_JourneyID ON JourneyCourse(JourneyID);
CREATE INDEX IX_JourneyCourse_CourseID ON JourneyCourse(CourseID);
CREATE INDEX IX_UserJourneyEnrollment_UserID ON UserJourneyEnrollment(UserID);
CREATE INDEX IX_UserJourneyEnrollment_JourneyID ON UserJourneyEnrollment(JourneyID);
CREATE INDEX IX_UserJourneyEnrollment_Status ON UserJourneyEnrollment(Status);
CREATE INDEX IX_UserJourneyCourseProgress_UserJourneyEnrollmentID ON UserJourneyCourseProgress(UserJourneyEnrollmentID);
CREATE INDEX IX_UserJourneyCourseProgress_CourseID ON UserJourneyCourseProgress(CourseID);
CREATE INDEX IX_UserJourneyCourseProgress_Status ON UserJourneyCourseProgress(Status);

-- Trigger function to update TotalDuration when courses are added/removed
CREATE OR REPLACE FUNCTION update_journey_duration()
RETURNS TRIGGER AS $$
BEGIN
    -- Update the TotalDuration in the Journey table
    UPDATE Journey
    SET TotalDuration = (
        SELECT SUM(c.Duration)
        FROM JourneyCourse jc
        JOIN Course c ON jc.CourseID = c.CourseID
        WHERE jc.JourneyID = NEW.JourneyID OR jc.JourneyID = OLD.JourneyID
    )
    WHERE JourneyID = NEW.JourneyID OR JourneyID = OLD.JourneyID;
    
    RETURN NULL;
END;
$$ LANGUAGE plpgsql;

-- Create triggers to maintain TotalDuration
CREATE TRIGGER after_journey_course_insert
AFTER INSERT ON JourneyCourse
FOR EACH ROW
EXECUTE FUNCTION update_journey_duration();

CREATE TRIGGER after_journey_course_update
AFTER UPDATE ON JourneyCourse
FOR EACH ROW
EXECUTE FUNCTION update_journey_duration();

CREATE TRIGGER after_journey_course_delete
AFTER DELETE ON JourneyCourse
FOR EACH ROW
EXECUTE FUNCTION update_journey_duration();