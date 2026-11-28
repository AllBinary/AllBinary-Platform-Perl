# Generated Code Do Not Modify

# Shares image operations between the SWT and OpenGL implementations. 
package org::allbinary::media::image::SwtOpenGLESImageBridge;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'java::lang::Object';



sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


sub addImage {
    my ($class, $util, $image) = @_;
        return $util->addImage($image);
}


sub isCustomScaling {
    my ($class, $util, $image) = @_;
        return $util->isCustomScaling($image);
}


sub getOpenGLESImage {
    my ($class, $image) = @_;
        return $image;
}


sub getBitmapImage {
    my ($class, $image) = @_;
        return $image->{openGLBitmap}->getImage();
}


sub asImage {
    my ($class, $image) = @_;
        return $image;
}

use java::lang::Object ();
use javax::microedition::lcdui::Image ();
use org::allbinary::graphics::opengles::OpenGLUtil ();
use org::allbinary::image::opengles::OpenGLESImage ();
use org::allbinary::image::opengles::OpenGLESImageExclusionUtil ();

1;

