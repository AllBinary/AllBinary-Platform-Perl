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

package org::allbinary::game::ag::layer::weapon::mine::MineLayerFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::layer::AllBinaryLayerFactoryInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{viewPositionFactoryInterface} = undef;
}


sub new {
    my ($class, $viewPositionFactoryInterface) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{viewPositionFactoryInterface} = $viewPositionFactoryInterface;
    return $self;
}


# throws Exception
sub getInstance {
    my ($self) = @_;
        return 'org::allbinary::game::ag::layer::weapon::mine::MineLayer'->new($self->{viewPositionFactoryInterface}->getInstance());
}

use org::allbinary::layer::AllBinaryLayer;
use org::allbinary::layer::AllBinaryLayerFactoryInterface;
use org::allbinary::view::ViewPositionFactoryInterface;
use org::allbinary::game::ag::layer::weapon::mine::MineLayer;

1;

