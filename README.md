# Our final project for the iOS dev class, which displays a user's most-listened to music and trends using the Spotify API.

## NOTES:
App Name: SpotifyTrends


App Tagline: Uses the Spotify API to log in and display a user's top tracks, artists, popularity, etc.


Links to backend: https://github.com/grantIee/Spotilyze-Backend  


Screenshots: 
![](https://github.com/medhavi27/iOSSpotifyTrends/blob/master/S1.png "Login")

iOS requirements: Our app uses Autolayout (NSLayout) to add views, labels, images, etc. We used a collectionview in screen 3 (the time periods) to select which time period the user wanted. We use a UINavigationController to navigate to the post-login screen and a Modal View Controller to present the data. We integrated the Spotify API.  
Issues: We used the SpotifyLogin cocoapod to login- and after 3 hours of working with Mindy we all learned that the cocoapod itself was broken/not updated. It was broken in a way that wouldn't display a session, so we could not use our session in our networking functions to get the user data. We have an example for our functions for networking in ThreeMonthModal- we implemented it, but it just had no session to pull data from. Also, our backend team gave up after the mid point submission and had an unusable API and so we chose not to merge with them and just used the Spotify API instead. Mindy watched us suffer so our struggle is 100% real. Pls understand :( 
