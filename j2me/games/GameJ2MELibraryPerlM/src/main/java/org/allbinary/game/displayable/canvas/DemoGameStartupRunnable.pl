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

package org::allbinary::game::displayable::canvas::DemoGameStartupRunnable;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::thread::ABRunnable';

our $TYPE = 4;

sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{demoCanvas} = undef;
}


sub new {
    my ($class, $demoCanvas) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
        $self->{demoCanvas} = $demoCanvas;
    return $self;
}


sub run {
    my ($self) = @_;
        try {
            $self->setRunning(1);
            $self->{demoCanvas}->stopGameDemo();
            $self->{demoCanvas}->create();
            $self->{demoCanvas}->start();
            $self->setRunning(0);
        } catch ($e) {
            $self->setRunning(0);
            my $commonStrings = 'org::allbinary::string::CommonStrings'->getInstance();
            $self->{logUtil}->put($commonStrings->{EXCEPTION}, $self, $commonStrings->{RUN}, $e);
        }
}


sub getType {
    my ($self) = @_;
        return $org::allbinary::game::displayable::canvas::DemoGameStartupRunnable::TYPE;
}

use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::string::CommonStrings;
use org::allbinary::thread::ABRunnable;

1;

