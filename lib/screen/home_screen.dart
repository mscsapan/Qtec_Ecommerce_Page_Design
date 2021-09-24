import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qtech_task/constant/constant.dart';
import 'package:qtech_task/list/item_list.dart';
import 'package:qtech_task/model/product_model.dart';
import 'package:qtech_task/network/network_service.dart';
import 'package:qtech_task/widgets/expansion_item.dart';
import 'package:qtech_task/widgets/four_button.dart';
import 'package:qtech_task/widgets/page_view.dart';
import 'package:qtech_task/widgets/price_widget.dart';

import 'delivery_info.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final String title = 'Product Details';
  int _currentIndex = 0;
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
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(children: [
                const Icon(Icons.arrow_back_ios, color: mDarkBlack, size: 20.0),
                const SizedBox(width: 20.0),
                Text(_loading ? 'Loading..' : title,
                    style: GoogleFonts.roboto(
                        color: mDarkBlack, fontWeight: FontWeight.w700)),
              ]),
              const Icon(Icons.share, color: mDarkBlack),
            ],
          ),
          backgroundColor: Colors.transparent,
          elevation: 0.0),
      body: _loading
          ? const Center(child: Text('Loading'))
          : FutureBuilder<List<Product>>(
              future: api.getProduct(),
              builder: (context, AsyncSnapshot<List<Product>> snapshot) {
                return ListView.builder(
                  physics: const ClampingScrollPhysics(),
                  itemCount: snapshot.data != null ? snapshot.data!.length : 0,
                  itemBuilder: (context, index) {
                    Product product = _product[index];
                    return snapshot.hasData
                        ? Column(
                            // shrinkWrap: true,
                            children: [
                              SwiperPageView(
                                  onPosition: () {
                                    debugPrint(_currentIndex.toString());
                                  },
                                  onTap: (val) =>
                                      setState(() => _currentIndex = val!),
                                  image: image[_currentIndex],
                                  length: image.length,
                                  position: _currentIndex),
                              Container(height: 12.0, color: mWhite),
                              Container(
                                decoration: const BoxDecoration(
                                    color: mWhite,
                                    borderRadius: BorderRadius.only(
                                        bottomRight: Radius.circular(12),
                                        bottomLeft: Radius.circular(12))),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 12.0, vertical: 3.0),
                                        child: Text(description,
                                            style: GoogleFonts.roboto(
                                                color: mDescription,
                                                fontSize: 20.0,
                                                fontWeight: FontWeight.w400))),
                                    PriceWidget(
                                        price:
                                            'BDT ${product.productPrice.toString()}'),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 12.0),
                                      child: Row(
                                        children: List.generate(
                                            5, (index) => buildStar()),
                                      ),
                                    ),
                                    const SizedBox(height: 10.0),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 12.0),
                                      child: Text('Select Color',
                                          style: titleStyle()),
                                    ),
                                    const SizedBox(height: 10.0),
                                    const FourButton(),
                                  ],
                                ),
                              ),
                              const DeliveryInfo(),
                              const SizedBox(height: 6.0),
                              const ExpansionItem(),
                            ],
                          )
                        : const Center(child: CircularProgressIndicator());
                  },
                );
              }),
    );
  }
}
