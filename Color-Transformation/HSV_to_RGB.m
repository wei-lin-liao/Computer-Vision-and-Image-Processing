function RGB = HSV_to_RGB ( HSV )
         % ªì©l¤Æ
         RGB = zeros(3,1);
         Hi = fix(HSV(1)/60) ;
         F = ( HSV(1)/60 ) - Hi;
         P = HSV(3) * ( 1-HSV(2) );
         Q = HSV(3) * ( 1-F*HSV(2) );
         T = HSV(3) * (1 - (1-F)*HSV(2) );
         switch Hi
             case 0, RGB = [HSV(3);T;P];
             case 1, RGB = [Q;HSV(3);P];
             case 2, RGB = [P;HSV(3);T];
             case 3, RGB = [P;Q;HSV(3)];
             case 4, RGB = [T;P;HSV(3)];
             case 5, RGB = [HSV(3);P;Q];
         end
end

