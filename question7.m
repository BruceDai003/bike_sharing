bike_trips = readtable('bike_trips.csv');
bike_stations = readtable('bike_stations.csv');
bike_weather = readtable('bike_weather.csv');

% Create the weather_code: weather_name mapping table
w_code = [1;2;3;4];
weather = {'Sunny'; 'Cloudy'; 'Light Rain'; 'Storm'};
w_map = table(w_code, weather);

% Join bike_weather with this table
bike_weather = join(bike_weather, w_map);

% Join the bike_weather table with the bike_trips table
bike_trips = join(bike_trips, bike_weather);

% Drop w_code column
bike_trips.w_code = [];


% Transpose the bike_station table
station = bike_stations.Properties.VariableNames';
station_id = bike_stations.Variables';
bike_stations = table(station, station_id);

% Join the bike_tips table with this bike_station table
bike_trips = join(bike_trips, bike_stations, 'LeftKeys', 'station_id_start', ...
    'RightKeys', 'station_id');
% Rename the new column
bike_trips.Properties.VariableNames{'station'} = 'station_start';
% Drop the station_id_start column
bike_trips.station_id_start = [];

% Repeat the same procedure for station_id_end
bike_trips = join(bike_trips, bike_stations, 'LeftKeys', 'station_id_end', ...
    'RightKeys', 'station_id');
% Rename the new column
bike_trips.Properties.VariableNames{'station'} = 'station_end';
% Drop the station_id_start column
bike_trips.station_id_end = [];

% Calculate duration
bike_trips.duration = bike_trips.t_end - bike_trips.t_start;
% Drop t_start, t_end columns
bike_trips.t_start = [];
bike_trips.t_end = [];

% Remove rows with duration < 0 
bike_trips(bike_trips.duration < 0, :) = [];

% Reorder the columns
old_vars = bike_trips.Properties.VariableNames;
new_vars = {'day', 'station_start', 'station_end', 'duration', 'weather'};
[~,LOCB] = ismember(old_vars,new_vars);
bike_trips = bike_trips(:, LOCB);

% b) Summy table
mean_table = varfun(@mean, bike_trips, 'GroupingVariables', 'weather',...
    'InputVariables', 'duration');
mean_table

% Box plot
figure;
boxplot(bike_trips.duration, bike_trips.weather);
title('Bike Duration Box Plot');
xlabel('Weather');
ylabel('Duration');
saveas(gcf, 'boxplot.png');

% c) T-test stats of the means
dur_sun = bike_trips(strcmp(bike_trips.weather, 'Sunny'), 'duration');
dur_cloudy = bike_trips(strcmp(bike_trips.weather, 'Cloudy'), 'duration');
dur_rain = bike_trips(strcmp(bike_trips.weather, 'Light Rain'), 'duration');
dur_storm = bike_trips(strcmp(bike_trips.weather, 'Storm'), 'duration');
durs = {table2array(dur_sun); table2array(dur_cloudy); table2array(dur_rain); table2array(dur_storm)};
% Now perform 2-samples t-test on each pair
group_results = zeros(4, 4);
for i = 1:3
    for j = i+1:4
        [h, p] = ttest2(durs{i}, durs{j}, 'Vartype', 'unequal');
        group_results(i, j) = h;
        group_results(j, i) = h;
    end
end
fprintf('The group t-test resutls\n');
group_results




