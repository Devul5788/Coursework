# Connection to GCP

![image info](/doc/GPCConnection.PNG)

We have used GCP, where the MySQL instance is running, if you need more info of the connection, please let us know!

# Data Definiton Language
* MySQL library was used to connect to the database with NodeJs and create the tables. The code can be found in db_utils.js
<pre>
Create Table Users(
    user_id varchar(50) not null,
    display_name varchar(30),
    email varchar(25),
    country varchar(50),
    image_url varchar(150),
    share_code varchar(50),
    primary key (user_id)
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
    artist_name varchar(50),
    popularity integer,
    genres varchar(200),
    primary key (artist_id)
);

Create Table UserArtist(
    user_id varchar(50),
    artist_id varchar(50),
    foreign key (user_id) references Users(user_id) ,
    foreign key (artist_id) references Artists(artist_id)
    on delete cascade
);

Create Table Tracks(
    track_id varchar(50) not null,
    artist_name varchar(50),
    artist_id varchar(50),
    duration_ms integer,
    explcit boolean,
    track_name varchar(30),
    popularity integer,
    img_url varchar(150),
    primary key (track_id),
    foreign key (artist_id), 
    foreign key (track_id)
    on delete cascade
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
    foreign key (track_id) references AudioFeatures(track_id)
    on delete cascade 
);
Create Table ArtistTrack(
    artist_id varchar(50),
    track_id varchar(50),
    foreign key (artist_id) references Artists(artist_id),
    foreign key (track_id) references Tracks(track_id)
    on delete cascade
);

Create Table UserTracks(
    user_id varchar(50),
    track_id varchar(50),
    foreign key (user_id) references Users(user_id),
    foreign key (track_id) references Tracks(track_id)
    on delete cascade
);
</pre>  


# Database Tables 
![image info](/doc/Tables.PNG)

Three of the tables: Artists, Tracks and AudioFeatures have more than 1000 rows each.

* Artists:

![image info](/doc/ArtistsCount.PNG)

* Tracks:

![image info](/doc/TracksCount.PNG)

* AudioFeatures:

![image info](/doc/AF.png)

* UserTrack: (Relationship between the user_id and track_id)

![image info](/doc/UT.png)

# Advanced Queries
## Advanced Query 1
### Advanced Query 1 - CODE
<pre>
SELECT a.artist_name, COUNT(*) as explicit_count
FROM Artists a JOIN Tracks t Using (artist_id) 
WHERE genres = 'happy' AND explcit = 1 
GROUP BY artist_id  
ORDER BY explicit_count DESC 
Limit 15;
</pre> 

### Advanced Query 1 - OUTPUT
![image info](/doc/AdvancedQ1.PNG)

### Advanced Query 1 - INDEXING
#### Advanced Query 1 - INDEXING BY artist_id
![image info](/doc/AdvancedQ1%200.PNG)

#### Advanced Query 1 - INDEXING BY genres
![image info](/doc/AdvancedQ1%201.PNG)

#### Advanced Query 1 - INDEXING BY explcit
![image info](/doc/AdvancedQ1%202.PNG)

#### Advanced Query 1 - INDEXING BY artist_name
![image info](/doc/AdvancedQ1%203.PNG)

### Advanced Query 1 - INDEXING ANALYSIS

Report on the index design you all select and explain why you chose it, referencing the analysis you performed in (b).
Note that if you did not find any difference in your results, report that as well. Explain why you think this change in indexing did not bring a better effect to your query.

We ran explain analysis on 4 different indices:
*  Artist_id 0.885
*  genres    1.211
*  explcit   0.753
*  artist_name 0.863

From the screenshots we can clearly see that indexing on explcit makes the query the fastest.
For the artist_id and artist_name we saw a negligible difference in time. This is because artist_id and name exists in both tables and most ids already have a unique name. Since we are searching based on explct, indexing on it makes the query faster.

## Advanced Query 2
### Advanced Query 2 - CODE
<pre>
SELECT a.artist_id, a.artist_name, AVG(f.energy) as avg_energy 
FROM Artists a Join Tracks t Using(artist_id) join AudioFeatures f Using(track_id) 
GROUP BY a.artist_id, a.artist_name 
ORDER BY avg_energy DESC LIMIT 15;
</pre> 

### Advanced Query 2 - OUTPUT
![image info](/doc/AdvancedQ2.PNG)

### Advanced Query 2 - INDEXING
#### Advanced Query 2 - INDEXING BY artist_id
![image info](/doc/AdvancedQ2%200.PNG)

#### Advanced Query 2 - INDEXING BY track_id
![image info](/doc/AdvancedQ2%201.PNG)

#### Advanced Query 2 - INDEXING BY energy
![image info](/doc/AdvancedQ2%202.PNG)

#### Advanced Query 2 - INDEXING BY artist_name
![image info](/doc/AdvancedQ2%203.PNG)

### Advanced Query 2 - INDEXING ANALYSIS

Report on the index design you all select and explain why you chose it, referencing the analysis you performed in (b).
Note that if you did not find any difference in your results, report that as well. Explain why you think this change in indexing did not bring a better effect to your query.

We ran explain analysis on 4 different indices:
*  Artist_id 0.860
*  track_id    0.827
*  energy   0.654
*  artist_name 0.920

From the screenshots we can clearly see that indexing on energy makes the query the fastest.
This is because we are averaging by energy in our query. There was a negligible difference in the rest of the queries with artist_name index being the slowest.

