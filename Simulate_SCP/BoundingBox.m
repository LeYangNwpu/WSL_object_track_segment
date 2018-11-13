function bbox = BoundingBox(mask)

[x, y] = find(mask == 255);
y_min = min(y);
x_min = min(x);
width = max(y) - y_min + 1;
height = max(x) - x_min + 1;
bbox = [y_min, x_min, width, height];

end

