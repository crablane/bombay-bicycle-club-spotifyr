# bombay-bicycle-club-spotifyr
Plotting all Bombay Bicycle Club tracks in an energy/valence-matrix

## Motivation
 <div align="justify"> I have always had strong feelings about music. At the ripe age of eleven, my pen-pal Julia and I drifted apart because she turned out to be an Eminem-Fan and I wasn’t – we both felt that signaled something important about each other’s character. Later, I hosted my own radio show at my uni radio station, and I will admit I used this as a way to play whatever music I felt needed to be heard. I have grown more tolerant over the years, but still, nothing hypes me up or makes me cry like a good song. 

So when I heard that there is an R-package that allows you to download and analyze data from Spotify, I knew I had to do _something_ with it. Every song that gets uploaded to Spotify is processed by an algorithm that determines a song’s characteristics, for example how danceable it is, whether it's an acoustic piece or not, whether it includes speech (like a podcast) how loud it is or whether it’s a live performed track.

Among those algorithmically determined characteristics are measures of a songs' energy and valence, that is, a “(…) perceptual measure of intensity and activity” and a measure for how positive or negative a songs' sound is. Both measures range from 0 (low intensity, negative) to 1 (high intensity, positive). This neatly corresponds to the dimensional model of emotion that uses arousal (energy) and valence as two dimensions along which emotions are categorized. Like so: </div>

