function output = gamma_correct ( input )
         [H,W] = size(input);
         output = zeros(H,W);
         for h = 1:H
             for w = 1:W
                 if input(h,w) < 0.081
                    output(h,w) = input(h,w) /4.5;
                 end
                 if input(h,w) >= 0.081
                    output(h,w) = ((input(h,w)+0.099)/1.099)^(1/0.45);
                 end
             end
         end
end