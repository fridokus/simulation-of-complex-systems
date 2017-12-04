function averageVelocities = getAverageVelocityOnRoads(roads, nodes)

%     averageVelocities = zeros(length(nodes),length(nodes));
%     roadLengths = calculateRoadLength(nodes, roads);
%     
%     for i = 1:length(roads)
%         from = roads(i, 1);
%         to = roads(i, 2);
%         roadLength = roadLengths(i);
%         averageVelocities(from,to) = roadLength;
%     end
    
    averageVelocities = zeros(length(nodes),length(nodes));
    
    for i = 1:length(roads)
        from = roads(i,1);
        to = roads(i,2);
        roadLength = norm(nodes(to,:) - nodes(from,:));
        averageVelocities(from,to) = roadLength;
    end
             
end