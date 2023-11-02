CREATE DATABASE quiz;


create table User_account
(
    id        serial primary key, -- primary key = unique not null
    name      text unique  not null,
    password  varchar(255) not null,
    email     text unique  not null,
    highscore integer      not null
);

create table Question
(
    id             serial PRIMARY KEY,
    question_text  text not null,
    correct_answer text not null,
    option1        text not null,
    option2        text not null,
    option3        text not null
);

create table Sessions
(
    id              serial PRIMARY KEY,
    session_token   varchar(255) not null,
    user_id         int not null,
    expiration_date timestamp not null,
    created_at      timestamp default current_timestamp

);

drop table user_answer;

create table User_answer
(
    id        serial primary key,
    user_id integer not null,
    question_id integer not null
);

alter table User_answer add foreign key (user_id) references user_account(id);

alter table sessions add foreign key (user_id) references user_account(id);

insert into user_answer (user_id, question_id)
values (6, 66);


insert into User_account (name, password, email, highscore)
values ('FestKasutaja11', 'FestKasutaja11', 'Fest11@mail.ee', 3);

ALTER USER postgres WITH PASSWORD 'postgres';

DELETE FROM user_account;

select * from user_account;

ALTER TABLE user_account   ADD COLUMN highscore_date TIMESTAMP;


