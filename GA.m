%% GA
clear all
clc
clf

in = load('nodes.mat');
cell1 = struct2cell(in);
nodes = cell2mat(cell1{1});

in2 = load('RoadsWithOneWay2.mat');
cell2 = struct2cell(in2);
cell2 = cell2{1};
roads = cell2mat(cell2{1});

populationSize = 20;
networkMatrix = loadNetworkMatrix(nodes, roads);
nbrNodes = size(networkMatrix,1);
disp('Data downloaded')
% cityLocatons = LoadCityLocations; %%% Fix this

mutationProbability = 0.2;
tournamentSelectionParameter = 0.8;
crossoverProbability = 0.2;
fitness = zeros(populationSize,1);
numberOfBestIndividualCopies = 1;

numberOfGenerations = 10;
population = InitializePopulation(populationSize, networkMatrix);
timeBestPath = zeros(1,numberOfGenerations);
disp('Population created')
originalPopulation = population;

for iGenerations = 1:numberOfGenerations 
    maximumFitness = 0.0;
    bestIndividualIndex = 0;
    for i = 1:populationSize
        path = population(i,:);
        fitness(i) = EvaluatePathTime(path, roads, nodes, networkMatrix);
        if (fitness(i) > maximumFitness)
            maximumFitness = fitness(i);
            bestIndividualIndex = i;
        end
    end
    disp('All fitness values calculated')
    bestIndividual = population(bestIndividualIndex,:);    

    tempPopulation = population;
    for i = 1:2:populationSize
        i1 = TournamentSelect(fitness,tournamentSelectionParameter);
        i2 = TournamentSelect(fitness,tournamentSelectionParameter);
        chromosome1 = population(i1,:);
        chromosome2 = population(i2,:);
    
        r = rand;
        if (r < crossoverProbability)
            newChromosomePair = Cross(chromosome1,chromosome2);
            tempPopulation(i,:) = newChromosomePair(1,:);
            tempPopulation(i+1,:) = newChromosomePair(2,:);
        else
            tempPopulation(i,:) = chromosome1;
            tempPopulation(i+1,:) = chromosome2;
        end
    end
    
    disp('all tournaments finished')
    
%     for i = 1:populationSize
%           r = rand;
%           if r < mutationProbability
%             originalPath = tempPopulation(i,:);
%             mutatedPath = Mutate(originalPath,mutationProbability,networkMatrix);
%             tempPopulation(i,:) = mutatedPath;
%           end
%     end
    
    %%%%%% Elitism 
    
    population = InsertBestIndividiual(tempPopulation,bestIndividual,numberOfBestIndividualCopies);  
    timeBestPath(iGenerations) = 1/fitness(1);
    disp(iGenerations)
    disp(timeBestPath(iGenerations))
end

%%%% The best in the last iteration (befeore mutation)
bestPath = population(1,:);


plot(1:numberOfGenerations,timeBestPath)

PlotBestPath(bestPath,networkMatrix,nodes)



