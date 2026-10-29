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

package org::allbinary::math::AngleFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::math::AngleFactory'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{TOTAL_ANGLE} = 360;
    $self->{QUARTER_TOTAL_ANGLE} = 90;
    $self->{angleArray} = [(undef) x ($self->{TOTAL_ANGLE})];
    $self->{NEGATIVE_ONE} = ((int(-1) + 32768) % 65536 - 32768);
    $self->{NOT_ANGLE} = 'org::allbinary::math::NamedAngle'->new($self->{NEGATIVE_ONE}, 'org::allbinary::string::CommonStrings'->getInstance()->{EMPTY});
    $self->{DOWN} = undef;
    $self->{UP} = undef;
    $self->{LEFT} = undef;
    $self->{RIGHT} = undef;
    $self->{frameUtil} = 'org::allbinary::math::FrameUtil'->getInstance();
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::math::AngleFactory::instance;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        my $commonPhoneStrings = 'org::allbinary::string::CommonPhoneStrings'->getInstance();
        my $total = ((int(scalar(@{$self->{angleArray}})) + 32768) % 65536 - 32768);
        $self->{UP} = 'org::allbinary::math::NamedAngle'->new(((int(0) + 32768) % 65536 - 32768), $commonPhoneStrings->{UP});
        $self->{angleArray}->[0] = $self->{UP};
        for (my $index = 1; $index < 90; $index++) {
            $self->{angleArray}->[$index] = 'org::allbinary::math::Angle'->new(((int($index) + 32768) % 65536 - 32768));
        }
        $self->{RIGHT} = 'org::allbinary::math::NamedAngle'->new(((int(90) + 32768) % 65536 - 32768), $commonPhoneStrings->{RIGHT});
        $self->{angleArray}->[90] = $self->{RIGHT};
        for (my $index = 91; $index < 180; $index++) {
            $self->{angleArray}->[$index] = 'org::allbinary::math::Angle'->new(((int($index) + 32768) % 65536 - 32768));
        }
        $self->{DOWN} = 'org::allbinary::math::NamedAngle'->new(((int(180) + 32768) % 65536 - 32768), $commonPhoneStrings->{DOWN});
        $self->{angleArray}->[180] = $self->{DOWN};
        for (my $index = 181; $index < 270; $index++) {
            $self->{angleArray}->[$index] = 'org::allbinary::math::Angle'->new(((int($index) + 32768) % 65536 - 32768));
        }
        $self->{LEFT} = 'org::allbinary::math::NamedAngle'->new(((int(270) + 32768) % 65536 - 32768), $commonPhoneStrings->{LEFT});
        $self->{angleArray}->[270] = $self->{LEFT};
        for (my $index = 271; $index < $total; $index++) {
            $self->{angleArray}->[$index] = 'org::allbinary::math::Angle'->new(((int($index) + 32768) % 65536 - 32768));
        }
    return $self;
}


sub getAt {
    my ($self, $index) = @_;
        my $adjustedIndex = int($self->{frameUtil}->adjustAngleToFrameAngle($index));
        return $self->{angleArray}->[$adjustedIndex];
}


sub getClosestDirection {
    my ($self, $angle) = @_;
        if (($angle >= 315 && $angle < 360) || ($angle >= 0 && $angle < 45)) {
            return $self->{UP};
        } elsif ($angle >= 45 && $angle < 135) {
            return $self->{RIGHT};
        } elsif ($angle >= 135 && $angle < 225) {
            return $self->{DOWN};
        } elsif ($angle >= 225 && $angle < 315) {
            return $self->{LEFT};
        }
        die ("RuntimeException");
}


sub getGeneralDirection {
    my ($self) = @_;
        return $self->{NOT_ANGLE};
}


sub main {
    my ($class, $args) = @_;
        my $stringMaker = 'org::allbinary::logic::string::StringMaker'->new();
        my $angleFactory = 'org::allbinary::math::AngleFactory'->getInstance();
        for (my $index = 0; $index < 360; $index++) {
            $stringMaker->appendint($index)->append('org::allbinary::string::CommonSeps'->getInstance()->{FORWARD_SLASH})->appendshort(((int($angleFactory->getClosestDirection($index)->getValue()) + 32768) % 65536 - 32768))->append('org::allbinary::string::CommonSeps'->getInstance()->{NEW_LINE});
        }
        'org::allbinary::logic::communication::log::LogUtil'->getInstance()->putF($stringMaker->toString(), "main", "main");
}

# use jsinterop::annotations::JsType;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::string::CommonPhoneStrings;
use org::allbinary::string::CommonSeps;
use org::allbinary::string::CommonStrings;
# use jsinterop::annotations::JsMethod;
# use jsinterop::annotations::JsConstructor;
# use jsinterop::annotations::JsProperty;
use org::allbinary::math::NamedAngle;
use org::allbinary::math::Angle;
use org::allbinary::math::FrameUtil;

1;

