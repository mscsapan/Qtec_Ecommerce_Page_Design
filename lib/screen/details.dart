import 'package:flutter/material.dart';
import 'package:qtech_task/model/product_model.dart';
import 'package:qtech_task/network/network_service.dart';

class Details extends StatefulWidget {
  const Details({Key? key}) : super(key: key);

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  NetworkApi api = NetworkApi();
  late final List<Product> _product;
  late bool _loading;

  loadData() {
    setState(() {
      _loading = true;
    });
    api.getProduct().then((v) {
      setState(() {
        _product = v;
        _loading = false;
      });
    });
  }

  @override
  void initState() {
    loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(_loading ? 'Loading..' : 'Product'), centerTitle: true),
      body: _loading
          ? const Center(child: Text('Loading'))
          : FutureBuilder<List<Product>>(
              future: api.getProduct(),
              builder: (context, AsyncSnapshot<List<Product>> snapshot) {
                return ListView.builder(
                  itemCount: snapshot.data != null ? snapshot.data!.length : 0,
                  itemBuilder: (context, index) {
                    Product pro = _product[index];
                    return snapshot.hasData
                        ? Column(
                            children: [
                              SizedBox(
                                height: 250.0,
                                width: double.infinity,
                                child: PageView(
                                  children: [
                                    Image.network('${pro.image}',
                                        fit: BoxFit.cover),
                                    Image.network('${pro.bannerImage}',
                                        fit: BoxFit.cover),
                                  ],
                                ),
                              ),
                              ListTile(
                                title: Text('${pro.productName}'),
                                subtitle: Text('${pro.maximumOrder}'),
                                trailing: Text(pro.productPrice.toString()),
                                leading: CircleAvatar(
                                    backgroundImage:
                                        NetworkImage('${pro.bannerImage}')),
                              ),
                            ],
                          )
                        : const Center(child: CircularProgressIndicator());
                  },
                );
              }),
    );
  }
}
