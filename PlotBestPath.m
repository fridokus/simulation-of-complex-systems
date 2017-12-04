function PlotBestPath(bestPath,startNode,stopNode)

    bestPathPlot = bestPath(1:find(bestPath == stopNode));
    networkMatrix = loadNetworkMatrix;
    nodes = xlsread('nodes.xlsx');
    
    figure 
    gplot(networkMatrix,nodes)
    hold on 
    plot(nodes(bestPathPlot,1),nodes(bestPathPlot,2),'red')
    
end
    