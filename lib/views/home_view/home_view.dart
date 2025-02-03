import 'package:clima/views/views.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final WeatherController controller = Get.put(WeatherController());
    return Scaffold(
      backgroundColor: Colors.lightBlue.shade200,
      body: SafeArea(child: Obx(() {
        final weather = controller.weatherModel.value;
        if ((weather?.current?.tempC ?? 0) > 30) {
          controller
              .showNotifications(weather?.current?.tempC?.toString() ?? "");
        }

        return controller.loading.value
            ? Center(
                child: CircularProgressIndicator(),
              )
            : SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 20),
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: [
                    height(10),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "${weather?.location?.name}",
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(fontSize: 16),
                      ),
                    ),
                    height(50),
                    CachedNetworkImage(
                      imageUrl:
                          "https:${weather?.current?.condition?.icon ?? ''}",
                      placeholder: (context, url) =>
                          CircularProgressIndicator(),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                    Text(
                      "${weather?.current?.tempC}°",
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(fontSize: 30),
                    ),
                    Text(
                      "${weather?.current?.condition?.text}",
                      style: Theme.of(context).textTheme.bodySmall!,
                    ),
                    height(20),
                    ForcastWidget(
                      weather: weather,
                    )
                  ],
                ),
              );
      })),
    );
  }
}
