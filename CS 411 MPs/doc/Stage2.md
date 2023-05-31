# UML Diagram:

![image info](/doc/UML.png)
# Assumptions and Limitations:

* We are assuming that for a unique user, their profile information doesn’t change, i.e., whatever information they have stored on their profile is cached in our database model and stays constant. We will continue using their original data even if they update their information, like their name or profile picture.

* Similar to our assumption for unique users, we are only caching the initial information for a unique artist. While the name of an artist will stay constant, they may update their profile picture. Due to the 3 API requests/second limitation, we are forfeiting regular updates.

* While doing our “compatibility calculation,” we are assuming that each user will only have one song from a unique artist. While this assumption will rarely hold in real-world applications, we are yet to figure out a method to handle this case. This feature may be added later as added functionality, but we are going with this assumption preliminarily.

* Songs may be produced by several artists or have artists featured in songs. In our database, each song will be attributed to the first artist in the list of artists.

* Users may have remixes of the same song in their top tracks or playlists. Since we are going with unique song_id and artist_id pairs, there may either be the same song attributed to another artist if their name occurs first in the list of artists or contrarily have a song be omitted if there exists a remix of a song having the same first artist.

# Logical Schema and Data Definiton Language
* MySQL library was used to connect to the database with NodeJs and create the tables. The code can be found in db_utils.js
<pre>
Create Table Users(
    user_id varchar(50) not null,
    display_name varchar(30),
    email varchar(25),
    country varchar(50),
    image_url varchar(150),
    share_code varchar(50),
    primary key (user_id),
);

Create Table UserAuthentication(
    user_id varchar(50) not null,
    user_access_token varchar(50),
    user_code varchar(50)
    request_again_auth_token varchar(50),
    primary key (user_id)
);

Create Table Artists(
    artist_id varchar(50) not null,
    track_name varchar(50),
    popularity integer,
    genres varchar(200),
    primary key (artist_id)
);

Create Table UserArtist(
    user_id varchar(50),
    artist_id varchar(50),
    foreign key (user_id) references Users ,
    foreign key (artist_id) references Artists
    on delete cascade
);


Create Table Tracks(
    track_id varchar(50) not null,
    artist_name varchar(50),
    artist_id varchar(50),
    duration_ms integer,
    explcit integer,
    track_name varchar(30),
    popularity integer,
    img_url varchar(150),
    foreign key (artist_id), 
    primary key (track_id),
    foreign key (track_id)
);

Create Table AudioFeatures(
    track_id varchar(50) not null,
    acoustiness float,
    danceability float,
    duration_ms integer, 
    energy float,
    instrumentalness float,
    track_key integer,
    liveness float,
    loudness float,
    speechiness float,
    tempo float,
    valence float,
    primary key (track_id),
    foreign key (track_id) references AudioFeatures
);

Create Table ArtistTrack(
    artist_id varchar(50),
    track_id varchar(50),
    foreign key (artist_id) references Artists,
    foreign key (track_id) references Tracks
);

Create Table UserTracks(
    user_id varchar(50),
    track_id varchar(50),
    foreign key (user_id) references Users on delete cascade,
    foreign key (track_id) references Tracks
);


</pre>

# Description

Users and artists: Many to Many
Cardinality: Users and Artists: Many to many - We are going to be using a relational table since both the user id and the artist id are primary keys in their own tables.

Users and User Tracks: One user  to Many tracks.

Tracks and Artists: Many Tracks to One Artist

Tracks and Track Analysis: One track to One Analysis
