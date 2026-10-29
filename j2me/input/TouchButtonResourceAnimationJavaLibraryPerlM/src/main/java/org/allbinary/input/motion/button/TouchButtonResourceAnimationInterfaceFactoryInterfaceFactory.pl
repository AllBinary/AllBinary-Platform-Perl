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
        my $portion = 140;
        my $loadingString = 'org::allbinary::logic::string::StringMaker'->new()->append($self->toString())->append(" Loading: ")->toString();
        my $index = 0;
        my $progressCanvas = 'org::allbinary::graphics::canvas::transition::progress::ProgressCanvasFactory'->getInstance();
        $progressCanvas->addPortion($portion, $loadingString, $index++);
        my $touchButtonBlankResource = 'org::allbinary::input::motion::button::TouchButtonBlankResource'->getInstance();
        my $touchButtonGenericActionResource = 'org::allbinary::input::motion::button::TouchButtonGenericActionResource'->getInstance();
        my $touchButtonStartResource = 'org::allbinary::input::motion::button::TouchButtonStartResource'->getInstance();
        my $touchButtonUpResource = 'org::allbinary::input::motion::button::TouchButtonUpResource'->getInstance();
        my $touchButtonDownResource = 'org::allbinary::input::motion::button::TouchButtonDownResource'->getInstance();
        my $touchButtonTurnLeftResource = 'org::allbinary::input::motion::button::TouchButtonTurnLeftResource'->getInstance();
        my $touchButtonTurnRightResource = 'org::allbinary::input::motion::button::TouchButtonTurnRightResource'->getInstance();
        my $touchButtonStrafeLeftResource = 'org::allbinary::input::motion::button::TouchButtonStrafeLeftResource'->getInstance();
        my $touchButtonStrafeRightResource = 'org::allbinary::input::motion::button::TouchButtonStrafeRightResource'->getInstance();
        my $touchButtonBlankResourceImage = $imageCache->getWithKey($touchButtonBlankResource->{RESOURCE});
        my $touchButtonGenericActionResourceImage = $imageCache->getWithKey($touchButtonGenericActionResource->{RESOURCE});
        my $touchButtonStartResourceImage = $imageCache->getWithKey($touchButtonStartResource->{RESOURCE});
        my $touchButtonUpResourceImage = $imageCache->getWithKey($touchButtonUpResource->{RESOURCE});
        my $touchButtonDownResourceImage = $imageCache->getWithKey($touchButtonDownResource->{RESOURCE});
        my $touchButtonTurnLeftResourceImage = $imageCache->getWithKey($touchButtonTurnLeftResource->{RESOURCE});
        my $touchButtonTurnRightResourceImage = $imageCache->getWithKey($touchButtonTurnRightResource->{RESOURCE});
        my $touchButtonStrafeLeftResourceImage = $imageCache->getWithKey($touchButtonStrafeLeftResource->{RESOURCE});
        my $touchButtonStrafeRightResourceImage = $imageCache->getWithKey($touchButtonStrafeRightResource->{RESOURCE});
        my $nullAnimationFactory = 'org::allbinary::animation::NullAnimationFactory'->getFactoryInstance();
        if ('org::allbinary::logic::system::os::OperatingSystemFactory'->getInstance()->getOperatingSystemInstance()->isOverScan()) {
            $imageCache->getWithKey('org::allbinary::input::motion::button::TouchButtonStartResource'->getInstance()->{HINT});
        }
        $progressCanvas->addPortion($portion, $loadingString, $index++);
        my $imageCompleteUtil = 'org::allbinary::media::image::ImageCompleteUtil'->getInstance();
        $progressCanvas->addPortion($portion, $loadingString, $index++);
        $imageCompleteUtil->waitForImage($touchButtonBlankResourceImage, $touchButtonBlankResource->{RESOURCE});
        $self->add($touchButtonBlankResource->{RESOURCE}, 'org::allbinary::animation::image::sprite::OneRowSpriteIndexedAnimationFactory'->createFactory($touchButtonBlankResourceImage, 'org::allbinary::animation::AnimationBehaviorFactory'->getInstance()));
        $self->add($touchButtonBlankResource->{HINT}, $nullAnimationFactory);
        $progressCanvas->addPortion($portion, $loadingString, $index++);
        $imageCompleteUtil->waitForImage($touchButtonGenericActionResourceImage, $touchButtonGenericActionResource->{RESOURCE});
        $self->add($touchButtonGenericActionResource->{RESOURCE}, 'org::allbinary::animation::image::sprite::OneRowSpriteIndexedAnimationFactory'->createFactory($touchButtonGenericActionResourceImage, 'org::allbinary::animation::AnimationBehaviorFactory'->getInstance()));
        $self->add($touchButtonGenericActionResource->{HINT}, $nullAnimationFactory);
        $progressCanvas->addPortion($portion, $loadingString, $index++);
        $imageCompleteUtil->waitForImage($touchButtonStartResourceImage, $touchButtonStartResource->{RESOURCE});
        $self->add($touchButtonStartResource->{RESOURCE}, 'org::allbinary::animation::image::sprite::OneRowSpriteIndexedAnimationFactory'->createFactory($touchButtonStartResourceImage, 'org::allbinary::animation::AnimationBehaviorFactory'->getInstance()));
        $progressCanvas->addPortion($portion, $loadingString, $index++);
        $imageCompleteUtil->waitForImage($touchButtonUpResourceImage, $touchButtonUpResource->{RESOURCE});
        $self->add($touchButtonUpResource->{RESOURCE}, 'org::allbinary::animation::image::sprite::OneRowSpriteIndexedAnimationFactory'->createFactory($touchButtonUpResourceImage, 'org::allbinary::animation::AnimationBehaviorFactory'->getInstance()));
        $self->add($touchButtonUpResource->{HINT}, $nullAnimationFactory);
        $progressCanvas->addPortion($portion, $loadingString, $index++);
        $imageCompleteUtil->waitForImage($touchButtonDownResourceImage, $touchButtonDownResource->{RESOURCE});
        $self->add($touchButtonDownResource->{RESOURCE}, 'org::allbinary::animation::image::sprite::OneRowSpriteIndexedAnimationFactory'->createFactory($touchButtonDownResourceImage, 'org::allbinary::animation::AnimationBehaviorFactory'->getInstance()));
        $self->add($touchButtonDownResource->{HINT}, $nullAnimationFactory);
        $progressCanvas->addPortion($portion, $loadingString, $index++);
        $imageCompleteUtil->waitForImage($touchButtonTurnLeftResourceImage, $touchButtonTurnLeftResource->{RESOURCE});
        $self->add($touchButtonTurnLeftResource->{RESOURCE}, 'org::allbinary::animation::image::sprite::OneRowSpriteIndexedAnimationFactory'->createFactory($touchButtonTurnLeftResourceImage, 'org::allbinary::animation::AnimationBehaviorFactory'->getInstance()));
        $self->add($touchButtonTurnLeftResource->{HINT}, $nullAnimationFactory);
        $progressCanvas->addPortion($portion, $loadingString, $index++);
        $imageCompleteUtil->waitForImage($touchButtonTurnRightResourceImage, $touchButtonTurnRightResource->{RESOURCE});
        $self->add($touchButtonTurnRightResource->{RESOURCE}, 'org::allbinary::animation::image::sprite::OneRowSpriteIndexedAnimationFactory'->createFactory($touchButtonTurnRightResourceImage, 'org::allbinary::animation::AnimationBehaviorFactory'->getInstance()));
        $self->add($touchButtonTurnRightResource->{HINT}, $nullAnimationFactory);
        $progressCanvas->addPortion($portion, $loadingString, $index++);
        $imageCompleteUtil->waitForImage($touchButtonStrafeLeftResourceImage, $touchButtonStrafeLeftResource->{RESOURCE});
        $self->add($touchButtonStrafeLeftResource->{RESOURCE}, 'org::allbinary::animation::image::sprite::OneRowSpriteIndexedAnimationFactory'->createFactory($touchButtonStrafeLeftResourceImage, 'org::allbinary::animation::AnimationBehaviorFactory'->getInstance()));
        $self->add($touchButtonStrafeLeftResource->{HINT}, $nullAnimationFactory);
        $progressCanvas->addPortion($portion, $loadingString, $index++);
        $imageCompleteUtil->waitForImage($touchButtonStrafeRightResourceImage, $touchButtonStrafeRightResource->{RESOURCE});
        $self->add($touchButtonStrafeRightResource->{RESOURCE}, 'org::allbinary::animation::image::sprite::OneRowSpriteIndexedAnimationFactory'->createFactory($touchButtonStrafeRightResourceImage, 'org::allbinary::animation::AnimationBehaviorFactory'->getInstance()));
        $self->add($touchButtonStrafeRightResource->{HINT}, $nullAnimationFactory);
        if ('org::allbinary::logic::system::os::OperatingSystemFactory'->getInstance()->getOperatingSystemInstance()->isOverScan()) {
            my $touchButtonStartHintResource = $imageCache->getWithKey('org::allbinary::input::motion::button::TouchButtonStartResource'->getInstance()->{HINT});
            $self->add($touchButtonStartResource->{HINT}, 'org::allbinary::animation::image::sprite::OneRowSpriteIndexedAnimationFactory'->createFactory($touchButtonStartHintResource, 'org::allbinary::animation::AnimationBehaviorFactory'->getInstance()));
        } else {
            $self->add($touchButtonStartResource->{HINT}, $nullAnimationFactory);
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

# use javax::microedition::lcdui::Image;
use org::allbinary::animation::AnimationBehaviorFactory;
use org::allbinary::animation::NullAnimationFactory;
use org::allbinary::animation::image::sprite::OneRowSpriteIndexedAnimationFactory;
use org::allbinary::animation::resource::BaseResourceAnimationInterfaceFactoryInterfaceFactory;
use org::allbinary::game::configuration::feature::Features;
use org::allbinary::game::resource::ResourceLoadingLevelFactory;
use org::allbinary::graphics::canvas::transition::progress::ProgressCanvas;
use org::allbinary::graphics::canvas::transition::progress::ProgressCanvasFactory;
use org::allbinary::graphics::opengles::OpenGLFeatureFactory;
use org::allbinary::image::ImageCache;
use org::allbinary::image::ImageCacheFactory;
use org::allbinary::logic::StdUtil;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::logic::system::os::OperatingSystemFactory;
use org::allbinary::media::image::ImageCompleteUtil;
use org::allbinary::input::motion::button::TouchButtonBlankResource;
use org::allbinary::input::motion::button::TouchButtonGenericActionResource;
use org::allbinary::input::motion::button::TouchButtonStartResource;
use org::allbinary::input::motion::button::TouchButtonUpResource;
use org::allbinary::input::motion::button::TouchButtonDownResource;
use org::allbinary::input::motion::button::TouchButtonTurnLeftResource;
use org::allbinary::input::motion::button::TouchButtonTurnRightResource;
use org::allbinary::input::motion::button::TouchButtonStrafeLeftResource;
use org::allbinary::input::motion::button::TouchButtonStrafeRightResource;

1;

