# Generated Code Do Not Modify

# Java interface
package javax::microedition::khronos::opengles::GL10;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'javax::microedition::khronos::opengles::GL';

our $GL_ADD = 260;
our $GL_ALIASED_LINE_WIDTH_RANGE = 33902;
our $GL_ALIASED_POINT_SIZE_RANGE = 33901;
our $GL_ALPHA = 6406;
our $GL_ALPHA_BITS = 3413;
our $GL_ALPHA_TEST = 3008;
our $GL_ALWAYS = 519;
our $GL_AMBIENT = 4608;
our $GL_AMBIENT_AND_DIFFUSE = 5634;
our $GL_AND = 5377;
our $GL_AND_INVERTED = 5380;
our $GL_AND_REVERSE = 5378;
our $GL_BACK = 1029;
our $GL_BLEND = 3042;
our $GL_BLUE_BITS = 3412;
our $GL_BYTE = 5120;
our $GL_CCW = 2305;
our $GL_CLAMP_TO_EDGE = 33071;
our $GL_CLEAR = 5376;
our $GL_COLOR_ARRAY = 32886;
our $GL_COLOR_BUFFER_BIT = 16384;
our $GL_COLOR_LOGIC_OP = 3058;
our $GL_COLOR_MATERIAL = 2903;
our $GL_COMPRESSED_TEXTURE_FORMATS = 34467;
our $GL_CONSTANT_ATTENUATION = 4615;
our $GL_COPY = 5379;
our $GL_COPY_INVERTED = 5388;
our $GL_CULL_FACE = 2884;
our $GL_CW = 2304;
our $GL_DECAL = 8449;
our $GL_DECR = 7683;
our $GL_DEPTH_BITS = 3414;
our $GL_DEPTH_BUFFER_BIT = 256;
our $GL_DEPTH_TEST = 2929;
our $GL_DIFFUSE = 4609;
our $GL_DITHER = 3024;
our $GL_DONT_CARE = 4352;
our $GL_DST_ALPHA = 772;
our $GL_DST_COLOR = 774;
our $GL_EMISSION = 5632;
our $GL_EQUAL = 514;
our $GL_EQUIV = 5385;
our $GL_EXP = 2048;
our $GL_EXP2 = 2049;
our $GL_EXTENSIONS = 7939;
our $GL_FALSE = 0;
our $GL_FASTEST = 4353;
our $GL_FIXED = 5132;
our $GL_FLAT = 7424;
our $GL_FLOAT = 5126;
our $GL_FOG = 2912;
our $GL_FOG_COLOR = 2918;
our $GL_FOG_DENSITY = 2914;
our $GL_FOG_END = 2916;
our $GL_FOG_HINT = 3156;
our $GL_FOG_MODE = 2917;
our $GL_FOG_START = 2915;
our $GL_FRONT = 1028;
our $GL_FRONT_AND_BACK = 1032;
our $GL_GEQUAL = 518;
our $GL_GREATER = 516;
our $GL_GREEN_BITS = 3411;
our $GL_IMPLEMENTATION_COLOR_READ_FORMAT_OES = 35739;
our $GL_IMPLEMENTATION_COLOR_READ_TYPE_OES = 35738;
our $GL_INCR = 7682;
our $GL_INVALID_ENUM = 1280;
our $GL_INVALID_OPERATION = 1282;
our $GL_INVALID_VALUE = 1281;
our $GL_INVERT = 5386;
our $GL_KEEP = 7680;
our $GL_LEQUAL = 515;
our $GL_LESS = 513;
our $GL_LIGHT_MODEL_AMBIENT = 2899;
our $GL_LIGHT_MODEL_TWO_SIDE = 2898;
our $GL_LIGHT0 = 16384;
our $GL_LIGHT1 = 16385;
our $GL_LIGHT2 = 16386;
our $GL_LIGHT3 = 16387;
our $GL_LIGHT4 = 16388;
our $GL_LIGHT5 = 16389;
our $GL_LIGHT6 = 16390;
our $GL_LIGHT7 = 16391;
our $GL_LIGHTING = 2896;
our $GL_LINE_LOOP = 2;
our $GL_LINE_SMOOTH = 2848;
our $GL_LINE_SMOOTH_HINT = 3154;
our $GL_LINE_STRIP = 3;
our $GL_LINEAR = 9729;
our $GL_LINEAR_ATTENUATION = 4616;
our $GL_LINEAR_MIPMAP_LINEAR = 9987;
our $GL_LINEAR_MIPMAP_NEAREST = 9985;
our $GL_LINES = 1;
our $GL_LUMINANCE = 6409;
our $GL_LUMINANCE_ALPHA = 6410;
our $GL_MAX_ELEMENTS_INDICES = 33001;
our $GL_MAX_ELEMENTS_VERTICES = 33000;
our $GL_MAX_LIGHTS = 3377;
our $GL_MAX_MODELVIEW_STACK_DEPTH = 3382;
our $GL_MAX_PROJECTION_STACK_DEPTH = 3384;
our $GL_MAX_TEXTURE_SIZE = 3379;
our $GL_MAX_TEXTURE_STACK_DEPTH = 3385;
our $GL_MAX_TEXTURE_UNITS = 34018;
our $GL_MAX_VIEWPORT_DIMS = 3386;
our $GL_MODELVIEW = 5888;
our $GL_MODULATE = 8448;
our $GL_MULTISAMPLE = 32925;
our $GL_NAND = 5390;
our $GL_NEAREST = 9728;
our $GL_NEAREST_MIPMAP_LINEAR = 9986;
our $GL_NEAREST_MIPMAP_NEAREST = 9984;
our $GL_NEVER = 512;
our $GL_NICEST = 4354;
our $GL_NO_ERROR = 0;
our $GL_NOOP = 5381;
our $GL_NOR = 5384;
our $GL_NORMAL_ARRAY = 32885;
our $GL_NORMALIZE = 2977;
our $GL_NOTEQUAL = 517;
our $GL_NUM_COMPRESSED_TEXTURE_FORMATS = 34466;
our $GL_ONE = 1;
our $GL_ONE_MINUS_DST_ALPHA = 773;
our $GL_ONE_MINUS_DST_COLOR = 775;
our $GL_ONE_MINUS_SRC_ALPHA = 771;
our $GL_ONE_MINUS_SRC_COLOR = 769;
our $GL_OR = 5383;
our $GL_OR_INVERTED = 5389;
our $GL_OR_REVERSE = 5387;
our $GL_OUT_OF_MEMORY = 1285;
our $GL_PACK_ALIGNMENT = 3333;
our $GL_PALETTE4_R5_G6_B5_OES = 35730;
our $GL_PALETTE4_RGB5_A1_OES = 35732;
our $GL_PALETTE4_RGB8_OES = 35728;
our $GL_PALETTE4_RGBA4_OES = 35731;
our $GL_PALETTE4_RGBA8_OES = 35729;
our $GL_PALETTE8_R5_G6_B5_OES = 35735;
our $GL_PALETTE8_RGB5_A1_OES = 35737;
our $GL_PALETTE8_RGB8_OES = 35733;
our $GL_PALETTE8_RGBA4_OES = 35736;
our $GL_PALETTE8_RGBA8_OES = 35734;
our $GL_PERSPECTIVE_CORRECTION_HINT = 3152;
our $GL_POINT_SMOOTH = 2832;
our $GL_POINT_SMOOTH_HINT = 3153;
our $GL_POINTS = 0;
our $GL_POINT_FADE_THRESHOLD_SIZE = 33064;
our $GL_POINT_SIZE = 2833;
our $GL_POLYGON_OFFSET_FILL = 32823;
our $GL_POLYGON_SMOOTH_HINT = 3155;
our $GL_POSITION = 4611;
our $GL_PROJECTION = 5889;
our $GL_QUADRATIC_ATTENUATION = 4617;
our $GL_RED_BITS = 3410;
our $GL_RENDERER = 7937;
our $GL_REPEAT = 10497;
our $GL_REPLACE = 7681;
our $GL_RESCALE_NORMAL = 32826;
our $GL_RGB = 6407;
our $GL_RGBA = 6408;
our $GL_SAMPLE_ALPHA_TO_COVERAGE = 32926;
our $GL_SAMPLE_ALPHA_TO_ONE = 32927;
our $GL_SAMPLE_COVERAGE = 32928;
our $GL_SCISSOR_TEST = 3089;
our $GL_SET = 5391;
our $GL_SHININESS = 5633;
our $GL_SHORT = 5122;
our $GL_SMOOTH = 7425;
our $GL_SMOOTH_LINE_WIDTH_RANGE = 2850;
our $GL_SMOOTH_POINT_SIZE_RANGE = 2834;
our $GL_SPECULAR = 4610;
our $GL_SPOT_CUTOFF = 4614;
our $GL_SPOT_DIRECTION = 4612;
our $GL_SPOT_EXPONENT = 4613;
our $GL_SRC_ALPHA = 770;
our $GL_SRC_ALPHA_SATURATE = 776;
our $GL_SRC_COLOR = 768;
our $GL_STACK_OVERFLOW = 1283;
our $GL_STACK_UNDERFLOW = 1284;
our $GL_STENCIL_BITS = 3415;
our $GL_STENCIL_BUFFER_BIT = 1024;
our $GL_STENCIL_TEST = 2960;
our $GL_SUBPIXEL_BITS = 3408;
our $GL_TEXTURE = 5890;
our $GL_TEXTURE_2D = 3553;
our $GL_TEXTURE_COORD_ARRAY = 32888;
our $GL_TEXTURE_ENV = 8960;
our $GL_TEXTURE_ENV_COLOR = 8705;
our $GL_TEXTURE_ENV_MODE = 8704;
our $GL_TEXTURE_MAG_FILTER = 10240;
our $GL_TEXTURE_MIN_FILTER = 10241;
our $GL_TEXTURE_WRAP_S = 10242;
our $GL_TEXTURE_WRAP_T = 10243;
our $GL_TEXTURE0 = 33984;
our $GL_TEXTURE1 = 33985;
our $GL_TEXTURE2 = 33986;
our $GL_TEXTURE3 = 33987;
our $GL_TEXTURE4 = 33988;
our $GL_TEXTURE5 = 33989;
our $GL_TEXTURE6 = 33990;
our $GL_TEXTURE7 = 33991;
our $GL_TEXTURE8 = 33992;
our $GL_TEXTURE9 = 33993;
our $GL_TEXTURE10 = 33994;
our $GL_TEXTURE11 = 33995;
our $GL_TEXTURE12 = 33996;
our $GL_TEXTURE13 = 33997;
our $GL_TEXTURE14 = 33998;
our $GL_TEXTURE15 = 33999;
our $GL_TEXTURE16 = 34000;
our $GL_TEXTURE17 = 34001;
our $GL_TEXTURE18 = 34002;
our $GL_TEXTURE19 = 34003;
our $GL_TEXTURE20 = 34004;
our $GL_TEXTURE21 = 34005;
our $GL_TEXTURE22 = 34006;
our $GL_TEXTURE23 = 34007;
our $GL_TEXTURE24 = 34008;
our $GL_TEXTURE25 = 34009;
our $GL_TEXTURE26 = 34010;
our $GL_TEXTURE27 = 34011;
our $GL_TEXTURE28 = 34012;
our $GL_TEXTURE29 = 34013;
our $GL_TEXTURE30 = 34014;
our $GL_TEXTURE31 = 34015;
our $GL_TRIANGLE_FAN = 6;
our $GL_TRIANGLE_STRIP = 5;
our $GL_TRIANGLES = 4;
our $GL_TRUE = 1;
our $GL_UNPACK_ALIGNMENT = 3317;
our $GL_UNSIGNED_BYTE = 5121;
our $GL_UNSIGNED_SHORT = 5123;
our $GL_UNSIGNED_SHORT_4_4_4_4 = 32819;
our $GL_UNSIGNED_SHORT_5_5_5_1 = 32820;
our $GL_UNSIGNED_SHORT_5_6_5 = 33635;
our $GL_VENDOR = 7936;
our $GL_VERSION = 7938;
our $GL_VERTEX_ARRAY = 32884;
our $GL_XOR = 5382;
our $GL_ZERO = 0;


