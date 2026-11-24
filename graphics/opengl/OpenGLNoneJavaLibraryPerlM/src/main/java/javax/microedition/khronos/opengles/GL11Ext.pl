# Generated Code Do Not Modify

# Java interface
package javax::microedition::khronos::opengles::GL11Ext;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'javax::microedition::khronos::opengles::GL';

our $GL_MATRIX_INDEX_ARRAY_BUFFER_BINDING_OES = 35742;
our $GL_MATRIX_INDEX_ARRAY_OES = 34884;
our $GL_MATRIX_INDEX_ARRAY_POINTER_OES = 34889;
our $GL_MATRIX_INDEX_ARRAY_SIZE_OES = 34886;
our $GL_MATRIX_INDEX_ARRAY_STRIDE_OES = 34888;
our $GL_MATRIX_INDEX_ARRAY_TYPE_OES = 34887;
our $GL_MATRIX_PALETTE_OES = 34880;
our $GL_MAX_PALETTE_MATRICES_OES = 34882;
our $GL_MAX_VERTEX_UNITS_OES = 34468;
our $GL_TEXTURE_CROP_RECT_OES = 35741;
our $GL_WEIGHT_ARRAY_BUFFER_BINDING_OES = 34974;
our $GL_WEIGHT_ARRAY_OES = 34477;
our $GL_WEIGHT_ARRAY_POINTER_OES = 34476;
our $GL_WEIGHT_ARRAY_SIZE_OES = 34475;
our $GL_WEIGHT_ARRAY_STRIDE_OES = 34474;
our $GL_WEIGHT_ARRAY_TYPE_OES = 34473;


sub glTexParameterfv {
    my ($self, $target, $pname, $param, $offset) = @_;
    die "abstract method glTexParameterfv";
}


sub glCurrentPaletteMatrixOES {
    my ($self, $matrixpaletteindex) = @_;
    die "abstract method glCurrentPaletteMatrixOES";
}


sub glDrawTexfOES {
    my ($self, $x, $y, $z, $width, $height) = @_;
    die "abstract method glDrawTexfOES";
}


sub glDrawTexfvOES_j2 {
    my ($self, $coords, $offset) = @_;
    die "abstract method glDrawTexfvOES";
}


sub glDrawTexfvOES_j1 {
    my ($self, $coords) = @_;
    die "abstract method glDrawTexfvOES";
}

sub glDrawTexfvOES {
    my ($invocant, @arguments) = @_;
    return $invocant->glDrawTexfvOES_j2(@arguments) if scalar(@arguments) == 2;
    return $invocant->glDrawTexfvOES_j1(@arguments) if scalar(@arguments) == 1;
    die "No method glDrawTexfvOES takes " . scalar(@arguments) . " arguments";
}


sub glDrawTexiOES {
    my ($self, $x, $y, $z, $width, $height) = @_;
    die "abstract method glDrawTexiOES";
}


sub glDrawTexivOES_j2 {
    my ($self, $coords, $offset) = @_;
    die "abstract method glDrawTexivOES";
}


sub glDrawTexivOES_j1 {
    my ($self, $coords) = @_;
    die "abstract method glDrawTexivOES";
}

sub glDrawTexivOES {
    my ($invocant, @arguments) = @_;
    return $invocant->glDrawTexivOES_j2(@arguments) if scalar(@arguments) == 2;
    return $invocant->glDrawTexivOES_j1(@arguments) if scalar(@arguments) == 1;
    die "No method glDrawTexivOES takes " . scalar(@arguments) . " arguments";
}


sub glDrawTexsOES {
    my ($self, $x, $y, $z, $width, $height) = @_;
    die "abstract method glDrawTexsOES";
}


sub glDrawTexsvOES_j2 {
    my ($self, $coords, $offset) = @_;
    die "abstract method glDrawTexsvOES";
}


sub glDrawTexsvOES_j1 {
    my ($self, $coords) = @_;
    die "abstract method glDrawTexsvOES";
}

