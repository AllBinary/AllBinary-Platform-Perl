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

#Many devices don't support this even though it is supposed to
package org::allbinary::image::opengles::OpenGLESGL11ExtImage;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::image::opengles::OpenGLESImage';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{a} = 0;
    $self->{rectangle} = undef;
}


sub new {
    my ($class, $image, $bitmapFactory, $textureFactory) = @_;
    my $self = $class->SUPER::new($image, $bitmapFactory, $textureFactory);
    $self->_init_fields();
        # super(...) made $self above
        $self->onDisplayChangeEvent(undef);
        $self->{rectangle} = [0, $self->getHeight(), $self->getWidth(), -$self->getHeight()];
    return $self;
}


sub onDisplayChangeEvent {
    my ($self, $displayChangeEvent) = @_;
        try {
            $self->{logUtil}->putF($self->{commonStrings}->{START}, $self, "onResize");
            $self->{a} = 'org::allbinary::graphics::displayable::DisplayInfoSingleton'->getInstance()->getLastHeight() - $self->getHeight();
        } catch ($e) {
            $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "onResize", $e);
        }
}


sub set {
    my ($self, $gl) = @_;
        $self->onDisplayChangeEvent(undef);
        my $gl11 = $gl;
        if ($self->SUPER::initTexture($gl11)) {
            $self->{textureFactory}->load($gl11, $javax::microedition::khronos::opengles::GL10::GL_TEXTURE_2D, 0, $self, 0, 1);
            $gl11->glTexParameteriv($javax::microedition::khronos::opengles::GL10::GL_TEXTURE_2D, $javax::microedition::khronos::opengles::GL11Ext::GL_TEXTURE_CROP_RECT_OES, $self->{rectangle}, 0);
            $gl11->glDisable($javax::microedition::khronos::opengles::GL10::GL_TEXTURE_2D);
            'org::allbinary::graphics::opengles::OpenGLLogUtil'->getInstance()->logError($gl11, $self);
        }
}


sub draw {
    my ($self, $gl, $x, $y, $z) = @_;
        $gl->glEnable($javax::microedition::khronos::opengles::GL10::GL_TEXTURE_2D);
        $gl->glBindTexture($javax::microedition::khronos::opengles::GL10::GL_TEXTURE_2D, $self->{openGLESImageProperties}->{textureID});
        ($gl)->glDrawTexfOES($x, $self->{a} - $y, $z, $self->getWidth(), $self->getHeight());
        $gl->glDisable($javax::microedition::khronos::opengles::GL10::GL_TEXTURE_2D);
}

# use javax::microedition::khronos::opengles::GL;
# use javax::microedition::khronos::opengles::GL10;
# use javax::microedition::khronos::opengles::GL11;
# use javax::microedition::khronos::opengles::GL11Ext;
# use javax::microedition::lcdui::Image;
use org::allbinary::graphics::displayable::DisplayInfoSingleton;
use org::allbinary::graphics::displayable::event::DisplayChangeEvent;
use org::allbinary::graphics::opengles::OpenGLLogUtil;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::platform::graphics::PlatformBitmapBaseFactory;
use org::allbinary::platform::opengles::PlatformTextureBaseFactory;
use org::allbinary::image::opengles::OpenGLESImage;

1;

