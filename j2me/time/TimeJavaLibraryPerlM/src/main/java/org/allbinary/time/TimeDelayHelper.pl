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

package org::allbinary::time::TimeDelayHelper;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use Time::HiRes ();


sub _init_fields {
    my ($self) = @_;
    $self->{startTime} = -1;
    $self->{elapsedTimeAtPause} = (-9223372036854775807 - 1);
    $self->{delay} = undef;
}


sub new {
    my ($class, $delay) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{delay} = $delay;
        $self->setStartTimeTNT();
    return $self;
}


sub isTimeTNT {
    my ($self) = @_;
        my $currentTime = int(Time::HiRes::time() * 1000);
        if ($currentTime - $self->{startTime} > $self->{delay}) {
            $self->{startTime} = $currentTime;
            return 1;
        }
        return 0;
}


sub isTimeSinceTNT {
    my ($self, $delay) = @_;
        my $currentTime = int(Time::HiRes::time() * 1000);
        if ($currentTime - $self->{startTime} > $delay) {
            $self->{startTime} = $currentTime;
            return 1;
        }
        return 0;
}


sub isTime {
    my ($self, $currentTime) = @_;
        if ($currentTime - $self->{startTime} > $self->{delay}) {
            $self->{startTime} = $currentTime;
            return 1;
        }
        return 0;
}


sub isTimeWithoutReset {
    my ($self, $currentTime) = @_;
        if ($currentTime - $self->{startTime} > $self->{delay}) {
            return 1;
        }
        return 0;
}


sub isTimeSince {
    my ($self, $delay, $currentTime) = @_;
        if ($currentTime - $self->{startTime} > $self->{delay}) {
            $self->{startTime} = $currentTime;
            return 1;
        }
        return 0;
}


sub getElapsedTNT {
    my ($self) = @_;
        return int(Time::HiRes::time() * 1000) - $self->{startTime};
}


sub getElapsed {
    my ($self, $currentTime) = @_;
        return $currentTime - $self->{startTime};
}


sub isElapsed {
    my ($self, $currentTime, $time) = @_;
        if ($self->getElapsed($currentTime) > $time) {
            return 1;
        } else {
            return 0;
        }
}


sub isElapsedTNT {
    my ($self, $time) = @_;
        if ($self->getElapsedTNT() > $time) {
            return 1;
        } else {
            return 0;
        }
}


sub setStartTime {
    my ($self, $startTime) = @_;
        $self->{startTime} = $startTime;
}


sub getStartTime {
    my ($self) = @_;
        return $self->{startTime};
}


sub setStartTimeTNT {
    my ($self) = @_;
        $self->{startTime} = int(Time::HiRes::time() * 1000);
}


sub pause {
    my ($self) = @_;
        $self->{elapsedTimeAtPause} = $self->getElapsedTNT();
        $self->{startTime} = 9223372036854775807;
}


sub resume {
    my ($self) = @_;
        if ($self->{elapsedTimeAtPause} != (-9223372036854775807 - 1)) {
            $self->{startTime} = int(Time::HiRes::time() * 1000) + $self->{elapsedTimeAtPause};
            $self->{elapsedTimeAtPause} = (-9223372036854775807 - 1);
            $self->setStartTimeTNT();
            return 1;
        }
        return 0;
}


sub toStringAt {
    my ($self, $currentTime) = @_;
        my $elapsed = $self->getElapsed($currentTime);
        if ($elapsed > 0) {
            my $commonLabels = 'org::allbinary::string::CommonLabels'->getInstance();
            my $elapsedAsString = ("" . ($elapsed));
            return 'org::allbinary::logic::string::StringMaker'->new()->append($commonLabels->{START})->appendlong($self->{startTime})->append($commonLabels->{CURRENT})->appendlong($currentTime)->append($commonLabels->{ELAPSED})->append($elapsedAsString)->toString();
        } else {
            return 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING};
        }
}


sub toString {
    my ($self) = @_;
        my $currentTime = int(Time::HiRes::time() * 1000);
        my $elapsed = $self->getElapsed($currentTime);
        if ($elapsed > 0) {
            my $commonLabels = 'org::allbinary::string::CommonLabels'->getInstance();
            my $elapsedAsString = ("" . ($elapsed));
            return 'org::allbinary::logic::string::StringMaker'->new()->append($commonLabels->{START})->appendlong($self->{startTime})->append($commonLabels->{CURRENT})->appendlong($currentTime)->append($commonLabels->{ELAPSED})->append($elapsedAsString)->toString();
        } else {
            return 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING};
        }
}

use org::allbinary::logic::string::StringMaker;
use org::allbinary::logic::string::StringUtil;
use org::allbinary::string::CommonLabels;
use java::lang::System;

1;

