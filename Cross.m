function newChromosomePair = Cross(chromosome1,chromosome2,stopNode)
    
    newChromosomePair = zeros(2,length(chromosome1));
    
    i = 2;
    crossIndex = [0,0];

    while (crossIndex(1) == 0 && chromosome1(i) ~= 5)
        j = 2;
        while (chromosome1(i) ~= chromosome2(j) && chromosome2(j) ~= 5)
            j = j + 1;
        end
        if (chromosome1(i) == chromosome2(j))
            crossIndex(1) = i;
            crossIndex(2) = j;
        end
        i = i + 1;
    end
    
    tempCh1 = [];
    tempCh2 = [];

    if (crossIndex(1) > 0)
        tempCh1(1:crossIndex(1)) = chromosome1(1:crossIndex(1));
        part2Ch1 = chromosome2(crossIndex(2)+1:find(chromosome2 == stopNode));
        tempCh1(crossIndex(1)+1:crossIndex(1)+length(part2Ch1)) = part2Ch1;
        
        tempCh2(1:crossIndex(2)) = chromosome2(1:crossIndex(2));
        part2Ch2 = chromosome1(crossIndex(1)+1:find(chromosome1 == stopNode));
        tempCh2(crossIndex(2)+1:crossIndex(2)+length(part2Ch2)) = part2Ch2;
        
        tempCh1 = EliminateLoop(tempCh1);
        tempCh2 = EliminateLoop(tempCh2);
        
        newChromosomePair(1,1:length(tempCh1)) = tempCh1;
        newChromosomePair(2,1:length(tempCh2)) = tempCh2;
        
    else
        
        newChromosomePair(1,:) = chromosome1;
        newChromosomePair(2,:) = chromosome2;
        
    end
        
end
