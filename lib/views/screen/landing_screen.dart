import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../services/api_services/api_Service.dart';
import '../widget/contact_us_pannle/contact_us_pannle.dart';
import '../widget/text/tile_text.dart';

class LandingScreen extends StatelessWidget {
  LandingScreen({super.key});

  final ApiService _apiService = Get.put(ApiService());

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(left: 80, right: 80),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 80,
              width: size.width,
              child: const Center(
                  child: TitleText(
                'SQL PlayGround : Where Learning Meets Data!',
                color: Colors.orange,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              )),
            ),
            const SizedBox(
              height: 30,
            ),
            const TitleText(
              'Learning SQL is beneficial for several reasons',
              color: Colors.orange,
              fontSize: 20,
              fontWeight: FontWeight.bold,


            ),
            const TitleText(
                '''\n1. Data Management: SQL is the standard language for managing and manipulating databases, making it essential for handling data efficiently.
            \n2. Career Opportunities: Proficiency in SQL is a valuable skill in many fields, including data analysis, software development, and business intelligence, leading to better job prospects.
            \n3. Data-Driven Decisions: Understanding SQL enables you to extract insights from data, helping businesses make informed decisions.
            \n4. Versatility: SQL is used across various database systems (like MySQL, PostgreSQL, and Microsoft SQL Server), making it widely applicable.
            \n5. Improved Problem-Solving: Learning SQL enhances your analytical skills and ability to tackle complex data-related problems.
            \n6. Collaboration: Knowledge of SQL helps you work effectively with data teams, bridging the gap between technical and non-technical stakeholders.
            \n7. Foundational Skill: SQL serves as a foundation for learning other data technologies and programming languages.
            \n8. Efficiency: With SQL, you can automate data retrieval and reporting, saving time and reducing errors.
             '''),
            const TitleText(
              '\nOur Vision',
              fontWeight: FontWeight.bold,
              fontSize: 25,
              color: Colors.orange,
            ),
            const TitleText(
                '''provide users with a comprehensive, all-in-one platform for mastering SQL through interactive learning, practical exercises, and engaging quizzes.'''),
            const Padding(
                padding: EdgeInsets.only(right: 1290),
                child: TitleText(
                  '\nLearning: ',
                  color: Colors.orange,
                )),
            const TitleText(
                'Our platform offers structured lessons that break down SQL concepts into digestible modules. Users can learn at their own pace, starting from the basics and advancing to more complex topics. This ensures a solid foundation and builds confidence in their SQL skills.'),
            const Padding(
                padding: EdgeInsets.only(right: 1290),
                child: TitleText(
                  'Practice: ',
                  color: Colors.orange,
                )),
            const TitleText(
                'To reinforce learning, we provide a hands-on environment where users can practice writing SQL queries. This practical application of knowledge helps solidify understanding and improves retention. Users can experiment with real datasets, allowing them to see the immediate impact of their queries.'),
            const Padding(
              padding: EdgeInsets.only(right: 1300),
              child: TitleText(
                'Quizzes: ',
                color: Colors.orange,
              ),
            ),
            const TitleText(
                'To gauge progress and understanding, our platform features interactive quizzes that test users on what they have learned. These quizzes offer instant feedback, helping users identify areas for improvement and reinforcing their knowledge through repetition.'),
            const Padding(
              padding: EdgeInsets.only(right: 1200),
              child: TitleText(
                'One-Stop Solution: ',
                color: Colors.orange,
              ),
            ),
            const TitleText(
                'By combining learning, practice, and assessment in one platform, we eliminate the need for multiple resources. Users can access everything they need to master SQL in one place, making the learning process more efficient and enjoyable.\n\n'),
          ContactUsPanel()
          ],
        ),
      ),
    );
  }
}
