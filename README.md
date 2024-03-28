# bombay-bicycle-club-spotifyr
Plotting all Bombay Bicycle Club tracks in an energy/valence-matrix

## Motivation
I have always had strong feelings about music. When I was twelve or so, my pen-pal Julia and I fell apart, because she turned out to be an Eminem-Fan and I wasn’t – we both felt that signaled something important about each others’ character. Later, I hosted my own radio show at our unis’ radio station and I will admit I used this as a way to play whatever music I felt needed to be heard. I have grown more tolerant over the years, but still, nothing hypes me up or makes me cry like a good song. 

So when I heard that there is an R-package that allows you to download and analyze data from Spotify, I knew I had to do something with it. Every song that gets uploaded to Spotify is processed by an algorithm that determines a songs’ charachteristics, for example how danceable it is, whether its an acoustic piece or not, whether it includes speech (like a podcast) how loud it is or whether it’s a live performed track.

Among those algorithmically determined characteristics are measures of a songs energy and valence, that is a “(…) perceptual measure of intensity and activity” and a measure for how positive or negative a song sounds. Both measures range from 0 (low intensity, negative) to 1 (high intensity, positive). This neatly corresponds to the dimensional model of emotion that uses arousal (energy) and valence as two dimensions along which emotions are categorized. Like so:

![wheel](https://github.com/crablane/bombay-bicycle-club-spotifyr/assets/159540127/1fd48852-73cb-4e95-b78e-f154f1041324)

So with the measure given, we are able to pinpoint exactly which emotion a song conveys. 

## Data and Measurement
What could be better than analyzing your favourite bands music? I have first heard of Bombay Bicycle Club ca. 2010 and have been a fan ever since. Their music is perfectly suited to this project not only because I like it and I know it well enough to make a judgement about how good Spotify’s measurement is, but also because their music covers a broad range of emotions and musical styles. There are the rough, angry songs from their debut album, upbeat indie club-hits like Carry Me, Luna and Shuffle, there is a whole acoustic album (and some more acoustic versions of songs over the years), the ecclectic sounds on their most recent album and heartfelt ballads like Still or To The Bone. 

I used the SpotifyR-Package and the get_track_audio_features command to download the information on energy and valence of all Bombay Bicycle Club songs that were released on an album or a single. All further analyses are conducted in Stata18. Before we can start plotting the songs, the data have to be cleaned and prepared. Since many songs are released on an album and on a single, duplicate songs have to be removed before the analysis. I further excluded all Remixes of Bombay Bicycle Club Songs by other artists and Live-versions of songs. 

Without further ado, let’s get to the fun part and look at where in that matrix each song falls:

## Results
![scatter-IHTBBISTL](https://github.com/crablane/bombay-bicycle-club-spotifyr/assets/159540127/30e1df99-84c0-4815-b423-4db4b0886a71)

The debut Album I Had The Blues But I Shook Them Loose has a lot of songs that are energetic and sound more negative, thus landing in the angry/tense area of the graph. So far, I agree, however this is probably the album I have listened to the least, so others may correct me. 

The band took an unexpected turn with their acoustic follow-up album, Flaws. This is most likely reflected in the relatively low energy of songs. However the album covers a broad range of emotions, from sad songs like Flaws or Dust On The Ground to calm and relaxed songs like Fairytale Lullaby and Word by Word and the more upbeat Rinse Me Down or Ivy & Gold. Personally, I feel that Swansea is a little misplaced and should be more in the calm and relaxed area of the graph, but that is only a minor disagreement.
 
![scatter-Flaws](https://github.com/crablane/bombay-bicycle-club-spotifyr/assets/159540127/366b3198-92cf-4e66-9d88-5ac3726947f0)

The next three albums A Different Kind of Fix, So Long, See You Tomorrow and Everything Else Has Gone Wrong all have a similar distribution of songs, with a few “sad” songs and the majority of tracks falling into the upper two quarters of the graph. Interestingly none of the songs fall into the calm/relaxed/content area. 
I strongly disagree with the placement of some of the songs though. Shuffle – to me, and to many others – is about the happiest song that the band has ever written. That piano sample, wherever it came from, is pure joy. It should be on the very right side of that graph, indicating a very positive sound, but according to Spotify, it’s…not. Similarly, Home by Now and Luna are happy songs for me. 

![scatter-Fix](https://github.com/crablane/bombay-bicycle-club-spotifyr/assets/159540127/3ed44b81-3d7d-4db9-beb2-6ca1cda81492)
![scatter-SLSYT](https://github.com/crablane/bombay-bicycle-club-spotifyr/assets/159540127/0a269273-d04e-4121-adef-d60556cbf79f)
![scatter-EEHGW](https://github.com/crablane/bombay-bicycle-club-spotifyr/assets/159540127/d7965a88-3e84-46ff-aca3-11f414d2d489)

The latest album, My Big Day, breaks that pattern: It is the most joyful, up-beat album according to Spotify and the most concise one in terms of the emotions conveyed! Yet again, I don’t agree with all of it. Look at where Meditate and Turn the World on are placed: I would say that Meditate sounds both more energetic and less positive than Turn The World On, which would put it into the top left quarter of the graph, above and left to Turn the World on. And I Want To Be Your Only Pet is placed right in terms of energy – it’s an absolute banger! – but does it sound more positive than Heaven!? Or Home By Now? Or, dare I say, Shuffle!? No! 

![scatter-MBD](https://github.com/crablane/bombay-bicycle-club-spotifyr/assets/159540127/7442eed4-2443-42c8-8f1b-c3612f1182c8)

Let’s look at the rest of it. Everything that has not been released on an album, but on an EP or a B-Side of a Single. Again, some songs seem misplaced and it has to do with the valence-rating. Take for example Better now and Blindfold. Both are on the most recent EP, Fantasies. One sounds like it will make you lift off the ground, a mood-booster, the thing to hype you up and the other one is a beautiful, melancholic song for an autumn day: Neither are where they are supposed to be in that graph and more egregiously, Blindfold (the sad song) is even further in the “positive” area than better now (the happy song). And please, Terrapin Station does not convey a relaxed emotion? Come on! 

![scatter-Others](https://github.com/crablane/bombay-bicycle-club-spotifyr/assets/159540127/e1fe61b7-a3c5-41fb-89f2-bfcfcf30307c)

Finally, let’s plot all songs in one graph, coloured by the album they are on:

![scatter-Alltracks](https://github.com/crablane/bombay-bicycle-club-spotifyr/assets/159540127/e8fff6fa-ee0a-4c12-af5e-3a41ab4ee81b)

Pretty! But given the misplacements mentioned above (and based on your favourite Bombay Bicycle Club album you might find other atrocities that stand out to you) pretty uninformative if you really wanted to know how a song or an album sounds, right? I guess there’s just one way to find that out: give it a listen, it’s worth it, I promise! 
Limitations

## Limitations
The biggest limitation of the analysis is that we don’t know what’s behind the measures, especially the measurement of valence. What exactly makes a song sound positive or negative according to Spotify? And if it clashes with the opinion of a self-proclaimed expert on all things Bombay Bicycle Club (me), is it a valid measure for valence at all? The answers to these questions may not have a big real-life impact, but as far as I am concerned, I don’t want Spotify to play me To The Bone when I need to be hyped up for an interview or something! So bottom line: Do make your own playlists! 

## Conclusion
Besides my disagreement with the measurement this was a fun project and I might do some more stuff with the data! Hope you enjoyed.

