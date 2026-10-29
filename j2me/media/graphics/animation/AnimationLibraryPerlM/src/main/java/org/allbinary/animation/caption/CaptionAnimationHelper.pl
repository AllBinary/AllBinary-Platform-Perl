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

package org::allbinary::animation::caption::CaptionAnimationHelper;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::animation::caption::CaptionAnimationHelperBase';


sub _init_fields {
    my ($self) = @_;
    $self->{timeHelper} = 'org::allbinary::time::TimeDelayHelper'->new(620);
    $self->{textAnimation} = 'org::allbinary::animation::text::TextAnimation'->new('org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING}, 'org::allbinary::animation::AnimationBehavior'->getInstance());
    $self->{captionAnimation} = undef;
    $self->{animation} = 'org::allbinary::animation::NullAnimationFactory'->getFactoryInstance()->getInstance(0);
}


sub new {
    my ($class, $captionAnimation, $captionDx, $captionDy, $dx, $dy) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
        $self->{captionAnimation} = 'org::allbinary::animation::caption::CaptionAnimation'->new($captionAnimation, $self->{textAnimation}, $captionDx, $captionDy, $dx, $dy);
    return $self;
}


sub isShowing {
    my ($self) = @_;
        if ($self->{animation} == $self->{captionAnimation}) {
            return 1;
        } else {
            return 0;
        }
}


sub tick {
    my ($self) = @_;
        if ($self->{timeHelper}->isTime('org::allbinary::time::GameTickTimeDelayHelperFactory'->getInstance()->{startTime})) {
            $self->{animation} = 'org::allbinary::animation::NullAnimationFactory'->getFactoryInstance()->getInstance(0);
        }
}


sub update {
    my ($self, $message, $basicColor) = @_;
        $self->{textAnimation}->setBasicColorP($basicColor);
        $self->{textAnimation}->setText($message);
        $self->{animation} = $self->{captionAnimation};
        $self->{timeHelper}->setStartTimeTNT();
}


sub paintXY {
    my ($self, $graphics, $x, $y) = @_;
        $self->{animation}->paintXY($graphics, $x, $y);
}

# use javax::microedition::lcdui::Graphics;
use org::allbinary::animation::Animation;
use org::allbinary::animation::AnimationBehavior;
use org::allbinary::animation::NullAnimationFactory;
use org::allbinary::animation::text::TextAnimation;
use org::allbinary::graphics::color::BasicColor;
use org::allbinary::logic::string::StringUtil;
use org::allbinary::time::GameTickTimeDelayHelperFactory;
use org::allbinary::time::TimeDelayHelper;
use org::allbinary::animation::caption::CaptionAnimationHelperBase;
use org::allbinary::animation::caption::CaptionAnimation;

1;

