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

package org::allbinary::math::FrameUtil;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::math::FrameUtil'->new();


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::math::FrameUtil::instance;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


sub getFrameForAngle {
    my ($self, $angle, $angleIncrement) = @_;
        return int($self->adjustAngleToFrameAngle($angle) / $angleIncrement);
}


sub getFrameAngle {
    my ($self, $frame, $angleIncrement) = @_;
        my $frameAngle = $angleIncrement * $frame - 90;
        return $self->adjustAngleToFrameAngle($frameAngle);
}


sub adjustAngleToFrameAngle {
    my ($self, $currentAngle) = @_;
        my $angleFactory = 'org::allbinary::math::AngleFactory'->getInstance();
        if ($currentAngle > 359) {
            $currentAngle = ($currentAngle - $angleFactory->{TOTAL_ANGLE});
            while ($currentAngle > 359) {
                $currentAngle = ($currentAngle - $angleFactory->{TOTAL_ANGLE});
            }
        }
        if ($currentAngle < 0) {
            $currentAngle = ($currentAngle + $angleFactory->{TOTAL_ANGLE});
            while ($currentAngle < 0) {
                $currentAngle = ($currentAngle + $angleFactory->{TOTAL_ANGLE});
            }
        }
        return $currentAngle;
}

# use jsinterop::annotations::JsType;
# use jsinterop::annotations::JsMethod;
# use jsinterop::annotations::JsConstructor;
use org::allbinary::math::AngleFactory;

1;

