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


sub texImage2D {
    my ($self, $gl, $glVersion, $target, $level, $generateMipMap, $openGLESImage, $border, $flip) = @_;
        die ("RuntimeException");
}


# Java overloaded method: Perl keeps the last definition
sub texImage2D {
    my ($self, $gl, $glVersion, $target, $level, $generateMipMap, $bitmap, $border, $flip) = @_;
        die ("RuntimeException");
}

use java::lang::Object ();
use java::lang::LazyStatic ();
# use java::nio::ByteBuffer ();
use javax::microedition::khronos::opengles::GL10 ();
use org::allbinary::graphics::OpenGLBitmap ();
use org::allbinary::image::opengles::OpenGLESImage ();

1;

