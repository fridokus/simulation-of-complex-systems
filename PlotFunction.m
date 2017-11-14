function PlotFunction(cars,ROAD_END)

    nbrCars = size(cars,1);
    
    hold off
    for c = 1:nbrCars
        p = cars(c,1);
        r = cars(c,3);
        plot(0.5,p,'.b','MarkerSize',30);
        hold on 
    end
    plot([0.4,0.4],[0,ROAD_END],'-b')
    hold on 
    plot([0.6,0.6],[0,ROAD_END],'-b')
    axis([0,1,0,ROAD_END])
    drawnow 
    
end

    