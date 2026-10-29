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

package org::allbinary::graphics::opengles::shader::ShaderStrings;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::graphics::opengles::shader::ShaderStrings'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{NO_PROGRAM_HANDLE} = "No program handle";
    $self->{UNIFORM_BLOCK_HANDLE} = "Uniform Block Handle: ";
    $self->{UNIFORM_HANDLE} = "Uniform Handle: ";
    $self->{UNIFORM_ATTRIBUTE_HANDLE} = "Uniform Attribute Handle: ";
}

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::graphics::opengles::shader::ShaderStrings::instance;
}


1;

