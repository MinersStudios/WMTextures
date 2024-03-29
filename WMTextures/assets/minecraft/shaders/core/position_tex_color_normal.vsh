#version 150

#moj_import <fog.glsl>

in vec3 Position;
in vec2 UV0;
in vec4 Color;
in vec3 Normal;

uniform mat4 ModelViewMat;
uniform mat4 ProjMat;

out vec2 texCoord0;
out float vertexDistance;
out vec4 vertexColor;
out vec4 normal;

void main() {
    gl_Position = ProjMat * ModelViewMat * vec4(Position, 1);
    texCoord0 = UV0;
    vertexDistance = length((ModelViewMat * vec4(Position.x, 0, Position.z, 1)).xyz);
    vertexColor = Color;
    normal = ProjMat * ModelViewMat * vec4(Normal, 0);
}
