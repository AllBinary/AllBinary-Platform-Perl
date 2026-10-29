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


sub glDrawTexfvOES {
    my ($self, $coords, $offset) = @_;
    die "abstract method glDrawTexfvOES";
}


# Java overloaded method: Perl keeps the last definition
sub glDrawTexfvOES {
    my ($self, $coords) = @_;
    die "abstract method glDrawTexfvOES";
}


sub glDrawTexiOES {
    my ($self, $x, $y, $z, $width, $height) = @_;
    die "abstract method glDrawTexiOES";
}


sub glDrawTexivOES {
    my ($self, $coords, $offset) = @_;
    die "abstract method glDrawTexivOES";
}


# Java overloaded method: Perl keeps the last definition
sub glDrawTexivOES {
    my ($self, $coords) = @_;
    die "abstract method glDrawTexivOES";
}


sub glDrawTexsOES {
    my ($self, $x, $y, $z, $width, $height) = @_;
    die "abstract method glDrawTexsOES";
}


sub glDrawTexsvOES {
    my ($self, $coords, $offset) = @_;
    die "abstract method glDrawTexsvOES";
}


# Java overloaded method: Perl keeps the last definition
sub glDrawTexsvOES {
    my ($self, $coords) = @_;
    die "abstract method glDrawTexsvOES";
}


sub glDrawTexxOES {
    my ($self, $x, $y, $z, $width, $height) = @_;
    die "abstract method glDrawTexxOES";
}


sub glDrawTexxvOES {
    my ($self, $coords, $offset) = @_;
    die "abstract method glDrawTexxvOES";
}


# Java overloaded method: Perl keeps the last definition
sub glDrawTexxvOES {
    my ($self, $coords) = @_;
    die "abstract method glDrawTexxvOES";
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


sub glMatrixIndexPointerOES {
    my ($self, $size, $type, $stride, $pointer) = @_;
    die "abstract method glMatrixIndexPointerOES";
}


# Java overloaded method: Perl keeps the last definition
sub glMatrixIndexPointerOES {
    my ($self, $size, $type, $stride, $offset) = @_;
    die "abstract method glMatrixIndexPointerOES";
}


sub glWeightPointerOES {
    my ($self, $size, $type, $stride, $pointer) = @_;
    die "abstract method glWeightPointerOES";
}


# Java overloaded method: Perl keeps the last definition
sub glWeightPointerOES {
    my ($self, $size, $type, $stride, $offset) = @_;
    die "abstract method glWeightPointerOES";
}


1;

