# 
# AllBinary Open License Version 1 
# Copyright (c) 2022 AllBinary 
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

package org::allbinary::animation::text::CustomTextAnimationFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::animation::AnimationInterfaceFactoryInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{animationBehaviorFactory} = undef;
    $self->{basicColor} = 'org::allbinary::graphics::color::BasicColorFactory'->getInstance()->{BLACK};
    $self->{text} = undef;
    $self->{initScaleHeight} = undef;
    $self->{dx} = 0;
    $self->{dy} = 0;
    $self->{font} = undef;
    $self->{scaleProperties} = undef;
}


sub createDXY {
    my ($class, $text, $fontSize, $dx, $dy, $animationBehaviorFactory) = @_;
        my $customTextAnimationFactory = 'org::allbinary::animation::text::CustomTextAnimationFactory'->new($text, $fontSize, $animationBehaviorFactory);
        $customTextAnimationFactory->{dx} = $dx;
        $customTextAnimationFactory->{dy} = $dy;
        return $customTextAnimationFactory;
}


sub new {
    my ($class, $text, $fontSize, $animationBehaviorFactory) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{scaleProperties} = 'org::allbinary::media::ScaleProperties'->new();
        $self->{text} = $text;
        $self->{scaleProperties}->{scaleHeight} = $fontSize - (int($fontSize / 4));
        $self->{initScaleHeight} = $self->{scaleProperties}->{scaleHeight};
        $self->{animationBehaviorFactory} = $animationBehaviorFactory;
        $self->{font} = 'javax::microedition::lcdui::Font'->getFont($javax::microedition::lcdui::Font::FACE_SYSTEM, $javax::microedition::lcdui::Font::STYLE_PLAIN, $self->{initScaleHeight});
    return $self;
}


# throws Exception
sub getInstance {
    my ($self, $instanceId) = @_;
        my $customTextAnimation = undef;
        if ($self->{dx} != 0 || $self->{dy} != 0) {
            $customTextAnimation = 'org::allbinary::animation::text::AdjustCustomTextAnimation'->new($self->{text}, $self->{scaleProperties}->{scaleHeight}, $self->{dx}, $self->{dy}, $self->{animationBehaviorFactory}->getOrCreateInstance());
        } else {
            $customTextAnimation = 'org::allbinary::animation::text::CustomTextAnimation'->new($self->{text}, $self->{scaleProperties}->{scaleHeight}, $self->{animationBehaviorFactory}->getOrCreateInstance());
        }
        $customTextAnimation->setBasicColorP($self->{basicColor});
        return $customTextAnimation;
}


sub setInitialScale {
    my ($self, $scaleProperties) = @_;
}


sub getWidth {
    my ($self) = @_;
        return $self->{font}->stringWidth($self->{text});
}


sub getHeight {
    my ($self) = @_;
        return $self->{font}->getHeight();
}

# use javax::microedition::lcdui::Font;
use org::allbinary::animation::Animation;
use org::allbinary::animation::AnimationBehaviorFactory;
use org::allbinary::animation::AnimationInterfaceFactoryInterface;
use org::allbinary::graphics::color::BasicColor;
use org::allbinary::graphics::color::BasicColorFactory;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::media::ScaleProperties;
use org::allbinary::animation::text::CustomTextAnimation;
use org::allbinary::animation::text::AdjustCustomTextAnimation;

1;

