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

package org::allbinary::animation::image::sprite::ImageCaptionIndexedAnimationFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::animation::AnimationInterfaceFactoryInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{animationFactoryImageScaleUtil} = 'org::allbinary::image::AnimationFactoryImageScaleUtil'->getInstance();
    $self->{animationFactorySpriteScaleUtil} = 'org::allbinary::image::sprite::AnimationFactorySpriteScaleUtil'->getInstance();
    $self->{captionImage} = undef;
    $self->{spriteMovieImage} = undef;
    $self->{frameWidth} = undef;
    $self->{frameHeight} = undef;
    $self->{captionDx} = undef;
    $self->{captionDy} = undef;
    $self->{dx} = undef;
    $self->{dy} = undef;
    $self->{time} = undef;
    $self->{soundInterface} = undef;
    $self->{scaleProperties} = $org::allbinary::media::ScaleProperties::instance;
    $self->{animationBehaviorFactory} = undef;
}


sub new {
    my ($class, $captionImage, $spriteMovieImage, $soundInterface, $frameWidth, $frameHeight, $captionDx, $captionDy, $dx, $dy, $time, $animationBehaviorFactory) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        if ($animationBehaviorFactory == 'org::allbinary::animation::AnimationBehaviorFactory'->getInstance()) {
            'org::allbinary::logic::communication::log::ForcedLogUtil'->log("Using default AnimationBehaviorFactory with IndexedAnimationFactory", $self);
        }
        $self->{captionImage} = $captionImage;
        $self->{spriteMovieImage} = $spriteMovieImage;
        $self->{frameWidth} = $frameWidth;
        $self->{frameHeight} = $frameHeight;
        $self->{captionDx} = $captionDx;
        $self->{captionDy} = $captionDy;
        $self->{dx} = $dx;
        $self->{dy} = $dy;
        $self->{time} = $time;
        $self->{soundInterface} = $soundInterface;
        $self->{animationBehaviorFactory} = $animationBehaviorFactory;
    return $self;
}


# throws Exception
sub getInstance {
    my ($self, $instanceId) = @_;
        my $scaledImage = $self->{animationFactoryImageScaleUtil}->createImage($self->{captionImage}, $self->{captionImage}->getWidth(), $self->{captionImage}->getHeight(), $self->{scaleProperties}->{scaleWidth}, $self->{scaleProperties}->{scaleHeight});
        my $animationInterface = 'org::allbinary::animation::image::ImageAnimation'->new($scaledImage, $self->{animationBehaviorFactory}->getOrCreateInstance());
        my $sprite = $self->{animationFactorySpriteScaleUtil}->createImage($self->{spriteMovieImage}, $self->{frameWidth}, $self->{frameHeight}, $self->{scaleProperties}->{scaleWidth}, $self->{scaleProperties}->{scaleHeight});
        my $movieIndexedAnimationInterface = 'org::allbinary::animation::image::sprite::SpriteIndexedAnimation'->new($sprite, $self->{spriteMovieImage}, 'org::allbinary::graphics::color::BasicColorUtil'->getInstance()->{ZERO_ARRAY}, $self->{animationBehaviorFactory}->getOrCreateInstance());
        my $player = $self->{soundInterface}->getPlayerP();
        if (!defined($player)) {
            die ("Sound Was not Initialized");
        }
        return 'org::allbinary::animation::caption::CaptionIndexedAnimation'->new($animationInterface, $movieIndexedAnimationInterface, $player, $self->{captionDx}, $self->{captionDy}, $self->{dx}, $self->{dy}, $self->{time}, $self->{animationBehaviorFactory}->getOrCreateInstance());
}


sub setInitialScale {
    my ($self, $scaleProperties) = @_;
        $self->{scaleProperties} = $scaleProperties;
}

# use javax::microedition::lcdui::Image;
# use javax::microedition::lcdui::game::Sprite;
# use javax::microedition::media::Player;
use org::allbinary::animation::Animation;
use org::allbinary::animation::AnimationBehaviorFactory;
use org::allbinary::animation::AnimationInterfaceFactoryInterface;
use org::allbinary::animation::IndexedAnimation;
use org::allbinary::animation::caption::CaptionIndexedAnimation;
use org::allbinary::animation::image::ImageAnimation;
use org::allbinary::graphics::color::BasicColorUtil;
use org::allbinary::image::AnimationFactoryImageScaleUtil;
use org::allbinary::image::sprite::AnimationFactorySpriteScaleUtil;
use org::allbinary::logic::communication::log::ForcedLogUtil;
use org::allbinary::media::ScaleProperties;
use org::allbinary::media::audio::Sound;
use org::allbinary::animation::image::sprite::SpriteIndexedAnimation;

1;

