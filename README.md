# bike_sharing
A city put in place a bike sharing system a year ago. Through this
system, users are able to easily rent a bike from a particular station and return it back at
another station (possibly the same). There are complaints that some stations often have
no bike available to rent. The logistics to make sure there are enough bikes available at
all renting stations is complex and partially based on the duration of the bike ride for
each user. Municipal employees have noticed that the ride duration tends to be longer
when the weather is nice. If this is true, the municipal staff that moves bikes to empty
stations could plan its activity in advance, based on weather forecasts, to improve bike
availability. The manager of the bike sharing program wants to be sure that weather
influences the bike ride duration and hires you as a data analyst consultant to study
this.

The manager provides a dataset of 2,000 bike rides randomly selected over the last year
in the file bike trips.csv as well as the file bike stations.csv that translates in
English the bike stations names from numerical codes. You also have access to weather
data for the city in the file bike weather.csv . The file bike INFO.txt contains
important additional information about those three files.

a) Merge the information from all three datasets (about bike rides, station names
and weather) in a single table that must have the following format (note that the
codes for weather and stations are replaced by their “names”):

| day | station start | station end | duration weather |
| --- | ------------- | ----------- | ---------------- |
| 1 | BotanicalGardens | MainStreetSouth | 56.78 | Sunny |
| 1 | MontagueStreet | MontagueStreet | 12.34 | Storm |
| 1 | BakerStreet | AdelaideStreet | 8.76 | Storm |
| 1 | TrainStation | BotanicalGardens | 6.31 | Light Rain |
| 2 | ShoppingMall | CravenAvenue | 69.31 | Sunny |
| ··· | ··· | ··· | ··· | ··· |

The table above is illustrative and does not represent the values of the actual data
contained in the file. The variable duration is the duration of the bike ride in
minutes.

Hint: this question involves several steps of joining tables.

b) Produce and display a table that summarizes the average bike ride duration for
each of the four types of weather. Create a well-annotated boxplot that shows the
distribution of bike ride durations by weather type.

c) Conduct a rigorous statistical analysis that determines if the bike ride durations
differs with the type of weather. Write a short paragraph that summarizes your
analysis.
