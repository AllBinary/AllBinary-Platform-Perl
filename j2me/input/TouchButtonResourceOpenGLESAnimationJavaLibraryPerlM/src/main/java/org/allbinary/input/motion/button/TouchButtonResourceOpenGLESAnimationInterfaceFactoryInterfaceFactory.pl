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

package org::allbinary::input::motion::button::TouchButtonResourceOpenGLESAnimationInterfaceFactoryInterfaceFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::input::motion::button::TouchButtonResourceAnimationInterfaceFactoryInterfaceFactory';



sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new("OpenGL TouchButton Animations");
        # super(...) made $self above
    return $self;
}


# throws Exception
sub init {
    my ($self, $level) = @_;
        $self->SUPER::initImageCache('org::allbinary::image::opengles::OpenGLImageCacheFactory'->getInstance(), $level);
}


sub isFeature {
    my ($self) = @_;
        if ('org::allbinary::game::configuration::feature::Features'->getInstance()->isDefault('org::allbinary::graphics::opengles::OpenGLFeatureFactory'->getInstance()->{OPENGL})) {
            return 1;
        } else {
            return 0;
        }
}

use org::allbinary::game::configuration::feature::Features;
use org::allbinary::graphics::opengles::OpenGLFeatureFactory;
use org::allbinary::image::opengles::OpenGLImageCacheFactory;
use org::allbinary::input::motion::button::TouchButtonResourceAnimationInterfaceFactoryInterfaceFactory;

1;

