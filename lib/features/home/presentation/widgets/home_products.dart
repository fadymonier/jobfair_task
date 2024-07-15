import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobfair_task/core/enums/screen_status.dart';
import 'package:jobfair_task/features/home/presentation/bloc/home_bloc.dart';
import 'package:jobfair_task/features/home/presentation/widgets/product_item.dart';

class Products extends StatelessWidget {
  const Products({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      listener: (context, state) {
        if (state.getProductsStatus == RequestStatus.loading) {
          const CircularProgressIndicator();
        }
      },
      builder: (context, state) {
        return Expanded(
          child: GridView.builder(
            itemCount: state.productModel?.products?.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: (205.h / 240.w),
                crossAxisCount: 2,
                mainAxisSpacing: 16.h,
                crossAxisSpacing: 16.w),
            itemBuilder: (context, index) {
              return ProductItem(
                productModel: state.productModel,
                index: index,
              );
            },
          ),
        );
      },
    );
  }
}