![wheel](https://github.com/crablane/bombay-bicycle-club-spotifyr/assets/159540127/1fd48852-73cb-4e95-b78e-f154f1041324)

So with the measure given, we are able to pinpoint exactly which emotion a song conveys. 

## Data and Measurement
<div align="justify"> What could be better than analyzing your favourite bands music? I first heard of **Bombay Bicycle Club** circa 2010 and have been a fan ever since. Their music is perfectly suited to this project not only because I like it and I know it well enough to make a judgement about how good Spotify’s measurement is, but also because their music covers a broad range of emotions and musical styles. There are the rough, angry songs from their debut album, upbeat indie club-hits like _Carry Me_, _Luna_ and _Shuffle_, there is a whole acoustic album (and some more acoustic versions of songs over the years), the eclectic sounds on their most recent album and heartfelt ballads. 

Now, personally, I already have an opinion about which emotion a specific song conveys - I have listened to them a few hundred times at least and that's a conservative estimate! Therefore, I rather see this as a test of the quality of Spotify's algorithm, whether for example it can find the difference between _I Want to Be Your Only Pet_ and _Luna_: Both are very energetic songs, but should be on rather different levels of valence.

I used the Spotifyr-Package and the _get_track_audio_features_ command to download the information on energy and valence of all Bombay Bicycle Club songs that were released on an album or a single. All further analyses are conducted in Stata 18. Before we can start plotting the songs, the data have to be cleaned and prepared. Since many songs are released on an album and on a single, duplicate songs have to be removed before the analysis. I further excluded all Remixes of Bombay Bicycle Club Songs by other artists and Live-versions of songs. </div>

Without further ado, let’s get to the fun part and look at where in that matrix each song falls:

## Results
![scatter-IHTBBISTL](https://github.com/crablane/bombay-bicycle-club-spotifyr/assets/159540127/30e1df99-84c0-4815-b423-4db4b0886a71)

<div align="justify"> The debut Album _I Had The Blues But I Shook Them Loose_ has a lot of songs that are energetic and have a more negative tone, thus landing in the angry/tense area of the graph. So far, I agree, however this is probably the album I have listened to the least, so others may correct me. 

The band took an unexpected turn with their acoustic follow-up album, _Flaws_. This is most likely reflected in the relatively low energy of songs. However the album covers a broad range of emotions, from sad songs like _Flaws_ to calm and relaxed songs like _Fairytale Lullaby_ and the more upbeat _Rinse Me Down_ or _Ivy & Gold_. Personally, I feel that _Swansea_ is a little misplaced and should be more in the calm and relaxed area of the graph, but that is only a minor disagreement. </div>
 
![scatter-Flaws](https://github.com/crablane/bombay-bicycle-club-spotifyr/assets/159540127/366b3198-92cf-4e66-9d88-5ac3726947f0)


The next three albums _A Different Kind of Fix_, _So Long, See You Tomorrow_ and _Everything Else Has Gone Wrong_ all have a similar distribution of songs, with a few “sad” songs and the majority of tracks falling into the upper two quarters of the graph. Interestingly none of the songs fall into the calm/relaxed/content area. 
I strongly disagree with the placement of some of the songs though. _Shuffle_ – to me, and to many others – is about the happiest song that the band has ever written. That piano sample, wherever it came from, is pure joy. It should be on the very right side of that graph, indicating a very positive sound, but according to Spotify, it’s… not. Similarly, _Home by Now_ and _Luna_ are happy songs for me.

![scatter-Fix](https://github.com/crablane/bombay-bicycle-club-spotifyr/assets/159540127/3ed44b81-3d7d-4db9-beb2-6ca1cda81492)
![scatter-SLSYT](https://github.com/crablane/bombay-bicycle-club-spotifyr/assets/159540127/0a269273-d04e-4121-adef-d60556cbf79f)
![scatter-EEHGW](https://github.com/crablane/bombay-bicycle-club-spotifyr/assets/159540127/d7965a88-3e84-46ff-aca3-11f414d2d489)

The latest album, _My Big Day_, breaks that pattern: It is the most joyful, upbeat album according to Spotify and the most concise one in terms of the emotions conveyed! Yet again, I don’t agree with all of it. Look at where _Meditate_ and _Turn the World on_ are placed: I would say that _Meditate_ sounds both more energetic and less positive than _Turn The World On_, which would put it into the top left quarter of the graph, above and left to _TTWO_ on. And _I Want To Be Your Only Pet_ is placed right in terms of energy, – it’s an absolute banger! – but does it sound more positive than _Heaven_!? Or _Home By Now_? Or, dare I say, _Shuffle_!? No! 

![scatter-MBD](https://github.com/crablane/bombay-bicycle-club-spotifyr/assets/159540127/7442eed4-2443-42c8-8f1b-c3612f1182c8)

So, remember what I said earlier about _Luna_ and _I Want To Be Your Only Pet_? Both have a high energy but Luna sounds a lot more positive to me than IWTBYOP. Spotify correctly assigns both a high level on the energy measure, but it messes up the valence. Not only are both songs rated pretty similarly - _IWTBYOP_ (.487) is even rated slightly more positive than _Luna_ (.387). Clearly, Spotify's algorithm does not perform well here.

Let’s look at the rest of it. Everything that has not been released on an album, but on an EP or a B-Side of a Single. Again, some songs seem misplaced and it has to do with the valence-rating. Take for example _Better now_ and _Blindfold_. Both are on the most recent EP, _Fantasies_. One sounds like it will make you lift off the ground, a mood-booster, the thing to hype you up and the other one is a beautiful, melancholic song for an autumn day: Neither are placed correctly in that graph and more egregiously, _Blindfold_ (the sad song) is even further in the “positive” area than _Better now_ (the happy song). And please, _Terrapin Station_ 🐢 does not convey a relaxed emotion? Come on!  </div>

![scatter-Others](https://github.com/crablane/bombay-bicycle-club-spotifyr/assets/159540127/e1fe61b7-a3c5-41fb-89f2-bfcfcf30307c)

Finally, let’s plot all songs in one graph, coloured by the album they are on:

![scatter-Alltracks](https://github.com/crablane/bombay-bicycle-club-spotifyr/assets/159540127/e8fff6fa-ee0a-4c12-af5e-3a41ab4ee81b)

<div align="justify"> Pretty! But given the misplacements mentioned above (and based on your favourite Bombay Bicycle Club album you might find other oddities that stand out to you) pretty uninformative if you really wanted to know how a song or an album sounds, right? I guess there’s just one way to find that out: give it a listen, it’s worth it, I promise! </div>

## Limitations & Conclusion
The biggest limitation of the analysis is that we don’t know what’s behind the measures, especially the measurement of valence. What exactly makes a song sound positive or negative according to Spotify? And if it clashes with the opinion of a self-proclaimed expert on all things Bombay Bicycle Club, me, is it a valid measure for valence at all? The answers to these questions may not have a big real-life impact, but as far as I am concerned, I don’t want Spotify to play me _To The Bone_ rather than _Shuffle_ when I need to be hyped up for an interview or something! So bottom line: Do make your own playlists!

Besides my disagreement with the measurement, this was a fun project and I might do some more stuff with the data! Hope you enjoyed.

![BBC-tracks](https://github.com/crablane/bombay-bicycle-club-spotifyr/assets/159540127/901a79ed-fed9-4162-84f5-03339fb237bc)


