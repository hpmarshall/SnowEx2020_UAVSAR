function getUAVSARgrid(flight_url,base_name)
% HPM 6/30/20
% this function downloads all polarizations and data files of interest from
%   a specific UAVSAR flight line

ext={'.cor.grd','.int.grd','.amp1.grd','.amp2.grd','.ann','.int.kmz','.cor.kmz','.amp1.kmz','.amp2.kmz','.unw.kmz','.hgt.kmz'}; % file extensions for data
pol={'HH','HH','HV','VH','VV'}; % polarizations
data_dir='../../DATA_DRIVE/SnowEx2020/UAVSAR/';
options=weboptions('Username','hpmarshall@boisestate.edu','Password','SnowEx2021!');
% loop over extensions
for n1=1:length(ext)
    local_name=[data_dir base_name ext{n1}];
    remote_name=[flight_url base_name ext{n1}];
    % loop over polarizations
    for n2=1:length(pol)-1
        local_name=strrep(local_name,pol{n2},pol{n2+1});
        remote_name=strrep(remote_name,pol{n2},pol{n2+1});
        disp(local_name)
        if ~exist(local_name,'file') % if file doesn't exist, then download it
            disp(['no local copy found, downloading, can take several minutes...'])
            tic
            outfilename=websave(local_name,remote_name,options)
            toc
        else
            disp('local copy found')
        end
    end
end