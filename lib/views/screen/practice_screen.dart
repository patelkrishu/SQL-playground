import 'package:flutter/material.dart';
import 'package:flutter_code_editor/flutter_code_editor.dart';
import 'package:get/get.dart';
import 'package:new_sql_playground/utilitys/extensions/decorative_extension.dart';
import 'package:new_sql_playground/views/screen/question_list_screen.dart';
import '../../controller/sql_controller.dart';
import '../../storages/sql_model.dart';
import '../widget/buttons/orange_button.dart';
import '../widget/sql_result_drawer/sql_result.dart';
import '../widget/table_drawer_menu/table_drawer_menu.dart';
import '../widget/tiles/text_field.dart';

class SqlPlayScreen extends StatelessWidget {
  SqlPlayScreen({super.key});

  final CodeController codeController = CodeController(language: sql);

  final List<String> myQuestions = [
    'Display User Orders\n Question: Write a query to list all users along with their order details (order date, total amount).',
    'Total Amount Spent by Each User\n Question: Write a query to display each user and the total amount they have spent on orders.',
    'List Products in Each Order\n Question: Write a query to show each order with the products ordered and the quantity of each product.',
    'Top Rated Products\n Question: Write a query to display products with an average rating of 4 or higher. Include the product name, average rating, and the number of reviews.',
    'Users Last Order\n Question: Write a query to display each user\'s last order date.',
    'Products in Stock Less Than 10\n Question: Write a query to find all products where the stock quantity is less than 10.',
    'Order Shipping Details\n Question: Write a query to list all orders along with their shipping address details (address, city, postal code, country).',
    'Order Payment Method\n Question: Write a query to display each order\'s payment method and amount.',
    'Items in the Cart\n Question: Write a query to display the items in each user\'s cart along with the quantity of each product.',
    'Orders with Total Amount Greater Than 500 dollars\n Question: Write a query to display all orders where the total amount is greater than 500 dollars.',
    'Category-wise Product Count\n Question: Write a query to count how many products exist in each category.',
    'Most Frequently Purchased Products\n Question: Write a query to display the top 3 products that have been ordered the most by quantity.',
    'Average Review Rating Per Product\n Question: Write a query to display the average review rating for each product.',
    'Users Without Orders\n Question: Write a query to list all users who have not placed any orders.',
    'Cart Items with Product Details\n Question: Write a query to display the cart details for all users, showing the product name, price, and the quantity added to the cart.',
  ];

  final RxString selectedQuestion = ''.obs;

  @override
  Widget build(BuildContext context) {
    final SqlController controller = Get.put(SqlController());
    Size size = MediaQuery.of(context).size;

    return Column(
      children: [
        Container(
          /// view question ni je black box chhe ne te aa chhe ke jema challenges par click karvathi que show thay chhe.....
          height: 50,
          color: Theme.of(context).appBarTheme.backgroundColor,
          child: Row(
            children: [
              Expanded(
                /// question left side
                child: Obx(() {
                  return selectedQuestion.isNotEmpty
                      ? Text(
                          selectedQuestion.value,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                          overflow: TextOverflow.ellipsis,
                        )
                      : const SizedBox();
                }),
              ),
              OrangeButton(
                width: 150,
                text: 'Run',
                onTap: () async {
                  String query = codeController.text;
                  controller.fetchResponse(query, context);
                },
              ),
              10.hSpace,
              OrangeButton(
                width: 200,
                text: 'Challenges',
                onTap: () async {
                  final result = await Get.to(
                    () => QuestionListScreen(questions: myQuestions),
                  );

                  if (result != null && result is String) {
                    selectedQuestion.value = result;
                  }
                },
              ),
            ],
          ),
        ),
        Stack(
          children: [
            Row(
              children: [
                const TableInfo(),
                Obx(
                  () => TextFieldScreen(
                    width: size.width - controller.left.value,
                    onPanUpdate: (details) {
                      controller.left.value += details.delta.dx;
                    },
                    codeController: codeController,
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: 0,
              child: SQLResult(
                height: controller.bottom,
                data: size,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
