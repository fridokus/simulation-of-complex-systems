function plotRoadsAndUpdateRoute(h, a1, roads, nodes, route, time, v, xmax, ymax, plotCoordinatesRandom, ...
    plotCoordinatesTarget, plotCoordinatesStandard)
    
    numberOfRoads = size(roads, 1);

    %%% UPDATING THE FIGURE  
    axes(a1); 
    cla;                          % clearing axes is important for preventing huge memmory stacks, if you plot something in a for loo       
    %hold off
    for i=1:numberOfRoads
        road = roads(i,:);
        startNode = nodes(road(1),:);
        endNode = nodes(road(2),:);
        if ismember(i, route)
            plot([startNode(1), endNode(1)], [startNode(2), endNode(2)], '-r', 'LineWidth', 2);
            hold on
        else
            plot([startNode(1), endNode(1)], [startNode(2), endNode(2)], '-.k');
            hold on
        end
    end
    %scatter(plotCoordinates(:,1), plotCoordinates(:,2), 'filled')
    %hold on
    plot(plotCoordinatesRandom(:,1), plotCoordinatesRandom(:,2), 'o', 'MarkerFaceColor',[0.5,0.5,0.5], 'MarkerEdgeColor', 'k')
    hold on 
    plot(plotCoordinatesTarget(:,1), plotCoordinatesTarget(:,2), 'o', 'MarkerFaceColor','blue', 'MarkerEdgeColor', 'k', 'MarkerSize', 8)
    hold on
    %scatter(plotCoordinatesStandard(:,1), plotCoordinatesStandard(:,2), 'filled','green')
    %hold on
    %text(0, 1500, strcat('Time: ',num2str(i*timeStep)), 'fontsize', 18);
    title(['Time: ', num2str(time)], 'fontsize', 24);
    xlim([-10 xmax+50]); 
    ylim([-10 ymax + 50]);
    set(a1,'xTick',[],'yTick',[]);
    drawnow
    H=getframe(h);
    writeVideo(v,H);


end