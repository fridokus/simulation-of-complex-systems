function carsAtRoad = Collision(carsAtRoad)
     
    nbrCars = size(carsAtRoad,1);
    positions = carsAtRoad(:,1);
    velocity = carsAtRoad(:,2);
    
    [sP,I] = sort(positions,'descend');
    
    for i = 1:nbrCars-1
        pos = positions(I(i));
        targetV = velocity(I(i));
        s = i + 1;
        pos1 = positions(I(s));
        while abs(pos-pos1) < 1  
            positions(I(s)) = positions(I(s)) - 1;
            velocity(I(i+1)) = targetV; 
            if s+1 < nbrCars +1
                pos1 = positions(I(s+1));
                s = s + 1; 
            else
                pos1 = 10000;
            end
            i = s; 
        end
    end
    
    carsAtRoad(:,1) = positions;
    carsAtRoad(:,2) = velocity;
    
    