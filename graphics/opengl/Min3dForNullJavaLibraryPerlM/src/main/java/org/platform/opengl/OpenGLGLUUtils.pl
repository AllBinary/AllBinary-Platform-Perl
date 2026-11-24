# Generated Code Do Not Modify

package org::platform::opengl::OpenGLGLUUtils;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'java::lang::Object';

tie our $instance, 'java::lang::LazyStatic', sub { 'org::platform::opengl::OpenGLGLUUtils'->new() };

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::platform::opengl::OpenGLGLUUtils::instance;
}


sub makeByteBuffer {
    my ($self, $bmp, $flip) = @_;
        die ("RuntimeException");
}


sub texImage2D_j8_1 {
    my ($self, $gl, $glVersion, $target, $level, $generateMipMap, $openGLESImage, $border, $flip) = @_;
        die ("RuntimeException");
}


sub texImage2D_j8_2 {
    my ($self, $gl, $glVersion, $target, $level, $generateMipMap, $bitmap, $border, $flip) = @_;
        die ("RuntimeException");
}

sub texImage2D {
    my ($invocant, @arguments) = @_;
    return $invocant->texImage2D_j8(@arguments) if scalar(@arguments) == 8;
    die "No method texImage2D takes " . scalar(@arguments) . " arguments";
}

sub texImage2D_j8 {
    my ($invocant, @arguments) = @_;
    return $invocant->texImage2D_j8_1(@arguments) if 1 && (!defined($arguments[0]) || (ref($arguments[0]) && ref($arguments[0]) ne 'ARRAY')) && !ref($arguments[1]) && !ref($arguments[2]) && !ref($arguments[3]) && !ref($arguments[4]) && (!defined($arguments[5]) || (ref($arguments[5]) && ref($arguments[5]) ne 'ARRAY')) && !ref($arguments[6]) && !ref($arguments[7]);
    return $invocant->texImage2D_j8_2(@arguments);
}

use java::lang::Object ();
use java::lang::LazyStatic ();
# use java::nio::ByteBuffer ();
use javax::microedition::khronos::opengles::GL10 ();
use org::allbinary::graphics::OpenGLBitmap ();
use org::allbinary::image::opengles::OpenGLESImage ();

1;

