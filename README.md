# Project 2 - Flix

Flix is a movies app using the [The Movie Database API](http://docs.themoviedb.apiary.io/#).

Time spent: 18 hours spent in total

## User Stories

The following **required** functionality is complete:

- [X] User sees an app icon on the home screen and a styled launch screen.
- [X] User can view a list of movies currently playing in theaters from The Movie Database.
- [X] Poster images are loaded using the UIImageView category in the AFNetworking library.
- [X] User sees a loading state while waiting for the movies API.
- [X] User can pull to refresh the movie list.
- [X] User sees an error message when there's a networking error.
- [X] User can tap a tab bar button to view a grid layout of Movie Posters using a CollectionView.

The following **optional** features are implemented:

- [X] User can tap a poster in the collection view to see a detail screen of that movie
- [X] User can search for a movie.
- [X] All images fade in as they are loading.
- [ ] User can view the large movie poster by tapping on a cell.
- [ ] For the large poster, load the low resolution image first and then switch to the high resolution image when complete.
- [ ] Customize the selection effect of the cell.
- [ ] Customize the navigation bar.
- [ ] Customize the UI.

The following **additional** features are implemented:

- [ ] List anything else that you can get done to improve the app functionality!

Please list two areas of the assignment you'd like to **discuss further with your peers** during the next class (examples include better ways to implement something, how to extend your app in certain ways, etc):

1. I want to discuss more about the search bar, I want to see if there is a better way to implement it or how I could maybe expand on it so that it can search all movies instead of just movies on a certain page. Also want to know how to add a search bar for grid views. 
2. I'm interested on how to put a table view and collection view together so that you could have a similar movies at the bottom. 

## Video Walkthrough

Here's a walkthrough of implemented user stories:

Users can view list of movies, detailed view and search:
<img src='http://g.recordit.co/VFVOHy7r71.gif' title='Users can view list of movies, detailed view and search' width='' alt='Video Walkthrough' />

Users can view grid view and view detailed view:
<img src='http://g.recordit.co/yfCH7Irh6z.gif' title='Users can view grid view and view detailed view' width='' alt='Video Walkthrough' />

Images and text fade in:
<img src='http://g.recordit.co/YBlwnqrJDE.gif' title='Images and text fade in' width='' alt='Video Walkthrough' />


GIF created with https://recordit.co/

## Notes

Describe any challenges encountered while building the app.

I faced the most challenge so far with the search bar. Since I am not too familliar with Objective C, I wasn't too sure on how to isolate the movie titles to make it so that you can search by title.I was able to figure it out by getting help from the internet. However, I tried to implement a search bar in the grid view but couldn't figure out how to solve it. 
I also faced issues with the loading screen because I wasn't aware of how things ran concurrently with each other. 

## Credits

List an 3rd party libraries, icons, graphics, or other assets you used in your app.

- [AFNetworking](https://github.com/AFNetworking/AFNetworking) - networking task library

## License

    Copyright [2020] [Alyssa Tan]

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
