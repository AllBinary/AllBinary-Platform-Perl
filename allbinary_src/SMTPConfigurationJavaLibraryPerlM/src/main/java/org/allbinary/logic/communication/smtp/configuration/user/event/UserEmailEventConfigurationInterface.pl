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
package org::allbinary::logic::communication::smtp::configuration::user::event::UserEmailEventConfigurationInterface;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';



sub getName {
    my ($self) = @_;
    die "abstract method getName";
}


sub setName {
    my ($self, $name) = @_;
    die "abstract method setName";
}


sub getEventListenerClassPath {
    my ($self) = @_;
    die "abstract method getEventListenerClassPath";
}


sub setEventListenerClassPath {
    my ($self, $eventListenerClassPath) = @_;
    die "abstract method setEventListenerClassPath";
}


sub log {
    my ($self) = @_;
    die "abstract method log";
}


1;

