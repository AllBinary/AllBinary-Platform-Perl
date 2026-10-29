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

package org::allbinary::logic::io::InputOutputTypeData;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::logic::io::InputOutputTypeData'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{NAME} = "INPUT_OUTPUT_TYPE_NAME";
    $self->{FILE} = "INPUT_OUTPUT_TYPE_FILE";
    $self->{RESPONSE} = "INPUT_OUTPUT_TYPE_RESPONSE";
    $self->{DB} = "INPUT_OUTPUT_TYPE_DB";
    $self->{JSP} = "jsp";
    $self->{JSP_FRAGMENT} = "jspf";
    $self->{PHP} = "php";
    $self->{ASP} = "asp";
    $self->{PL} = "pl";
    $self->{DEFAULT} = $self->{JSP};
    $self->{DEFAULT_FRAGMENT} = $self->{JSP_FRAGMENT};
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::logic::io::InputOutputTypeData::instance;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


1;

