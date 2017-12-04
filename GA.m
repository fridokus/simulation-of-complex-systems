%% GA
clear all
clc
clf

populationSize = 20;
networkMatrix = loadNetworkMatrix;
nbrNodes = size(networkMatrix,1);


% cityLocatons = LoadCityLocations; %%% Fix this

mutationProbability = 0.2;
tournamentSelectionParameter = 0.8;
crossoverProbability = 0.2;
fitness = zeros(populationSize,1);
numberOfBestIndividualCopies = 1;

numberOfGenerations = 10;

% %%% Plot
% path = randperm(numberOfNodes);                
% tspFigure = InitializeTspPlot(cityLocations,[0 20 0 20]); 
% connection = InitializeConnections(cityLocations); 
% PlotPath(connection,cityLocations,path);  
% %%%
startNode = 1;
stopNode = 54;
population = InitializePopulation(populationSize,startNode,stopNode,networkMatrix);

timeBestPath = zeros(1,numberOfGenerations);

%%%% Iterate over generations
for iGenerations = 1:numberOfGenerations
    %%%%% Calculate fitness values for population and save best value  
    
    maximumFitness = 0.0;
    bestIndividualIndex = 0;
    for i = 1:populationSize
        path = population(i,:);
        fitness(i) = EvaluatePathTime(path);
        if (fitness(i) > maximumFitness)
            maximumFitness = fitness(i);
            bestIndividualIndex = i;
        end
    end
    
    bestIndividual = population(bestIndividualIndex,:); % Save best individual for elitism 
    %PlotPath(connection,cityLocations,bestIndividual)
    

    %%%%%% Tournament selction
    tempPopulation = population;
    
    for i = 1:2:populationSize
        i1 = TournamentSelect(fitness,tournamentSelectionParameter);
        i2 = TournamentSelect(fitness,tournamentSelectionParameter);
        chromosome1 = population(i1,:);
        chromosome2 = population(i2,:);
    
        r = rand;
        if (r < crossoverProbability)
            newChromosomePair = Cross(chromosome1,chromosome2,stopNode);
            tempPopulation(i,:) = newChromosomePair(1,:);
            tempPopulation(i+1,:) = newChromosomePair(2,:);
        else
            tempPopulation(i,:) = chromosome1;
            tempPopulation(i+1,:) = chromosome2;
        end
    end
    
    %%%%%% Mutate
    
    for i = 1:populationSize
          r = rand;
          if r < mutationProbability
            originalPath = tempPopulation(i,:);
            mutatedPath = Mutate(originalPath,mutationProbability,stopNode,networkMatrix);
            tempPopulation(i,:) = mutatedPath;
          end
    end
    
    %%%%%% Elitism 
    
    population = InsertBestIndividiual(tempPopulation,bestIndividual,numberOfBestIndividualCopies);  
    timeBestPath(iGenerations) = 1/fitness(1);
    disp(iGenerations)
    disp(timeBestPath(iGenerations))
end

%%%% The best in the last iteration (befeore mutation)
bestPath = population(1,:);


plot(1:numberOfGenerations,timeBestPath)

PlotBestPath(bestPath,startNode,stopNode)



