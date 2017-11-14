function PlotMap(cars, nodes, roadSegments)
  clf;
  
  nbrOfRoadSegments = size(roadSegments, 1);
  for segment=1:nbrOfRoadSegments
    startNode = roadSegments(segment, 1);
    xStart = nodes(startNode, 1);
    yStart = nodes(startNode, 2);
    endNode = roadSegments(segment, 2);
    xEnd = nodes(endNode, 1);
    yEnd = nodes(endNode, 2);
    plot([xStart, xEnd], [yStart, yEnd], '--b');
    hold on
    
    carsInSegment = find(cars(:,3) == segment);
    nbrOfCarsInSegment = length(carsInSegment);
    for iCar=1:nbrOfCarsInSegment
      position = cars(carsInSegment(iCar),1);
      if xStart - xEnd == 0
        plot(xStart, yStart + position, 'rs', 'MarkerFaceColor', 'r')
      else
        plot(xStart + position, yStart, 'rs', 'MarkerFaceColor', 'r')
      end
    end
  end
  
  axis([-20, 120, -20, 120])
  drawnow;
  
  


end