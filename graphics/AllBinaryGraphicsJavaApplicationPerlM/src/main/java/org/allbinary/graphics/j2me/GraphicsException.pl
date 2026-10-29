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

package org::allbinary::graphics::j2me::GraphicsException;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'java::lang::Exception';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{guiLog} = 'org::allbinary::logic::communication::log::GuiLog'->getInstance();
}

sub new {
    my ($class, @arguments) = @_;
    return $class->_new3(@arguments) if scalar(@arguments) == 3;
    return $class->_new3(@arguments) if scalar(@arguments) == 3;
    die "No constructor of GraphicsException takes " . scalar(@arguments) . " arguments";
}


sub _new3 {
    my ($class, $msg, $obj, $method) = @_;
    my $self = $class->SUPER::new($msg);
    $self->_init_fields();
        # super(...) made $self above
        try {
            $self->{guiLog}->showDialog($msg);
            $self->{logUtil}->put($msg, $obj, $method, $self);
        } catch ($e) {
        }
    return $self;
}


sub _new3 {
    my ($class, $msg, $className, $method) = @_;
    my $self = $class->SUPER::new($msg);
    $self->_init_fields();
        # super(...) made $self above
        try {
            $self->{guiLog}->showDialog($msg);
            $self->{logUtil}->put($msg, $className, $method, $self);
        } catch ($e) {
        }
    return $self;
}

use org::allbinary::logic::communication::log::GuiLog;
use org::allbinary::logic::communication::log::LogUtil;

1;

