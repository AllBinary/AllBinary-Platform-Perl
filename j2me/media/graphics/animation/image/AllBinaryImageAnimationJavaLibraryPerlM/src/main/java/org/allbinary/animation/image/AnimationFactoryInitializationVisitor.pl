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

package org::allbinary::animation::image::AnimationFactoryInitializationVisitor;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';


sub _init_fields {
    my ($self) = @_;
    $self->{width} = 0;
    $self->{height} = 0;
    $self->{dx} = 0;
    $self->{dy} = 0;
    $self->{originalDx} = 0;
    $self->{originalDy} = 0;
}

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub visit {
    my ($self) = @_;
}


sub toString {
    my ($self) = @_;
        my $commonSeps = 'org::allbinary::string::CommonSeps'->getInstance();
        my $commonLabels = 'org::allbinary::string::CommonLabels'->getInstance();
        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        $stringBuffer->append('org::allbinary::math::PositionStrings'->getInstance()->{DX_LABEL})->appendfloat($self->{dx});
        $stringBuffer->append('org::allbinary::math::PositionStrings'->getInstance()->{DY_LABEL})->appendfloat($self->{dy});
        $stringBuffer->append($commonLabels->{WIDTH_LABEL});
        $stringBuffer->appendint($self->{width});
        $stringBuffer->append($commonSeps->{SPACE});
        $stringBuffer->append($commonLabels->{HEIGHT_LABEL});
        $stringBuffer->appendint($self->{height});
        return $stringBuffer->toString();
}

use org::allbinary::logic::string::StringMaker;
use org::allbinary::math::PositionStrings;
use org::allbinary::string::CommonLabels;
use org::allbinary::string::CommonSeps;

1;