sub glActiveTexture {
    my ($self, $texture) = @_;
    die "abstract method glActiveTexture";
}


sub glAlphaFunc {
    my ($self, $func, $ref) = @_;
    die "abstract method glAlphaFunc";
}


sub glBindTexture {
    my ($self, $target, $texture) = @_;
    die "abstract method glBindTexture";
}


sub glBlendFunc {
    my ($self, $sfactor, $dfactor) = @_;
    die "abstract method glBlendFunc";
}


sub glClear {
    my ($self, $mask) = @_;
    die "abstract method glClear";
}


sub glClearColor {
    my ($self, $red, $green, $blue, $alpha) = @_;
    die "abstract method glClearColor";
}


sub glClearDepthf {
    my ($self, $depth) = @_;
    die "abstract method glClearDepthf";
}


sub glClearStencil {
    my ($self, $s) = @_;
    die "abstract method glClearStencil";
}


sub glClientActiveTexture {
    my ($self, $texture) = @_;
    die "abstract method glClientActiveTexture";
}


sub glColor4f {
    my ($self, $red, $green, $blue, $alpha) = @_;
    die "abstract method glColor4f";
}


sub glColorMask {
    my ($self, $red, $green, $blue, $alpha) = @_;
    die "abstract method glColorMask";
}


