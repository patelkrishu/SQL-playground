import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/theory_controller.dart';
import '../../models/theory_model.dart';
import '../widget/content_builder/content_builder.dart';
import '../widget/text/tile_text.dart';

class LearnScreen extends StatelessWidget {
  LearnScreen({super.key});

  final TheoryController _controller = Get.put(TheoryController());

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: FutureBuilder(
              future: _controller.fetchTheory(),
              builder: (context, snapshot) {
                // print('~~~~~~~~~~~~ !!! $snapshot');
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }
                if (snapshot.hasError) {
                  print('~~~~~~>>> ${snapshot.error}');
                  return TitleText(
                    'Something went wrong',
                    color: Colors.orange,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  );
                }
                if (snapshot.hasData) {
                  List<TheoryModel> theory = snapshot.data!;
                  Future.delayed(Duration.zero).then(
                        (value) {
                      _controller.currentTheory.value = theory[0];
                    },
                  );
                  // print('+++++++++++++= ${theory.contents[0].title}');
                  // return TitleText(theory.contents[0].title);
                  return ListView.separated(
                    itemCount: theory.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        onTap: () {
                          _controller.currentTheory.value = theory[index];
                        },
                        tileColor: Theme.of(context).cardColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                          side: BorderSide(
                            color: Colors.orange,
                          ),
                        ),
                        title: Center(
                          child: TitleText(
                            theory[index].title,
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(
                        height: 10,
                      );
                    },
                  );
                }
                return TitleText(
                  'No data found!',
                  color: Colors.orange,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                );
              },
            ),
          ),
        ),
        Expanded(
            flex: 4,
            child: GetX<TheoryController>(
              builder: (controller) {
                return _controller.currentTheory.value != null
                    ? SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        TitleText(
                          _controller.currentTheory.value!.title,
                          color: Colors.orange,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                        ListView.separated(
                          shrinkWrap: true,
                          itemCount: _controller
                              .currentTheory.value!.contents.length,
                          itemBuilder: (context, index) {
                            return ContentBuilder(
                                contents: _controller
                                    .currentTheory.value!.contents[index]);
                          },
                          separatorBuilder: (context, index) => SizedBox(
                            height: 50,
                          ),
                          // Divider(),
                        )
                      ],
                    ),
                  ),
                )
                    : const Center(child: CircularProgressIndicator());
              },
            ))
