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

package org::allbinary::canvas::ProfilingRefreshHelper;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use Time::HiRes ();
use parent -norequire,'org::allbinary::canvas::AndroidGameStatistics';

our $instance = 'org::allbinary::canvas::ProfilingRefreshHelper'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{firstTime} = 1;
    $self->{bestFrameProcessingTime} = 0;
    $self->{worstFrameProcessingTime} = 0;
    $self->{frameProcessingTimeElapsed} = 0;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::canvas::ProfilingRefreshHelper::instance;
}


sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
    return $self;
}


sub initView {
    my ($self, $view) = @_;
        $self->SUPER::initView($view);
        $self->{frameProcessingTimeElapsed} = $self->getTimeDelayHelper()->getStartTime();
        $self->{bestFrameProcessingTime} = 2147483647;
        $self->{worstFrameProcessingTime} = 0;
}


sub nextFrame {
    my ($self) = @_;
        $self->{frameProcessingTimeElapsed} = int(Time::HiRes::time() * 1000) - $self->{frameProcessingTimeElapsed};
        if ($self->{firstTime} != 1) {
            if ($self->{frameProcessingTimeElapsed} > $self->{worstFrameProcessingTime}) {
                $self->{worstFrameProcessingTime} = $self->{frameProcessingTimeElapsed};
            }
            if ($self->{frameProcessingTimeElapsed} < $self->{bestFrameProcessingTime}) {
                $self->{bestFrameProcessingTime} = $self->{frameProcessingTimeElapsed};
            }
        } else {
            $self->{firstTime} = 0;
        }
        $self->SUPER::nextFrame();
}


sub toString {
    my ($self) = @_;
        return 'org::allbinary::logic::string::StringMaker'->new()->append($self->SUPER::toString())->append(" Worst: ")->appendint($self->{worstFrameProcessingTime})->append(" Best: ")->appendint($self->{bestFrameProcessingTime})->toString();
}

use android::view::View;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::canvas::AndroidGameStatistics;
use java::lang::System;

1;

