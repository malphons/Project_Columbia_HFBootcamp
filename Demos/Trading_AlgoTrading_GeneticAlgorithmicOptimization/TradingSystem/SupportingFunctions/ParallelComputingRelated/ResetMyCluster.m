function myCluster = ResetMyCluster()

try
    poolsize = Count_NumOfWorkers();
    warning('off') %#ok
    if poolsize == 0
        myCluster = parpool('local');
        disp(['Succesfully opened cluster of ' num2str(poolsize) ' workers'])
    else
        myCluster = gcp;
        disp(['Cluster already open and read for use with ' num2str(poolsize) ' workers'])
    end
catch
    myCluster = [];
    disp('Failed to open cluster')
end
warning('on') %#ok