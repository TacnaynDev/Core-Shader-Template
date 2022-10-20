// Bottom half of sky and various GUI elements

#version 150

#moj_import <vsh_util.glsl>

in vec3 Position;
in vec4 Color;

uniform mat4 ModelViewMat;
uniform mat3 IViewRotMat;
uniform mat4 ProjMat;
uniform float GameTime;

out vec4 vertexColor;

void main() {

    vertexColor = Color;

    // Skip GUI
    if (isGUI(ProjMat)) {
        gl_Position = ProjMat * ModelViewMat * vec4(Position, 1.0);
        return;
    }
        
    vec3 pos;
    vec4 color;
    mat4 projMat;
    float fogDistance;
    
    if(ModelViewMat == mat4(1)) 
    {
        pos = IViewRotMat * Position; // Translate Position to world-space

        #moj_import <entity_shader.glsl>
    } else {
                
        pos = Position; // Add chunk offset

        #moj_import <block_shader.glsl>
    }
}
