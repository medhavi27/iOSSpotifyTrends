# Our final project for the iOS dev class, which displays a user's most-listened to music and trends using the Spotify API.

## NOTES:
App Name: SpotifyTrends  
Michael Zheng and Medhavi Gandhi 


App Tagline: Uses the Spotify API to log in and display a user's top tracks, artists, popularity, etc.


Links to backend: https://github.com/grantIee/Spotilyze-Backend  


Screenshots: 


<img src="https://github.com/medhavi27/iOSSpotifyTrends/blob/master/S1.png" alt="Home Page" width="400"/> <img src="https://github.com/medhavi27/iOSSpotifyTrends/blob/master/S4.png" alt="Login Authorization" width="400"/> <img src="https://github.com/medhavi27/iOSSpotifyTrends/blob/master/S2.png" alt="Collection View" width="400"/> <img src="https://github.com/medhavi27/iOSSpotifyTrends/blob/master/S5.jpg" alt="Data Display" width="400"/>


**iOS requirements**: Our app uses Autolayout (NSLayout) to add views, labels, images, etc. We used a collectionview in screen 3 (the time periods) to select which time period the user wanted. We use a UINavigationController to navigate to the post-login screen and a Modal View Controller to present the data. We integrated the Spotify API.  


**Issues**: We used the SpotifyLogin cocoapod to login- and after 3 hours of working with Mindy we all learned that the cocoapod itself was broken/not updated. It was broken in a way that wouldn't display a session, so we could not use our session in our networking functions to get the user data. We have an example for our functions for networking in ThreeMonthModal- we implemented it, but the data from the session won't load.

