# Generated Code Do Not Modify

# Java interface
package javax::microedition::khronos::opengles::GL11;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'javax::microedition::khronos::opengles::GL10';

our $GL_ACTIVE_TEXTURE = 34016;
our $GL_ADD_SIGNED = 34164;
our $GL_ALPHA_SCALE = 3356;
our $GL_ALPHA_TEST_FUNC = 3009;
our $GL_ALPHA_TEST_REF = 3010;
our $GL_ARRAY_BUFFER = 34962;
our $GL_ARRAY_BUFFER_BINDING = 34964;
our $GL_BLEND_DST = 3040;
our $GL_BLEND_SRC = 3041;
our $GL_BUFFER_ACCESS = 35003;
our $GL_BUFFER_SIZE = 34660;
our $GL_BUFFER_USAGE = 34661;
our $GL_CLIENT_ACTIVE_TEXTURE = 34017;
our $GL_CLIP_PLANE0 = 12288;
our $GL_CLIP_PLANE1 = 12289;
our $GL_CLIP_PLANE2 = 12290;
our $GL_CLIP_PLANE3 = 12291;
our $GL_CLIP_PLANE4 = 12292;
our $GL_CLIP_PLANE5 = 12293;
our $GL_COLOR_ARRAY_BUFFER_BINDING = 34968;
our $GL_COLOR_ARRAY_POINTER = 32912;
our $GL_COLOR_ARRAY_SIZE = 32897;
our $GL_COLOR_ARRAY_STRIDE = 32899;
our $GL_COLOR_ARRAY_TYPE = 32898;
our $GL_COLOR_CLEAR_VALUE = 3106;
our $GL_COLOR_WRITEMASK = 3107;
our $GL_COMBINE = 34160;
our $GL_COMBINE_ALPHA = 34162;
our $GL_COMBINE_RGB = 34161;
our $GL_CONSTANT = 34166;
our $GL_COORD_REPLACE_OES = 34914;
our $GL_CULL_FACE_MODE = 2885;
our $GL_CURRENT_COLOR = 2816;
our $GL_CURRENT_NORMAL = 2818;
our $GL_CURRENT_TEXTURE_COORDS = 2819;
our $GL_DEPTH_CLEAR_VALUE = 2931;
our $GL_DEPTH_FUNC = 2932;
our $GL_DEPTH_RANGE = 2928;
our $GL_DEPTH_WRITEMASK = 2930;
our $GL_DOT3_RGB = 34478;
our $GL_DOT3_RGBA = 34479;
our $GL_DYNAMIC_DRAW = 35048;
our $GL_ELEMENT_ARRAY_BUFFER = 34963;
our $GL_ELEMENT_ARRAY_BUFFER_BINDING = 34965;
our $GL_FRONT_FACE = 2886;
our $GL_GENERATE_MIPMAP = 33169;
our $GL_GENERATE_MIPMAP_HINT = 33170;
our $GL_INTERPOLATE = 34165;
our $GL_LINE_WIDTH = 2849;
our $GL_LOGIC_OP_MODE = 3056;
our $GL_MATRIX_MODE = 2976;
our $GL_MAX_CLIP_PLANES = 3378;
our $GL_MODELVIEW_MATRIX = 2982;
our $GL_MODELVIEW_MATRIX_FLOAT_AS_INT_BITS_OES = 35213;
our $GL_MODELVIEW_STACK_DEPTH = 2979;
our $GL_NORMAL_ARRAY_BUFFER_BINDING = 34967;
our $GL_NORMAL_ARRAY_POINTER = 32911;
our $GL_NORMAL_ARRAY_STRIDE = 32895;
our $GL_NORMAL_ARRAY_TYPE = 32894;
our $GL_OPERAND0_ALPHA = 34200;
our $GL_OPERAND0_RGB = 34192;
our $GL_OPERAND1_ALPHA = 34201;
our $GL_OPERAND1_RGB = 34193;
our $GL_OPERAND2_ALPHA = 34202;
our $GL_OPERAND2_RGB = 34194;
our $GL_POINT_DISTANCE_ATTENUATION = 33065;
our $GL_POINT_FADE_THRESHOLD_SIZE = 33064;
our $GL_POINT_SIZE = 2833;
our $GL_POINT_SIZE_ARRAY_BUFFER_BINDING_OES = 35743;
our $GL_POINT_SIZE_ARRAY_OES = 35740;
our $GL_POINT_SIZE_ARRAY_POINTER_OES = 35212;
our $GL_POINT_SIZE_ARRAY_STRIDE_OES = 35211;
our $GL_POINT_SIZE_ARRAY_TYPE_OES = 35210;
our $GL_POINT_SIZE_MAX = 33063;
our $GL_POINT_SIZE_MIN = 33062;
our $GL_POINT_SPRITE_OES = 34913;
our $GL_POLYGON_OFFSET_FACTOR = 32824;
our $GL_POLYGON_OFFSET_UNITS = 10752;
our $GL_PREVIOUS = 34168;
our $GL_PRIMARY_COLOR = 34167;
our $GL_PROJECTION_MATRIX = 2983;
our $GL_PROJECTION_MATRIX_FLOAT_AS_INT_BITS_OES = 35214;
our $GL_PROJECTION_STACK_DEPTH = 2980;
our $GL_RGB_SCALE = 34163;
our $GL_SAMPLE_BUFFERS = 32936;
our $GL_SAMPLE_COVERAGE_INVERT = 32939;
our $GL_SAMPLE_COVERAGE_VALUE = 32938;
our $GL_SAMPLES = 32937;
our $GL_SCISSOR_BOX = 3088;
our $GL_SHADE_MODEL = 2900;
our $GL_SRC0_ALPHA = 34184;
our $GL_SRC0_RGB = 34176;
our $GL_SRC1_ALPHA = 34185;
our $GL_SRC1_RGB = 34177;
our $GL_SRC2_ALPHA = 34186;
our $GL_SRC2_RGB = 34178;
our $GL_STATIC_DRAW = 35044;
our $GL_STENCIL_CLEAR_VALUE = 2961;
our $GL_STENCIL_FAIL = 2964;
our $GL_STENCIL_FUNC = 2962;
our $GL_STENCIL_PASS_DEPTH_FAIL = 2965;
our $GL_STENCIL_PASS_DEPTH_PASS = 2966;
our $GL_STENCIL_REF = 2967;
our $GL_STENCIL_VALUE_MASK = 2963;
our $GL_STENCIL_WRITEMASK = 2968;
our $GL_SUBTRACT = 34023;
our $GL_TEXTURE_BINDING_2D = 32873;
our $GL_TEXTURE_COORD_ARRAY_BUFFER_BINDING = 34970;
our $GL_TEXTURE_COORD_ARRAY_POINTER = 32914;
our $GL_TEXTURE_COORD_ARRAY_SIZE = 32904;
our $GL_TEXTURE_COORD_ARRAY_STRIDE = 32906;
our $GL_TEXTURE_COORD_ARRAY_TYPE = 32905;
our $GL_TEXTURE_MATRIX = 2984;
our $GL_TEXTURE_MATRIX_FLOAT_AS_INT_BITS_OES = 35215;
our $GL_TEXTURE_STACK_DEPTH = 2981;
our $GL_VERTEX_ARRAY_BUFFER_BINDING = 34966;
our $GL_VERTEX_ARRAY_POINTER = 32910;
our $GL_VERTEX_ARRAY_SIZE = 32890;
our $GL_VERTEX_ARRAY_STRIDE = 32892;
our $GL_VERTEX_ARRAY_TYPE = 32891;
our $GL_VIEWPORT = 2978;
our $GL_WRITE_ONLY = 35001;


