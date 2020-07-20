function hI=nanimagesc(r,Ix,crange)
% show an image, making pixels with indicies in Ix transparent
% INPUT: r = structure array
%           r.x = easting
%           r.y = northing
%           r.Z = image data
%        Ix = indicies for pixels to make transparent
%        crange = range for colorscale
% OUTPUT:  hI= index to image 

A=zeros(size(r.Z));
A(Ix)=1;
hI=imagesc(r.x,r.y,r.Z,crange); colorbar('EastOutside')
set(hI,'AlphaData',A)
set(gca,'ydir','normal','FontSize',14,'FontWeight','bold','LineWidth',3)
hold on
axis equal; axis tight
title(r.name)
xlabel('UTM Zone 13 Easting [m]')
ylabel('UTM Zone 13 Northing [m]')
