#version 150

#moj_import <vsh_util.glsl>

in vec3 Position;
in vec4 Color;
in vec2 UV0;

uniform mat3 IViewRotMat;
uniform mat4 ModelViewMat;
uniform mat4 ProjMat;
uniform float GameTime;

out float vertexDistance;
out vec4 vertexColor;
out vec2 texCoord0;
out vec2 texCoord1;
out vec2 texCoord2;
out vec4 normal;

void main() {

    vec3 pos = IViewRotMat * Position; // Translate Position to world-space
    pos.y += 0.0001;
    vec4 color;
    mat4 projMat;
    float fogDistance;

    #moj_import <entity_shader.glsl>

    // Populate outputs
    vertexDistance = fogDistance;
    vertexColor = color;
    texCoord0 = UV0;
}