sub glColorPointer {
    my ($self, $size, $type, $stride, $pointer) = @_;
    die "abstract method glColorPointer";
}


sub glCompressedTexImage2D {
    my ($self, $target, $level, $internalformat, $width, $height, $border, $imageSize, $data) = @_;
    die "abstract method glCompressedTexImage2D";
}


sub glCompressedTexSubImage2D {
    my ($self, $target, $level, $xoffset, $yoffset, $width, $height, $format, $imageSize, $data) = @_;
    die "abstract method glCompressedTexSubImage2D";
}


sub glCopyTexImage2D {
    my ($self, $target, $level, $internalformat, $x, $y, $width, $height, $border) = @_;
    die "abstract method glCopyTexImage2D";
}


sub glCopyTexSubImage2D {
    my ($self, $target, $level, $xoffset, $yoffset, $x, $y, $width, $height) = @_;
    die "abstract method glCopyTexSubImage2D";
}


sub glCullFace {
    my ($self, $mode) = @_;
    die "abstract method glCullFace";
}


sub glDeleteTextures {
    my ($self, $n, $textures, $offset) = @_;
    die "abstract method glDeleteTextures";
}


# Java overloaded method: Perl keeps the last definition
sub glDeleteTextures {
    my ($self, $n, $textures) = @_;
    die "abstract method glDeleteTextures";
}


