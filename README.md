# pacmantow

-----------yasser Ibrahem
this step by step in ad d google service in game app
1- create  account in google play console
2- go to create app and add app name  and choose default lang and choose game and free and create app
3- choose play game service  form menu and choose no my game .........   and create app
4- choose view in google cloud plat form and choose OAuthe consent screen Form menu and choose external and create
5- now you create app name and developer contact information and save  befor save again
6- now you can shoose publish  app
7- go to create cerndentials and choose OAauth client Id and choose android

--------------new you can see package name --------------
-------------- add package google play service from Pub.dev ------------

1- (iOS Configurations) First, you need to open the iOS project, you can do that by navigating to ios file then right-click on Runner.xcworkspace
Now click on reveal in finder You will see the items as in the image below: Double click on the Runner.xcworkspace then select the project from the top Now from
the right menu click on Runner target then select Signing & Capabilities, click on add capability button Search for Game Center Select it
2- Now you can close Xcode Now you need to go to the iTunes Connect, Then select your app, then select features, then Game Center, now from here you can add an achievement or
a leaderboard it’s a very simple process For adding a new leader board click on the add icon, then select Single Leaderboard, now enter the name, id, and the score format type, for the Score Submission Type it’s
to decide which score should the leaderboard keep, the latest one or the highest one. One last thing, you need to add a language, go to Leaderboard Localization and click on add language, a new dialog will open select the language
and enter the name, score format, and score suffix. Like this, we have added our first leaderboard.
3- Now for the achievements, it’s almost the same thing click on add achievement icon, enter the name, id, and points and don’t forget to add a language from the Achievement Localization section
------------------------ Now like this we finished all the configurations for our game on iOS ---------

4- (Android Configurations)  First, we need to add two new meta-data to our app, you can do that by navigating to the android project manifest.xml First metadata will have your app id, we will get this id later in this tutorial
and you will come back here to replace your id, the second metadata you will copy-paste it as it’s.
Make sure to add the metadata inside your app application tag
<!---------------- Start Code MetaData ---------------
<meta-data
    android:name="com.google.android.gms.games.APP_ID"
    android:value="app_id" />

<meta-data
    android:name="com.google.android.gms.version"
    android:value="@integer/google_play_services_version" />

-------- End Code  ----------->
5- Now you need to go to the Google play console, Then select game service, Add a new game, enter the name and the category then press continue.
A new game will be created, enter the description of the game, the icon and feature graphics.
Take the app id and use it inside the android project manifest.xml. Next,
you need to go to linked apps, click on android, then enter your package name, then click on save and continue.

6- Now, click on Authorize your app now button, a dialog will ask you for the SHA1, you can get the SHA1 by executing the following command line.

<------------- Start code in Command Line --------------

keytool -list -v -keystore ~/.android/debug.keystore -alias androiddebugkey -storepass android -keypass android
-->

7-This SHA1 is the debug SHA1, when you publish your app on google play you need to get the production SHA1.
8- Go to publishing, Then click on publish your game.
9- Now we need to add a new leaderboard by going to the leaderboards then click on add leaderboard, enter the name of the leader board and add an icon then save.
And to add achievements go to achievements and add new achievement, enter the name of the achievement, the description, and the icon then click save.
Now again, you need to go to publishing and click on Publish your game.


---------------- One last important thing ------------

You do need to enable the OAuth APIs that you want, using the Google Cloud Platform API manager
You’ll need also to enable the Google People API.

Make sure you’ve filled out all required fields in the console for OAuth consent screen. Otherwise
you may encounter APIException errors. Like this, we finished all the configurations for our game on Android

-------------------- now step Games Services ----------------
12- games_services is a flutter plugin I made to support game center and google play games services. so you can easily sign in the user, submit a score, unlock achievements, show the leader board screen and the achievements screen
To add the plugin to your project navigate to pubspec.yaml and then add the games_services to the app dependencies

(The code)
13- First thing you need to do is to sign in the user before doing anything, you can sign in the user by calling
and import the plugin

<--------- strat import and code ------------------
import 'package:games_services/games_services.dart';
GamesServices.signIn();
------end code ------------------->

14- You can call the sign-in function in the initState method.
<---------
@ overrid
void initState(){
super.initState();
GamesServices.signIn();
}
---------->
15-(Leaderboards Screen) To show the leaderboards screen you can simply call the showLeaderboards function

<--------- strat import and code ------------------
GamesServices.showLeaderboards(
iOSLeaderboardID: "ios_leader_board");
------end code ------------------->
16- You can get the iOSLeaderboardID from the iTunes connect
(if you remember we created a new leader board for iOS you can take that leader board id and put it here).

<--------- strat  code ------------------
child:AppButtonWidget(
title:"Top players",
onTap:(){
GamesServices.showLeaderboards(
iOSLeaderboardID:"ios_leader_board");
}),// AppButtonWidget
------end code ------------------->

17- now (Achievements Screen)To show the achievements screen you need to call the showAchievements function
<--------- strat import and code ------------------

            GamesServices.showAchievements();

------end code ------------------->

When you call it a new screen will open with the list of achievements.

18- now  (Submit a score) To submit a Score to a specific leader board, you need to create a Score object and send it using submitScore function.
-The Score class takes three parameters:
-androidLeaderboardID: the leader board id that you want to send the score to in the case of android.
-iOSLeaderboardID the leader board id that you want to send the score for in case of iOS.
-value the score.

<--------- strat import and code ------------------

          GamesServices.submitScore(
    score: Score(
        androidLeaderboardID: "android_leaderboard_id",
        iOSLeaderboardID: "ios_leaderboard_id",
        value: score));
------end code ------------------->
19-now  (Unlock achievement) The Achievement takes three parameters:
-androidID the achievement id for android.
-iOSID the achievement id for iOS.
-percentComplete the completion percent of the achievement, this parameter is optional in case of iOS
and this code just required in ios but not in android
<--------- start import and code ------------------
GamesServices.unlock(achievement:Achievement(androidID: 'android_id', iOSID: 'ios_id', percentComplete: 500));
------end code ------------------->



----------------------- Note -------------
This explanation is through research,
and if there is any mistake, I hope to fix it,
even if it is after the hackathon,
so that I can benefit from it and learn about it after that
-----------------------------------





A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
