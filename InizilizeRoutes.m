function routes = InizilizeRoutes(parkingNodes,nbrOfCars)
    
    nbrOfNodes = 5;
    routes = zeros(nbrOfCars,2*nbrOfNodes+1);
    nbrOfParkingNodes = length(parkingNodes);
    start = randi([1 nbrOfParkingNodes],1,1);
    stop = randi([1 nbrOfParkingNodes],1,1);
    
    for i = 1:nbrOfCars
        route = getStartRoute(start,stop);
        routes(i,1:length(route)) = route(:);
    end
    
end

    
    