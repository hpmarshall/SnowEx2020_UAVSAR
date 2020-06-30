Working directory for UAVSAR analysis for SnowEx2020
HPM  6/30/20

getUAVSARgrd.m = downloads data from UAVSAR server.  Input flight_url and base_name, and all polarizations and datafiles (correlation, interferogram, amplitude1, amplitude2) are auto downloaded

batchDownloadData.m = script to dump data using getUAVSARgrd.m for several sites and flights

readUAVSARgrd.m = loads binary data into matlab, converts to UTM, creates northing/easting vectors [in progress]






