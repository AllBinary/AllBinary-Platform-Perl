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

package org::allbinary::string::CommonStateStrings;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::string::CommonStateStrings'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{CONTEXT} = "Context: ";
    $self->{FINISH} = "finish";
    $self->{CREATE} = "onCreate";
    $self->{START} = "onStart";
    $self->{RESTART} = "onRestart";
    $self->{RESUME} = "onResume";
    $self->{PAUSE} = "onPause";
    $self->{STOP} = "onStop";
    $self->{DESTROY} = "onDestroy";
    $self->{BIND} = "onBind";
    $self->{ON_SAVE_INSTANCE_STATE} = "onSaveInstanceState";
    $self->{ON_START_COMMAND} = "onStartCommand";
}

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::string::CommonStateStrings::instance;
}


1;

