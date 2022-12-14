import 'package:firebase_auth/firebase_auth.dart';
import 'package:perfect_fitness/core/const/color_constants.dart';
import 'package:perfect_fitness/core/const/data_constants.dart';
import 'package:perfect_fitness/core/const/path_constants.dart';
import 'package:perfect_fitness/core/const/text_constants.dart';
import 'package:perfect_fitness/screens/edit_account/edit_account_screen.dart';
import 'package:perfect_fitness/screens/home/bloc/home_bloc.dart';
import 'package:perfect_fitness/screens/tab_bar/bloc/tab_bar_bloc.dart';
import 'package:perfect_fitness/screens/common_widgets/fitness_button.dart';
import 'package:perfect_fitness/screens/home/widget/home_statistics.dart';
import 'package:perfect_fitness/data/workout_data.dart';
import 'package:perfect_fitness/screens/tab_bar/page/tab_bar_page.dart';
import 'package:perfect_fitness/screens/workout_details_screen/page/workout_details_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:perfect_fitness/screens/home/widget/home_exercises_card.dart';

class HomeContent extends StatefulWidget {
  final List<WorkoutData> workouts;

  const HomeContent({
    required this.workouts,
    Key? key,
  }) : super(key: key);

  @override
  _HomeContentState createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  int getProgressPercentage() {
    List<WorkoutData> workouts = <WorkoutData>[];
    final completed = workouts
        .where((w) =>
            (w.currentProgress ?? 0) > 0 && w.currentProgress == w.progress)
        .toList();
    final percent01 =
        completed.length.toDouble() / DataConstants.workouts.length.toDouble();
    final percent = (percent01 * 100).toInt();
    return percent;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorConstants.homeBackgroundColor,
      height: double.infinity,
      width: double.infinity,
      child: _createHomeBody(context),
    );
  }

  Widget _createHomeBody(BuildContext context) {
    final bloc = BlocProvider.of<HomeBloc>(context);
    return SafeArea(
        child: RefreshIndicator(
      onRefresh: () {
        setState(() {
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (_) => TabBarPage()),
              (route) => false);
        });
        return Future<void>.delayed(Duration(seconds: 5));
      },
      child: ListView(
        padding: const EdgeInsets.symmetric(vertical: 20),
        children: [
          _createProfileData(context),
          const SizedBox(height: 35),
          _showStartWorkout(context, bloc),
          const SizedBox(height: 30),
          _createExercisesList(context),
          const SizedBox(height: 25),
          _createProgress(bloc),
        ],
      ),
    ));
  }

  Widget _createProfileData(BuildContext context) {
    final User? user = FirebaseAuth.instance.currentUser;
    final displayName2 = user?.displayName ?? "No Username";
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BlocBuilder<HomeBloc, HomeState>(
                buildWhen: (_, currState) =>
                    currState is ReloadDisplayNameState,
                builder: (context, state) {
                  final displayName = displayName2;
                  return Text(
                    'Hi, $displayName',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  );
                },
              ),
              const SizedBox(height: 2),
              Text(
                TextConstants.checkActivity,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          BlocBuilder<HomeBloc, HomeState>(
            buildWhen: (_, currState) => currState is ReloadImageState,
            builder: (context, state) {
              final photoUrl =
                  FirebaseAuth.instance.currentUser?.photoURL ?? null;
              return GestureDetector(
                child: photoUrl == null
                    ? CircleAvatar(
                        backgroundImage: AssetImage(PathConstants.profile),
                        radius: 60)
                    : CircleAvatar(
                        child: ClipOval(
                            child: FadeInImage.assetNetwork(
                                placeholder: PathConstants.profile,
                                image: photoUrl,
                                fit: BoxFit.cover,
                                width: 200,
                                height: 120)),
                        radius: 25),
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => EditAccountScreen()));
                  BlocProvider.of<HomeBloc>(context).add(ReloadImageEvent());
                },
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _showStartWorkout(BuildContext context, HomeBloc bloc) {
    return widget.workouts.isEmpty
        ? _createStartWorkout(context, bloc)
        : HomeStatistics();
  }

  Widget _createStartWorkout(BuildContext context, HomeBloc bloc) {
    final blocTabBar = BlocProvider.of<TabBarBloc>(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      margin: const EdgeInsets.symmetric(horizontal: 20),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: ColorConstants.white,
        boxShadow: [
          BoxShadow(
            color: ColorConstants.textBlack.withOpacity(0.12),
            blurRadius: 5.0,
            spreadRadius: 1.1,
          )
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                image: AssetImage(PathConstants.didYouKnow),
                width: 24,
                height: 24,
              ),
              const SizedBox(width: 10),
              Text(TextConstants.didYouKnow,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500))
            ],
          ),
          const SizedBox(height: 16),
          Text(TextConstants.sportActivity,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
          const SizedBox(height: 4),
          Text(TextConstants.signToStart,
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: ColorConstants.textGrey)),
          const SizedBox(height: 24),
          FitnessButton(
            title: TextConstants.startWorkout,
            onTap: () {
              blocTabBar.add(
                  TabBarItemTappedEvent(index: blocTabBar.currentIndex = 1));
            },
          ),
        ],
      ),
    );
  }

  Widget _createExercisesList(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            TextConstants.discoverWorkouts,
            style: TextStyle(
              color: ColorConstants.textBlack,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 15),
        Container(
          height: 160,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              const SizedBox(width: 20),
              WorkoutCard(
                  color: ColorConstants.cardioColor,
                  workouts: DataConstants.workouts[0],
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (_) => WorkoutDetailsPage(
                            workout: DataConstants.workouts[0],
                          )))),
              const SizedBox(width: 15),
              WorkoutCard(
                  color: ColorConstants.armsColor,
                  workouts: DataConstants.workouts[1],
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (_) => WorkoutDetailsPage(
                            workout: DataConstants.workouts[2],
                          )))),
              const SizedBox(width: 20),
            ],
          ),
        ),
      ],
    );
  }

  Widget _createProgress(HomeBloc bloc) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: ColorConstants.white,
        boxShadow: [
          BoxShadow(
            color: ColorConstants.textBlack.withOpacity(0.12),
            blurRadius: 5.0,
            spreadRadius: 1.1,
          ),
        ],
      ),
      child: Row(
        children: [
          Image(image: AssetImage(PathConstants.progress)),
          SizedBox(width: 20),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(TextConstants.keepProgress,
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(height: 3),
                Text(
                  '${TextConstants.profileSuccessful} ${bloc.getProgressPercentage()}% of workouts.',
                  style: TextStyle(fontSize: 16),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
