# 
# AllBinary Open License Version 1 
# Copyright (c) 2022 AllBinary 
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

package org::allbinary::media::ScaleProperties;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::media::ScaleProperties'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{scaleX} = 0.0;
    $self->{scaleY} = 0.0;
    $self->{scaleWidth} = 0;
    $self->{scaleHeight} = 0;
    $self->{shouldScale} = 0;
}

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub toString {
    my ($self) = @_;
        return 'org::allbinary::logic::string::StringMaker'->new()->append('org::allbinary::string::CommonLabels'->getInstance()->{COLON_SEP})->appendboolean($self->{shouldScale})->append("scaleX: ")->appendfloat($self->{scaleX})->append("scaleY: ")->appendfloat($self->{scaleY})->append("scaleWidth: ")->appendint($self->{scaleWidth})->append("scaleHeight: ")->appendint($self->{scaleHeight})->toString();
}

use org::allbinary::logic::string::StringMaker;
use org::allbinary::string::CommonLabels;

1;

