# 
# AllBinary Open License Version 1 
# Copyright (c) 2025 AllBinary 
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

package org::allbinary::data::tree::dom::URIResolverStrings;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::data::tree::dom::URIResolverStrings'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{IMPORT_URL} = "/{import url}";
    $self->{ATTEMPT} = "attempt to use xsl:import: href=";
    $self->{BASE} = "\nBase= ";
    $self->{NEW_PATH} = "\nNew path= ";
    $self->{NOTE} = "\nNote: ";
    $self->{URL_GLOBAL} = " is a urlglobal";
    $self->{REQUIRED_EXTENSION} = "\nRequired Extension: ";
    $self->{RESOLVE} = "resolve";
}

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::data::tree::dom::URIResolverStrings::instance;
}


1;

