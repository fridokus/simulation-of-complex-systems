function [path,costMatrix] = dijkstrasGetPath(startNode,stopNode,networkMatrix,averageV)

    costMatrix = networkMatrix.*averageV;
    nbrNodes = size(costMatrix,1);
    tmp_distance = Inf(1, nbrNodes);
    
    queue = [];
    visited = [];
    nodeBefore = [];
    queue(1) = startNode;
    tmp_distance(startNode) = 0.0;
    
    while ~isempty(queue)
       [~, iNextNode] =  min(tmp_distance(queue));
       shortestDistanceNode = queue(iNextNode(1));
       visited(length(visited) + 1) = shortestDistanceNode;
       queue(iNextNode(1)) = [];
       neighbouringNodes = find(costMatrix(shortestDistanceNode,:) ~= 0);
       for j=1:length(neighbouringNodes)
           neighbourNode = neighbouringNodes(j);
           newDistance = tmp_distance(shortestDistanceNode) + costMatrix(shortestDistanceNode,neighbourNode);
           if newDistance < tmp_distance(neighbourNode) && ~ismember(neighbourNode, visited)
              tmp_distance(neighbourNode) = newDistance;
              queue(end + 1) = neighbourNode;
              nodeBefore(neighbourNode) = shortestDistanceNode;
           end
       end
    end
        tmp_distance(startNode) = Inf;
     
    currentNode = stopNode;
    path = [];
    
    while currentNode ~= startNode
        path(end + 1)= currentNode;
        currentNode = nodeBefore(currentNode);
    end
    path(end + 1) = currentNode;
    path = flip(path);
end
      
