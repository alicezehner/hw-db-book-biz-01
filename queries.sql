USE BookDB;

-- 7.1
SELECT concat(A.FirstName,' ',A.LastName) AS Name, GROUP_CONCAT(B.Title) AS Titles FROM Books B INNER JOIN Book_Authors BA ON B.BookID = BA.BookID INNER JOIN Authors A ON BA.AuthorID = A.AuthorID GROUP BY A.LastName, A.FirstName ORDER BY A.LastName;

-- 7.2
SELECT B.Title, GROUP_CONCAT(A.LastName) Authors FROM Books B JOIN Book_Authors BA ON B.BookID = BA.BookID JOIN Authors A ON BA.AuthorID = A.AuthorID GROUP BY B.Title;

-- 7.3
SELECT B.Title, B.Price*B.Royalty*COUNT(OD.BookId) AS Profit FROM Books B JOIN Order_Details OD ON B.BookId = OD.BookId GROUP BY B.Title, B.Price, B.Royalty;

-- 7.4
SELECT Name, SUM(Profit) AS TotalRoyalties FROM (
SELECT concat(A.FirstName,' ',A.LastName) AS Name, SUM(B.Price*B.Royalty) AS Profit FROM Books B JOIN Book_Authors BA ON B.BookId= BA.BookId JOIN Order_Details OD ON B.BookId = OD.BookId JOIN Authors A ON BA.AuthorId = A.AuthorId GROUP BY A.LastName, A.FirstName, B.Price, B.Royalty
) sub GROUP BY Name;

-- 7.5
SELECT G.Genre, GROUP_CONCAT(B.Title) Titles FROM Genres G Join Book_Genres BG ON G.GenreID = BG.GenreID JOIN Books B ON BG.BookID = B.BookID GROUP BY G.Genre;

-- 7.6
SELECT P.Name, GROUP_CONCAT(B.Title) Titles FROM Books B JOIN Publishers P ON B.PublisherID = P.PublisherID GROUP BY P.Name;

-- 7.7
SELECT B.Title, GROUP_CONCAT(concat(E.FirstName,' ',E.LastName)) AS Editors FROM Books B INNER JOIN Book_Editors BE ON B.BookID = BE.BookID INNER JOIN Editors E ON BE.EditorID = E.EditorID GROUP BY B.Title;

-- 7.8
SELECT concat(E.FirstName,' ',E.LastName) AS Name, GROUP_CONCAT(B.Title) AS Titles FROM Books B INNER JOIN Book_Editors BE ON B.BookID = BE.BookID INNER JOIN Editors E ON BE.EditorID = E.EditorID GROUP BY E.LastName, E.FirstName ORDER BY E.LastName;

-- 7.9
SELECT O.OrderId, group_concat(B.Title) AS Items FROM Orders O JOIN Order_Details OD ON O.OrderId = OD.OrderId JOIN Books B ON OD.BookId = B.BookID GROUP BY O.OrderId;

-- 7.10
SELECT B.Title, count(OD.OrderId) AS Orders FROM Books B JOIN Order_Details OD ON B.BookId = OD.BookId GROUP BY B.Title;

-- 7.11
SELECT O.CustomerId, O.OrderId, group_concat(B.Title) AS Titles FROM Orders O JOIN Order_Details OD ON O.OrderId = OD.OrderId JOIN Books B ON OD.BookId = B.BookId GROUP BY O.CustomerId, O.OrderId;

-- 7.12
SELECT CustomerId, OrderId FROM Orders Order BY CustomerId;