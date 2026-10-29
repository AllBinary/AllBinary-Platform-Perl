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

package org::allbinary::animation::image::LazyImageRotationAnimation;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::animation::RotationAnimation';

our $SET_REAL_ANIMATION = "setRealAnimation";

sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{layoutIndex} = undef;
    $self->{instanceId} = undef;
    $self->{animationInterfaceFactoryInterface} = undef;
    $self->{NULL_INDEX_ANIMATION} = undef;
    $self->{animation} = undef;
    $self->{scaleProperties} = $org::allbinary::media::ScaleProperties::instance;
}


sub new {
    my ($class, $layoutIndex, $instanceId, $scaleProperties, $animationInterfaceFactoryInterface, $animationBehavior) = @_;
    my $self = $class->SUPER::new('org::allbinary::math::AngleInfo'->getInstance('org::allbinary::math::AngleFactory'->getInstance()->{QUARTER_TOTAL_ANGLE}), 'org::allbinary::util::CircularIndexUtil'->createInstance(4), $animationBehavior);
    $self->_init_fields();
        # super(...) made $self above
        $self->{layoutIndex} = $layoutIndex;
        $self->{instanceId} = $instanceId;
        $self->{animationInterfaceFactoryInterface} = $animationInterfaceFactoryInterface;
        my $imageCache = 'org::allbinary::image::ImageCacheFactory'->getInstance();
        $imageCache->add($self);
        $self->{scaleProperties} = $scaleProperties;
        $self->{NULL_INDEX_ANIMATION} = 'org::allbinary::animation::NullRotationAnimationFactory'->getFactoryInstance()->getInstance(0);
        {
        package org::allbinary::animation::image::ActualRotationAnimation;
        use strict;
        use warnings;
        use feature 'try';
        no warnings 'experimental::try';
        use parent -norequire,'org::allbinary::animation::RotationAnimation';
        

        sub _init_fields {
            my ($self) = @_;
            $self->{lazyImageRotationAnimation} = undef;
            $self->{index} = 0;
        }
        

        sub new {
            my ($class, $lazyImageRotationAnimation) = @_;
            my $self = $class->SUPER::new('org::allbinary::math::AngleInfo'->getInstance('org::allbinary::math::AngleFactory'->getInstance()->{QUARTER_TOTAL_ANGLE}), 'org::allbinary::util::CircularIndexUtil'->createInstance(4), $self->{animationBehavior});
            $self->_init_fields();
                # super(...) made $self above
                $self->{lazyImageRotationAnimation} = $lazyImageRotationAnimation;
            return $self;
        }
        

        sub setFrame {
            my ($self, $index) = @_;
                $self->{index} = $index;
        }
        

        sub getFrame {
            my ($self) = @_;
                return $self->{index};
        }
        

        sub paintXY {
            my ($self, $graphics, $x, $y) = @_;
                try {
                    'org::allbinary::image::ImageCacheFactory'->getInstance()->insertFirst($self);
                    $self->{lazyImageRotationAnimation}->{animation} = $self->{lazyImageRotationAnimation}->{NULL_INDEX_ANIMATION};
                } catch ($e) {
                    my $logUtil = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
                    $logUtil->put($self->{commonStrings}->{EXCEPTION}, $self, $self->{commonStrings}->{PROCESS}, $e);
                }
        }
        

        sub paintThreedXYZ {
            my ($self, $graphics, $x, $y, $z) = @_;
                try {
                    'org::allbinary::image::ImageCacheFactory'->getInstance()->insertFirst($self);
                    $self->{lazyImageRotationAnimation}->{animation} = $self->{lazyImageRotationAnimation}->{NULL_INDEX_ANIMATION};
                } catch ($e) {
                    my $logUtil = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
                    $logUtil->put($self->{commonStrings}->{EXCEPTION}, $self, $self->{commonStrings}->{PROCESS}, $e);
                }
        }
        }

        $self->{animation} = 'org::allbinary::animation::image::ActualRotationAnimation'->new($self);
    return $self;
}


sub setRealAnimation {
    my ($self) = @_;
        try {
            my $animation = $self->{animation};
            $self->{animationInterfaceFactoryInterface}->setInitialScale($self->{scaleProperties});
            $self->{animation} = $self->{animationInterfaceFactoryInterface}->getInstance($self->{instanceId});
            $self->{animation}->setState($animation);
        } catch ($e) {
            $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, $org::allbinary::animation::image::LazyImageRotationAnimation::SET_REAL_ANIMATION, $e);
        }
}


sub setScale {
    my ($self, $scaleX, $scaleY) = @_;
        $self->{animation}->setScale($scaleX, $scaleY);
}


sub getAnimationBehavior {
    my ($self) = @_;
        return $self->{animation}->getAnimationBehavior();
}


# throws Exception
sub set {
    my ($self, $gl) = @_;
        $self->{animation}->set($gl);
}


sub setAlpha {
    my ($self, $alpha) = @_;
        $self->{animation}->setAlpha($alpha);
}


