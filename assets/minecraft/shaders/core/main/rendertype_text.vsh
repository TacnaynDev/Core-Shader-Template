#version 150

#moj_import <vsh_util.glsl>

in vec3 Position;
in vec4 Color;
in vec2 UV0;
in ivec2 UV2;

uniform sampler2D Sampler2;

uniform mat3 IViewRotMat;
uniform mat4 ModelViewMat;
uniform mat4 ProjMat;
uniform float GameTime;

out float vertexDistance;
out vec4 vertexColor;
out vec2 texCoord0;

void main() {

    texCoord0 = UV0;
    vec3 pos = IViewRotMat * Position;

    if (isGUI(ProjMat)) {
        gl_Position = ProjMat * ModelViewMat * vec4(Position, 1.0);
        vertexColor = Color * texelFetch(Sampler2, UV2 / 16, 0);
        vertexDistance = max(
            length((ModelViewMat * vec4(pos.x, 0.0, pos.z, 1.0)).xyz),
            length((ModelViewMat * vec4(0.0, pos.y, 0.0, 1.0)).xyz));
        return;
    }

    vec4 color;
    mat4 projMat;
    float fogDistance;

    #moj_import <entity_shader.glsl>
    vertexColor = color * texelFetch(Sampler2, UV2 / 16, 0);
    vertexDistance = fogDistance;

}