#
# AllBinary Open License Version 1
# Copyright (c) 2011 AllBinary
# 
# By agreeing to this license you and any business entity you represent are
# legally bound to the AllBinary Open License Version 1 legal agreement.
# 
# You may obtain the AllBinary Open License Version 1 legal agreement from
# AllBinary or the root directory of AllBinary's AllBinary Platform repository.
# 
# Created By: Travis Berthelot
#   
# Generated Code Do Not Modify

package org::allbinary::media::image::ImageRotationUtil;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::media::image::ImageRotationUtil'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{imageSwtRotationUtil} = 'org::allbinary::media::image::ImageSwtRotationUtil'->getInstance();
    $self->{features} = 'org::allbinary::game::configuration::feature::Features'->getInstance();
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::media::image::ImageRotationUtil::instance;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub rotateImage {
    my ($self, $originalImage, $image, $totalAngle) = @_;
        my $originalImage2 = $originalImage;
        if ($self->{features}->isFeature('org::allbinary::graphics::opengles::OpenGLFeatureFactory'->getInstance()->{OPENGL})) {
            if ($image->getType() >= $org::allbinary::image::opengles::OpenGLESImage::TYPE) {
                my $openGLESImage = ($image);
                $openGLESImage->{openGLESImageProperties}->{angle} = $totalAngle;
                return;
            } else {
                'org::allbinary::logic::communication::log::PreLogUtil'->put("OpenGL but image is: " . $image . " type: " . $image->getType(), $self, "rotateImage");
            }
        }
        my $originalSwtImage = ($originalImage2->getImage());
        my $gc = undef;
        my $copySwtImage = undef;
        if ($image->isMutable()) {
            my $swtImage = $image;
            $copySwtImage = $swtImage->getImage();
            $gc = $swtImage->getGc();
            $self->{imageSwtRotationUtil}->rotateImage($originalSwtImage, $copySwtImage, $gc, $totalAngle);
        } else {
            'org::allbinary::logic::communication::log::PreLogUtil'->put("No rotation for: " . $image->toString(), $self, "rotateImage");
        }
}


# throws Exception
sub createRotatedImage {
    my ($self, $originalImage, $rotationInDegrees) = @_;
        return $originalImage;
}

# use javax::microedition::lcdui::Image;
use org::allbinary::game::configuration::feature::Features;
use org::allbinary::graphics::opengles::OpenGLFeatureFactory;
use org::allbinary::image::opengles::OpenGLESImage;
use org::allbinary::logic::communication::log::PreLogUtil;
use org::eclipse::swt::graphics::GC;
use org::microemu::device::swt::SwtImmutableImage;
use org::microemu::device::swt::SwtMutableImage;
use org::allbinary::media::image::ImageSwtRotationUtil;

1;

