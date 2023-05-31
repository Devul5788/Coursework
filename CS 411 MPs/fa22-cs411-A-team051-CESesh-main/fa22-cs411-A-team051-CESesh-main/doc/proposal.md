# SyncTunes

## 2. Project Summary

Our project will help Spotify users to gain insight into their listening habits and preferences and compare their taste in music with their friends. Each Spotify user will be able to log in with Spotify and after the Spotify data gets imported the users will be able to see their  top artists,tracks and genres as part of their insight. Additionally each user will have a unique code. This unique code can be shared with a friend and a score on how compatible your music taste is will be displayed, together with a breakdown of which are the artists and songs in common.


## 3. Description
Ever since the early 2000s, the number of people on internet has been growing rapidly every year. As a result it has made listening to music on streaming platforms such as Spoifty much more accessible. For instance, there are currently 433 million users on Spotify right now. This easy access to music has not only connected people accross the world, but also helped people through an array of problems such as relieving stress, uplifting mood, and simulating pain. This makes our website an incredibly useful tool allowing people to gauge their listening habits and the trends of how their music taste has evolved over time. This app provides a peak what music means for a person. 

However, it is important to note that many useful apps and websites exist that provide an insight into the a person's music profile. Spotify, for instance provides a wrap up of all of all the songs that person heard as well as how the the person's music taste changed with the seasons. Another popular alternative is Receiptfy, which gives you a list of the top songs you have listened to in the last week, month, and year. However, both of these tools lack in terms of the overall features they provide as well as an indepth view of how similar one's taste is one another person. This website would be a perfect way to see just how similar one's music taste is to another person based on metrics such as genes, artists, and moods. 


## 4. Usefulness

Our project will help Spotify users to gain insight into their listening habits and preferences and compare their taste music with their friends. Each Spotify user will be able to log in with Spotify and after the Spotify data gets imported the users will be able to see their  top artists,tracks and genres as part of their insight. Additionally each user will have a unique code. This unique code can be shared with a friend and a score on how compatible your music taste is will be displayed, together with a breakdown of which are the artists and songs in common.

## 5. Realness

The data for our project will consist of users, the songs, albums, and artists that they listen to, along with the parameters that describe the songs, such as energy, danceability, etc. To gather this data, we will be asking our peers to log in to our site using their Spotify profile. We will then use Spotify Web API calls to collect the aforementioned data. Once a user has logged in to our site, their profile will be stored as the data. 

As for the realness of the data, all of our data will be collected from real users and we are not going to be relying on randomly generated data. This is to aid with the compatibility section of the project, which will allow a user to match with another user based off the likeliness of of their music tastes. All the data that we are collecting is to be directly collected from Spotify using REST API calls after an initial OAuth.

## 6. Functionality

SyncTunes is a web application to be developed in Node.js in the backend and SQL as our database. We will use vanilla HTML, CSS, and JavaScript on the frontend. We will use Material UI for the components and Tailwind CSS.

### Features
1. The user logs in to our application via Spotify (OAuth is implemented here).
2. The user agrees to share the Spotify data with our application and clicks "sync data".
3. The web app fetches all user data via Spotify's developers API. We collect different data points via REST API like Albums, Artists, Shows, Episodes, Tracks, Playlists, Genre etc. Here we need to take care of paging the results from the API and as well perform error hadling for events such as timeout.
4. We store all of the fetched data into our MySQL tables based on design. 
5. Now the user is displayed all the music insights in-depth. We might have to user third party APIs for getting emotional parameters based on music or calculate it within the app to display in depth insight to the user like percentage of Happy, Sad, Up-beat, Dancable etc. music the person listens to. (More details to be decided)
6. Apart from viewing one's own song profile analysis, we also generate a unique code for each user. We call it the "share code". The user can share their share code with other users who have logged into the web app to see the similarities in their music profiles! For this, we have a "compatibility" page on our web app.

### Data sources and attributes
We are mainly focusing on two to three main objects that Spotify's API provides us with, User, Track, and Playlist. All of these objects are going to fetched via the REST API after the user has logged in with Spotify (OAuth). We will be having three main tables to hold tracks, playlists and user. We will be making use of multiple helper tables so that we can fetch data faster. We will also be using Passport.js to maintain a user's session. A table to hold user sessions and a table to hold compatibility match results would also be required as our algorigthms to process the data gets more complex.

### Our highlight feature
We believe every app could display results fetched from an API, but we go beyond that to add the "compatibility" feature. This feature gives a compatibility score between two users from 0 to 100 based on thier music profile. Here we intend to use complex algorithms to compare the music tastes, show similarities and differences based on complex data points recieved from Spotify.

Moreover, we will provide a dynamic share compatibility results page and a share profile page for each user. The challenging part is how we store these results in database and make the urls unique to the user.

## 7. A low fidelity UI mockup
![image info](/doc/IMG-0349.jpg)
![image info](/doc/IMG-0350.jpg)
![image info](/doc/IMG-0351.jpg)
![image info](/doc/IMG-0353.jpg)

## 8. Project work distribution
For our backend, we will be using Node.js and SQL for querying to get the relevant data. Our team has decided on a 70-30 split for backend development between two groups - (Sara and Devul) and (Diwaker and Shubham) respectively. Front-end and site development will be handled by Diwaker and Shubham, and will be done through HTML and CSS using Materialize UI and Tailwind CSS.

As for the more specific parts of the project, Devul will be handling the OAuth login functionality, Sara will be handling the REST calls to retrieve the data from Spotify, followed by all of the team working on querying this data. For the frontend, the exact split is not decided yet, but the tasks will be split 50-50 between Diwaker and Shubham regarding the design and programming of the web pages.