sub glBindBuffer {
    my ($self, $target, $buffer) = @_;
    die "abstract method glBindBuffer";
}


sub glBufferData {
    my ($self, $target, $size, $data, $usage) = @_;
    die "abstract method glBufferData";
}


sub glBufferSubData {
    my ($self, $target, $offset, $size, $data) = @_;
    die "abstract method glBufferSubData";
}


sub glClipPlanef {
    my ($self, $plane, $equation, $offset) = @_;
    die "abstract method glClipPlanef";
}


# Java overloaded method: Perl keeps the last definition
sub glClipPlanef {
    my ($self, $plane, $equation) = @_;
    die "abstract method glClipPlanef";
}


sub glColor4ub {
    my ($self, $red, $green, $blue, $alpha) = @_;
    die "abstract method glColor4ub";
}


sub glColorPointer {
    my ($self, $size, $type, $stride, $offset) = @_;
    die "abstract method glColorPointer";
}


sub glDeleteBuffers {
    my ($self, $n, $buffers, $offset) = @_;
    die "abstract method glDeleteBuffers";
}


# Java overloaded method: Perl keeps the last definition
sub glDeleteBuffers {
    my ($self, $n, $buffers) = @_;
    die "abstract method glDeleteBuffers";
}


sub glDrawElements {
    my ($self, $mode, $count, $type, $offset) = @_;
    die "abstract method glDrawElements";
}


sub glGenBuffers {
    my ($self, $n, $buffers, $offset) = @_;
    die "abstract method glGenBuffers";
}


# Java overloaded method: Perl keeps the last definition
sub glGenBuffers {
    my ($self, $n, $buffers) = @_;
    die "abstract method glGenBuffers";
}


sub glGetBufferParameteriv {
    my ($self, $target, $pname, $params, $offset) = @_;
    die "abstract method glGetBufferParameteriv";
}


