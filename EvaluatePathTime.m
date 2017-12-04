function fitness = EvaluatePathTime(path, roads, nodes, networkMatrix)
    
    fitness = 0;
    averageVelocity = getAverageVelocityOnRoads(roads, nodes); %is really path length
    
    i = 1;
    from = path(i);
    to = path(i+1);
    
    while to > 0
        i = i + 1;
        time = networkMatrix(from,to)*averageVelocity(from,to);
        fitness = fitness + time;
        from = to;
        to = path(i + 1);
    end
    
    fitness = 1/fitness;
    
end


    
    
    
    