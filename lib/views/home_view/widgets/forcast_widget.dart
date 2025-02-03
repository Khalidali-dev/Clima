import 'package:clima/views/views.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ForcastWidget extends StatelessWidget {
  const ForcastWidget({super.key, this.weather});
  final WeatherModel? weather;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.transparent,
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            height(10),
            Text(
              "Next 5 (day)s",
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(fontSize: 15, color: Colors.white),
            ),
            height(10),
            SizedBox(
              height: 300,
              child: GridView.builder(
                shrinkWrap: true,
                itemCount: weather?.forecast?.forecastday.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    childAspectRatio: 2 / 3,
                    crossAxisCount: Get.size.width > 500 ? 5 : 3),
                itemBuilder: (context, index) {
                  final forcast = weather?.forecast?.forecastday[index].day;
                  final date = weather?.forecast?.forecastday[index].date ??
                      DateTime.now();
                  final formatedDate = DateFormat('dd/MM').format(date);
                  return Card(
                    color: AppColors.transparent,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          CachedNetworkImage(
                            imageUrl: "https:${forcast?.condition?.icon ?? ''}",
                            width: 35,
                            height: 35,
                            placeholder: (context, url) =>
                                CircularProgressIndicator(),
                            errorWidget: (context, url, error) => Icon(
                              Icons.error,
                              color: AppColors.red,
                            ),
                          ),
                          Text(
                            "${forcast?.avgtempC.toString()}",
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.textColor),
                          ),
                          Text(
                            "${forcast?.condition?.text.toString()}",
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(
                                    fontSize: 10, color: AppColors.textColor),
                          ),
                          height(2),
                          Text(
                            formatedDate.toString(),
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(
                                    fontSize: 11,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.textColor),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
