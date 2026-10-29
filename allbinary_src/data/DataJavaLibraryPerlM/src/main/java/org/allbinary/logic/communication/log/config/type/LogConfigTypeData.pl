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

package org::allbinary::logic::communication::log::config::type::LogConfigTypeData;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::logic::communication::log::config::type::LogConfigTypeData'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{NAME} = "LOG_CONFIG_TYPE_NAME";
    $self->{DESCRIPTION} = "LOG_CONFIG_TYPE_DESCRIPTION";
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::logic::communication::log::config::type::LogConfigTypeData::instance;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


1;

