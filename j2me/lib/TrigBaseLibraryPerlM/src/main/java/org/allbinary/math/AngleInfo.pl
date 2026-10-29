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

package org::allbinary::math::AngleInfo;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $ANGLE = "Angle: ";

sub _init_fields {
    my ($self) = @_;
    $self->{angleIncrementInfo} = undef;
    $self->{angle} = 0;
    $self->{frameUtil} = 'org::allbinary::math::FrameUtil'->getInstance();
}


sub getInstance {
    my ($class, $angleIncrement) = @_;
        return 'org::allbinary::math::AngleInfo'->new('org::allbinary::math::AngleIncrementInfoFactory'->getInstance()->getAt($angleIncrement));
}


sub new {
    my ($class, $angleIncrementInfo) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{angleIncrementInfo} = $angleIncrementInfo;
    return $self;
}


sub adjustAngle {
    my ($self, $frame) = @_;
        my $newAngle = $self->{angleIncrementInfo}->getAngleIncrement() * $frame - 90;
        $self->setAngle(((int($self->{frameUtil}->adjustAngleToFrameAngle($newAngle)) + 32768) % 65536 - 32768));
}


sub getAngle {
    my ($self) = @_;
        return $self->{angle};
}


sub setAngle {
    my ($self, $angle) = @_;
        $self->{angle} = $angle;
}


sub getAngleIncrementInfo {
    my ($self) = @_;
        return $self->{angleIncrementInfo};
}


sub toString {
    my ($self) = @_;
        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        $stringBuffer->append($org::allbinary::math::AngleInfo::ANGLE);
        $stringBuffer->appendshort($self->{angle});
        $stringBuffer->append('org::allbinary::string::CommonSeps'->getInstance()->{SPACE});
        $stringBuffer->append('org::allbinary::logic::string::StringUtil'->getInstance()->toString($self->getAngleIncrementInfo()));
        return $stringBuffer->toString();
}

# use jsinterop::annotations::JsType;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::logic::string::StringUtil;
use org::allbinary::string::CommonSeps;
# use jsinterop::annotations::JsMethod;
# use jsinterop::annotations::JsConstructor;
use org::allbinary::math::AngleIncrementInfoFactory;
use org::allbinary::math::FrameUtil;

1;

