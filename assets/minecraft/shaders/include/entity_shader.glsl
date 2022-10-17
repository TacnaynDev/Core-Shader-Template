/* 
 * Shader template by TacNayn
 */

// --- Outputs ---
// These MUST be populated
vec3 viewPos;
vec4 outputColor;
mat4 OutputProjMat;

// --- AVAILABLE VARIABLES ---
// in vec3 Position;            Position in VIEW space
// in vec4 Color;               Current vertex color

// uniform mat3 IViewRotMat;    Turns coordinates from view space > world space
// uniform mat4 ModelViewMat;   This is an IDENTITY MATRIX for entites. Use inverse by doing transpose(IViewRotMat) instead
// uniform mat4 ProjMat;        Turns coordinates from view space > screen space
// uniform float GameTime;


/* --- Put code below here --- */

// Set outputs
OutputProjMat = ProjMat;
viewPos = Position;
outputColor = Color;

// Project world to screen
gl_Position = OutputProjMat * ModelViewMat * vec4(viewPos, 1.0);