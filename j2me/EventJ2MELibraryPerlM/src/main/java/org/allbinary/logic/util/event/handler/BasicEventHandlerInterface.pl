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

# Java interface
package org::allbinary::logic::util::event::handler::BasicEventHandlerInterface;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';



sub addListenerInterface {
    my ($self, $eventListenerInterface) = @_;
    die "abstract method addListenerInterface";
}


sub addListeners {
    my ($self, $basicArrayList) = @_;
    die "abstract method addListeners";
}


# throws Exception
sub fireEvent {
    my ($self, $eventObject) = @_;
    die "abstract method fireEvent";
}


sub removeAllListeners {
    my ($self) = @_;
    die "abstract method removeAllListeners";
}


sub removeListener {
    my ($self, $eventListenerInterface) = @_;
    die "abstract method removeListener";
}

# use jsinterop::annotations::JsType;
use org::allbinary::logic::util::event::AllBinaryEventObject;
use org::allbinary::logic::util::event::EventListenerInterface;
use org::allbinary::util::BasicArrayList;
# use jsinterop::annotations::JsMethod;

1;

