#version 100

struct Buffer
{
    mat4 MVPRowMajor;
    mat4 MVPColMajor;
    mat4 M;
};

uniform Buffer _13;

attribute vec4 Position;

mat4 SPIRV_Cross_workaround_load_row_major(mat4 wrap) { return wrap; }

void main()
{
    vec4 c0 = SPIRV_Cross_workaround_load_row_major(_13.M) * (Position * _13.MVPRowMajor);
    vec4 c1 = SPIRV_Cross_workaround_load_row_major(_13.M) * (SPIRV_Cross_workaround_load_row_major(_13.MVPColMajor) * Position);
    vec4 c2 = SPIRV_Cross_workaround_load_row_major(_13.M) * (_13.MVPRowMajor * Position);
    vec4 c3 = SPIRV_Cross_workaround_load_row_major(_13.M) * (Position * SPIRV_Cross_workaround_load_row_major(_13.MVPColMajor));
    gl_Position = ((c0 + c1) + c2) + c3;
}

