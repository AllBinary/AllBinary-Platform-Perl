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

package org::allbinary::thread::ThreadUtil;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::thread::ThreadUtil'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{JOIN} = "join";
}

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::thread::ThreadUtil::instance;
}


sub isRunning {
    my ($self, $thread) = @_;
        if (defined($thread) && $thread->isAlive()) {
            return 1;
        } else {
            return 0;
        }
}


# throws Exception
sub join {
    my ($self, $thread) = @_;
        if ('org::allbinary::thread::ThreadUtil'->getInstance()->isRunning($thread)) {
            $self->{logUtil}->putF("Waiting for Thread To Join/End", $self, $self->{JOIN});
            $thread->join();
        }
}

use org::allbinary::logic::communication::log::LogUtil;

1;

