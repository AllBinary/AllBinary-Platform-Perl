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

package org::allbinary::game::ai::path::BasicDirectionAIHelper;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use POSIX ();
use List::Util ();


sub _init_fields {
    my ($self) = @_;
    $self->{name} = undef;
    $self->{angleInfo} = undef;
}


sub new {
    my ($class, $name, $angleInfo) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{name} = $name;
        $self->{angleInfo} = $angleInfo;
    return $self;
}


sub turnAI {
    my ($self, $frame) = @_;
        my $keyDirection = -1;
        my $directionAngle = $self->{angleInfo}->getAngleIncrementInfo()->getFrameAngle($frame);
        my $angle = $self->{angleInfo}->getAngle();
        my $degrees = abs($directionAngle - $angle);
        if ($degrees < 180) {
            if ($angle > $directionAngle) {
                $keyDirection = $javax::microedition::lcdui::Canvas::LEFT;
            } elsif ($angle < $directionAngle) {
                $keyDirection = $javax::microedition::lcdui::Canvas::RIGHT;
            }
        } else {
            if ($angle > $directionAngle) {
                $keyDirection = $javax::microedition::lcdui::Canvas::RIGHT;
            } elsif ($angle < $directionAngle) {
                $keyDirection = $javax::microedition::lcdui::Canvas::LEFT;
            }
        }
        return $keyDirection;
}


sub getAIKeyPressed {
    my ($self, $frame) = @_;
        my $angle = ((int($self->{angleInfo}->getAngleIncrementInfo()->getFrameAngle(int($frame))) + 32768) % 65536 - 32768);
        if ($self->{angleInfo}->getAngle() != $angle) {
            return $self->turnAI(int($frame));
        } else {
            return $javax::microedition::lcdui::Canvas::UP;
        }
}


sub getAIKeyPressedFromDirection {
    my ($self, $geographicMapDirectionData) = @_;
        my $keyDirection = -1;
        my $angleIncrementInfo = $self->{angleInfo}->getAngleIncrementInfo();
        my $directionFactory = 'org::allbinary::direction::DirectionFactory'->getInstance();
        if ($geographicMapDirectionData == $directionFactory->{DOWN}) {
            $keyDirection = $self->getAIKeyPressed($angleIncrementInfo->{DOWN_FRAME});
        } elsif ($geographicMapDirectionData == $directionFactory->{UP}) {
            $keyDirection = $self->getAIKeyPressed($angleIncrementInfo->{UP_FRAME});
        } elsif ($geographicMapDirectionData == $directionFactory->{LEFT}) {
            $keyDirection = $self->getAIKeyPressed($angleIncrementInfo->{LEFT_FRAME});
        } elsif ($geographicMapDirectionData == $directionFactory->{RIGHT}) {
            $keyDirection = $self->getAIKeyPressed($angleIncrementInfo->{RIGHT_FRAME});
        }
        return $keyDirection;
}


sub getAngleInfoP {
    my ($self) = @_;
        return $self->{angleInfo};
}


sub getName {
    my ($self) = @_;
        return $self->{name};
}

# use javax::microedition::lcdui::Canvas;
use org::allbinary::direction::Direction;
use org::allbinary::direction::DirectionFactory;
use org::allbinary::math::AngleIncrementInfo;
use org::allbinary::math::AngleInfo;

1;