sub glDepthFunc {
    my ($self, $func) = @_;
    die "abstract method glDepthFunc";
}


sub glDepthMask {
    my ($self, $flag) = @_;
    die "abstract method glDepthMask";
}


sub glDepthRangef {
    my ($self, $zNear, $zFar) = @_;
    die "abstract method glDepthRangef";
}


sub glDisable {
    my ($self, $cap) = @_;
    die "abstract method glDisable";
}


sub glDisableClientState {
    my ($self, $array) = @_;
    die "abstract method glDisableClientState";
}


sub glDrawArrays {
    my ($self, $mode, $first, $count) = @_;
    die "abstract method glDrawArrays";
}


sub glDrawElements {
    my ($self, $mode, $count, $type, $indices) = @_;
    die "abstract method glDrawElements";
}


sub glEnable {
    my ($self, $cap) = @_;
    die "abstract method glEnable";
}


sub glEnableClientState {
    my ($self, $array) = @_;
    die "abstract method glEnableClientState";
}


sub glFinish {
    my ($self) = @_;
    die "abstract method glFinish";
}


sub glFlush {
    my ($self) = @_;
    die "abstract method glFlush";
}


sub glFogf {
    my ($self, $pname, $param) = @_;
    die "abstract method glFogf";
}


sub glFogfv {
    my ($self, $pname, $params, $offset) = @_;
    die "abstract method glFogfv";
}


