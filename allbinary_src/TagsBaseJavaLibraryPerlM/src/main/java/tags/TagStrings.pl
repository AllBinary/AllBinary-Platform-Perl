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

package tags::TagStrings;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'tags::TagStrings'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{DO_START_TAG} = "doStartTag";
}

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $tags::TagStrings::instance;
}


1;

