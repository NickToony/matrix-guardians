depth = y + 1;

image_index = 0;
if (metals <= 0) instance_destroy();
if (metals >= 100) image_index = 1;
if (metals >= 150) image_index = 2;
if (metals >= 250) image_index = 3;