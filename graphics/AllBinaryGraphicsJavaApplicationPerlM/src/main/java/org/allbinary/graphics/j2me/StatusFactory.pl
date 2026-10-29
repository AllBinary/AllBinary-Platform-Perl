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

package org::allbinary::graphics::j2me::StatusFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::graphics::j2me::StatusFactory'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{SETSTATUS} = "setStatus";
    $self->{STATUS_LABEL} = "Status: ";
}

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::graphics::j2me::StatusFactory::instance;
}


sub setStatusNoLog {
    my ($self, $status) = @_;
        $org::allbinary::graphics::j2me::MyFrame::statusJLabel->setText($status);
}


sub setStatus {
    my ($self, $status) = @_;
        $self->setStatusNoLog($status);
        $self->{logUtil}->putF($self->{STATUS_LABEL} . $status, $self, $self->{SETSTATUS});
}

use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::graphics::j2me::MyFrame;

1;

