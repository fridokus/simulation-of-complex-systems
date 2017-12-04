function mutatedPath = Mutate(originalPath,mutationProbability,stopNode,networkMatrix)
    mutatedPath = zeros(1,length(originalPath));
    tempPath = originalPath(1:find(originalPath == stopNode));
    if length(tempPath) > 2
        muteatePoint = randi([2 length(tempPath)-1],1,1);
        part2 = InitializePopulation(1,tempPath(muteatePoint),stopNode,networkMatrix);
        mutaedPathN(1:muteatePoint-1) = tempPath(1:muteatePoint-1);
        mutaedPathN(muteatePoint:muteatePoint-1+length(part2)) = part2;
        mutatedPath(1:find(mutaedPathN == stopNode)) = mutaedPathN(1:find(mutaedPathN == stopNode)); 
    else
        mutatedPath = originalPath;
    end
    
end

    
    

