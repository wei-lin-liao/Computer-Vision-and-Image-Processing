function output = gamma_effect ( input )
         [H,W] = size(input);
         output = zeros(H,W); 
         for h = 1:H
             for w = 1:W
                 if input(h,w) <= 0.018
                    output(h,w) = input(h,w)*4.5;
                 end
                 if input(h,w) > 0.018
                    output(h,w) = 1.099*(input(h,w)^(0.45))-0.099;
                 end
             end
         end
end

