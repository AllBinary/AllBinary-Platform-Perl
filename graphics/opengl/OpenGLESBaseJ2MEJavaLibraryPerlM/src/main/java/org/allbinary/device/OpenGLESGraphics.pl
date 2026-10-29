# Generated Code Do Not Modify

package org::allbinary::device::OpenGLESGraphics;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::image::opengles::OpenGLSurfaceChangedInterface','org::allbinary::device::GraphicsInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{commonStrings} = 'org::allbinary::string::CommonStrings'->getInstance();
    $self->{gl} = $org::allbinary::device::NullGL10::NULL_GL10;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub updateGL {
    my ($self, $gl) = @_;
}


sub set {
    my ($self, $gl) = @_;
}


# throws Exception
sub init {
    my ($self) = @_;
}


# throws Exception
sub update {
    my ($self) = @_;
}


sub setOrthoginalMode {
    my ($self) = @_;
}


sub setCameraMode {
    my ($self) = @_;
}


sub getGlP {
    my ($self) = @_;
        return $self->{gl};
}


sub setFontDebug {
    my ($self, $font, $fontDebug) = @_;
        die ("RuntimeException");
}

# use javax::microedition::khronos::opengles::GL;
# use javax::microedition::khronos::opengles::GL10;
# use javax::microedition::lcdui::Font;
use org::allbinary::graphics::font::FontDebugBase;
use org::allbinary::image::opengles::OpenGLSurfaceChangedInterface;
use org::allbinary::string::CommonStrings;
use org::allbinary::device::GraphicsInterface;
use org::allbinary::device::NullGL10;

1;

