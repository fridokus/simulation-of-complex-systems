function fitness = EvaluatePathTime(path)
    
    fitness = 0;
    networkMatrix = loadNetworkMatrix;
    nbrNodes = size(networkMatrix,1);
    averageV = GetAvregeVelocityOnRoads;
    
    i = 1;
    from = path(i);
    to = path(i+1);
    
    while to > 0
        i = i + 1;
        time = networkMatrix(from,to)*averageV(from,to);
        fitness = fitness + time;
        from = to;
        to = path(i + 1);
    end
    
    fitness = 1/fitness;
    
end


    
    
    
    