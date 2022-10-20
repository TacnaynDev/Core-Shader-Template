#version 150

#moj_import <light.glsl>
#moj_import <vsh_util.glsl>

in vec3 Position;
in vec4 Color;
in vec2 UV0;
in ivec2 UV1;
in ivec2 UV2;
in vec3 Normal;

uniform sampler2D Sampler1;
uniform sampler2D Sampler2;

uniform mat4 ModelViewMat;
uniform mat4 ProjMat;
uniform mat3 IViewRotMat;
uniform float GameTime;

uniform vec3 Light0_Direction;
uniform vec3 Light1_Direction;

out float vertexDistance;
out vec4 vertexColor;
out vec4 lightMapColor;
out vec4 overlayColor;
out vec2 texCoord0;
out vec4 normal;

void main() {

    // Populate outputs
    lightMapColor = texelFetch(Sampler2, UV2 / 16, 0);
    texCoord0 = UV0;
    overlayColor = texelFetch(Sampler1, UV1, 0);

    vec3 pos = IViewRotMat * Position;

    if(isGUI(ProjMat)){
        
        gl_Position = ProjMat * ModelViewMat * vec4(Position, 1.0);
        vertexDistance = max(
            length((ModelViewMat * vec4(pos.x, 0.0, pos.z, 1.0)).xyz),
            length((ModelViewMat * vec4(0.0, pos.y, 0.0, 1.0)).xyz));
        vertexColor = minecraft_mix_light(Light0_Direction, Light1_Direction, Normal, Color);
        return;
    }

    vec4 color;
    mat4 projMat;
    float fogDistance;

    if(ModelViewMat == mat4(1)) // Check for block items vs entity items
    {
        #moj_import <entity_shader.glsl>
        
    } else {
        
        #moj_import <block_shader.glsl>
    }

    // Populate outputs
    vertexDistance = fogDistance;
    vertexColor = minecraft_mix_light(Light0_Direction, Light1_Direction, Normal, color);
}