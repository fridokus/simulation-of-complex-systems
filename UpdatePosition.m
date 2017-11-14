function newPosition = UpdatePosition(car, segmentLength, timeStep)
  
  position = car(1);
  velocity = car(2);
  newPosition = position + (velocity * timeStep);
  if newPosition > segmentLength
    disp("Outside RoadSegment")
  end
  
end