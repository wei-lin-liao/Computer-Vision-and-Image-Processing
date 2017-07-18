function output = img_gamma_correct ( input )
         [H,W,L] = size(input);
         output = zeros(H,W,L);
         for h = 1:H
             for w = 1:W
                 for l = 1:L
                     if input(h,w,l) < 0.081
                        output(h,w,l) = input(h,w,l) /4.5;
                     end
                     if input(h,w) >= 0.081
                        output(h,w,l) = ((input(h,w,l)+0.099)/1.099)^(1/0.45);
                     end
                 end
             end
         end
         output = output*255;
         output = uint8(output);
end