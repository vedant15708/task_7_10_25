import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      builder: (context, child) {
        return const MaterialApp(
          debugShowCheckedModeBanner: false,
          home: PageViewExample(),
        );
      },
    );
  }
}

class PageViewExample extends StatefulWidget {
  const PageViewExample({super.key});

  @override
  State<PageViewExample> createState() => _PageViewExampleState();
}

class _PageViewExampleState extends State<PageViewExample> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page!.round();
      });
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Widget _buildIndicator(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      margin: EdgeInsets.symmetric(horizontal: 4.w),
      width: isActive ? 15.w : 15.w,
      height: isActive ? 15.w : 15.w,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isActive ? Colors.blue : Colors.transparent,
        border: Border.all(color: Colors.blue, width: 1.5.w),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  PageView(
        controller: _pageController,
        children: [
          Container(
            color: Colors.red,
            child: Center(
                child: Text(
                  'Page 1',
                  style: TextStyle(color: Colors.white,fontSize: 20.sp),
                )),
          ),
          Container(
            color: Colors.pink,
            child: Center(
                child: Text(
                  'Page 2',
                  style: TextStyle(color: Colors.white,fontSize: 20.sp),
                )),
          ),
          Container(
            color: Colors.purple,
            child: Center(
                child: Text(
                  'Page 3',
                  style: TextStyle(color: Colors.white,fontSize: 20.sp),
                )),
          ),
        ],
      ),
        bottomNavigationBar: Container(
            height: 60.h,
            color: Colors.white,
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                   Text(
                  'My logo',
                  style: TextStyle(color: Colors.blue,fontSize: 25.sp,fontWeight: FontWeight.bold),
                ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(3, (index) {
                  return _buildIndicator(_currentPage == index);
                }),
              ),
            ],
                ),
            ),
        ),
    );
  }
}
