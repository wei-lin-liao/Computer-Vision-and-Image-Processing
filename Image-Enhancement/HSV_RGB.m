function RGB = HSV_RGB( HSV )

height = size(HSV,1);
width = size(HSV,2);
comp = size(HSV,3);
container = reshape(HSV, height*width, comp);
RGB = zeros(height*width,comp);
height*width;
for i = 1:height*width
    Hi = mod( floor(container(i,1)/60), 6 );
    F = container(i,1)/60 - Hi;
    P = container(i,3)*(1 - container(i,2));
    Q = container(i,3)*(1 - F*container(i,2));
    T = container(i,3)*(1 - (1-F)*container(i,2));
    switch Hi
           case 0,RGB(i,:) = [container(i,3),T,P]';
           case 1,RGB(i,:) = [Q,container(i,3),P]';
           case 2,RGB(i,:) = [P,container(i,3),T]';
           case 3,RGB(i,:) = [P,Q,container(i,3)]';
           case 4,RGB(i,:) = [T,P,container(i,3)]';
           case 5,RGB(i,:) = [container(i,3),P,Q]';
    end
end
RGB = reshape(RGB, height, width, comp);
end

