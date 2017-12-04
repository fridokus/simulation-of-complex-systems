function newChromosomePair = Cross(chromosome1,chromosome2)
    chromosome1
    chromosome2
    iStopNode1 = find(chromosome1 == 0);
    lengthChromosome1 = iStopNode1(1) - 1
    iStopNode2 = find(chromosome2 == 0);
    lengthChromosome2 = iStopNode2(1) - 1
    
    newChromosomePair = zeros(2,length(chromosome1));
    
    [~, index1, index2] = intersect(chromosome1(2:lengthChromosome1-1), chromosome2(2:lengthChromosome2-1));
    if length(index1) > 2
        disp('changing')
       crossPoint1 = [min(index1), max(index1)]
       crossPoint2 = [min(index2), max(index2)]
       
       if crossPoint1(1) + crossPoint1(2) < lengthChromosome1 && crossPoint2(1) + crossPoint2(2) < lengthChromosome2

           if crossPoint1(1) > 1
               newChromosomePair(1,1:crossPoint1(1)) = chromosome1(1:crossPoint1(1));
           end
           lengthOfPart1 = crossPoint2(2) - crossPoint2(1);
           newChromosomePair(1,crossPoint1(1):crossPoint1(1)+lengthOfPart1) = chromosome2(crossPoint2(1):crossPoint2(2));;
           if crossPoint1(2) < lengthChromosome1
               length1 = lengthChromosome1 - crossPoint1(2);
               newChromosomePair(1,crossPoint1(2):crossPoint1(2) + length1) = chromosome1(crossPoint1(2):lengthChromosome1);
           end

           if crossPoint2(1) > 1
               newChromosomePair(2,1:crossPoint2(1)) = chromosome2(1:crossPoint2(1));
           end
           lengthOfPart2 = crossPoint1(2) - crossPoint1(1);
           newChromosomePair(2,crossPoint2(1):crossPoint1(1) + lengthOfPart2) = chromosome1(crossPoint1(1):crossPoint1(2));
           if crossPoint2(2) < lengthChromosome2
               length2 = lengthChromosome2 - crossPoint2(2);
               newChromosomePair(2,crossPoint2(2):crossPoint2(2) + length2) = chromosome2(crossPoint2(2):lengthChromosome2);
           end
       end
    else
        newChromosomePair(1,:) = chromosome1;
        newChromosomePair(2,:) = chromosome2;
    end
    
    newChromosomePair
    
    
%     i = 2;
%     crossIndex = [0,0];
%     while (crossIndex(1) == 0 && chromosome1(i) ~= nbrOfNodes)
%         j = 2;
%         while (chromosome1(i) ~= chromosome2(j) && chromosome2(j) ~= nbrOfNodes)
%             j=j+1;
%         end
%         if (chromosome1(i) == chromosome2(j))
%             crossIndex(1) = i;
%             crossIndex(2) = j;
%         end
%         i=i+1;
%     end
%     
%     tempCh1 = [];
%     tempCh2 = [];
% 
%     if (crossIndex(1) > 0)
%         tempCh1(1:crossIndex(1)) = chromosome1(1:crossIndex(1));
%         part2Ch1 = chromosome2(crossIndex(2)+1:find(chromosome2 == stopNode2));
%         tempCh1(crossIndex(1)+1:crossIndex(1)+length(part2Ch1)) = part2Ch1;
%         
%         tempCh2(1:crossIndex(2)) = chromosome2(1:crossIndex(2));
%         part2Ch2 = chromosome1(crossIndex(1)+1:find(chromosome1 == stopNode1));
%         tempCh2(crossIndex(2)+1:crossIndex(2)+length(part2Ch2)) = part2Ch2;
%         
%         tempCh1 = EliminateLoop(tempCh1);
%         tempCh2 = EliminateLoop(tempCh2);
%         
%         newChromosomePair(1,1:length(tempCh1)) = tempCh1;
%         newChromosomePair(2,1:length(tempCh2)) = tempCh2;
%         
%     else
%         
%         newChromosomePair(1,:) = chromosome1;
%         newChromosomePair(2,:) = chromosome2;
%         
%     end
        
end
