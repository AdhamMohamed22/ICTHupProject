import 'package:flutter/material.dart';
import 'package:task1/Features/FirstScreen/data/dataSource/ProductDataSource.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  @override
  void initState() {
    super.initState();
    ProductDataSource.getProductsData().then((value) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: ProductDataSource.isLoading
          ? const Center(child: CircularProgressIndicator())
          : ProductDataSource.isError
              ? const Center(child: Text("Failed To Fetch Data"))
              : ProductDataSource.data.isEmpty
                  ? const Center(
                      child: Text("No Data Found In Database"),
                    )
                  : SingleChildScrollView(
                      child: Container(
                        margin: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: ListView.separated(
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return ListTile(
                              leading: Image.network(
                                  ProductDataSource.data[index].image ??
                                      "assets/img/No Hay Ley.jpg",
                                  height: 100,
                                  width: 50),
                              title: Text(
                                ProductDataSource.data[index].title ??
                                    "title not found",
                                maxLines: 2,
                              ),
                              subtitle: Text(
                                ProductDataSource.data[index].description ??
                                    "description not found",
                                maxLines: 3,
                              ),
                              trailing: Text(
                                  '${ProductDataSource.data[index].price ?? 0.0}'),
                            );
                          },
                          itemCount: ProductDataSource.data.length,
                          separatorBuilder: (BuildContext context, int index) {
                            return const Divider(
                              thickness: 5,
                            );
                          },
                        ),
                      ),
                    ),
    ));
  }
}
