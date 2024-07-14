import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobfair_task/core/api/api_manager.dart';
import 'package:jobfair_task/core/utils/app_colors.dart';
import 'package:jobfair_task/features/home/data/datasource/home_ds_impl.dart';
import 'package:jobfair_task/features/home/data/respository/home_repo_impl.dart';
import 'package:jobfair_task/features/home/domain/usecases/get_product_usecase.dart';
import 'package:jobfair_task/features/home/presentation/bloc/home_bloc.dart';
import 'package:jobfair_task/features/home/presentation/widgets/home_products.dart';
import 'package:jobfair_task/features/home/presentation/widgets/home_textfield.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(
          getProductsUseCase:
              GetProductsUseCase(HomeRepoImpl(HomeDSImpl(ApiManager()))))
        ..add(const GetProductsEvent()),
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: AppColors.backgroundColor,
            title: Image(
              image: const AssetImage("assets/images/appBarLogo.png"),
              height: 22.sp,
            ),
          ),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  children: [
                    const Expanded(child: HomeTextField()),
                    const SizedBox(
                      width: 20,
                    ),
                    InkWell(
                      onTap: () {},
                      child: Icon(
                        Icons.shopping_cart_outlined,
                        size: 30.0.sp,
                        color: AppColors.mainColor,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              const Products(),
            ],
          )),
    );
  }
}
