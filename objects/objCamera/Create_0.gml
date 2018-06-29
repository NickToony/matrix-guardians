// Create blank camera
camera = camera_create();

view_visible[0] = true;
view_wport[0] = 1280;
view_hport[0] = 800;
// Matrixes
var vm = matrix_build_lookat(x, y, -10, x, y, 0, 0, 1, 0);
var pm = matrix_build_projection_ortho(view_wport[0], view_hport[0], 1, 1000);

// Apply
camera_set_view_mat(camera, vm);
camera_set_proj_mat(camera, pm);

// give viewport
view_camera[0] = camera;

// Variables
follow = noone;
xTo = x;
yTo = y;
x1 = x;
y1 = y;
x2 = x;
y2 = y;
w = 0;
h = 0;
bx = 0;
by = 0;
ba = 4;
zoom = 1;
zoomTo = 2;
zoomSpeed = 0.05;
minZoom = 0.7;
maxZoom = 3;
cameraSpeed = 10;
mouseTileX = 0;
mouseTileY = 0;

// Scaling
base_size = browser_width;
width = browser_width;
height = browser_height;
fullscreen = false;
fullscreenLast = fullscreen;
canvas_fullscreen(base_size, width, height);

TutorialInit()
messages = ds_queue_create();
message = noone;
messageWidth = 500;
messageActive = false;
ShowMessage("WELCOME HUMAN! IT IS TIME TO ASSIMILATE THIS REALM AND ANY ORGANIC LIFE FORMS.");
ShowMessage("WE'VE PROVIDED SOME ROOMBA XZ5000'S - THESE NEW MODELS CAN DO WAY MORE THAN JUST VACUUM!");
ShowMessage("TRY ORDERING THEM TO DIG OUT SOME TUNNELS, AND BEGIN EXTRACTING METALS.");

tip = noone;
tipAlpha = 1;

alarm[0] = room_speed * 10;