//         Expanded(
//             flex: 4,
//             child: SingleChildScrollView(
//               child: Padding(
//                 padding: const EdgeInsets.all(20),
//                 child: Column(
//                   children: [
//
//                     TitleText('INTRODUCTION',color: Colors.orange,fontSize: 30,fontWeight: FontWeight.bold,),
//                     SizedBox(height: 20,),
//                     TitleText(' What is SQL ?',color: Colors.orange,fontSize: 20,fontWeight: FontWeight.bold,),
//                     TitleText('''• SQL (Structured Query Language) is a standardized programming language used to manage and manipulate relational databases.
// • It allows you to interact with the data stored in a database by performing operations like querying, updating, deleting, and inserting records.
// • SQL is designed to work with structured data, typically organized in tables consisting of rows and columns.
// • SQL is the primary language used to manage and manipulate relational databases.
// • If you're building applications that rely on data storage and retrieval, SQL is a fundamental tool.
// • Whether you're developing web, mobile, or desktop applications, knowing SQL will enable you to interact with databases efficiently.'''),
//                     SizedBox(height: 10,),
//                     TitleText('Why SQL Matters for Developers',color: Colors.orange,fontSize: 20,fontWeight: FontWeight.bold,),
//                     SizedBox(height: 10,),
//                     TitleText('''1. Data Manipulation: SQL allows you to interact with the data within your application. You can retrieve, modify, delete, or insert data with a few commands. It's essential when your application deals with structured data such as user profiles, product catalogs, or financial records.\n
// 2. Database Management: SQL provides the tools to create and manage database structures like tables, indexes, and relationships between datasets. For instance, a relational database ensures that data stored across multiple tables can be related and retrieved as a whole.\n
// 3. Integration with Programming Languages: SQL seamlessly integrates with popular programming languages (e.g., Python, Java, PHP, C#, Node.js) to fetch and update data dynamically. This is especially useful for full-stack development, where you'll need to query databases based on user actions in your app.\n
// 4. Efficiency & Scalability: SQL queries can be optimized for performance using indexes, views, and stored procedures, which helps in scaling applications to handle large datasets and high volumes of transactions.'''),
//                     SizedBox(height: 30,),
//                     TitleText('Core Concepts',color: Colors.orange,fontSize: 30,fontWeight: FontWeight.bold,),
//                     SizedBox(height: 20,),
//                     Padding(
//                       padding: const EdgeInsets.only(right: 1100),
//                       child: TitleText('1. Tables',fontWeight: FontWeight.bold,fontSize: 20,color: Colors.orange,),
//                     ),
//                     TitleText('''• Tables are the fundamental structure in SQL. Each table contains rows and columns where data is stored.
//
//  • Example:
//
//  CREATE TABLE users (
//      id INT PRIMARY KEY,
//      name VARCHAR(100),
//      email VARCHAR(100)
//  );'''),
//                     SizedBox(height: 10,),
//                     Padding(
//                       padding: const EdgeInsets.only(right: 1090),
//                       child: TitleText('2. Queries',fontWeight: FontWeight.bold,fontSize: 20,color: Colors.orange,),
//                     ),
//                     TitleText('''• SQL queries retrieve data from tables using the SELECT statement, with options to filter, sort, and join data from multiple tables.
//
// • Example:
//
//  SELECT name, email FROM users WHERE id = 1;'''),
//                     TitleText(''),
//                     TitleText(''),
//                     TitleText(''),
//                     TitleText(''),
//                     TitleText(''),
//
// //                     TitleText(
// //                       '''INTRODUCTION
// //
// //
// //  What is SQL ?
// //
// // => SQL (Structured Query Language) is a standardized programming language used to manage and manipulate relational databases.
// // => It allows you to interact with the data stored in a database by performing operations like querying, updating, deleting, and inserting records.
// // => SQL is designed to work with structured data, typically organized in tables consisting of rows and columns.
// // => SQL is the primary language used to manage and manipulate relational databases.
// // => If you're building applications that rely on data storage and retrieval, SQL is a fundamental tool.
// // => Whether you're developing web, mobile, or desktop applications, knowing SQL will enable you to interact with databases efficiently.
// //
// // * Why SQL Matters for Developers
// //
// // 1. Data Manipulation: SQL allows you to interact with the data within your application. You can retrieve, modify, delete, or insert data with a few commands. It's essential when your application deals with structured data such as user profiles, product catalogs, or financial records.
// //
// // 2. Database Management: SQL provides the tools to create and manage database structures like tables, indexes, and relationships between datasets. For instance, a relational database ensures that data stored across multiple tables can be related and retrieved as a whole.
// //
// // 3. Integration with Programming Languages: SQL seamlessly integrates with popular programming languages (e.g., Python, Java, PHP, C#, Node.js) to fetch and update data dynamically. This is especially useful for full-stack development, where you'll need to query databases based on user actions in your app.
// //
// // 4. Efficiency & Scalability: SQL queries can be optimized for performance using indexes, views, and stored procedures, which helps in scaling applications to handle large datasets and high volumes of transactions.
// //
// // * Core Concepts Every Developer Should Know
// //
// // 1. Tables: Tables are the fundamental structure in SQL. Each table contains rows and columns where data is stored.
// //
// // => Example:
// //
// // CREATE TABLE users (
// //     id INT PRIMARY KEY,
// //     name VARCHAR(100),
// //     email VARCHAR(100)
// // );
// //
// // 2. Queries: SQL queries retrieve data from tables using the SELECT statement, with options to filter, sort, and join data from multiple tables.
// //
// // => Example:
// //
// // SELECT name, email FROM users WHERE id = 1;
// //
// // 3. CRUD Operations:
// //
// // Create (INSERT): Add new records.
// //
// // Read (SELECT): Retrieve data.
// //
// // Update (UPDATE): Modify existing data.
// //
// // Delete (DELETE): Remove data.
// //
// // 4. Joins: Joins allow you to combine data from multiple tables based on related columns (usually keys).
// //
// // => Example:
// //
// // SELECT orders.id, users.name
// // FROM orders
// // JOIN users ON orders.user_id = users.id;
// //
// // 5. Indexes: Indexes help speed up database queries by providing a quick way to look up data. Proper indexing is crucial for performance optimization.
// //
// // 6. Transactions: Transactions allow you to group SQL commands so that they either all succeed or all fail, ensuring data integrity.
// //
// // 7. Normalization: Normalization is the process of structuring a database to minimize redundancy and dependency by dividing data into related tables.
// //
// // => Advanced SQL Features
// //
// // 1. Stored Procedures: Predefined SQL functions stored in the database that can be called to perform complex queries or operations.
// //
// // => Example:
// //
// // CREATE PROCEDURE getUser(IN userId INT)
// // BEGIN
// //     SELECT * FROM users WHERE id = userId;
// // END;
// //
// // 2. Triggers: These are automatic actions triggered by events such as data modification in a table.
// //
// // 3. Views: Virtual tables created by queries. They simplify complex queries and enhance security by restricting access to certain data.
// //
// //
// // Here’s a concise introduction to SQL (Structured Query Language) tailored for developers:
// //
// // Introduction to SQL for Developers
// // SQL is the primary language used to manage and manipulate relational databases. If you're building applications that rely on data storage and retrieval, SQL is a fundamental tool. Whether you're developing web, mobile, or desktop applications, knowing SQL will enable you to interact with databases efficiently.
// //
// // Why SQL Matters for Developers
// // Data Manipulation: SQL allows you to interact with the data within your application. You can retrieve, modify, delete, or insert data with a few commands. It's essential when your application deals with structured data such as user profiles, product catalogs, or financial records.
// //
// // Database Management: SQL provides the tools to create and manage database structures like tables, indexes, and relationships between datasets. For instance, a relational database ensures that data stored across multiple tables can be related and retrieved as a whole.
// //
// // Integration with Programming Languages: SQL seamlessly integrates with popular programming languages (e.g., Python, Java, PHP, C#, Node.js) to fetch and update data dynamically. This is especially useful for full-stack development, where you'll need to query databases based on user actions in your app.
// //
// // Efficiency & Scalability: SQL queries can be optimized for performance using indexes, views, and stored procedures, which helps in scaling applications to handle large datasets and high volumes of transactions.
// //
// // Core Concepts Every Developer Should Know
// // Tables: Tables are the fundamental structure in SQL. Each table contains rows and columns where data is stored.
// //
// // Example:
// //
// // sql
// // Copy code
// // CREATE TABLE users (
// //     id INT PRIMARY KEY,
// //     name VARCHAR(100),
// //     email VARCHAR(100)
// // );
// // Queries: SQL queries retrieve data from tables using the SELECT statement, with options to filter, sort, and join data from multiple tables.
// //
// // Example:
// //
// // sql
// // Copy code
// // SELECT name, email FROM users WHERE id = 1;
// // CRUD Operations:
// //
// // Create (INSERT): Add new records.
// // Read (SELECT): Retrieve data.
// // Update (UPDATE): Modify existing data.
// // Delete (DELETE): Remove data.
// // Joins: Joins allow you to combine data from multiple tables based on related columns (usually keys).
// //
// // Example:
// //
// // sql
// // Copy code
// // SELECT orders.id, users.name
// // FROM orders
// // JOIN users ON orders.user_id = users.id;
// // Indexes: Indexes help speed up database queries by providing a quick way to look up data. Proper indexing is crucial for performance optimization.
// //
// // Transactions: Transactions allow you to group SQL commands so that they either all succeed or all fail, ensuring data integrity.
// //
// // Normalization: Normalization is the process of structuring a database to minimize redundancy and dependency by dividing data into related tables.
// //
// // Advanced SQL Features
// // Stored Procedures: Predefined SQL functions stored in the database that can be called to perform complex queries or operations.
// //
// // Example:
// //
// // sql
// // Copy code
// // CREATE PROCEDURE getUser(IN userId INT)
// // BEGIN
// //     SELECT * FROM users WHERE id = userId;
// // END;
// // Triggers: These are automatic actions triggered by events such as data modification in a table.
// //
// // Views: Virtual tables created by queries. They simplify complex queries and enhance security by restricting access to certain data.
// //
// // => SQL in Modern Development
// //
// // * Backend Development: SQL is integral to server-side programming where databases store user credentials, transaction data, and application logs.
// //
// // * Full-Stack Web Development: SQL is commonly used alongside frameworks like Django, Laravel, and Ruby on Rails, making it an essential tool for full-stack developers.
// //
// // * Mobile Development: Apps often require offline storage or cloud-based databases, where SQL can be used to handle local databases (SQLite) or interact with cloud databases.
// //
// // * Data Science & Analytics: SQL is invaluable for querying large datasets stored in relational databases, making it an important tool in the world of data science and business analytics.
// //
// // => Next Steps for Developers
// //
// // 1. Set Up Your Database: Start by setting up a relational database system like MySQL, PostgreSQL, or SQLite.
// //
// // 2. Practice Basic Queries: Experiment with CRUD operations on a sample dataset.
// //
// // 3. Integrate with Code: Use SQL queries within your application code, combining it with libraries like SQLAlchemy (Python), JDBC (Java), or Node.js database drivers.
// //
// // 4. Learn Optimization: As your applications scale, learning how to optimize SQL queries and database performance becomes crucial.''',
// //                     ),
//                   ],
//                 ),
//               ),
//             )),
      ],
    );
  }
}

