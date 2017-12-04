function carsAtIntersection = intersection(cars, roadLengths)
  global positionIndex;
  global roadIndex;
  carsAtIntersection = cars(:,1) >= roadLengths(cars(:,2));
end
