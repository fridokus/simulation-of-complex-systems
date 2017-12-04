function averageV = GetAvregeVelocityOnRoads

    roads = xlsread('roads.xlsx');
    nodes = xlsread('nodes.xlsx');
    averageV = zeros(length(nodes),length(nodes));
    
    for i = 1:length(roads)
        from = roads(i,1);
        to = roads(i,2);
        roadLength = norm(nodes(to,:) - nodes(from,:));
        averageV(from,to) = roadLength;
    end
    
             
end