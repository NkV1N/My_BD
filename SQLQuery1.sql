CREATE DATABASE Sklad;
GO
USE Sklad;

CREATE TABLE Client(
	Client_id INT IDENTITY(1,1),
	Family VARCHAR(255),
	Client_name VARCHAR(255),
	Last_name VARCHAR(255),
	Number_phone VARCHAR(255),
	Email VARCHAR(255),
	PRIMARY KEY(CLient_id)
);

CREATE TABLE Job(
	Job_id INT IDENTITY(1,1),
	Name_job VARCHAR(255),
	PRIMARY KEY (Job_id)
);

CREATE TABLE Category(
	Category_id INT IDENTITY(1,1),
	Category_name VARCHAR(255),
	PRIMARY KEY (Category_id)
);

CREATE TABLE [User](
	[User_id] INT IDENTITY(1,1),
	Family VARCHAR(255),
	[User_name] VARCHAR(255),
	Last_name VARCHAR(255),
	Job_id INT FOREIGN KEY REFERENCES Job(Job_id),
	PRIMARY KEY ([User_id])
);

CREATE TABLE Product(
	Product_id INT IDENTITY(1,1),
	Product_name VARCHAR(255),
	Category_id INT FOREIGN KEY REFERENCES Category(Category_id),
	Price INT,
	[Count] INT,
	PRIMARY KEY (Product_id)
);

CREATE TABLE Buy(
	Buy_id INT IDENTITY(1,1),
	Product_id INT FOREIGN KEY REFERENCES Product(Product_id),
	Totle_price INT,
	[User_id] INT FOREIGN KEY REFERENCES [User]([User_id]),
	PRIMARY KEY (Buy_id)
);

CREATE TABLE BuyClient(
	BuyClient_id INT IDENTITY(1,1),
	Client_id INT FOREIGN KEY REFERENCES Client(Client_id),
	Product_id INT FOREIGN KEY REFERENCES Product(Product_id),
	Totle_price INT,
	[Count] INT
	PRIMARY KEY (BuyClient_id)
);

USE Sklad;

INSERT INTO Client(Family, Client_name, Last_name, Number_phone, Email) VALUES ('Петров', 'Николай', 'Павлович', '89826567332', 'kolyapetrov00@gmail.com');
INSERT INTO Client(Family, Client_name, Last_name, Number_phone, Email) VALUES ('Сидоров', 'Кирилл', 'Николаевич', '89222514224', 'sidorovkirill04@gmail.com');
INSERT INTO Client(Family, Client_name, Last_name, Number_phone, Email) VALUES ('Пентяев', 'Владимир', 'Валентинович', '89122984512', 'pentuaevvladimir12@gmail.com');
INSERT INTO Client(Family, Client_name, Last_name, Number_phone, Email) VALUES ('Вологда', 'Павел', 'Валерьевич', '89821238653', 'vologdapavellll77@gmail.com');
INSERT INTO Client(Family, Client_name, Last_name, Number_phone, Email) VALUES ('Сулимова', 'Алина', 'Владимировна', '89925433459', 'sulimovaalina25@gmail.com');

INSERT INTO Job(Name_job) VALUES('Грузчик');
INSERT INTO Job(Name_job) VALUES('Менеджер');
INSERT INTO Job(Name_job) VALUES('Директор склада');

INSERT INTO Category(Category_name) VALUES('Компьютер');
INSERT INTO Category(Category_name) VALUES('Блок питания');
INSERT INTO Category(Category_name) VALUES('Процессор');
INSERT INTO Category(Category_name) VALUES('Видеокарта');
INSERT INTO Category(Category_name) VALUES('Кулер');
INSERT INTO Category(Category_name) VALUES('Жесткий диск');

INSERT INTO [User](Family, [User_name], Last_name, Job_id) VALUES('Сидоренко', 'Олег', 'Игоревич', 1);
INSERT INTO [User](Family, [User_name], Last_name, Job_id) VALUES('Павлов', 'Сегрей', 'Сергеевич', 1);
INSERT INTO [User](Family, [User_name], Last_name, Job_id) VALUES('Устьянцева', 'Валерия', 'Петровна', 1);
INSERT INTO [User](Family, [User_name], Last_name, Job_id) VALUES('Агеев', 'Павел', 'Сергеевич', 2);
INSERT INTO [User](Family, [User_name], Last_name, Job_id) VALUES('Приходько', 'Ирина', 'Вячеславовна', 3)

