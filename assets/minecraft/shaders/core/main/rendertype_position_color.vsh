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
        
    vec3 pos = IViewRotMat * Position;
    vec4 color;
    mat4 projMat;
    float fogDistance;
    
    // gl_Position = vec4(0); // Disable lower part of skybox
    #moj_import <entity_shader.glsl>

}
