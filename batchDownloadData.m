% script to get flight line data of interest

%% Grand Mesa processed with standard SRTM 30m DEM
flight_url='http://uavsar.asfdaac.alaska.edu/UA_grmesa_27416_20003-028_20005-007_0011d_s01_L090_01/'
base_name='grmesa_27416_20003-028_20005-007_0011d_s01_L090HH_01';
getUAVSARgrd(flight_url,base_name)

%% Grand Mesa processed with 5m DSM
flight_url='http://downloaduav.jpl.nasa.gov/Release2u/grmesa_27416_20003-028_20005-007_0011d_s01_L090_02/'
base_name='grmesa_27416_20003-028_20005-007_0011d_s01_L090HH_02';
getUAVSARgrd(flight_url,base_name)

%% Grand Mesa processed with 5m DTM
flight_url='http://downloaduav.jpl.nasa.gov/Release2u/grmesa_27416_20003-028_20005-007_0011d_s01_L090_03/'
base_name='grmesa_27416_20003-028_20005-007_0011d_s01_L090HH_03';
getUAVSARgrd(flight_url,base_name)

%% Boise Basin, lowman_23205, 1/31-2/13
flight_url='http://downloaduav.jpl.nasa.gov/Release2v/lowman_23205_20002-007_20007-003_0013d_s01_L090_01/'
base_name='lowman_23205_20002-007_20007-003_0013d_s01_L090HH_01';
getUAVSARgrd(flight_url,base_name)

%% Boise Basin, lowman_23205, 2/13-2/21
flight_url='http://uavsar.asfdaac.alaska.edu/UA_lowman_23205_20007-003_20011-003_0008d_s01_L090_01/'
base_name='lowman_23205_20007-003_20011-003_0008d_s01_L090HH_01';
getUAVSARgrd(flight_url,base_name)

%% Boise Basin, lowman_23205, 2/21-3/11
flight_url='http://downloaduav.jpl.nasa.gov/Release2v/lowman_23205_20011-003_20016-004_0019d_s01_L090_01/'
base_name='lowman_23205_20011-003_20016-004_0019d_s01_L090HH_01';
getUAVSARgrd(flight_url,base_name)

%% Reynolds Creek, silver_34715, 2/21-3/11
flight_url='http://downloaduav.jpl.nasa.gov/Release2x/silver_34715_20011-001_20016-002_0019d_s01_L090_01/'
base_name='silver_34715_20011-001_20016-002_0019d_s01_L090HH_01';
getUAVSARgrd(flight_url,base_name)