INSERT INTO Product(Product_name, Category_id, Price, [Count]) VALUES('AMD Ryzen 5 3550h', 3, 20000, 6);
INSERT INTO Product(Product_name, Category_id, Price, [Count]) VALUES('Intel Core i7 11370', 3, 35500, 89);
INSERT INTO Product(Product_name, Category_id, Price, [Count]) VALUES('Nvidia GeFource 1650', 4, 16999, 10);
INSERT INTO Product(Product_name, Category_id, Price, [Count]) VALUES('Cooler Master A30 ', 5, 299, 24);
INSERT INTO Product(Product_name, Category_id, Price, [Count]) VALUES('HYPERPC LUMEN PRO PLUS', 1, 210000, 2);
INSERT INTO Product(Product_name, Category_id, Price, [Count]) VALUES('ExeGate AB350', 2, 350, 90);
INSERT INTO Product(Product_name, Category_id, Price, [Count]) VALUES('WD Caviar Blue WD10EZEX', 6, 3390, 15);

INSERT INTO BuyClient(Client_id, Product_id, Totle_price, [Count]) VALUES(1, 1, 40000, 2);
INSERT INTO BuyClient(Client_id, Product_id, Totle_price, [Count]) VALUES(2, 7, 3390, 1);
INSERT INTO BuyClient(Client_id, Product_id, Totle_price, [Count]) VALUES(3, 5, 210000, 1);
INSERT INTO BuyClient(Client_id, Product_id, Totle_price, [Count]) VALUES(4, 3, 50997, 3);
INSERT INTO BuyClient(Client_id, Product_id, Totle_price, [Count]) VALUES(5, 6, 2450, 7);

INSERT INTO Buy(Product_id, Totle_price, [User_id], [Count]) VALUES(3, 230000, 4, 13);
INSERT INTO Buy(Product_id, Totle_price, [User_id], [Count]) VALUES(1, 100000, 5, 9);
INSERT INTO Buy(Product_id, Totle_price, [User_id], [Count]) VALUES(2, 320000, 4, 19);
INSERT INTO Buy(Product_id, Totle_price, [User_id], [Count]) VALUES(6, 31500, 5, 40);
INSERT INTO Buy(Product_id, Totle_price, [User_id], [Count]) VALUES(7, 51000, 5, 23);
INSERT INTO Buy(Product_id, Totle_price, [User_id], [Count]) VALUES(4, 7200, 4, 20);

USE Sklad
SELECT * FROM Client;
SELECT * FROM Buy;
SELECT * FROM Job;
SELECT * FROM Category;
SELECT * FROM [User];
SELECT * FROM Product;
SELECT * FROM BuyClient;
USE Sklad;
--
SELECT Category.Category_name, Product.Product_name, Totle_price, Buy.[Count], [User].Family, [User].[User_name], [User].Last_name, Job.Name_job
FROM Product, Category, Buy, [User], Job
WHERE Job.Job_id = [User].Job_id AND [User].[User_id] = Buy.[User_id] AND Buy.Product_id = Product.Product_id AND Product.Category_id = Category.Category_id
--
SELECT Category.Category_name, Product.Product_name, BuyClient.[Count], BuyClient.Totle_price, Client.Client_name, Client.Family, Client.Last_name, Client.Number_phone, Client.Email
FROM Category, Product, BuyClient, Client
WHERE Category.Category_id = Product.Category_id AND Product.Product_id = BuyClient.Product_id AND BuyClient.Client_id = Client.Client_id
--
SELECT Category.Category_name, Product.Product_name, BuyClient.[Count], BuyClient.Totle_price, Client.Client_name, Client.Family, Client.Last_name, Client.Number_phone, Client.Email
FROM Category, Product, BuyClient, Client
WHERE Category.Category_id = Product.Category_id AND Product.Product_id = BuyClient.Product_id AND BuyClient.Client_id = Client.Client_id AND Client.Family = 'Петров'
--
SELECT Product.Product_name, Category.Category_name, Totle_price, [User].Family, [User].[User_name], [User].Last_name, Job.Name_job
FROM Product, Category, Buy, [User], Job
WHERE Job.Job_id = [User].Job_id AND [User].[User_id] = Buy.[User_id] AND Buy.Product_id = Product.Product_id AND Product.Category_id = Category.Category_id AND [User].Family = 'Агеев'