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

package org::allbinary::graphics::form::ItemPaintableFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::graphics::form::ItemPaintable';

our $instance = 'org::allbinary::graphics::form::ItemPaintableFactory'->new();

sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new();
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::graphics::form::ItemPaintableFactory::instance;
}


# throws Exception
sub getInstanceItemPaintable {
    my ($self, $paintableForm) = @_;
        return $org::allbinary::graphics::form::ItemPaintableFactory::instance;
}

use org::allbinary::graphics::form::ItemPaintable;

1;

