function [r,hI]=readUAVSARgrd(dfile)
% HPM  6/29/20
% read in the UAVSAR binary images 

%dfile='../../DATA_DRIVE/SnowEx2020/UAVSAR/grmesa_27416_20003-028_20005-007_0011d_s01_L090HH_01.amp1.grd';
%zone=12;
%%
[dpath,dname,~]=fileparts(dfile);
[~,dname,~]=fileparts(dname);
afile=[dpath '/' dname '.ann'];

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
Z=fread(fileID,[Ncol Nrow],'float32',0,'l');
Z=Z'; % transpose

%% now create spatial coordinates
lat=Lat1:dLat:(Lat1+dLat*(Nrow-1));
lon=Lon1:dLon:(Lon1+dLon*(Ncol-1));
[LON,LAT]=meshgrid(lon,lat);
Z(Z==0)=NaN; % set zeros to NaN
Ix=~isnan(Z); % indicies to non-nan values
%[X,Y]=ll2utm(LAT,LON,zone);
r.x=lon; r.y=lat; r.Z=Z; r.name='Grand Mesa, Feb 1, amplitude';
crange=[0 0.5];
hI=nanimagesc(r,Ix,crange)

%%
%figure(1);clf
%imagesc(lon,lat,Z,[0 0.5]); colorbar
%set(gca,'YDir','normal')
%Z(Z==0)=NaN; % set zero values to NaN

%%
%Z2=Z; Z2(Z2>0.5)=0.5;
%figure(1);clf
%geoimg = geoshow(LAT,LON,Z2,'DisplayType', 'texturemap') % save object
%geoimg.AlphaDataMapping = 'none'; % interpet alpha values as transparency values
%geoimg.FaceAlpha = 'texturemap'; % Indicate that the transparency can be different each pixel
%alpha(geoimg,double(~isnan(Z))) % Change transparency to matrix where if data==NaN --> transparency = 1, else 0.


