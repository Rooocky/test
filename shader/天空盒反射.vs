#version 330 core
layout (location = 0) in vec3 position;
layout (location = 1) in vec3 normal;

out vec3 Normal;
out vec3 Position;

uniform mat4 model;
uniform mat4 view;
uniform mat4 projection;

void main()
{
    gl_Position = projection * view * model * vec4(position, 1.0f);
    //Normal = normal;
    Normal = mat3(transpose(inverse(model))) * normal;//为啥非要转化成矩阵？两种效果明明一样
    Position = vec3(model * vec4(position, 1.0f));
}