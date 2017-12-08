function averageV = getAvregeVMatrix(carsV,carsR,nodes,roads)
   
    averageV = zeros(length(nodes),length(nodes));
    nbrRoads = length(roads);
    maxVAtRoad = roads(:,3);
    s = 1;
    vAtRoad = zeros(1,nbrRoads);
    
    for i = nbrRoads:-1:1
        carsAtRoad = find(carsR == i);
        nbrCars = length(carsAtRoad);
        if nbrCars > 0
            vAtRoad(i) = sum(carsV(s:nbrCars))/nbrCars;
        else 
            vAtRoad(i) = maxVAtRoad(nbrRoads-i+1);
        end
            s = s + nbrCars;
    end
    
   for i = 1:length(roads)
        from = roads(i,1);
        to = roads(i,2);
        if vAtRoad(length(roads)-i+1) == 0
            averageV(from,to) = 1000000; 
        else
            averageV(from,to) = 1/vAtRoad(length(roads)-i+1);
        end
   end

end