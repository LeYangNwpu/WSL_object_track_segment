function img = draw_box(img, box)
[height, width, ~] = size(img);
y_min = box(1);
if y_min < 1
    y_min = 1;
end
x_min = box(2);
if x_min < 1
    x_min = 1;
end
wid = box(3);
hei = box(4);
y_max = y_min + wid;
if y_max > width
   y_max = width;
end
x_max = x_min + hei;
if x_max > height
   x_max = height;
end

img(x_min:x_max, y_min, :) = 0;
img(x_min:x_max, y_max, :) = 0;
img(x_min, y_min:y_max, :) = 0;
img(x_max, y_min:y_max, :) = 0;
% detection box is in green
img(x_min:x_max, y_min, 2) = 255;
img(x_min:x_max, y_max, 2) = 255;
img(x_min, y_min:y_max, 2) = 255;
img(x_max, y_min:y_max, 2) = 255;

end

