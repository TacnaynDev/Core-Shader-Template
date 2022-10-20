#version 150

#moj_import <vsh_util.glsl>

in vec3 Position;
in vec4 Color;
in vec2 UV0;
in vec2 UV2;
in vec3 Normal;

uniform mat3 IViewRotMat;
uniform mat4 ModelViewMat;
uniform mat4 ProjMat;

out float vertexDistance;
out vec4 vertexColor;
out vec2 texCoord0;
out vec2 texCoord2;
out vec4 normal;

void main() {
    
    texCoord0 = UV0;
    texCoord2 = UV2;

    vec3 pos = Position;

    // Skip GUI
    if (isGUI(ProjMat)) {
        gl_Position = ProjMat * ModelViewMat * vec4(Position, 1.0);
        vertexDistance = max(
            length((ModelViewMat * vec4(pos.x, 0.0, pos.z, 1.0)).xyz),
            length((ModelViewMat * vec4(0.0, pos.y, 0.0, 1.0)).xyz));
        vertexColor = Color;
        return;
    }

    vec4 color;
    mat4 projMat;
    float fogDistance;

    #moj_import <block_shader.glsl>

    vertexDistance = fogDistance;
    vertexColor = color;
}
