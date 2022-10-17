#version 150

#moj_import <vsh_util.glsl>
#moj_import <fog.glsl>

in vec3 Position;
in vec4 Color;
in vec2 UV0;
in ivec2 UV2;

uniform sampler2D Sampler2;

uniform mat3 IViewRotMat;
uniform mat4 ModelViewMat;
uniform int FogShape;
uniform mat4 ProjMat;

out float vertexDistance;
out vec4 vertexColor;
out vec2 texCoord0;

void main() {

    // Prevent text from rendering
    if (isGUI(ProjMat)) {
        gl_Position = ProjMat * ModelViewMat * vec4(Position, 1.0);
        vertexColor = Color * texelFetch(Sampler2, UV2 / 16, 0);
        vertexDistance = fog_distance(ModelViewMat, IViewRotMat * Position, FogShape);
    } else {
        #moj_import <entity_shader.glsl>
        vertexColor = outputColor * texelFetch(Sampler2, UV2 / 16, 0);
        vertexDistance = fog_distance(ModelViewMat, viewPos, FogShape);
    }

    texCoord0 = UV0;
}