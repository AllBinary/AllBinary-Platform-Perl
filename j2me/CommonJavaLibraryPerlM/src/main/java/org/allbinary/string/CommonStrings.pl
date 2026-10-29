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

package org::allbinary::string::CommonStrings;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::string::CommonStrings'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{EMPTY} = "Empty";
    $self->{CREATE_IMAGE} = "createImage";
    $self->{PLEASE_WAIT} = "Please Wait";
    $self->{PLEASE_WAIT_FOR_SERVER} = "Please Wait Getting Data From Server...";
    $self->{PERIODS} = "...";
    $self->{LOADING} = "Loading...";
    $self->{CONSTRUCTOR} = "Constructor";
    $self->{START} = "Start";
    $self->{END} = "End";
    $self->{EXCEPTION} = "Exception";
    $self->{EXCEPTION_LABEL} = "Exception: ";
    $self->{CLEANUP} = "cleanup";
    $self->{INIT} = "init";
    $self->{CLOSE} = "close";
    $self->{UP} = "up";
    $self->{DOWN} = "down";
    $self->{LEFT} = "left";
    $self->{RIGHT} = "right";
    $self->{DIRECTION_NAME} = [$self->{DOWN}, $self->{LEFT}, $self->{RIGHT}, $self->{UP}];
    $self->{CREATE} = "Create";
    $self->{REMOVE} = "Remove";
    $self->{UPDATE} = "Update";
    $self->{DELETE} = "Delete";
    $self->{delete} = "delete";
    $self->{LOAD} = "load";
    $self->{SAVE} = "save";
    $self->{ADD} = "Add";
    $self->{DROP} = "Drop";
    $self->{INSERT} = "Insert";
    $self->{VISIT} = "visit";
    $self->{START_METHOD_NAME} = $self->{START};
    $self->{END_METHOD_NAME} = "end";
    $self->{GET} = "get";
    $self->{PROCESS} = "process";
    $self->{GET_INSTANCE} = "getInstance";
    $self->{GET_LIST} = "getList";
    $self->{RUN} = "run";
    $self->{START_RUNNABLE} = "Start Runnable";
    $self->{RUNNING} = "Running";
    $self->{END_RUNNABLE} = "End Runnable";
    $self->{DISABLE} = "disable";
    $self->{ENABLE} = "enable";
    $self->{SUCCESS} = "Command Success";
    $self->{FAILURE} = "Command Failed";
    $self->{NOT_IMPLEMENTED} = "Not Implemented";
    $self->{UNKNOWN} = "Unknown";
    $self->{ON_EVENT} = "onEvent";
    $self->{IS_VALID} = "isValid";
    $self->{TOSTRING} = "toString";
    $self->{ADD_LISTENER} = "addListener";
    $self->{REMOVE_LISTENER} = "removeListener";
    $self->{SIZE} = "size";
}

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::string::CommonStrings::instance;
}

# use jsinterop::annotations::JsType;
# use jsinterop::annotations::JsMethod;
# use jsinterop::annotations::JsProperty;

1;

