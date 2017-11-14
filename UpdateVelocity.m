function velocity = UpdateVelocity(car, maxAcceleration, segmentLength, timeStep)
  
  position = car(1);
  velocity = car(2);
  
  if velocity < 0
    maxAcceleration = - maxAcceleration;
  end
  desiredVelocity = car(4);
  stopDistance = velocity^2 / maxAcceleration + (timeStep * velocity);
  if stopDistance >= (segmentLength - position)
    velocity = velocity - (maxAcceleration * timeStep);
  elseif abs(velocity - desiredVelocity) < 0
    velocity = velocity + (maxAcceleration * timeStep);    
  end

  if velocity < 0
    velocity = 0.0;
  end
  
end