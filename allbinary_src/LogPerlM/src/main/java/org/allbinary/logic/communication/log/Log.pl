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

package org::allbinary::logic::communication::log::Log;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';


sub _init_fields {
    my ($self) = @_;
    $self->{logFormatUtil} = 'org::allbinary::logic::communication::log::LogFormatUtil'->getInstance();
    $self->{specialMessage} = undef;
    $self->{anyType} = undef;
    $self->{functionName} = undef;
    $self->{exception} = undef;
}


sub new {
    my ($class, $specialMessage, $anyType, $functionName, $exception) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{specialMessage} = $specialMessage;
        $self->{anyType} = $anyType;
        $self->{functionName} = $functionName;
        $self->{exception} = $exception;
    return $self;
}


sub getSpecialMessage {
    my ($self) = @_;
        return $self->{specialMessage};
}


sub getObject {
    my ($self) = @_;
        return $self->{anyType};
}


sub getFunctionName {
    my ($self) = @_;
        return $self->{functionName};
}


sub getThrowable {
    my ($self) = @_;
        return $self->{exception};
}


sub toString {
    my ($self) = @_;
        my $className = 'org::allbinary::string::CommonStrings'->getInstance()->{EMPTY};
        my $clazz = ref($self->{anyType});
        if (defined($clazz->getName())) {
            $className = $clazz->getName();
        }
        return $self->{logFormatUtil}->get($className, $self->{functionName}, $self->{specialMessage}, $self->{exception});
}

use org::allbinary::string::CommonStrings;
use org::allbinary::logic::communication::log::LogFormatUtil;

1;

