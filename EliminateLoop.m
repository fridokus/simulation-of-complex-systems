function chromosome = EliminateLoop(chromosome)

    nbrGenes = length(chromosome);
    i = 2;
    temp = [];
    
    while length(temp) < 1 && i < nbrGenes
        j = i + 1;
        while length(temp) < 1 && j < nbrGenes
            if chromosome(i) == chromosome(j)
                temp(1:i) = chromosome(1:i);
                part2 = chromosome(j+1:nbrGenes);
                temp(i+1:i + length(part2)) = part2;
            end
            j = j + 1;
        end
        i = i + 1;
    end
    
    if isempty(temp)
        chromosome = temp;
    end
    
end
