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

package org::allbinary::logic::communication::log::LogBuffer;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{logEntryVector} = undef;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{logEntryVector} = 'org::allbinary::util::BasicArrayListD'->new();
    return $self;
}


sub add {
    my ($self, $log) = @_;
        $self->{logEntryVector}->add($log);
}


sub logAll {
    my ($self) = @_;
        my $size = $self->{logEntryVector}->size();
        for (my $index = 0; $index < $size; $index++) {
            my $log = $self->{logEntryVector}->get($index);
            $self->{logUtil}->putL($log);
        }
}

use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;
use org::allbinary::logic::StdUtil;
use org::allbinary::logic::communication::log::LogUtil;

1;

