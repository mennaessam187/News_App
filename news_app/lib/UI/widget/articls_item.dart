import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
//import 'package:flutter/widgets.dart';
import 'package:news_app/UI/screean/article_detailes.dart';
import 'package:news_app/utils/app_const.dart';
import 'package:news_app/utils/color_manager.dart';

Widget buildArticleItem(context, article) {
  var urlToImage = article["urlToImage"];
  return InkWell(
    onTap: () {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ArticleDetelswithnews(
                    url: '${article["url"]}',
                  )));
    },
    child: Padding(
      padding: EdgeInsets.all(12),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: ConditionalBuilder(
              condition: urlToImage != null,
              builder: (context) => Image.network(
                "${article["urlToImage"]}",
                width: 300,
                height: 160,
              ),
              fallback: ((context) => Icon(
                    Icons.error,
                    color: Color(
                      colorManager.bottomnavbarcolor,
                    ),
                    size: AppConstant.s20,
                  )),
              /*child: Image.network(
                "${article["urlToImage"]}",
                width: 300,
                height: 160,
                //fit: BoxFit.contain,
              ),
              */

              /*child: FadeInImage.assetNetwork(
                placeholder:
                    'assets/placeholder.png', // Add a placeholder image in assets
                image: article["urlToImage"] ??
                    'https://via.placeholder.com/300x160.png?text=No+Image', // Default image if URL is null
                width: 300,
                height: 160,
                fit: BoxFit.cover,
              ),
              */
              /* child: Image.network(
                "${article["urlToImage"]}",
                width: 300,
                height: 160,
                loadingBuilder: (BuildContext context, Widget child,
                    ImageChunkEvent? loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Center(
                    child: CircularProgressIndicator(
                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded /
                              loadingProgress.expectedTotalBytes!
                          : null,
                    ),
                  );
                },
              ),
              */
            ),
          ),
          SizedBox(
            height: 3,
          ),
          Directionality(
            textDirection: TextDirection.rtl,
            child: Text(
              "${article["title"]}",
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: Colors.white,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          SizedBox(
            height: 3,
          ),
          Text(
            "${article["publishedAt"]}",
            style: const TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w400,
              color: Colors.white,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    ),
  );
}
