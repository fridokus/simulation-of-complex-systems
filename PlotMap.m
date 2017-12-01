%{        
%               TODO
%
% Plotta vägar som de är, till en hel stad
% Se till att endast plotta vänster fil
% Se till att enbart plotta höger fil
% Testa mer flera filer
%
%}

%function PlotMap(cars, nodes, roads)
    clear all;
    clc;
    clf;
    %{
    % Cars components
    % 1. position
    % 2. velocity
    % 3. roadSegment
    % 4. desiredVelocity
    %}
    cars = [0,10,1,20; 0, 20, 2, 20];
    %        1       2      3        4      5
    nodes = [50,50; 50,100; 100,100; 100,50;0,50;50,0];
    %roads = [1,2; 2,3; 3,4; 4,1];
    roads = [1,2;2,3;3,4;4,1;1,5;5,1;6,1];
    
    nRoads = size(roads,1);
    nCars = size(cars,1);
    
    for iRoad = 1:nRoads
        startNode = roads(iRoad,1);
        endNode = roads(iRoad,2);
        xStart = nodes(startNode,1);
        yStart = nodes(startNode,2);
        xEnd = nodes(endNode,1);
        yEnd = nodes(endNode,2);
        hold on
        %{
        switch neighbours(iRoad)
            case 1

                plot([xStart+1, xEnd+1], [yStart+1, yEnd-1])
                plot([xStart-1, xEnd-1], [yStart-1, yEnd+1])
            case 2
                plot([xStart-1, xEnd+1], [yStart+1, yEnd+1])
                plot([xStart+1, xEnd-1], [yStart-1, yEnd-1])
            case 3
                plot([xStart-1, xEnd-1], [yStart-1, yEnd+1])
                plot([xStart+1, xEnd+1], [yStart+1, yEnd-1])
            case 4
                plot([xStart-1, xEnd+1], [yStart+1, yEnd+1])
                plot([xStart+1, xEnd-1], [yStart-1, yEnd-1])
        end
        %}
        if xStart < xEnd
            plot([xStart-1, xEnd+1], [yStart+1, yEnd+1])
            plot([xStart+1, xEnd-1], [yStart-1, yEnd-1])
        elseif yStart < yEnd
            plot([xStart-1, xEnd-1], [yStart-1, yEnd+1])
            plot([xStart+1, xEnd+1], [yStart+1, yEnd-1])
        elseif yStart > yEnd
            plot([xStart+1, xEnd+1], [yStart+1, yEnd-1])
            plot([xStart-1, xEnd-1], [yStart-1, yEnd+1])
        elseif xStart > xEnd
            plot([xStart+1, xEnd-1], [yStart-1, yEnd-1])
            plot([xStart-1, xEnd+1], [yStart+1, yEnd+1])
        end
        %}
        %hold on
        %plot(roads(iRoad)
        hold on
        plot([xStart, xEnd], [yStart, yEnd])
        
        %plotCoordinates = parameterCoordinates(cars, nodes, roads);
        %scatter(plotCoordinates(:,1), plotCoordinates(:,2))
        axis([-20 120 -20 120])
    end