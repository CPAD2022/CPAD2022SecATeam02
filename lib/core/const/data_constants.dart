import 'package:perfect_fitness/core/const/path_constants.dart';
import 'package:perfect_fitness/core/const/text_constants.dart';
import 'package:perfect_fitness/data/exercise_data.dart';
import 'package:perfect_fitness/data/workout_data.dart';
import 'package:perfect_fitness/screens/onboarding/widget/onboarding_tile.dart';

class DataConstants {
  // Onboarding
  static final onboardingTiles = [
    OnboardingTile(
      title: TextConstants.onboarding1Title,
      mainText: TextConstants.onboarding1Description,
      imagePath: PathConstants.onboarding1,
    ),
    OnboardingTile(
      title: TextConstants.onboarding2Title,
      mainText: TextConstants.onboarding2Description,
      imagePath: PathConstants.onboarding2,
    ),
    OnboardingTile(
      title: TextConstants.onboarding3Title,
      mainText: TextConstants.onboarding3Description,
      imagePath: PathConstants.onboarding3,
    ),
  ];

  // Workouts
  static final List<WorkoutData> workouts = [
    WorkoutData(
        id: 'workout1',
        title: TextConstants.yogaTitle,
        exercises: TextConstants.yogaExercises,
        minutes: TextConstants.yogaMinutes,
        currentProgress: 0,
        progress: 3,
        image: PathConstants.yoga,
        exerciseDataList: [
          ExerciseData(
            id: 'exercise1',
            title: 'Yoga warm up',
            minutes: TextConstants.recliningMinutes,
            progress: 0,
            image: PathConstants.yogawarm,
            video: PathConstants.recliningVideo,
            description: TextConstants.warriorDescription,
            steps: [
              TextConstants.warriorStep1,
              TextConstants.warriorStep2,
              TextConstants.warriorStep1,
              TextConstants.warriorStep2,
              TextConstants.warriorStep1,
              TextConstants.warriorStep2,
            ],
          ),
          ExerciseData(
            id: 'exercise2',
            title: TextConstants.cowPose,
            minutes: TextConstants.cowPoseMinutes,
            progress: 0,
            image: PathConstants.cowpose,
            video: PathConstants.cowPoseVideo,
            description: TextConstants.warriorDescription,
            steps: [TextConstants.warriorStep1, TextConstants.warriorStep2],
          ),
          ExerciseData(
            id: 'exercise3',
            title: TextConstants.warriorPose,
            minutes: TextConstants.warriorPoseMinutes,
            progress: 0,
            image: PathConstants.warriorpose2,
            video: PathConstants.warriorIIVideo,
            description: TextConstants.warriorDescription,
            steps: [TextConstants.warriorStep1, TextConstants.warriorStep2],
          ),
        ]),
    WorkoutData(
        id: 'workout2',
        title: TextConstants.pilatesTitle,
        exercises: TextConstants.pilatesExercises,
        minutes: TextConstants.pilatesMinutes,
        currentProgress: 0,
        progress: 3,
        image: PathConstants.pilates,
        exerciseDataList: [
          ExerciseData(
            id: 'exercise1',
            title: 'Breathing',
            minutes: TextConstants.recliningMinutes,
            progress: 0.0,
            image: PathConstants.breathing,
            video: PathConstants.recliningVideo,
            description: TextConstants.warriorDescription,
            steps: [TextConstants.warriorStep1, TextConstants.warriorStep2],
          ),
          ExerciseData(
            id: 'exercise2',
            title: 'Shoulder bridge',
            minutes: TextConstants.cowPoseMinutes,
            progress: 0.0,
            image: PathConstants.shoulderbridge,
            video: PathConstants.cowPoseVideo,
            description: TextConstants.warriorDescription,
            steps: [TextConstants.warriorStep1, TextConstants.warriorStep2],
          ),
          ExerciseData(
            id: 'exercise3',
            title: 'Leg lifts',
            minutes: TextConstants.warriorPoseMinutes,
            progress: 0.0,
            image: PathConstants.leftlift,
            video: PathConstants.warriorIIVideo,
            description: TextConstants.warriorDescription,
            steps: [TextConstants.warriorStep1, TextConstants.warriorStep2],
          ),
        ]),
    WorkoutData(
        id: 'workout3',
        title: TextConstants.fullBodyTitle,
        exercises: TextConstants.fullBodyExercises,
        minutes: TextConstants.fullBodyMinutes,
        currentProgress: 0,
        progress: 3,
        image: PathConstants.fullBody,
        exerciseDataList: [
          ExerciseData(
            id: 'exercise1',
            title: 'Burpee',
            minutes: TextConstants.recliningMinutes,
            progress: 0.0,
            image: PathConstants.burpee,
            video: PathConstants.recliningVideo,
            description: TextConstants.warriorDescription,
            steps: [TextConstants.warriorStep1, TextConstants.warriorStep2],
          ),
          ExerciseData(
            id: 'exercise2',
            title: 'Plank',
            minutes: TextConstants.cowPoseMinutes,
            progress: 0.0,
            image: PathConstants.plank,
            video: PathConstants.cowPoseVideo,
            description: TextConstants.warriorDescription,
            steps: [TextConstants.warriorStep1, TextConstants.warriorStep2],
          ),
          ExerciseData(
            id: 'exercise3',
            title: 'Thruster',
            minutes: TextConstants.warriorPoseMinutes,
            progress: 0.0,
            image: PathConstants.thrusters,
            video: PathConstants.warriorIIVideo,
            description: TextConstants.warriorDescription,
            steps: [TextConstants.warriorStep1, TextConstants.warriorStep2],
          ),
        ]),
    WorkoutData(
      id: 'workout4',
      title: TextConstants.stretchingTitle,
      exercises: TextConstants.stretchingExercises,
      minutes: TextConstants.stretchingMinutes,
      currentProgress: 0,
      progress: 3,
      image: PathConstants.stretching,
      exerciseDataList: [
        ExerciseData(
          id: 'exercise1',
          title: 'Quad Stretch',
          minutes: TextConstants.recliningMinutes,
          progress: 0.0,
          image: PathConstants.quad,
          video: PathConstants.recliningVideo,
          description: TextConstants.warriorDescription,
          steps: [TextConstants.warriorStep1, TextConstants.warriorStep2],
        ),
        ExerciseData(
          id: 'exercise2',
          title: 'Side Stretch',
          minutes: TextConstants.cowPoseMinutes,
          progress: 0.0,
          image: PathConstants.sidestretch,
          video: PathConstants.cowPoseVideo,
          description: TextConstants.warriorDescription,
          steps: [TextConstants.warriorStep1, TextConstants.warriorStep2],
        ),
        ExerciseData(
          id: 'exercise3',
          title: 'Hamstring Stretch',
          minutes: TextConstants.warriorPoseMinutes,
          progress: 0.0,
          image: PathConstants.hamString,
          video: PathConstants.warriorIIVideo,
          description: TextConstants.warriorDescription,
          steps: [TextConstants.warriorStep1, TextConstants.warriorStep2],
        ),
      ],
    ),
  ];

  // Reminder
  static List<String> reminderDays = [
    TextConstants.everyday,
    TextConstants.monday_friday,
    TextConstants.weekends,
    TextConstants.monday,
    TextConstants.tuesday,
    TextConstants.wednesday,
    TextConstants.thursday,
    TextConstants.friday,
    TextConstants.saturday,
    TextConstants.sunday,
  ];
}
