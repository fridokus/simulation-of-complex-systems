function pathRoad = fromNodeToRoad(path,roads)

    pathRoad = [];
    
    for i = 1:length(path) - 1
        from = find(roads(:,1) == path(i));
        pathRoad(end + 1) = from(find(roads(from,2) == path(i+1)));
    end
    
end