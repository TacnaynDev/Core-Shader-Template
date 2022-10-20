// Shader template by TacNayn

//  vvv (For reference only, DO NOT UNCOMMENT) vvv

//      --- UNIFORMS ---          
// uniform mat3 IViewRotMat;    Turns coordinates from view space > world space
// uniform mat4 ModelViewMat;   Turns coordinates from world space > view space
// uniform mat4 ProjMat;        Projects coordinates from view space > screen space
// uniform float GameTime;      Increases every frame. Synchronized between players. Will lag with the server

//    --- INPUT VARIABLES --- 
// vec3 pos;                    Position in world space (relative to camera)
// vec4 Color;                  Current vertex color (read-only)

//    --- OUTPUT VARIABLES ---      
// vec3 pos;                    Final position
// vec4 color;                  Final vertex color
// float fogDistance;           If this value is above renderdistance * 16, fog will be drawn over the vertex

//  ^^^ (For reference only, DO NOT UNCOMMENT) ^^^ 

// --- Initialize Outputs ---
color = Color;

/* --- Put code below here --- */





// Draw fog (Cylinder shape)
fogDistance = max(
    length((ModelViewMat * vec4(pos.x, 0.0, pos.z, 1.0)).xyz),
    length((ModelViewMat * vec4(0.0, pos.y, 0.0, 1.0)).xyz));

// Project world to screen
gl_Position = ProjMat * ModelViewMat * vec4(pos, 1.0);