// ignore_for_file: prefer_const_constructors

import 'package:bloc_practice/api/cubit/api_handel_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<LiquidPullToRefreshState> _refreshIndicatorKey =
        GlobalKey<LiquidPullToRefreshState>();
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                'assets/images/jack.jpg',
              ),
              fit: BoxFit.cover),
        ),
        child: LiquidPullToRefresh(
          key: _refreshIndicatorKey,
          onRefresh: () async =>
              BlocProvider.of<ApiHandelCubit>(context).getNews(),
          showChildOpacityTransition: false,
          child: BlocBuilder<ApiHandelCubit, ApiHandelState>(
            builder: (context, state) {
              if (state is ApiHandelLoadingState) {
                return Center(child: CircularProgressIndicator());
              }
              if (state is ApiHandelLoadedState) {
                return ListView.builder(
                  itemCount: state.apiData.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      margin: EdgeInsets.only(top: 10, bottom: 10),
                      height: 370,
                      width: double.infinity,
                      decoration:
                          BoxDecoration(color: Color.fromARGB(178, 0, 0, 0)),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.network(
                              state.apiData[index].urlToImage,
                              height: 220,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              state.apiData[index].title,
                              maxLines: 2,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 19),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(state.apiData[index].author,
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 149, 163, 243),
                                        fontSize: 18,
                                        fontWeight: FontWeight.w800)),
                                SizedBox(
                                  width: 20,
                                ),
                                InkWell(
                                  child: Container(
                                    height: 40,
                                    width: 100,
                                    decoration: BoxDecoration(
                                        color: Colors.blue,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Center(
                                      child: Text(
                                        "Read More",
                                        style: TextStyle(
                                          fontSize: 17,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            )
                          ]),
                    );
                  },
                );
              } else {
                return Center(
                  child: Text("Something went wrong"),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
