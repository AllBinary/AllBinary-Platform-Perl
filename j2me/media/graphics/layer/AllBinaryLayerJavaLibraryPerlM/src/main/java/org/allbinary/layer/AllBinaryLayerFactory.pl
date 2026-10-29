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

package org::allbinary::layer::AllBinaryLayerFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::layer::AllBinaryLayerFactoryInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{rectangle} = undef;
}


sub new {
    my ($class, $rectangle) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{rectangle} = $rectangle;
    return $self;
}


sub getInstance {
    my ($self) = @_;
        return 'org::allbinary::layer::AllBinaryLayer'->new('org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING}, $self->{rectangle}, 'org::allbinary::view::ViewPosition'->getInstanceD());
}

use org::allbinary::graphics::Rectangle;
use org::allbinary::logic::string::StringUtil;
use org::allbinary::view::ViewPosition;
use org::allbinary::layer::AllBinaryLayerFactoryInterface;
use org::allbinary::layer::AllBinaryLayer;

1;

