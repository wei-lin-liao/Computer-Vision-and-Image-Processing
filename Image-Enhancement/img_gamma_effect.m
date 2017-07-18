function output = img_gamma_effect ( input )
         [H,W,L] = size(input);
         input = double(input);
         input = input/255;
         output = zeros(H,W,L); 
         for h = 1:H
             for w = 1:W
                 for l = 1:L
                     if input(h,w,l) <= 0.018
                        output(h,w,l) = input(h,w,l)*4.5;
                     end
                     if input(h,w,l) > 0.018
                        output(h,w,l) = 1.099*(input(h,w,l)^(0.45))-0.099;
                     end
                 end
             end
         end
end

