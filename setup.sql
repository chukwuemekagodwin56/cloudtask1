CREATE TABLE Tasks (
    Id INT PRIMARY KEY IDENTITY(1,1),
    Title NVARCHAR(200) NOT NULL,
    Description NVARCHAR(MAX) DEFAULT '',
    Assignee NVARCHAR(100) DEFAULT '',
    Priority NVARCHAR(20) DEFAULT 'Medium',
    Status NVARCHAR(20) DEFAULT 'Open',
    CreatedAt DATETIME2 DEFAULT GETUTCDATE()
);

CREATE TABLE Attachments (
    Id INT PRIMARY KEY IDENTITY(1,1),
    TaskId INT NOT NULL FOREIGN KEY REFERENCES Tasks(Id) ON DELETE CASCADE,
    FileName NVARCHAR(255) NOT NULL,
    BlobName NVARCHAR(500) NOT NULL,
    Size INT NOT NULL,
    UploadedAt DATETIME2 DEFAULT GETUTCDATE()
);

-- Insert sample data
INSERT INTO Tasks (Title, Description, Assignee, Priority, Status) VALUES
('Set up CI/CD pipeline', 'Configure GitHub Actions for automated deployment', 'Alice', 'High', 'Open'),
('Design database schema', 'Create tables for tasks and attachments', 'Bob', 'High', 'Done'),
('Write API documentation', 'Document all REST endpoints in README', 'Alice', 'Medium', 'Open'),
('Configure monitoring', 'Set up Azure Monitor alerts and Log Analytics', 'Carol', 'Medium', 'In Progress');