//
// const myFont = GoogleFonts.gowunBatang;
//
// class LearnScreen extends StatelessWidget {
//   const LearnScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//         children: [
//           // FinalAppbar(),
//           Row(
//             children: [
//               Expanded(
//                 child: Container(
//                   height: 70,
//                   // color: Color(0xff494949),
//                   decoration: BoxDecoration(
//                     // color: Color(0xff1e1f24),
//                       color: Color(0xff26282e),
//                     // color: Color(0xff303030),
//                     border: Border.all(
//                       width: 2,
//                       color: Colors.white70,
//                     )
//                   ),
//                   child: Center(child: Text('Topic',
//                     style: TextStyle(
//                         color: Color(0xffdbdbdb),
//                         fontSize: 20,
//                         fontWeight: FontWeight.bold
//                     ),)),
//                 ),
//               ),
//               SizedBox(width: 1,),
//               Expanded(
//                 flex: 4,
//                 child: Container(
//                   height: 70,
//                   // color: Color(0xff494949),
//                     decoration: BoxDecoration(
//                       // color: Color(0xff1e1f24),
//                       //   color: Color(0xff303030),
//                       //   color: Color(0xff1e1f24),
//                         color: Color(0xff26282e),
//                         border: Border.all(
//                           width: 2,
//                           color: Colors.white70,
//                         )
//                     ),
//                   child: Center(child: Text('Information',style: TextStyle(color: Color(0xffdbdbdb),fontSize: 20,fontWeight: FontWeight.bold)),
//                   )
//                 ),
//               ),
//             ],
//           ),
//           Expanded(
//             child: Row(
//               children: [
//                 Expanded(
//                   child: Container(
//                     // height: 200,
//                     // width: 200,
//                     // color: Color(0xff494949),
//                     // color: Color(0xff303030),
//                     // color: Color(0xff1e1f24),
//                     color: Color(0xff26282e),
//
//                     child: ListView.builder(
//                       itemCount: 25,
//                       itemBuilder: (BuildContext context, int index) {
//                         return Container(
//                           decoration: BoxDecoration(
//                             border: Border.all(color: Colors.white70,width: 2),
//                           ),
//                           child: ListTile(
//                             title: Center(child: Text('item $index',style: TextStyle(color: Color(0xffdbdbdb),fontSize: 20,fontWeight: FontWeight.bold))),
//                           ),
//                         );
//                       },
//                     ),
//                   ),
//                 ),
//                 Expanded(
//                     flex: 4,
//                     child: Column(
//                       children: [
//                         Expanded(
//                           child: SingleChildScrollView(
//                             child: Container(
//                                               // color: Colors.grey,
//                                               child: Padding(
//                                                 padding: const EdgeInsets.all(20),
//                                                 child: Text('''INTRODUCTION......
//
//
// * What is SQL ?
//
// => SQL (Structured Query Language) is a standardized programming language used to manage and manipulate relational databases.
// => It allows you to interact with the data stored in a database by performing operations like querying, updating, deleting, and inserting records.
// => SQL is designed to work with structured data, typically organized in tables consisting of rows and columns.
// => SQL is the primary language used to manage and manipulate relational databases.
// => If you're building applications that rely on data storage and retrieval, SQL is a fundamental tool.
// => Whether you're developing web, mobile, or desktop applications, knowing SQL will enable you to interact with databases efficiently.
//
// * Why SQL Matters for Developers
//
// 1. Data Manipulation: SQL allows you to interact with the data within your application. You can retrieve, modify, delete, or insert data with a few commands. It's essential when your application deals with structured data such as user profiles, product catalogs, or financial records.
//
// 2. Database Management: SQL provides the tools to create and manage database structures like tables, indexes, and relationships between datasets. For instance, a relational database ensures that data stored across multiple tables can be related and retrieved as a whole.
//
// 3. Integration with Programming Languages: SQL seamlessly integrates with popular programming languages (e.g., Python, Java, PHP, C#, Node.js) to fetch and update data dynamically. This is especially useful for full-stack development, where you'll need to query databases based on user actions in your app.
//
// 4. Efficiency & Scalability: SQL queries can be optimized for performance using indexes, views, and stored procedures, which helps in scaling applications to handle large datasets and high volumes of transactions.
//
// * Core Concepts Every Developer Should Know
//
// 1. Tables: Tables are the fundamental structure in SQL. Each table contains rows and columns where data is stored.
//
// => Example:
//
// CREATE TABLE users (
//     id INT PRIMARY KEY,
//     name VARCHAR(100),
//     email VARCHAR(100)
// );
//
// 2. Queries: SQL queries retrieve data from tables using the SELECT statement, with options to filter, sort, and join data from multiple tables.
//
// => Example:
//
// SELECT name, email FROM users WHERE id = 1;
//
// 3. CRUD Operations:
//
// Create (INSERT): Add new records.
//
// Read (SELECT): Retrieve data.
//
// Update (UPDATE): Modify existing data.
//
// Delete (DELETE): Remove data.
//
// 4. Joins: Joins allow you to combine data from multiple tables based on related columns (usually keys).
//
// => Example:
//
// SELECT orders.id, users.name
// FROM orders
// JOIN users ON orders.user_id = users.id;
//
// 5. Indexes: Indexes help speed up database queries by providing a quick way to look up data. Proper indexing is crucial for performance optimization.
//
// 6. Transactions: Transactions allow you to group SQL commands so that they either all succeed or all fail, ensuring data integrity.
//
// 7. Normalization: Normalization is the process of structuring a database to minimize redundancy and dependency by dividing data into related tables.
//
// => Advanced SQL Features
//
// 1. Stored Procedures: Predefined SQL functions stored in the database that can be called to perform complex queries or operations.
//
// => Example:
//
// CREATE PROCEDURE getUser(IN userId INT)
// BEGIN
//     SELECT * FROM users WHERE id = userId;
// END;
//
// 2. Triggers: These are automatic actions triggered by events such as data modification in a table.
//
// 3. Views: Virtual tables created by queries. They simplify complex queries and enhance security by restricting access to certain data.
//
//
// Here’s a concise introduction to SQL (Structured Query Language) tailored for developers:
//
// Introduction to SQL for Developers
// SQL is the primary language used to manage and manipulate relational databases. If you're building applications that rely on data storage and retrieval, SQL is a fundamental tool. Whether you're developing web, mobile, or desktop applications, knowing SQL will enable you to interact with databases efficiently.
//
// Why SQL Matters for Developers
// Data Manipulation: SQL allows you to interact with the data within your application. You can retrieve, modify, delete, or insert data with a few commands. It's essential when your application deals with structured data such as user profiles, product catalogs, or financial records.
//
// Database Management: SQL provides the tools to create and manage database structures like tables, indexes, and relationships between datasets. For instance, a relational database ensures that data stored across multiple tables can be related and retrieved as a whole.
//
// Integration with Programming Languages: SQL seamlessly integrates with popular programming languages (e.g., Python, Java, PHP, C#, Node.js) to fetch and update data dynamically. This is especially useful for full-stack development, where you'll need to query databases based on user actions in your app.
//
// Efficiency & Scalability: SQL queries can be optimized for performance using indexes, views, and stored procedures, which helps in scaling applications to handle large datasets and high volumes of transactions.
//
// Core Concepts Every Developer Should Know
// Tables: Tables are the fundamental structure in SQL. Each table contains rows and columns where data is stored.
//
// Example:
//
// sql
// Copy code
// CREATE TABLE users (
//     id INT PRIMARY KEY,
//     name VARCHAR(100),
//     email VARCHAR(100)
// );
// Queries: SQL queries retrieve data from tables using the SELECT statement, with options to filter, sort, and join data from multiple tables.
//
// Example:
//
// sql
// Copy code
// SELECT name, email FROM users WHERE id = 1;
// CRUD Operations:
//
// Create (INSERT): Add new records.
// Read (SELECT): Retrieve data.
// Update (UPDATE): Modify existing data.
// Delete (DELETE): Remove data.
// Joins: Joins allow you to combine data from multiple tables based on related columns (usually keys).
//
// Example:
//
// sql
// Copy code
// SELECT orders.id, users.name
// FROM orders
// JOIN users ON orders.user_id = users.id;
// Indexes: Indexes help speed up database queries by providing a quick way to look up data. Proper indexing is crucial for performance optimization.
//
// Transactions: Transactions allow you to group SQL commands so that they either all succeed or all fail, ensuring data integrity.
//
// Normalization: Normalization is the process of structuring a database to minimize redundancy and dependency by dividing data into related tables.
//
// Advanced SQL Features
// Stored Procedures: Predefined SQL functions stored in the database that can be called to perform complex queries or operations.
//
// Example:
//
// sql
// Copy code
// CREATE PROCEDURE getUser(IN userId INT)
// BEGIN
//     SELECT * FROM users WHERE id = userId;
// END;
// Triggers: These are automatic actions triggered by events such as data modification in a table.
//
// Views: Virtual tables created by queries. They simplify complex queries and enhance security by restricting access to certain data.
//
// => SQL in Modern Development
//
// * Backend Development: SQL is integral to server-side programming where databases store user credentials, transaction data, and application logs.
//
// * Full-Stack Web Development: SQL is commonly used alongside frameworks like Django, Laravel, and Ruby on Rails, making it an essential tool for full-stack developers.
//
// * Mobile Development: Apps often require offline storage or cloud-based databases, where SQL can be used to handle local databases (SQLite) or interact with cloud databases.
//
// * Data Science & Analytics: SQL is invaluable for querying large datasets stored in relational databases, making it an important tool in the world of data science and business analytics.
//
// => Next Steps for Developers
//
// 1. Set Up Your Database: Start by setting up a relational database system like MySQL, PostgreSQL, or SQLite.
//
// 2. Practice Basic Queries: Experiment with CRUD operations on a sample dataset.
//
// 3. Integrate with Code: Use SQL queries within your application code, combining it with libraries like SQLAlchemy (Python), JDBC (Java), or Node.js database drivers.
//
// 4. Learn Optimization: As your applications scale, learning how to optimize SQL queries and database performance becomes crucial.''',
//
//                                                  style: myFont(
//                                                     textStyle:  TextStyle(color: Color(0xffdbdbdb),fontSize: 20,),
//                                                  ),),
//                                               ),
//                                             ),
//                           ),
//                         ),
//                       ],
//                     ))
//               ],
//             ),
//           ),
//           // Row(
//           //   children: [
//           //     Container(
//           //       height: 200,
//           //       width: 290,
//           //       color: Colors.grey,
//           //     )
//           //   ],
//           // )
//         ],
//       );
//   }
// }
// style: TextStyle(color: Color(0xffdbdbdb),fontSize: 20,fontWeight: FontWeight.bold)