%% Test

networkMatrix = [0 15 10 20 0;
                 15  0 5  0  7;
                 10  5 0  5  8;
                 20  0 5  0  9;
                 0   7 8  9  0];
                
n =networkMatrix(2,:)

visited = [1 2];

s = find(n ~= 0 )
d = find(n ~= visited(:))


r = randi(length(s),1,1)

s(r)

networkMatrix(4,2)

%%

populationSize = 3;
startNode = 1;
stopNode = 5;

population = InitializePopulation(populationSize,startNode,stopNode)

path = population(1,:);
fitness = EvaluatePathTime(path);

ch1 = population(1,:)
ch2 = population(2,:)
i = 2;
crossIndex = [0,0];

while (crossIndex(1) == 0 && ch1(i) ~= 5)
    j = 2;
    while (ch1(i) ~= ch2(j) && ch2(j) ~= 5)
        j = j + 1;
    end
    if (ch1(i) == ch2(j))
        crossIndex(1) = i;
        crossIndex(2) = j;
    end
    i = i + 1;
end

crossIndex

    tempCh1 = [];
    tempCh2 = [];
    
    if (crossIndex(1) > 0)
        tempCh1(1:crossIndex(1)) = ch1(1:crossIndex(1));
        part2Ch1 = ch2(crossIndex(2)+1:find(ch2 == 5));
        tempCh1(crossIndex(1)+1:crossIndex(1)+length(part2Ch1)) = part2Ch1;
        
        tempCh2(1:crossIndex(2)) = ch2(1:crossIndex(2));
        part2Ch2 = ch1(crossIndex(1)+1:find(ch1 == 5));
        tempCh2(crossIndex(2)+1:crossIndex(2)+length(part2Ch2)) = part2Ch2;
    end

tempCh1
tempCh2

%%
clc


tempCh1 = EliminateLoop(tempCh1)

tempCh2 = [1 3 4 2 4 3 5]
tempCh2 = EliminateLoop(tempCh2)



%%
clear all
clc

networkMatrix = loadNetworkMatrix;
averageV = GetAvregeVelocityOnRoads;

startNode = 1;
stopNode = 38;

path = dijkstrasGetPath(startNode,stopNode,networkMatrix,averageV)

PlotBestPath(path,startNode,stopNode)











