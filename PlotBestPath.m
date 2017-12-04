function PlotBestPath(bestPath,startNode,stopNode, networkMatrix, nodes)

    bestPathPlot = bestPath(1:find(bestPath == stopNode));
    
    figure 
    gplot(networkMatrix,nodes)
    hold on 
    plot(nodes(bestPathPlot,1),nodes(bestPathPlot,2),'red')
    
end
    