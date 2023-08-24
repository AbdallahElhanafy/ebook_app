import 'package:ebook_app/constants.dart';
import 'package:ebook_app/core/utils/app_router.dart';
import 'package:ebook_app/core/utils/styles.dart';
import 'package:ebook_app/features/home/data/models/book_model/book_model.dart';
import 'package:ebook_app/features/home/presentation/views/widgets/book_rating_widget.dart';
import 'package:ebook_app/features/home/presentation/views/widgets/custom_book_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class BookListViewItem extends StatelessWidget {
  const BookListViewItem({super.key, required this.bookModel});
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(AppRouter.kBookDetailsView, extra: bookModel);
      },
      child: SizedBox(
        height: 126.h,
        child: Row(
          children: [
            CustomBookImage(
                imageUrl: bookModel.volumeInfo.imageLinks?.thumbnail ?? ''),
            SizedBox(
              width: 30.w,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .5,
                    child: Text(bookModel.volumeInfo.title!,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style:
                            Styles.text20.copyWith(fontFamily: kGtSectraFine)),
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  Text(
                    bookModel.volumeInfo.authors?[0] ?? '',
                    style: Styles.text14,
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  Row(
                    children: [
                      Text(
                        "Free",
                        style:
                            Styles.text20.copyWith(fontWeight: FontWeight.bold),
                      ),
                      const Spacer(),
                      BookRating(
                        count: bookModel.volumeInfo.ratingsCount ?? 0,
                        rating: bookModel.volumeInfo.averageRating ?? 0,
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}