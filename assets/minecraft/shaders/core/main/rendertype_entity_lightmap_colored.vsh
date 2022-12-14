#version 150

#moj_import <light.glsl>
#moj_import <vsh_util.glsl>

in vec3 Position;
in vec4 Color;
in vec2 UV0;
in vec2 UV1;
in ivec2 UV2;
in vec3 Normal;

uniform sampler2D Sampler1;
uniform sampler2D Sampler2;

uniform mat3 IViewRotMat;
uniform mat4 ModelViewMat;
uniform mat4 ProjMat;

uniform vec3 Light0_Direction;
uniform vec3 Light1_Direction;
uniform float GameTime;

out float vertexDistance;
out vec4 vertexColor;
out vec4 overlayColor;
out vec2 texCoord0;
out vec2 texCoord1;
out vec2 texCoord2;
out vec4 normal;

void main() {

    texCoord0 = UV0;
    texCoord1 = UV1;
    texCoord2 = UV2;
    overlayColor = texelFetch(Sampler1, ivec2(UV1), 0);

    vec3 pos = IViewRotMat * Position;

    if(isGUI(ProjMat)){
        
        gl_Position = ProjMat * ModelViewMat * vec4(Position, 1.0);
        vertexDistance = max(
            length((ModelViewMat * vec4(pos.x, 0.0, pos.z, 1.0)).xyz),
            length((ModelViewMat * vec4(0.0, pos.y, 0.0, 1.0)).xyz));;
        vertexColor = minecraft_mix_light(Light0_Direction, Light1_Direction, Normal, Color) * texelFetch(Sampler2, UV2 / 16, 0);
        return;
    }

    vec4 color;
    mat4 projMat;
    float fogDistance;

    #moj_import <entity_shader.glsl>

    // Populate outputs
    vertexDistance = fogDistance;
    vertexColor = minecraft_mix_light(Light0_Direction, Light1_Direction, Normal, color) * texelFetch(Sampler2, UV2 / 16, 0);
}