INSERT INTO question (question_text, correct_answer, option1, option2, option3)
VALUES
    ('What does the clean code principle "KISS" stand for?', 'Keep it Simple, Stupid', 'Complexity is key', 'Keenly Investigate Software Syntax', 'Kindly Ignore Source Structure'),
    ('In clean code, what does the "Open-Closed Principle" recommend?', 'Software entities should be open for extension but closed for modification', 'Software entities should be constantly modified', 'Software entities should always be open for modification', 'Software entities should never be extended'),
    ('What is the primary purpose of meaningful variable and function names in clean code?', 'Enhance code readability and maintainability', 'Minimize code length', 'Improve code performance', 'Optimize code reuse'),
    ('What is the main goal of the clean code principle "YAGNI"?', 'You Aren''t Gonna Need It: Avoid adding unnecessary complexity or features', 'You Always Get New Ideas: Continuously add new features', 'You Ask Good Nonstop Inquiries: Keep questioning your code', 'You Attempt General Next-level Improvements: Focus on advanced features'),
    ('Why is avoiding long functions and methods important in clean code?', 'To enhance readability, maintainability, and testability', 'To improve code performance', 'To maximize code length', 'To increase code complexity'),
    ('What does clean code suggest regarding meaningful variable names?', 'Use descriptive names that convey the purpose of the variable', 'Use short and cryptic names to save space', 'Avoid using variables in your code', 'Use random names for variables'),
    ('In clean code, what does the "Tell, Don''t Ask" principle recommend?', 'Encapsulate behavior within objects instead of querying object state', 'Always ask for object state without telling it what to do', 'Keep asking objects for their state in code', 'Ignore object state entirely'),
    ('What does the clean code principle "SOLID" stand for?', 'A set of five design principles for writing maintainable and scalable software', 'A set of code formatting guidelines', 'A set of best practices for code performance optimization', 'A set of rules for code comments'),
    ('In clean code, what is the primary goal of the "Single Responsibility Principle"?', 'A function or class should have only one reason to change', 'A function or class should perform as many tasks as possible', 'A function or class should have multiple entry points', 'A function or class should always be extended'),
    ('What is the clean code principle "Law of Demeter" (LoD) also known as?', 'The principle of least knowledge', 'The principle of most knowledge', 'The principle of absolute control', 'The principle of direct connections'),
    ('According to clean code principles, what does the "Boy Scout Rule" recommend when modifying code?', 'Leave the code cleaner than you found it', 'Avoid modifying code at all costs', 'Leave the code exactly as you found it', 'Modify code only if you wrote it'),
    ('Why is clean code concerned with "Code Comments"?', 'To provide context and explain non-obvious code behavior', 'To make code more colorful', 'To replace code with explanations', 'To add humor to the code'),
    ('What does clean code suggest about long method or function names?', 'Use long and descriptive method or function names', 'Use short and cryptic names for methods or functions', 'Don''t use method or function names, just use numbers', 'Use one-character names for methods or functions'),
    ('What does clean code emphasize regarding code simplicity and complexity?', 'Favor simplicity over complexity', 'Favor complexity over simplicity', 'It doesn''t matter whether code is simple or complex', 'Always strive for code of medium complexity'),
    ('What is the primary goal of the clean code principle "Keep it DRY"?', 'Don''t Repeat Yourself: Avoid code duplication', 'Always Repeat Yourself: Encourage code duplication', 'Define Really Yielding Improvements: Continuously add new code', 'Deliver Robust Yielding Solutions: Prioritize robust code over DRY'),
    ('According to clean code principles, what is the purpose of the "Law of Least Astonishment"?', 'Minimize surprises and make code behavior as predictable as possible', 'Maximize astonishment for added excitement', 'Ignore astonishment in code design', 'Balance astonishment and predictability'),
    ('What does clean code recommend about "Magic Numbers" in code?', 'Replace hard-coded numbers with named constants', 'Use magic numbers to simplify code', 'Increase the use of magic numbers for improved performance', 'Avoid using any numbers in code'),
    ('In clean code, what is the primary purpose of code refactoring?', 'Improve code structure and maintainability without changing its external behavior', 'Change the behavior of code to meet new requirements', 'Add more features to the existing code', 'Never refactor code, it slows down development'),
    ('What does clean code suggest about "Code Consistency" within a project?', 'Maintain consistent coding style, naming conventions, and formatting', 'Encourage inconsistency to keep the codebase fresh', 'Consistency is not important in clean code', 'Periodically change coding style to confuse developers'),
    ('What is the primary goal of "Cohesion" in clean code principles?', 'High cohesion: Keep related code together and separate unrelated code', 'Low cohesion: Mix related and unrelated code', 'No cohesion: Combine all code into one module', 'Cohesion doesn''t matter in clean code'),
    ('What does clean code recommend about the use of "Global Variables" in code?', 'Minimize or avoid global variables to improve code maintainability', 'Use global variables extensively for simplicity', 'Use global variables for all variables in code', 'Global variables are mandatory in clean code'),
    ('What is the primary objective of "Continuous Integration" (CI) in clean code practices?', 'Continuously integrate code changes and run automated tests', 'Integrate code only once a month for stability', 'Ignore integration completely in clean code', 'Continuous integration is for code backups'),
    ('What is the main goal of "Encapsulation" according to clean code principles?', 'Hide implementation details and expose a simple interface', 'Expose all implementation details to improve transparency', 'No need for encapsulation in clean code', 'Encapsulation is only for security purposes'),
    ('What is the primary goal of using intention-revealing names in clean code?', 'To make the code self-explanatory', 'To save characters in variable names', 'To confuse other developers', 'To follow industry trends'),
    ('Which of the following is an example of an intention-revealing variable name for storing a customer''s age?', 'customerAge', 'a', 'x', 'age1234'),
    ('In clean code, why should you avoid using misleading names for variables and functions?', 'To improve code readability and maintainability', 'To confuse other developers', 'To save memory space', 'To make the code more challenging to read'),
    ('When creating variable names in clean code, what should you ensure when making meaningful distinctions?', 'Ensure that the names reflect their purpose and are distinct from each other', 'Use random characters', 'Make the names as long as possible', 'Use names that are similar to each other'),
    ('What is the advantage of using pronounceable names for variables and functions in clean code?', 'It aids in code communication and understanding', 'It makes the code harder to understand', 'It saves characters', 'It increases compile time'),
    ('Which of the following is an example of a pronounceable variable name?', 'customerNumber', 'cstmrNmbr', 'xyz', 'pqr678'),
    ('Why is proper indenting important in clean code?', 'To improve code readability and structure', 'To make the code visually appealing', 'To use more memory', 'To increase code execution speed'),
    ('What is the purpose of using blocks (e.g., `{}`) in code indentation?', 'To define code scope and organization', 'To create empty spaces', 'To reduce code length', 'To save memory space'),
    ('In clean code, what is the recommended maximum number of lines for a function?', '20 lines', '50 lines', '100 lines', 'As many lines as possible'),
    ('Why is it important to separate different sections within a function (e.g., initialization, processing, return) with clear comments?', 'To improve code maintainability and understanding', 'To add extra lines to the code', 'To make the code more challenging to read', 'To save memory space'),
    ('Why is it recommended to structure code in a way that allows developers to read it from top to bottom like a story?', 'To improve code comprehension and debugging', 'To add more comments to the code', 'To confuse developers', 'To make code reading more difficult'),
    ('Which of the following code structures aligns with the principle of reading code from top to bottom?', 'Sequential flow with clear function calls and logical structure', 'Randomly placed functions and variables', 'Functions organized by their first letter', 'Functions placed in reverse order'),
    ('In clean code, what is the recommendation regarding the number of arguments a function should accept?', 'Minimize the number of arguments', 'As many arguments as needed', 'Ten or more arguments', 'Exactly three arguments'),
    ('Why is it advised to minimize the number of function arguments in clean code?', 'To improve code maintainability and testing', 'To increase code execution time', 'To make code more complex', 'To save memory space'),
    ('What is the primary goal of data abstraction in clean code?', 'To hide the internal details of data and provide a simplified interface', 'To expose all internal data details', 'To make data complex and hard to use', 'To maximize data redundancy'),
    ('What is a "code smell" in clean code development?', 'Indications in the code that something might be wrong', 'A pleasant aroma in well-written code', 'Comments that make code more understandable', 'Use of whitespace and indentation'),
    ('What is the term for a code smell that indicates a function or method is doing too many things?', 'A "God Function" or "Monolithic Function"', 'A "Small Function" or "Atomic Function"', 'A "Good Function" or "Balanced Function"', 'A "Magic Function" or "Enchanted Function"'),
    ('Which code smell refers to the use of variable or function names that are overly vague and do not describe their purpose?', 'Non-descriptive Names', 'Descriptive Names', 'Variable Clarity', 'Verbose Names'),
    ('What is the code smell related to code that contains unnecessary or redundant parts, often resulting from copy-pasting code?', 'Duplicated Code', 'Optimized Code', 'Refactored Code', 'Lean Code'),
    ('What is the primary goal of clean code according to Robert C. Martin?', 'To make the software easier to understand and maintain', 'To make the software faster', 'To reduce software development costs', 'To add more features quickly'),
    ('What does the SOLID principle "S" stand for in clean code?', 'Single Responsibility Principle (SRP)', 'Simple Code Principle', 'Smart Code Principle', 'Shared Responsibility Principle'),
    ('What is the purpose of the "Liskov Substitution Principle" (LSP) in clean code?', 'To ensure that derived classes can be substituted for their base classes without affecting program correctness', 'To ensure that inheritance is not used in object-oriented programming', 'To prevent code reusability', 'To make code more complex'),
    ('What does the "Dependency Inversion Principle" (DIP) recommend in clean code?', 'High-level modules should not depend on low-level modules; both should depend on abstractions.', 'High-level modules should always depend on low-level modules', 'Abstractions should depend on low-level modules', 'Low-level modules should depend on high-level modules'),
    ('What is the purpose of unit testing in clean code development?', 'To verify that individual units of code work correctly in isolation', 'To test the entire application', 'To find and fix all bugs in the code', 'To improve the performance of the code'),
    ('According to Robert C. Martin, what does "clean code" look like?', 'It looks like it was written by someone who cares.', 'It looks like it was written quickly to meet deadlines.', 'It looks like it contains a lot of comments.', 'It looks like it was written without testing.'),
    ('What is the purpose of using version control systems (VCS) in clean code development?', 'To track changes and collaborate on code effectively', 'To write code without any history or tracking', 'To hide the code from other team members', 'To slow down development processes'),
    ('Why is code review an important practice in clean code development?', 'It helps identify issues and improve the quality of the code.', 'It slows down the development process.', 'It is a waste of time.', 'It is only necessary for junior developers'),
    ('Why is code documentation considered a best practice in coding?', 'To explain "why" rather than "what" in the code', 'To add humor to the code', 'To increase code complexity', 'To hide code logic from others'),
    ('Why is it essential to handle "NullPointerException" in Java and how can it be prevented?', 'It occurs when trying to access or modify a null object and can be prevented with proper null checks and handling', 'It indicates a successful operation in Java and does not need prevention', 'It is unrelated to Java programming', 'It only occurs in advanced Java code'),
    ('What is the principle that allows one class to inherit the attributes and methods of another class in Java?', 'Inheritance', 'Polymorphism', 'Abstraction', 'Encapsulation'),
    ('Which principle in Java suggests that a method in a subclass should have the same name, return type, and parameters as a method in its superclass?', 'Method Overriding', 'Method Overloading', 'Method Inheritance', 'Method Polymorphism'),
    ('What is the purpose of a "for" loop in programming?', 'To repeat a block of code a specified number of times', 'To define a new function', 'To print a message to the console', 'To create a class'),
    ('What does the term "variable" mean in programming?', 'A container for storing data', 'A type of error', 'A type of function', 'A programming language'),
    ('What is the main purpose of a "function" in programming?', 'To encapsulate a block of code that can be called and reused', 'To define a data type', 'To display a graphical user interface', 'To create a loop'),
    ('In programming, what is a "syntax error"?', 'An error in the structure of the code', 'A type of loop', 'A data storage location', 'A form of documentation'),
    ('What does the acronym "IDE" stand for in programming?', 'Integrated Development Environment', 'Interactive Design Environment', 'Inherent Data Encryption', 'Intelligent Development Entity'),
    ('What is the primary purpose of a "while" loop in programming?', 'To repeat a block of code as long as a specified condition is true', 'To define a new variable', 'To execute a block of code only once', 'To create an object'),
    ('In programming, what does "algorithm" refer to?', 'A step-by-step procedure for solving a problem', 'A programming language', 'A hardware component', 'A type of error'),
    ('What is the primary purpose of comments in code?', 'To provide explanations and context for the code', 'To store data', 'To create functions', 'To display error messages'),
    ('In programming, what does the term "bug" mean?', 'An error or defect in the code', 'A type of loop', 'A variable with a value of zero', 'A software feature'),
    ('What is the role of a "compiler" in programming?', 'To translate source code into machine code', 'To execute code line by line', 'To design user interfaces', 'To write documentation'),
    ('What is the primary purpose of a "conditional statement" in programming?', 'To execute different code based on a specified condition', 'To define a new function', 'To create loops', 'To store data'),
    ('What does the term "iteration" mean in programming?', 'Repeating a block of code a certain number of times or until a condition is met', 'An error in the code', 'A variable declaration', 'A comment in the code'),
    ('What is the purpose of "data types" in programming?', 'To categorize and define the kind of data a variable can hold', 'To store comments in the code', 'To create loops', 'To execute code'),
    ('In programming, what does "optimization" refer to?', 'Improving code efficiency and performance', 'Adding errors to the code', 'Writing long comments', 'Creating complex algorithms'),
    ('What is the primary purpose of a "while loop" in programming?', 'To repeat a block of code while a specific condition is true', 'To define a new function', 'To display a graphical user interface', 'To create comments in the code'),
    ('What is the primary function of a "for loop" in programming?', 'To repeat a block of code a specified number of times', 'To create a new variable', 'To print a message to the console', 'To define a function'),
    ('What is the primary role of HTML in web development?', 'To structure and define the content of web pages', 'To style and design web pages', 'To handle server-side logic', 'To manage databases'),
    ('In web development, what does CSS stand for?', 'Cascading Style Sheets', 'Computer Science and Software', 'Client-Side Scripting', 'Content Structure Syntax'),
    ('What does JavaScript primarily handle in front-end development?', 'Interactivity and client-side scripting', 'Database management', 'Server-side processing', 'Structuring content'),
    ('What is the purpose of responsive design in front-end development?', 'To ensure web content displays correctly on various devices and screen sizes', 'To slow down web page loading', 'To make web pages appear exactly the same on all devices', 'To eliminate the need for user interaction'),
    ('What does the acronym "DOM" stand for in the context of web development?', 'Document Object Model', 'Data Object Management', 'Design Overhaul Mechanism', 'Dynamic Object Model'),
    ('What is the primary role of a back-end developer in web development?', 'To work on server-side logic, databases, and application performance', 'To design user interfaces and front-end interactions', 'To optimize the website for search engines', 'To write content for the website'),
    ('In back-end development, what does the acronym "SQL" stand for?', 'Structured Query Language', 'Server Quality Language', 'Systematic Query Logic', 'Server Query Layer'),
    ('What is the main purpose of a back-end framework like Node.js or Django?', 'To provide a structure for building server-side applications', 'To create visual elements on the web page', 'To handle client-side scripting', 'To design user interfaces'),
    ('Why is database management crucial in back-end development?', 'To store, retrieve, and manage data for the application', 'To enhance the visual design of the website', 'To perform client-side scripting', 'To structure web content'),
    ('What is the role of a back-end developer in securing web applications?', 'Implementing security measures to protect data and prevent unauthorized access', 'Optimizing website performance', 'Designing user interfaces', 'Writing content for the website'),
    ('What is the primary function of a database in software development?', 'To store, manage, and retrieve data efficiently', 'To design user interfaces', 'To write server-side code', 'To create front-end interactions'),
    ('What is the purpose of a "relational database"?', 'To store structured data in tables with defined relationships between them', 'To store unstructured data in a single table', 'To manage front-end code', 'To optimize website performance'),
    ('What is a "primary key" in a database table?', 'A unique identifier for each record in the table', 'A key used for locking records in the table', 'A common field shared among multiple tables', 'A foreign key used for referencing other tables'),
    ('Why is data normalization important in database design?', 'To reduce data redundancy and improve data integrity', 'To increase data redundancy and make data more accessible', 'To speed up data retrieval', 'To make data more difficult to query'),
    ('What is the Java platform used for?', 'Developing and running Java applications', 'Running only C++ applications', 'Creating web pages', 'Designing graphical user interfaces'),
    ('In Java, what does the "main" method do in a class?', 'It is the entry point for the program and is executed when the program runs.', 'It defines the class constructor.', 'It is a method for drawing graphics.', 'It manages database connections.'),
    ('What is the primary advantage of Java over languages like C++?', 'Java is platform-independent and has automatic memory management.', 'Java has better performance.', 'Java is exclusively used for web development.', 'Java is a low-level language.'),
    ('What is the role of the "JVM" in Java programming?', 'It interprets and executes Java bytecode on different platforms.', 'It manages the Java source code.', 'It designs user interfaces.', 'It is responsible for database management.'),
    ('In Java, what is the purpose of the "final" keyword for variables?', 'It makes a variable constant and cannot be changed after initialization.', 'It allows the variable to be changed without restrictions.', 'It indicates the variable is a class variable.', 'It prevents the variable from being accessed in other classes.'),
    ('What is the primary role of CSS in web development?', 'To style and format web pages', 'To create interactive features on web pages', 'To manage databases', 'To define server-side logic'),
    ('In CSS, what does "selector" refer to?', 'A pattern that selects the HTML elements to which a style is applied', 'A JavaScript variable', 'A programming language', 'A database table'),
    ('What is the purpose of "cascading" in CSS?', 'It defines the order of importance and inheritance of styles.', 'It specifies the use of inline styles only.', 'It refers to animated styles.', 'It controls database queries.'),
    ('In CSS, what is the "box model"?', 'A model that defines the spacing and layout of elements', 'A model for organizing data in tables', 'A model for managing server resources', 'A model for defining database structures'),
    ('What is the role of "media queries" in CSS?', 'To make web pages responsive to different devices and screen sizes', 'To query a database for specific data', 'To define JavaScript functions', 'To create server-side logic.'),
    ('What does "HTML" stand for in the context of web development?', 'Hypertext Markup Language', 'Highly Technical Markup Language', 'Hyperlink and Text Manipulation Language', 'Hyper Transfer Markup Language'),
    ('What is the purpose of "HTTP" in web development?', 'To facilitate communication between web browsers and servers', 'To create web page content', 'To design user interfaces', 'To manage databases'),
    ('What does "URL" stand for in the context of the internet?', 'Uniform Resource Locator', 'User Requirement List', 'Universal Router Language', 'User Registration Link'),
    ('In web development, what is the primary role of a "web server"?', 'To host and serve web content to clients', 'To design user interfaces', 'To create database tables', 'To write server-side code'),
    ('What is the primary function of a "web browser" in web development?', 'To render and display web content to users', 'To process server-side code', 'To manage databases', 'To write HTML code.'),
    ('What is the primary purpose of an Integrated Development Environment (IDE)?', 'To provide a comprehensive toolset for software development', 'To store data in a database', 'To design user interfaces', 'To create web pages'),
    ('What does "debugging" refer to in the context of software development tools?', 'Identifying and fixing errors in code', 'Creating complex algorithms', 'Writing documentation', 'Optimizing website performance'),
    ('What is the purpose of a "code editor" in an IDE?', 'To write, edit, and manage source code files', 'To create graphical user interfaces', 'To host websites', 'To process server-side code'),
    ('What is the "syntax highlighting" feature in code editors?', 'It color-codes elements of code to make it easier to read and understand.', 'It indicates errors in code with bright colors.', 'It allows code to be executed directly in the editor.', 'It provides code suggestions and autocomplete.'),
    ('Why is it important to maintain good posture when working at a computer?', 'Good posture helps prevent strain and discomfort and reduces the risk of long-term health issues.', 'Good posture has no impact on health or comfort.', 'Good posture is only important for physical appearance.', 'Good posture is necessary to increase typing speed.'),
    ('What is the ideal position for your monitor when working at a computer?', 'At eye level to avoid neck strain', 'Below eye level to improve concentration', 'Far to the side to keep the desk clear', 'Directly behind the keyboard'),
    ('How should you position your keyboard and mouse to promote good posture?', 'Close to the body and at elbow height', 'Far away from the body and below elbow height', 'On the floor for a more comfortable angle', 'At waist level to reduce strain'),
    ('What can you do to reduce strain on your wrists when typing at a computer?', 'Use an ergonomic keyboard and wrist support', 'Type with your wrists in a flexed position', 'Keep your wrists hovering above the keyboard', 'Type quickly to minimize wrist strain'),
    ('How often should you take breaks and stretch when working at a computer to maintain good posture?', 'Every 20-30 minutes', 'Every 2-3 hours', 'Only when feeling discomfort', 'Never take breaks.'),
    ('In what way can meditation support a programmer''s overall well-being?', 'It can promote a sense of calm, reduce anxiety, and improve mental health.', 'It can lead to increased aggression and irritability.', 'It can lead to a decrease in overall happiness.', 'It has no influence on well-being.'),
    ('Why is project organization important for programmers?', 'It helps maintain clarity, efficiency, and collaboration during development.', 'It makes code harder to read and understand.', 'It is a time-consuming process with no benefits.', 'It is only important for project managers.'),
    ('What is a common method for organizing code in a project?', 'Using directories or folders to group related files and modules.', 'Placing all code in a single file for simplicity.', 'Leaving code unorganized with no structure.', 'Using unrelated and arbitrary file names.'),
    ('What does "code modularization" involve in project organization?', 'Breaking code into reusable modules for easier maintenance and development.', 'Creating overly long and monolithic code files.', 'Avoiding functions and modules in coding.', 'Randomly mixing code from different projects.'),
    ('What is the purpose of a "project README" file?', 'To provide project documentation, instructions, and important information for collaborators and users.', 'To hide information from collaborators and users.', 'To store code for the project.', 'To create user manuals.'),
    ('What is a popular Java framework for building web applications?', 'Spring', 'Autumn', 'Winter', 'Summer'),
    ('In JavaScript, which framework is often used for building user interfaces?', 'React', 'Act', 'Proact', 'Interact'),
    ('What does the "MVC" pattern stand for in the context of web development?', 'Model-View-Controller', 'Model-View-Component', 'Manage-View-Code', 'Model-View-Container'),
    ('What is the primary purpose of a Java framework like Hibernate?', 'To simplify database interactions and object-relational mapping (ORM)', 'To design user interfaces', 'To create server-side logic', 'To manage front-end code'),
    ('Which JavaScript framework is known for its flexibility and versatility and is often used for building single-page applications?', 'Angular', 'Rectangle', 'Circle', 'Square'),
    ('What is the purpose of a software library in programming?', 'To provide pre-written, reusable code for common tasks or functionality.', 'To create new programming languages.', 'To design user interfaces.', 'To write code from scratch for every project.'),
    ('What does the term "API" stand for in the context of libraries?', 'Application Programming Interface', 'Advanced Programming Instruction', 'Algorithm and Programming Interface', 'Application and Process Integration'),
    ('In programming, what is a common use case for a "math library"?', 'Performing mathematical operations and calculations.', 'Managing databases.', 'Creating web page layouts.', 'Designing graphical user interfaces.'),
    ('Why are libraries essential in software development?', 'They save time and effort by providing tested and reliable code solutions.', 'They increase development costs.', 'They make code more complex and difficult to maintain.', 'They hinder collaboration with other developers.'),
    ('What is an example of a widely used library in web development for working with the Document Object Model (DOM)?', 'jQuery', 'jDocument', 'WebDOM', 'DOMMaster'),
    ('What does "full-stack programming" refer to?', 'The ability to work on both the front-end and back-end of a web application.', 'Exclusively working on front-end technologies.', 'Exclusively working on back-end technologies.', 'Managing databases without writing code.'),
    ('Why is full-stack development advantageous for certain projects?', 'It allows a developer to work on both ends of a web application, which can be more efficient and cost-effective.', 'It limits the developer to one specific role, making project management easier.', 'It is the only option for small projects.', 'It is not advantageous for any projects.'),
    ('What skills are essential for a full-stack developer?', 'Proficiency in both front-end and back-end technologies, as well as understanding databases.', 'Only expertise in front-end technologies.', 'Only expertise in back-end technologies.', 'Design skills without coding knowledge.'),
    ('What is the first step in learning programming for beginners?', 'Understanding fundamental concepts and selecting a programming language.', 'Creating complex applications from the start.', 'Memorizing code snippets.', 'Learning a single programming language for life.'),
    ('Why is problem-solving an important skill in programming?', 'Programming involves identifying and solving problems with code.', 'Problem-solving has no relevance in programming.', 'Programmers only follow instructions and don''t solve problems.', 'Problem-solving is mainly important for project managers.'),
    ('What is the value of practice and hands-on coding exercises in learning programming?', 'Practice helps reinforce concepts and improve coding skills.', 'Practice has no impact on learning programming.', 'Reading programming books is sufficient for mastery.', 'Practice is only important for experienced programmers.'),
    ('Why is it recommended to start with simple programming projects when learning?', 'Starting with simple projects helps build a foundation and gain confidence.', 'Complex projects are more enjoyable for beginners.', 'Simple projects are too boring for beginners.', 'Complex projects provide faster learning results.'),
    ('What role does online documentation and community forums play in programming learning?', 'They provide valuable resources for learning, troubleshooting, and finding solutions.', 'Online resources are not useful in programming.', 'Community forums are primarily for socializing.', 'Documentation and forums are only useful for experienced programmers.'),
    ('What is the main concept behind object-oriented programming (OOP)?', 'Organizing code into objects that encapsulate data and behavior.', 'Using global variables for all data storage.', 'Eliminating the need for functions.', 'Using only procedural programming.'),
    ('What is an "object" in the context of OOP?', 'An instance of a class that bundles data and methods.', 'A block of code used for calculations.', 'A single line of code in a program.', 'A database table.'),
    ('Why is not keeping track of code changes a common error for programmers?', 'Not tracking changes can lead to confusion and loss of code versions.', 'Keeping track of changes is unnecessary in programming.', 'Tracking changes is the sole responsibility of project managers.', 'Code changes are not important.'),
    ('Why is it important to maintain a healthy work-life balance?', 'To prevent burnout, reduce stress, and improve overall well-being.', 'Work should always be the top priority.', 'Maintaining work-life balance has no impact on health.', 'Balancing work and life is essential only for individuals with high stress jobs.'),
    ('What are the potential consequences of consistently overworking without a proper balance?', 'Increased stress, burnout, and negative effects on physical and mental health.', 'Overworking leads to enhanced productivity and well-being.', 'Overworking has no consequences.', 'Overworking primarily affects job performance.'),
    ('How can one achieve a healthy work-life balance?', 'By setting boundaries, prioritizing self-care, and managing time effectively.', 'By focusing solely on work and neglecting personal life.', 'Balancing work and personal life is unattainable.', 'Achieving work-life balance is only possible for a select few.'),
    ('What is the significance of taking regular breaks and vacations in maintaining a balanced life?', 'Taking breaks and vacations can recharge and rejuvenate individuals, reducing stress.', 'Regular breaks and vacations are not needed.', 'Breaks and vacations are detrimental to productivity.', 'Only individuals with high-stress jobs need breaks and vacations.'),
    ('How can technology and remote work affect work-life balance?', 'While technology enables flexibility, it can also blur the lines between work and personal life.', 'Technology has no impact on work-life balance.', 'Remote work is detrimental to work-life balance.', 'Technology and remote work only affect personal life, not work.'),
    ('In the MVC architectural pattern, what is the role of a "controller"?', 'Handling user input, making decisions, and updating the model and view.', 'Displaying data to the user.', 'Managing database connections.', 'Storing data in memory.'),
    ('What does a "service" typically do in a software application?', 'It encapsulates business logic, performs operations, and interacts with the repository.', 'It handles user interface and displays data.', 'It serves as a database management tool.', 'It is responsible for user authentication only.'),
    ('What is the primary purpose of a "repository" in programming?', 'It acts as an interface for data access and storage, often linked to a database.', 'It handles user input and updates the view.', 'It is responsible for routing requests in the application.', 'It displays the results to the user interface.'),
    ('What is the primary purpose of a Data Transfer Object (DTO) in software development?', 'DTOs are used to transfer data between different layers or components of an application, often to minimize network calls or simplify data transmission.', 'DTOs are used for complex data calculations.', 'DTOs are responsible for database management.', 'DTOs are used exclusively for user authentication.'),
    ('Why are Data Transfer Objects (DTOs) valuable in web services and APIs?', 'DTOs help reduce the amount of data sent over the network, improving performance and reducing data transfer costs.', 'DTOs have no role in web services and APIs.', 'DTOs primarily increase data transfer costs.', 'DTOs are only used in offline data processing.'),
    ('In version control systems, what does "GIT" signify?', 'Distributed Version Control System', 'Global Information Tracker', 'Graphical Interface Toolkit', 'General Integrated Technology');

































