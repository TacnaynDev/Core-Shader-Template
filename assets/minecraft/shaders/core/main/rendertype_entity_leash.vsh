#version 150

#moj_import <vsh_util.glsl>
#moj_import <fog.glsl>

in vec3 Position;
in vec4 Color;
in ivec2 UV2;

uniform sampler2D Sampler2;

uniform mat3 IViewRotMat;
uniform mat4 ModelViewMat;
uniform mat4 ProjMat;
uniform vec4 ColorModulator;
uniform int FogShape;
uniform float GameTime;

out float vertexDistance;
flat out vec4 vertexColor;

void main() {

    #moj_import <entity_shader.glsl>

    vertexDistance = fog_distance(ModelViewMat, viewPos, FogShape);
    vertexColor = Color * ColorModulator * texelFetch(Sampler2, UV2 / 16, 0);
}
