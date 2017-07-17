function HSV = RGB_to_HSV ( RGB  )
         % Initialization
         HSV = zeros(3,1);
         maximum = max(RGB);
         minimum = min(RGB);
         R = RGB(1); G = RGB(2); B = RGB(3);
         % Calculate Hue
            if maximum == minimum
               HSV(1) = 0;
            end
            if maximum == R && G >= B
               HSV(1) = 60*((G-B)/(maximum-minimum));
            end
            if maximum == R && G < B
               HSV(1) = 60*((G-B)/(maximum-minimum)) + 360;
            end
            if maximum == G
               HSV(1) = 60*((B-R)/(maximum-minimum)) + 120;
            end
            if maximum == B
               HSV(1) = 60*((R-G)/(maximum-minimum)) + 240;
            end
            
        % Calculate Saturation
            if maximum == 0
               HSV(2) = 0;
               else
               HSV(2) = 1-(minimum/maximum);
            end
             
        % Calculate Value
            HSV(3) = maximum; 
          
end

