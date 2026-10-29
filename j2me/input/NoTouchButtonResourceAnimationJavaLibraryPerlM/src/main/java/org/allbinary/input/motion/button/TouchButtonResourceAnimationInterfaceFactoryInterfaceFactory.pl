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

package org::allbinary::input::motion::button::TouchButtonResourceAnimationInterfaceFactoryInterfaceFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::animation::resource::BaseResourceAnimationInterfaceFactoryInterfaceFactory';



sub createFactory {
    my ($class) = @_;
        return 'org::allbinary::input::motion::button::TouchButtonResourceAnimationInterfaceFactoryInterfaceFactory'->new("TouchButton Animations");
}


sub new {
    my ($class, $name) = @_;
    my $self = $class->SUPER::new($name, 'org::allbinary::logic::StdUtil'->getInstance()->createHashtable(), 'org::allbinary::logic::StdUtil'->getInstance()->createHashtable(), 'org::allbinary::logic::StdUtil'->getInstance()->createHashtable());
        # super(...) made $self above
    return $self;
}


# throws Exception
sub init {
    my ($self, $level) = @_;
        $self->initImageCache('org::allbinary::image::ImageCacheFactory'->getInstance(), $level);
}


# throws Exception
sub initImageCache {
    my ($self, $imageCache, $level) = @_;
        if ($self->isInitialized()) {
            return;
        }
        $self->SUPER::init($level);
}


sub isLoadingLevel {
    my ($self, $level) = @_;
        my $resourceLoadingLevelFactory = 'org::allbinary::game::resource::ResourceLoadingLevelFactory'->getInstance();
        if ($level == $resourceLoadingLevelFactory->{LOAD_TOUCH}->getLevel()) {
            return 1;
        } else {
            return $self->SUPER::isLoadingLevel($level);
        }
}


sub isFeature {
    my ($self) = @_;
        if (!'org::allbinary::game::configuration::feature::Features'->getInstance()->isDefault('org::allbinary::graphics::opengles::OpenGLFeatureFactory'->getInstance()->{OPENGL})) {
            return 1;
        } else {
            return 0;
        }
}

use org::allbinary::animation::resource::BaseResourceAnimationInterfaceFactoryInterfaceFactory;
use org::allbinary::game::configuration::feature::Features;
use org::allbinary::game::resource::ResourceLoadingLevelFactory;
use org::allbinary::graphics::opengles::OpenGLFeatureFactory;
use org::allbinary::image::ImageCache;
use org::allbinary::image::ImageCacheFactory;
use org::allbinary::logic::StdUtil;

1;