sub glDrawTexsvOES {
    my ($invocant, @arguments) = @_;
    return $invocant->glDrawTexsvOES_j2(@arguments) if scalar(@arguments) == 2;
    return $invocant->glDrawTexsvOES_j1(@arguments) if scalar(@arguments) == 1;
    die "No method glDrawTexsvOES takes " . scalar(@arguments) . " arguments";
}


sub glDrawTexxOES {
    my ($self, $x, $y, $z, $width, $height) = @_;
    die "abstract method glDrawTexxOES";
}


sub glDrawTexxvOES_j2 {
    my ($self, $coords, $offset) = @_;
    die "abstract method glDrawTexxvOES";
}


sub glDrawTexxvOES_j1 {
    my ($self, $coords) = @_;
    die "abstract method glDrawTexxvOES";
}

sub glDrawTexxvOES {
    my ($invocant, @arguments) = @_;
    return $invocant->glDrawTexxvOES_j2(@arguments) if scalar(@arguments) == 2;
    return $invocant->glDrawTexxvOES_j1(@arguments) if scalar(@arguments) == 1;
    die "No method glDrawTexxvOES takes " . scalar(@arguments) . " arguments";
}


sub glEnable {
    my ($self, $cap) = @_;
    die "abstract method glEnable";
}


sub glEnableClientState {
    my ($self, $array) = @_;
    die "abstract method glEnableClientState";
}


sub glLoadPaletteFromModelViewMatrixOES {
    my ($self) = @_;
    die "abstract method glLoadPaletteFromModelViewMatrixOES";
}


sub glMatrixIndexPointerOES_j4_1 {
    my ($self, $size, $type, $stride, $pointer) = @_;
    die "abstract method glMatrixIndexPointerOES";
}


sub glMatrixIndexPointerOES_j4_2 {
    my ($self, $size, $type, $stride, $offset) = @_;
    die "abstract method glMatrixIndexPointerOES";
}

sub glMatrixIndexPointerOES {
    my ($invocant, @arguments) = @_;
    return $invocant->glMatrixIndexPointerOES_j4(@arguments) if scalar(@arguments) == 4;
    die "No method glMatrixIndexPointerOES takes " . scalar(@arguments) . " arguments";
}

sub glMatrixIndexPointerOES_j4 {
    my ($invocant, @arguments) = @_;
    return $invocant->glMatrixIndexPointerOES_j4_1(@arguments) if 1 && !ref($arguments[0]) && !ref($arguments[1]) && !ref($arguments[2]) && (!defined($arguments[3]) || (ref($arguments[3]) && ref($arguments[3]) ne 'ARRAY'));
    return $invocant->glMatrixIndexPointerOES_j4_2(@arguments);
}


sub glWeightPointerOES_j4_1 {
    my ($self, $size, $type, $stride, $pointer) = @_;
    die "abstract method glWeightPointerOES";
}


sub glWeightPointerOES_j4_2 {
    my ($self, $size, $type, $stride, $offset) = @_;
    die "abstract method glWeightPointerOES";
}

sub glWeightPointerOES {
    my ($invocant, @arguments) = @_;
    return $invocant->glWeightPointerOES_j4(@arguments) if scalar(@arguments) == 4;
    die "No method glWeightPointerOES takes " . scalar(@arguments) . " arguments";
}

sub glWeightPointerOES_j4 {
    my ($invocant, @arguments) = @_;
    return $invocant->glWeightPointerOES_j4_1(@arguments) if 1 && !ref($arguments[0]) && !ref($arguments[1]) && !ref($arguments[2]) && (!defined($arguments[3]) || (ref($arguments[3]) && ref($arguments[3]) ne 'ARRAY'));
    return $invocant->glWeightPointerOES_j4_2(@arguments);
}

# use java::nio::Buffer ();
# use java::nio::FloatBuffer ();
# use java::nio::IntBuffer ();
# use java::nio::ShortBuffer ();
use javax::microedition::khronos::opengles::GL ();

1;