sub setDx {
    my ($self, $dx) = @_;
        $self->{animation}->setDx($dx);
}


sub setDy {
    my ($self, $dy) = @_;
        $self->{animation}->setDy($dy);
}


sub setMaxScale {
    my ($self, $maxScaleX, $maxScaleY) = @_;
        $self->{animation}->setMaxScale($maxScaleX, $maxScaleY);
}


sub nextRotation {
    my ($self) = @_;
        my $rotationAnimation = ($self->{animation});
        $rotationAnimation->nextRotation();
}


sub previousRotation {
    my ($self) = @_;
        my $rotationAnimation = ($self->{animation});
        $rotationAnimation->previousRotation();
}


sub nextRotationX {
    my ($self) = @_;
        my $rotationAnimation = ($self->{animation});
        $rotationAnimation->nextRotationX();
}


sub previousRotationX {
    my ($self) = @_;
        my $rotationAnimation = ($self->{animation});
        $rotationAnimation->previousRotationX();
}


sub nextRotationZ {
    my ($self) = @_;
        my $rotationAnimation = ($self->{animation});
        $rotationAnimation->nextRotationZ();
}


sub previousRotationZ {
    my ($self) = @_;
        my $rotationAnimation = ($self->{animation});
        $rotationAnimation->previousRotationZ();
}


sub changeBasicColor {
    my ($self, $basicColor) = @_;
        $self->{animation}->changeBasicColor($basicColor);
}


sub getBasicColorP {
    my ($self) = @_;
        return $self->{animation}->getBasicColorP();
}


sub getChangeBasicColor {
    my ($self) = @_;
        return $self->{animation}->getChangeBasicColor();
}


sub getChangeColor {
    my ($self) = @_;
        return $self->{animation}->getChangeColor();
}


sub getColor {
    my ($self) = @_;
        return $self->{animation}->getColor();
}


sub getDx {
    my ($self) = @_;
        return $self->{animation}->getDx();
}


sub getDy {
    my ($self) = @_;
        return $self->{animation}->getDy();
}


sub isThreed {
    my ($self) = @_;
        return $self->{animation}->isThreed();
}


# throws Exception
sub nextFrame {
    my ($self) = @_;
        $self->{animation}->nextFrame();
}


sub reset {
    my ($self) = @_;
        $self->{animation}->reset();
}


sub setFrame {
    my ($self, $index) = @_;
        $self->{animation}->setFrame($index);
}


sub getFrame {
    my ($self) = @_;
        return $self->{animation}->getFrame();
}


# throws Exception
sub getAnimationSize {
    my ($self) = @_;
        return $self->{animation}->getAnimationSize();
}


sub getSize {
    my ($self) = @_;
        return $self->{animation}->getSize();
}


sub previousFrame {
    my ($self) = @_;
        $self->{animation}->previousFrame();
}


sub isLastFrame {
    my ($self) = @_;
        return $self->{animation}->isLastFrame();
}


sub setSequence {
    my ($self, $sequence) = @_;
        $self->{animation}->setSequence($sequence);
}


sub getSequence {
    my ($self) = @_;
        return $self->{animation}->getSequence();
}


sub getWidth {
    my ($self) = @_;
        return $self->{animation}->getWidth();
}


sub paintXY {
    my ($self, $graphics, $x, $y) = @_;
        try {
            $self->{animation}->paintXY($graphics, $x, $y);
        } catch ($e) {
            $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, $self->{commonStrings}->{PROCESS}, $e);
        }
}


sub paintThreedXYZ {
    my ($self, $graphics, $x, $y, $z) = @_;
        try {
            $self->{animation}->paintThreedXYZ($graphics, $x, $y, $z);
        } catch ($e) {
            $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, $self->{commonStrings}->{PROCESS}, $e);
        }
}


sub toString {
    my ($self) = @_;
        my $commonSeps = 'org::allbinary::string::CommonSeps'->getInstance();
        my $image = $self->{animationInterfaceFactoryInterface}->getImage();
        return 'org::allbinary::logic::string::StringMaker'->new()->append($self->SUPER::toString())->append($commonSeps->{SPACE})->append($image->getName())->append($commonSeps->{SPACE})->appendint(int($image->getWidth()))->append($commonSeps->{SPACE})->appendint(int($image->getHeight()))->toString();
}

# use javax::microedition::khronos::opengles::GL;
# use javax::microedition::lcdui::Graphics;
# use javax::microedition::lcdui::Image;
use org::allbinary::animation::AnimationBehavior;
use org::allbinary::animation::IndexedAnimation;
use org::allbinary::animation::NullRotationAnimationFactory;
use org::allbinary::animation::RotationAnimation;
use org::allbinary::graphics::color::BasicColor;
use org::allbinary::image::ImageCache;
use org::allbinary::image::ImageCacheFactory;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::math::AngleFactory;
use org::allbinary::math::AngleInfo;
use org::allbinary::string::CommonSeps;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::media::ScaleProperties;
use org::allbinary::util::CircularIndexUtil;

1;