# Java overloaded method: Perl keeps the last definition
sub glFogfv {
    my ($self, $pname, $params) = @_;
    die "abstract method glFogfv";
}


sub glFrontFace {
    my ($self, $mode) = @_;
    die "abstract method glFrontFace";
}


sub glFrustumf {
    my ($self, $left, $right, $bottom, $top, $zNear, $zFar) = @_;
    die "abstract method glFrustumf";
}


sub glGenTextures {
    my ($self, $n, $textures, $offset) = @_;
    die "abstract method glGenTextures";
}


# Java overloaded method: Perl keeps the last definition
sub glGenTextures {
    my ($self, $n, $textures) = @_;
    die "abstract method glGenTextures";
}


sub glGetError {
    my ($self) = @_;
    die "abstract method glGetError";
}


sub glGetIntegerv {
    my ($self, $pname, $params, $offset) = @_;
    die "abstract method glGetIntegerv";
}


# Java overloaded method: Perl keeps the last definition
sub glGetIntegerv {
    my ($self, $pname, $params) = @_;
    die "abstract method glGetIntegerv";
}


sub glGetString {
    my ($self, $name) = @_;
    die "abstract method glGetString";
}


sub glHint {
    my ($self, $target, $mode) = @_;
    die "abstract method glHint";
}


sub glLightModelf {
    my ($self, $pname, $param) = @_;
    die "abstract method glLightModelf";
}


sub glLightModelfv {
    my ($self, $pname, $params, $offset) = @_;
    die "abstract method glLightModelfv";
}


# Java overloaded method: Perl keeps the last definition
sub glLightModelfv {
    my ($self, $pname, $params) = @_;
    die "abstract method glLightModelfv";
}


sub glLightf {
    my ($self, $light, $pname, $param) = @_;
    die "abstract method glLightf";
}


sub glLightfv {
    my ($self, $light, $pname, $params, $offset) = @_;
    die "abstract method glLightfv";
}


# Java overloaded method: Perl keeps the last definition
sub glLightfv {
    my ($self, $light, $pname, $params) = @_;
    die "abstract method glLightfv";
}


sub glLineWidth {
    my ($self, $width) = @_;
    die "abstract method glLineWidth";
}


sub glLoadIdentity {
    my ($self) = @_;
    die "abstract method glLoadIdentity";
}


sub glLoadMatrixf {
    my ($self, $m, $offset) = @_;
    die "abstract method glLoadMatrixf";
}


# Java overloaded method: Perl keeps the last definition
sub glLoadMatrixf {
    my ($self, $m) = @_;
    die "abstract method glLoadMatrixf";
}


sub glLogicOp {
    my ($self, $opcode) = @_;
    die "abstract method glLogicOp";
}


sub glMaterialf {
    my ($self, $face, $pname, $param) = @_;
    die "abstract method glMaterialf";
}


sub glMaterialfv {
    my ($self, $face, $pname, $params, $offset) = @_;
    die "abstract method glMaterialfv";
}


# Java overloaded method: Perl keeps the last definition
sub glMaterialfv {
    my ($self, $face, $pname, $params) = @_;
    die "abstract method glMaterialfv";
}


sub glMatrixMode {
    my ($self, $mode) = @_;
    die "abstract method glMatrixMode";
}


sub glMultMatrixf {
    my ($self, $m, $offset) = @_;
    die "abstract method glMultMatrixf";
}


# Java overloaded method: Perl keeps the last definition
sub glMultMatrixf {
    my ($self, $m) = @_;
    die "abstract method glMultMatrixf";
}


sub glMultiTexCoord4f {
    my ($self, $target, $s, $t, $r, $q) = @_;
    die "abstract method glMultiTexCoord4f";
}


sub glNormal3f {
    my ($self, $nx, $ny, $nz) = @_;
    die "abstract method glNormal3f";
}


sub glNormalPointer {
    my ($self, $type, $stride, $pointer) = @_;
    die "abstract method glNormalPointer";
}