# Java overloaded method: Perl keeps the last definition
sub glGetBufferParameteriv {
    my ($self, $target, $pname, $params) = @_;
    die "abstract method glGetBufferParameteriv";
}


sub glGetClipPlanef {
    my ($self, $pname, $eqn, $offset) = @_;
    die "abstract method glGetClipPlanef";
}


# Java overloaded method: Perl keeps the last definition
sub glGetClipPlanef {
    my ($self, $pname, $eqn) = @_;
    die "abstract method glGetClipPlanef";
}


sub glGetFloatv {
    my ($self, $pname, $params, $offset) = @_;
    die "abstract method glGetFloatv";
}


# Java overloaded method: Perl keeps the last definition
sub glGetFloatv {
    my ($self, $pname, $params) = @_;
    die "abstract method glGetFloatv";
}


sub glGetLightfv {
    my ($self, $light, $pname, $params, $offset) = @_;
    die "abstract method glGetLightfv";
}


# Java overloaded method: Perl keeps the last definition
sub glGetLightfv {
    my ($self, $light, $pname, $params) = @_;
    die "abstract method glGetLightfv";
}


sub glGetMaterialfv {
    my ($self, $face, $pname, $params, $offset) = @_;
    die "abstract method glGetMaterialfv";
}


# Java overloaded method: Perl keeps the last definition
sub glGetMaterialfv {
    my ($self, $face, $pname, $params) = @_;
    die "abstract method glGetMaterialfv";
}


sub glGetTexEnviv {
    my ($self, $env, $pname, $params, $offset) = @_;
    die "abstract method glGetTexEnviv";
}


# Java overloaded method: Perl keeps the last definition
sub glGetTexEnviv {
    my ($self, $env, $pname, $params) = @_;
    die "abstract method glGetTexEnviv";
}


sub glGetTexParameterfv {
    my ($self, $target, $pname, $params, $offset) = @_;
    die "abstract method glGetTexParameterfv";
}


# Java overloaded method: Perl keeps the last definition
sub glGetTexParameterfv {
    my ($self, $target, $pname, $params) = @_;
    die "abstract method glGetTexParameterfv";
}


sub glGetTexParameteriv {
    my ($self, $target, $pname, $params, $offset) = @_;
    die "abstract method glGetTexParameteriv";
}


# Java overloaded method: Perl keeps the last definition
sub glGetTexParameteriv {
    my ($self, $target, $pname, $params) = @_;
    die "abstract method glGetTexParameteriv";
}


sub glIsBuffer {
    my ($self, $buffer) = @_;
    die "abstract method glIsBuffer";
}


sub glIsEnabled {
    my ($self, $cap) = @_;
    die "abstract method glIsEnabled";
}


sub glIsTexture {
    my ($self, $texture) = @_;
    die "abstract method glIsTexture";
}


sub glNormalPointer {
    my ($self, $type, $stride, $offset) = @_;
    die "abstract method glNormalPointer";
}


sub glPointParameterf {
    my ($self, $pname, $param) = @_;
    die "abstract method glPointParameterf";
}


sub glPointParameterfv {
    my ($self, $pname, $params, $offset) = @_;
    die "abstract method glPointParameterfv";
}


# Java overloaded method: Perl keeps the last definition
sub glPointParameterfv {
    my ($self, $pname, $params) = @_;
    die "abstract method glPointParameterfv";
}


sub glTexCoordPointer {
    my ($self, $size, $type, $stride, $offset) = @_;
    die "abstract method glTexCoordPointer";
}


sub glTexEnvi {
    my ($self, $target, $pname, $param) = @_;
    die "abstract method glTexEnvi";
}


sub glTexEnviv {
    my ($self, $target, $pname, $params, $offset) = @_;
    die "abstract method glTexEnviv";
}


# Java overloaded method: Perl keeps the last definition
sub glTexEnviv {
    my ($self, $target, $pname, $params) = @_;
    die "abstract method glTexEnviv";
}


sub glTexParameterfv {
    my ($self, $target, $pname, $params, $offset) = @_;
    die "abstract method glTexParameterfv";
}


# Java overloaded method: Perl keeps the last definition
sub glTexParameterfv {
    my ($self, $target, $pname, $params) = @_;
    die "abstract method glTexParameterfv";
}


sub glTexParameteri {
    my ($self, $target, $pname, $param) = @_;
    die "abstract method glTexParameteri";
}


sub glTexParameteriv {
    my ($self, $target, $pname, $params, $offset) = @_;
    die "abstract method glTexParameteriv";
}


# Java overloaded method: Perl keeps the last definition
sub glTexParameteriv {
    my ($self, $target, $pname, $params) = @_;
    die "abstract method glTexParameteriv";
}


sub glVertexPointer {
    my ($self, $size, $type, $stride, $offset) = @_;
    die "abstract method glVertexPointer";
}


1;

