import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobfair_task/core/utils/app_colors.dart';
import 'package:jobfair_task/features/home/data/models/product_model.dart';

class ProductItem extends StatelessWidget {
  final int index;
  final ProductModel? productModel;

  const ProductItem({
    required this.index,
    required this.productModel,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var product = productModel?.products?[index];

    return InkWell(
      onTap: () {
        // Handle tap
      },
      child: Padding(
        padding: EdgeInsets.only(
            left: index.isEven ? 16.w : 0, right: index.isOdd ? 16.w : 0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.r),
            border: Border.all(width: 2.w, color: Colors.blueGrey),
          ),
          child: Column(
            children: [
              Expanded(
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.r),
                      ),
                      child: CachedNetworkImage(
                        imageUrl: product?.images?.toString() ?? "",
                        fit: BoxFit.fill,
                        width: double.infinity,
                        height: 191.h,
                        errorWidget: (context, url, error) => const Center(
                            child: Icon(Icons.error_outline, size: 40)),
                      ),
                    ),
                    _buildFavoriteIcon(),
                  ],
                ),
              ),
              SizedBox(height: 8.h),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildTitle(product),
                      _buildDescription(product),
                      SizedBox(height: 8.h),
                      _buildPriceRow(product),
                      SizedBox(height: 5.h),
                      const Spacer(),
                      _buildReviewRow(product),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFavoriteIcon() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 7.w),
      child: Align(
        alignment: Alignment.topRight,
        child: Container(
          padding: EdgeInsets.all(2.h.w),
          margin: EdgeInsets.only(left: 6.w),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15.r),
          ),
          child: const Icon(
            Icons.favorite_outline,
            color: AppColors.mainColor,
          ),
        ),
      ),
    );
  }

  Widget _buildTitle(Products? product) {
    return Text(
      product?.title ?? "",
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
    );
  }

  Widget _buildDescription(Products? product) {
    return Text(
      product?.description ?? "",
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(fontSize: 14.sp, color: Colors.grey),
    );
  }

  Widget _buildPriceRow(Products? product) {
    return Row(
      children: [
        Text("EGP ${product?.price.toString() ?? ""}",
            style: TextStyle(fontSize: 14.sp)),
        SizedBox(width: 16.w),
        Text("EGP 1200",
            style: TextStyle(
                fontSize: 14.sp, decoration: TextDecoration.lineThrough)),
      ],
    );
  }

  Widget _buildReviewRow(Products? product) {
    return Padding(
      padding: EdgeInsets.only(bottom: 13.h),
      child: Row(
        children: [
          const Text("Review"),
          SizedBox(width: 4.w),
          Text(product?.rating.toString() ?? ""),
          SizedBox(width: 4.w),
          const Icon(Icons.star, color: Colors.yellow),
          const Spacer(),
          Container(
            padding: EdgeInsets.all(5.w.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25.r),
              color: AppColors.mainColor,
            ),
            child: const Icon(Icons.add, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