sub glOrthof {
    my ($self, $left, $right, $bottom, $top, $zNear, $zFar) = @_;
    die "abstract method glOrthof";
}


sub glPixelStorei {
    my ($self, $pname, $param) = @_;
    die "abstract method glPixelStorei";
}


sub glPointSize {
    my ($self, $size) = @_;
    die "abstract method glPointSize";
}


sub glPolygonOffset {
    my ($self, $factor, $units) = @_;
    die "abstract method glPolygonOffset";
}


sub glPopMatrix {
    my ($self) = @_;
    die "abstract method glPopMatrix";
}


sub glPushMatrix {
    my ($self) = @_;
    die "abstract method glPushMatrix";
}


sub glReadPixels {
    my ($self, $x, $y, $width, $height, $format, $type, $pixels) = @_;
    die "abstract method glReadPixels";
}


sub glRotatef {
    my ($self, $angle, $x, $y, $z) = @_;
    die "abstract method glRotatef";
}


sub glRotatex {
    my ($self, $angle, $x, $y, $z) = @_;
    die "abstract method glRotatex";
}


sub glSampleCoverage {
    my ($self, $value, $invert) = @_;
    die "abstract method glSampleCoverage";
}


sub glScalef {
    my ($self, $x, $y, $z) = @_;
    die "abstract method glScalef";
}


sub glScalex {
    my ($self, $x, $y, $z) = @_;
    die "abstract method glScalex";
}


sub glScissor {
    my ($self, $x, $y, $width, $height) = @_;
    die "abstract method glScissor";
}


sub glShadeModel {
    my ($self, $mode) = @_;
    die "abstract method glShadeModel";
}


sub glStencilFunc {
    my ($self, $func, $ref, $mask) = @_;
    die "abstract method glStencilFunc";
}


sub glStencilMask {
    my ($self, $mask) = @_;
    die "abstract method glStencilMask";
}


sub glStencilOp {
    my ($self, $fail, $zfail, $zpass) = @_;
    die "abstract method glStencilOp";
}


sub glTexCoordPointer {
    my ($self, $size, $type, $stride, $pointer) = @_;
    die "abstract method glTexCoordPointer";
}


sub glTexEnvf {
    my ($self, $target, $pname, $param) = @_;
    die "abstract method glTexEnvf";
}


sub glTexEnvfv {
    my ($self, $target, $pname, $params, $offset) = @_;
    die "abstract method glTexEnvfv";
}


# Java overloaded method: Perl keeps the last definition
sub glTexEnvfv {
    my ($self, $target, $pname, $params) = @_;
    die "abstract method glTexEnvfv";
}


sub glTexImage2D {
    my ($self, $target, $level, $internalformat, $width, $height, $border, $format, $type, $pixels) = @_;
    die "abstract method glTexImage2D";
}


sub glTexParameterf {
    my ($self, $target, $pname, $param) = @_;
    die "abstract method glTexParameterf";
}


sub glTexParameteri {
    my ($self, $target, $pname, $param) = @_;
    die "abstract method glTexParameteri";
}


sub glTexSubImage2D {
    my ($self, $target, $level, $xoffset, $yoffset, $width, $height, $format, $type, $pixels) = @_;
    die "abstract method glTexSubImage2D";
}


sub glTranslatef {
    my ($self, $x, $y, $z) = @_;
    die "abstract method glTranslatef";
}


sub glVertexPointer {
    my ($self, $size, $type, $stride, $pointer) = @_;
    die "abstract method glVertexPointer";
}


sub glViewport {
    my ($self, $x, $y, $width, $height) = @_;
    die "abstract method glViewport";
}


sub glBegin {
    my ($self, $i) = @_;
    die "abstract method glBegin";
}


sub glEnd {
    my ($self) = @_;
    die "abstract method glEnd";
}


sub glVertex3f {
    my ($self, $f, $f2, $f3) = @_;
    die "abstract method glVertex3f";
}


sub glPolygonMode {
    my ($self, $i, $i1) = @_;
    die "abstract method glPolygonMode";
}


1;

