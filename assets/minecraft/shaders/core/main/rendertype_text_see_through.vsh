#version 150

#moj_import <vsh_util.glsl>

in vec3 Position;
in vec4 Color;
in vec2 UV0;
in vec2 UV2;

uniform mat3 IViewRotMat;
uniform mat4 ModelViewMat;
uniform mat4 ProjMat;
uniform float GameTime;

out vec4 vertexColor;
out vec2 texCoord0;
out vec2 texCoord2;

void main() {

    texCoord0 = UV0;
    texCoord2 = UV2;

    if (isGUI(ProjMat)) {
        gl_Position = ProjMat * ModelViewMat * vec4(Position, 1.0);
        vertexColor = Color;
        return;
    }

    vec3 pos = IViewRotMat * Position;
    vec4 color;
    mat4 projMat;
    float fogDistance;

    #moj_import <entity_shader.glsl>
    vertexColor = color;

}
