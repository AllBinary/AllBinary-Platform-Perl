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

package org::allbinary::logic::communication::http::HttpData;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::logic::communication::http::HttpData'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{EQUALS} = undef;
    $self->{PARAM_SEP} = undef;
    $self->{URL_PARAM_SEP} = undef;
    $self->{URL_LABEL} = "Url: ";
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::logic::communication::http::HttpData::instance;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        my $commonSeps = 'org::allbinary::string::CommonSeps'->getInstance();
        $self->{EQUALS} = $commonSeps->{EQUALS};
        $self->{PARAM_SEP} = $commonSeps->{AMPERSAND};
        $self->{URL_PARAM_SEP} = $commonSeps->{QUESTION};
    return $self;
}

use org::allbinary::string::CommonSeps;

1;

