function newPopulation = InsertBestIndividiual(population,bestIndividual,nbrOfCopies)

    for i = 1:nbrOfCopies
        population(i,:) = bestIndividual;
    end
    
    newPopulation = population;
    
end