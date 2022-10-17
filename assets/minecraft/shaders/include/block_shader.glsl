/* 
 * Shader template by TacNayn
 */

// --- Outputs ---
// These MUST be populated
vec3 viewPos;
vec4 outputColor;
mat4 OutputProjMat;

// --- AVAILABLE VARIABLES ---
// in vec3 pos;                 Position in WORLD space
// in vec4 Color;               Current vertex color

// uniform mat3 IViewRotMat;    Turns coordinates from view space > world space
// uniform mat4 ModelViewMat;   Turns coordinates from world space > view space
// uniform mat4 ProjMat;        Turns coordinates from view space > screen space
// uniform float GameTime;


/* --- Put code below here --- */

// Set outputs
OutputProjMat = ProjMat;
viewPos = pos;
outputColor = Color;

// Project world to screen
gl_Position = OutputProjMat * ModelViewMat * vec4(viewPos, 1.0);