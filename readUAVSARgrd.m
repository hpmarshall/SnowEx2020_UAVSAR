% readUAVSARgrd
% HPM  6/29/20
% read in the UAVSAR binary images from their website

flight_name='http://uavsar.asfdaac.alaska.edu/UA_grmesa_27416_20003-028_20005-007_0011d_s01_L090_01/grmesa_27416_20003-028_20005-007_0011d_s01_L090HH_01'

ext={'.cor.grd','.int.grd','.amp1.grd','.amp2.grd'} % file extensions for data
pol={'HH','HV','VH','VV'} % polarizations

%%




D=dir('../../DATA_DRIVE/SnowEx2020/UAVSAR/*.amp1.grd');
dfile=[D(1).folder '/' D(1).name];
[~,dname,~]=fileparts(dfile);
[~,dname,~]=fileparts(dname);
afile=[D(1).folder '/' dname '.ann.txt'];


text = fileread(afile);
TextAsCells = regexp(text, '\n', 'split');
mask = ~cellfun(@isempty, regexp(TextAsCells, 'Ground Range Data Latitude Lines'));
s = TextAsCells(mask);
Ix=strfind(s{1},'=');
Nrow=str2double(s{1}((Ix+1):end));
mask = ~cellfun(@isempty, regexp(TextAsCells, 'Ground Range Data Longitude Samples'));
s = TextAsCells(mask);
Ix=strfind(s{1},'=');
Ncol=str2double(s{1}((Ix+1):end));
mask = ~cellfun(@isempty, regexp(TextAsCells, 'Ground Range Data Starting Latitude'));
s = TextAsCells(mask);
Ix=strfind(s{1},'=');
Ix2=strfind(s{1},';');
Lat1=str2double(s{1}((Ix+1):(Ix2-1)));
mask = ~cellfun(@isempty, regexp(TextAsCells, 'Ground Range Data Starting Longitude'));
s = TextAsCells(mask);
Ix=strfind(s{1},'=');
Ix2=strfind(s{1},';');
Lon1=str2double(s{1}((Ix+1):(Ix2-1)));
mask = ~cellfun(@isempty, regexp(TextAsCells, 'Ground Range Data Latitude Spacing'));
s = TextAsCells(mask);
Ix=strfind(s{1},'=');
dLat=str2double(s{1}((Ix+1):end));
mask = ~cellfun(@isempty, regexp(TextAsCells, 'Ground Range Data Longitude Spacing'));
s = TextAsCells(mask);
Ix=strfind(s{1},'=');
dLon=str2double(s{1}((Ix+1):end));
%%
fileID=fopen(dfile,'r');
A=fread(fileID,[Ncol Nrow],'float32',0,'l');
%%
%%
figure(1);clf
imagesc(A',[0 1]); colorbar

%%






