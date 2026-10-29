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

package org::allbinary::business::init::InitInfo2;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::business::init::InitInfo2'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{directory} = 'org::allbinary::logic::io::file::directory::Directory'->getInstance();
}

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::business::init::InitInfo2::instance;
}


sub isTestHtmlPathValid {
    my ($self, $value) = @_;
        return $self->{directory}->create($value);
}


sub isMainPathValid {
    my ($self, $value) = @_;
        return $self->{directory}->create($value);
}

use org::allbinary::logic::io::file::directory::Directory;
use org::allbinary::logic::io::path::AbPath;

1;

